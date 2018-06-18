open Vect_abstr
open Vect_instantiation

let () =
  let n = int_of_string (Sys.argv.(1)) in
  let a =
    List.init (n * 2000) (fun i ->
        let x = { VR2.x = float i; VR2.y = float (i + 1) } in
        VR2.dot x x)
  in
  let b =
    List.init (n * 2000) (fun i ->
      let x = (float i, float (i + 1)) in
      IV2.dot x x)
  in
  let c = 
    List.init (n * 2000) (fun i ->
      let x = (float i, float (i + 1), float (i + 2)) in
      IV3.dot x x)
  in
  let d =
    List.init (n * 3000) (fun i ->
      let x = { Vect3_record. x = float i; y = float (i + 1); z = float (i + 2) } in
      IV3R.dot x x)
  in
  let r = 
    List.fold_left (+.) 1.0 a
    +. List.fold_left (+.) 1.0 b
    +. List.fold_left (+.) 1.0 c
    +. List.fold_left (+.) 1.0 d
  in
  Format.printf "%f\n" r
;;

let () =
  try
    let fn = Sys.getenv "OCAML_GC_STATS" in
    let oc = open_out fn in
    Gc.print_stat oc
  with _ -> ()
