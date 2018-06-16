(** qr.ml --- QR decompisition by Gram-Schmidt orthonormalization

    [MIT License] Copyright (C) 2015 Akinori ABE
*)

open Format

let init_matrix m n f = Array.init m (fun i -> Array.init n (f i))

let matrix_size a =
  let m = Array.length a in
  let n = if m = 0 then 0 else Array.length a.(0) in
  (m, n)

let map2 f x y =  Array.mapi (fun i xi -> f xi y.(i)) x
let iter2 f x y = Array.iteri (fun i xi -> f xi y.(i)) x

let fold_left2 f init x y =
  let acc = ref init in
  for i = 0 to Array.length x - 1 do acc := f !acc x.(i) y.(i) done;
  !acc

(* ================================================================= *
 * BLAS-like functions for linear algebraic operations
 * ================================================================= *)

(** Dot product of two vectors *)
let dot = fold_left2 (fun acc xi yi -> acc +. xi *. yi) 0.0

(** Execute [y := alpha * x + y] where [alpha] is a scalar, [x] and [y] are
    vectors. *)
let axpy ~alpha x y =
  let n = Array.length x in
  for i = 0 to n - 1 do y.(i) <- alpha *. x.(i) +. y.(i) done

(** [gemv_t a x] computes [a^T * x] where [a] is a matrix and [x] is a vector.
*)
let gemv_t a x =
  let (_, n) = matrix_size a in
  let y = Array.make n 0.0 in
  iter2 (fun ai xi -> axpy ~alpha:xi ai y) a x;
  y

(** [gemm x y] computes [x * y] where [x] and [y] are (rectangular) matrices. *)
let gemm x y =
  let m, k = matrix_size x in
  let k', n = matrix_size y in
  assert(k = k');
  Array.map (gemv_t y) x

(** Transpose a given matrix. *)
let trans a =
  let m, n = matrix_size a in
  init_matrix n m (fun i j -> a.(j).(i))

(* ================================================================= *
 * QR decomposition via Householder transformation
 * ================================================================= *)

(** [householder x y] returns householder transformation matrix [h] (such that
    [h * x] = [y] and [h * y] = [x]). *)
let householder x y =
  let z = map2 ( -. ) x y in
  let c = 2. /. dot z z in
  let h i zi j zj = (if i = j then 1. else 0.) -. c *. zi *. zj in
  Array.mapi (fun i zi -> Array.mapi (h i zi) z) z

(** [gemm_householder k x h] multiplies matrix [x] and householder matrix [h]
    (of the [k]-th iteration). *)
let gemm_householder k x h =
  let t = Array.length h in
  let update_row xi =
    let xi' = Array.sub xi k t in
    Array.iteri (fun j hj -> xi.(j+k) <- dot xi' hj) h
  in
  Array.iter update_row x

(** [qr a] computes QR-decomposition of (rectangular) matrix [a] via Householder
    transformation.
    @return [(q, r)] where [q] is an orthogonal matrix and [r] is a right
    trapezoidal matrix. *)
let qr a =
  let w = trans a in (* a working memory *)
  let (m, n) = matrix_size w in
  let q = Array.make n [||] in (* orthogonal matrix *)
  for k = 0 to min m n - 1 do
    (* Compute householder transformation matrix [h]. *)
    let x = Array.sub w.(k) k (n - k) in
    let y = Array.make (Array.length x) 0. in
    y.(0) <- copysign (sqrt (dot x x)) (~-. (x.(0)));
    let h = householder x y in
    (* Update orthogonal matrix [q] *)
    if k = 0 then Array.blit h 0 q 0 n else gemm_householder k q h;
    (* Update working memory [w] *)
    w.(k).(k) <- y.(0);
    gemm_householder k (Array.sub w (k + 1) (m - k - 1)) h
  done;
  let r = init_matrix n m (fun i j -> if i <= j then w.(j).(i) else 0.) in
  (q, r)

(* ================================================================= *
 * Main routine
 * ================================================================= *)

let print_mat label x =
  printf "%s =@\n" label;
  Array.iter (fun xi ->
      Array.iter (printf "  %8.4f") xi;
      print_newline ()) x

let a =
    [|
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
      [| 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.;  3.; 5.; 0.; 0.; 1.; 3.; 5.; 0.; 0.; 1.|];
      [| 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.;  0.; 2.; 3.; 0.; 9.; 0.; 2.; 3.; 0.; 9.|];
      [|-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.; -1.; 1.; 4.; 2.; 3.;-1.; 1.; 4.; 2.; 3.|];
      [| 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.;  6.; 0.;-9.; 1.; 0.; 6.; 0.;-9.; 1.; 0.|];
      [|-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.; -8.; 3.; 1.;-5.; 2.;-8.; 3.; 1.;-5.; 2.|];
    |]

let main () =
  let q, r = qr a in
  (* print_mat "Q" q; *)
  (* print_mat "R" r; *)
  (* print_mat "Q * R" *) (gemm q r)

let () =
  let _ = main () in
  try
    let fn = Sys.getenv "OCAML_GC_STATS" in
    let oc = open_out fn in
    Gc.print_stat oc
  with _ -> ()
;;