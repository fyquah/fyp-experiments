module Make(T: sig

    type t

    val identity : t

    val ( + ) : t -> t -> t

    val ( * ) : t -> t -> t

  end) : sig

  val finite_field_exp : T.t -> int -> T.t * T.t array
end
