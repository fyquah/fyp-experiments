(* A stupid algorithm to find modulo - see if the program is smart
 * enough to inline this ...
 *)
let rec float_modulo a b =
  if a < b then
    a
  else
    float_modulo (a -. b) b
;;

let () =
  let n = int_of_string Sys.argv.( 1 ) in
  let finite_field_size = float_of_string Sys.argv.( 2 ) in
  let module M = struct
    type t = float

    let gf = finite_field_size

    let identity = 200.0

    let ( + ) a b = float_modulo (a +. b) gf

    let ( * ) a b = float_modulo (a *. b) gf
  end
  in
  let module T = A.Make(M) in
  let a, hashes =
    T.finite_field_exp M.((identity + identity) * identity) n
  in
  Printf.printf "result = %.3f\n" a;
  try
    let fn = Sys.getenv "OCAML_GC_STATS" in
    let oc = open_out fn in
    Gc.print_stat oc
  with _ -> ()
;;
