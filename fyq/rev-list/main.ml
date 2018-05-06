external print_int_native : int -> unit = "caml_print_int_native"

module Revlist = struct
  type 'a revlist = ('a list -> 'a list)

  let concat_back revlist a =
    fun x -> revlist (a @@ x)
  ;;

  let append revlist a =
    fun x -> revlist (a :: x)
  ;;

  let rappend a revlist = append revlist a
  
  let empty =
    (fun a -> a)
  
  let to_list revlist =
    revlist []
  ;;
end

let rec pathelogical_magic depth =
  let r = ref 0.0 in
  let job_list =
    let depth = float_of_int depth in
    Revlist.empty
    |> Revlist.rappend (fun () -> r := !r +. depth *. 10.0)
    |> Revlist.rappend (fun () -> r := !r +. depth *. 11.0)
    |> Revlist.rappend (fun () -> r := !r +. depth *. 12.0)
    |> Revlist.rappend (fun () -> r := !r +. depth *. 13.0)
    |> Revlist.rappend (fun () -> r := !r +. depth *. 14.0)
    |> Revlist.rappend (fun () -> r := !r +. depth *. 15.0)
    |> Revlist.rappend (fun () -> r := !r +. depth *. 16.0)
    |> Revlist.rappend (fun () -> r := !r +. depth *. 17.0)
    |> Revlist.rappend (fun () -> r := !r +. depth *. 16.0)
    |> Revlist.rappend (fun () -> r := !r +. depth *. 17.0)
  in
  List.iter (fun f -> f ()) (Revlist.to_list job_list);
  !r
;;

let () =
  let x = int_of_string (Sys.argv.(1)) in
  let r = ref 0.0 in
  for i = 0 to x do
    r := !r +. pathelogical_magic i;
  done;
  print_int_native (int_of_float !r)
;;

let () =
  try
    let fn = Sys.getenv "OCAML_GC_STATS" in
    let oc = open_out fn in
    Gc.print_stat oc
  with _ -> ()
