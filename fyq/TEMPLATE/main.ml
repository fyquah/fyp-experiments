external print_int_native : int -> unit = "caml_print_int_native"

let () =
  let x = int_of_string (Sys.argv.(1)) in
  print_int_native x
;;

let () =
  try
    let fn = Sys.getenv "OCAML_GC_STATS" in
    let oc = open_out fn in
    Gc.print_stat oc
  with _ -> ()
