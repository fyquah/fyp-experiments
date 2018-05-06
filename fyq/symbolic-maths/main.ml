(* Some toy symbolic maths computation. A decent inliner should be able
 * to simplify many of the hand-maintained cases.
 *)
external print_int_native : int -> unit = "caml_print_int_native"

type 'a t =
  | Pow      : int t * int t   -> int t
  | Mult     : int t * int t   -> int t
  | Add      : int t * int t   -> int t
  | Int      : int           -> int t
  | Var      : string   -> int t
  | Sub      : int t * int t   -> int t
  | Neg      : int t -> int t
  | Cond     : int t * 'a t * 'a t -> 'a t


(* Extracted from [janestret/base] a62aa233d9adcc7f8549fdee53381a9930162371 *)
let fold t ~init ~f = List.fold_left f init t

let foldi (type a b) (t : a list) ~(init : b) ~(f : int -> b -> a -> b) =
  snd (fold t ~init:(0, init) ~f:(fun (i, acc) v -> (i + 1, f i acc v)))
;;

let reduce_balanced l ~f =
  (* Call the "size" of a value the number of list elements that have been combined into
     it via calls to [f].  We proceed by using [f] to combine elements in the accumulator
     of the same size until we can't combine any more, then getting a new element from the
     input list and repeating.
     With this strategy, in the accumulator:
     - we only ever have elements of sizes a power of two
     - we never have more than one element of each size
     - the sum of all the element sizes is equal to the number of elements consumed
     These conditions enforce that list of elements of each size is precisely the binary
     expansion of the number of elements consumed: if you've consumed 13 = 0b1101
     elements, you have one element of size 8, one of size 4, and one of size 1.  Hence
     when a new element comes along, the number of combinings you need to do is the number
     of trailing 1s in the binary expansion of [num], the number of elements that have
     already gone into the accumulator.  The accumulator is in ascending order of size, so
     the next element to combine with is always the head of the list. *)
  let rec step_accum num acc x =
    if num land 1 = 0
    then x :: acc
    else
      match acc with
      | [] -> assert false
      (* New elements from later in the input list go on the front of the accumulator, so
         the accumulator is in reverse order wrt the original list order, hence [f y x]
         instead of [f x y]. *)
      | y :: ys -> step_accum (num asr 1) ys (f y x)
  in
  (* Experimentally, inlining [foldi] and unrolling this loop a few times can reduce
     runtime down to a third and allocation to 1/16th or so in the microbenchmarks below.
     However, in most use cases [f] is likely to be expensive (otherwise why do you care
     about the order of reduction?) so the overhead of this function itself doesn't really
     matter. If you come up with a use-case where it does, then that's something you might
     want to try: see hg log -pr 49ef065f429d. *)
  match foldi l ~init:[] ~f:step_accum with
  | [] -> None
  | x :: xs -> Some (fold xs ~init:x ~f:(fun x y -> f y x))
;;
(* End of a62aa233d9adcc7f8549fdee53381a9930162371 *)

type ctx =
  { depth : int;
  }

type 'a result =
  { matches  : 'a t list;
    children : 'a t list;
  }

let traverse_children ~f ~acc node =
  match node with
  | Var _
  | Int _ -> acc
  | Pow (a, b)
  | Sub (a, b)
  | Mult (a, b)
  | Cond (_, a, b)
  | Add (a, b) ->
    let acc = f ~acc a in
    f ~acc b
  | Neg a -> f ~acc a
;;

let rec rewrite_bottom_up ~f node =
  let r = rewrite_bottom_up ~f in
  match node with
  | Var _
  | Int _ ->
    node
  | Pow (a, b)        -> f (Pow  (r a, r b))
  | Sub (a, b)        -> f (Sub  (r a, r b))
  | Mult (a, b)       -> f (Mult (r a, r b))
  | Cond (cond, a, b) -> Cond (cond, r a, r b)
  | Add (a, b)        -> Add (r a, r b)
  | Neg a             -> Neg (r a)
;;

let rec find_int_matches ~acc ~f node =
  if not (f node) then
    { matches  = acc.matches;
      children = node :: acc.children
    }
  else
    let init = { acc with matches = node :: acc.matches } in
    traverse_children node ~acc:init ~f:(fun ~acc node ->
      find_int_matches ~acc ~f node)
;;

let find_int_matches ~f node =
  let acc = { matches = []; children = [] } in
  find_int_matches ~acc ~f node
;;

module String_map = Map.Make(String)
module Int = struct
  type t = int

  let compare (a : int) (b : int) =
    if a < b then -1
    else if a = b then 0
    else 1
  ;;
end
module Int_map = Map.Make(Int)

module Make_grouping(M: sig
  val check      : int t -> bool
  val reduce     : int t -> int t -> int t
  val accumulate : int t -> int -> int t
end) : sig
  val run : int t -> int t
end = struct

  type s =
    { vars     : int String_map.t;
      raws     : int Int_map.t;
      others   : int t list;
    }

  let inc_by x = function
    | None -> Some x
    | Some y -> Some (y + x)
  ;;

  let inc = inc_by 1

  let run node =
    let result = find_int_matches node ~f:M.check in
    let matches =
      let init =
        { vars = String_map.empty;
          raws = Int_map.empty;
          others = []
        }
      in
      fold result.children ~init ~f:(fun unchanged node ->
        match node with
        | Var s ->
          { unchanged with vars = String_map.update s inc unchanged.vars }
        | Int a -> 
          { unchanged with raws = Int_map.update a inc unchanged.raws }
        | Pow (Var s, Int c) ->
          { unchanged with vars = String_map.update s (inc_by c) unchanged.vars }
        | Pow (Int a, Int c) ->
          { unchanged with raws = Int_map.update a (inc_by c) unchanged.raws }
        | _ ->
          { unchanged with others = node :: unchanged.others }
      )
    in
    let components =
      matches.others
      |> String_map.fold (fun key value acc ->
            M.accumulate (Var key) value :: acc)
          matches.vars
      |> Int_map.fold (fun key value acc ->
            M.accumulate (Int key) value :: acc)
          matches.raws
    in
    match reduce_balanced components ~f:M.reduce with
    | None -> assert false
    | Some x -> x
end

module Multiply_groupping = Make_grouping(struct
  let check = function | Mult _ -> true | _ -> false
  let reduce a b = Mult (a, b)
  let accumulate a n = Pow (a, (Int n))
end)

module Addition_grouping = Make_grouping(struct
  let check = function | Add _ -> true | _ -> false
  let reduce a b = Add (a, b)
  let accumulate a n = Mult (a, Int n)
end)

module Dco = struct
  let run node =
    match node with
    | Cond ((Int 0), a, _) -> a
    | node -> node
  ;;
end

module Native = struct
  let rec construct_balance ~f a x =
    if x == 0 then
      assert false
    else if x == 1 then
      a
    else if x mod 2 == 0 then
      f (construct_balance ~f a (x / 2)) (construct_balance ~f a (x / 2))
    else
      f (construct_balance ~f a (x - 1)) a
  ;;
  
  let mult_const a x = construct_balance ~f:(fun a b -> Mult (a, b)) a x
end

let simplify_node node =
  Multiply_groupping.run node
  |> Addition_grouping.run
  |> Dco.run
;;

let simplify node =
  rewrite_bottom_up node ~f:(function
    | Sub (a, Neg b) -> Add (a, b)
    | Sub (a, b) -> Add (a, (Neg b))
    | _ -> node)
  |> rewrite_bottom_up ~f:simplify_node
  |> rewrite_bottom_up ~f:simplify_node
  |> rewrite_bottom_up ~f:simplify_node
;;

let rec int_pow a b =
  if b = 0 then 1
  else if b = 1 then a
  else if b mod 2 = 0 then
    int_pow a (b / 2) * int_pow a (b / 2)
  else
    a * int_pow a (b - 1)
;;

let rec eval ~vars node =
  let eval node = eval node ~vars in
  match node with
  | Pow (a, b)  -> eval a * eval b
  | Mult (a, b)  -> eval a * eval b
  | Add (a, b) -> eval a + eval b
  | Int a -> a
  | Var a -> String_map.find a vars
  | Sub (a, b) -> eval a - eval b
  | Neg a -> 0 - eval a
  | Cond (a, b, c) ->
    if eval a <> 0 then eval b
    else eval c
;;

let rec find_nodes ~acc node =
  let acc =
    match node with
    | Var  s -> s :: acc
    | _ -> acc
  in
  traverse_children node ~acc ~f:find_nodes
;;

let () =
  let gensym =
    let ref = ref (-1) in
    fun () ->
      ref := !ref + 1;
      "name_" ^ string_of_int !ref
  in
  let rand () = Random.int 100000 in
  let rec build depth =
    if depth <= 0 then
      if Random.bool () then
        Var (gensym ())
      else
        Int (rand ())
    else
      let b () = build (depth - 1) in
      match Random.int 7 with
      | 0 -> Pow  (b (), b ())
      | 1 -> Mult (b (), b ())
      | 2 -> Add  (b (), b ())
      | 3 -> Int  (rand ())
      | 4 -> Var (gensym ())
      | 5 -> Sub  (b (), b ())
      | 6 -> Neg  (b ())
      | _ -> assert false
  in
  let node = build (int_of_string (Sys.argv.(1))) in
  let node = simplify node in
  let vars =
    find_nodes ~acc:[] node
    |> fold ~init:String_map.empty ~f:(fun acc s ->
        String_map.add s (rand ()) acc)
  in
  print_int_native (eval ~vars node)
;;
