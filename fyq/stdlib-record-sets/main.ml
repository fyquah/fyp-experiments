external print_int_native : int -> unit = "caml_print_int_native"

module Int = struct
  type t = int

  let compare a b =
    if a < b then
      -1
    else if a = b then
      0
    else
      1
  ;;
end

module Set = Set.Make(Int)

let () =
  (* Initialise sets to random shit *)
  Random.init 10;

  let rec loop ~ctr ~acc =
    if ctr = 0 then acc
    else
      loop ~ctr:(ctr - 1) ~acc:(Set.add (Random.int 10000000) acc)
  in
  let set1 = loop ~ctr:800000 ~acc:Set.empty in
  let set2 = loop ~ctr:800000 ~acc:Set.empty in
  let set_diff = Set.diff set1 set2 in
  let gallios_add a b = (a + b) mod 1238283 in
  let () =
    let total =
      Set.fold (fun a (l1, l2) -> (l1 + a, l2 * a)) set_diff (0, 1)
    in
    print_int_native (fst total);
    print_int_native (snd total)
  in
  let set_union = Set.union set1 set2 in
  let () =
    print_int_native (Set.fold gallios_add set_union 10);
  in
  let () =
    let s1, _, s2 = 
      let splitter =
        (Set.max_elt set_union - Set.min_elt set_union) / 2
      in
      Set.split splitter set_union
    in
    let a1 = Set.fold gallios_add s1 100 in
    let a2 = Set.fold gallios_add s2 100 in
    print_int_native a1;
    print_int_native a2
  in
  ()
;;
