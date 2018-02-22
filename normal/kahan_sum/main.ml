(*
  This benchmark test the capacity of the compiler to inline Array.fold_left
  and promote reference assignment to local mutable variables, or continuarion
  variables.

  This is not possible yet as of 4.03
*)

open Micro_bench_types

let () =
  let n = int_of_string Sys.argv.(1) in
  let prepare n =
    let state = Random.State.make [|n|] in
    Array.init n (fun _ -> Random.State.float state 1e10)
  in
  Printf.printf "%.3f" (Kahan_sum.sum_with_array_fold (prepare n))
;;

let () =
  try
    let fn = Sys.getenv "OCAML_GC_STATS" in
    let oc = open_out fn in
    Gc.print_stat oc
  with _ -> ()
;;
