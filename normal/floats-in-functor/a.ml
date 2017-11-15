module Make(T: sig

    type t

    val identity : t

    val ( + ) : t -> t -> t

    val ( * ) : t -> t -> t

  end) = struct

  let finite_field_exp base power =
    let prev = ref T.identity in
    let arr =
      Array.init power (fun (_ : int) ->
          prev := T.( !prev + T.identity );
          T.( identity + !prev ))
    in
    let rec loop ~i ~acc =
      if i >= power then
        acc
      else begin
        let ret = T.( acc * base + base) in
        Array.set arr i ret;
        loop ~i:(i + 1) ~acc:ret
      end
    in
    (loop ~i:0 ~acc:T.identity, arr)
  ;;
end
