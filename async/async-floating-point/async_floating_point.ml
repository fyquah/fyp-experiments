open Core
open Async

type ticker =
  { bid    : float;
    ask    : float;
    volume : float;
    last   : float;
  }

let stock_ticker prev =
  let diff () = (Random.float 2.0) -. 1.0 in
  let rec loop acc count =
    if count = 0 then begin
      Deferred.return acc
    end else begin
      Deferred.return (
        { bid    = acc.bid +. diff ();
          ask    = acc.ask +. diff ();
          volume = acc.volume +. diff ();
          last   = acc.last +. diff ();
        }
      )
      >>= fun acc ->
      loop acc (count - 1)
    end
  in
  loop prev 5
;;

module Make_state(T: sig

  val estimate_fair_value : bid: float -> ask: float -> float Deferred.t

end) = struct

  type t =
    { pnl : float;
      iter : int;
      prev : ticker;
    }

  let init =
    { pnl = 0.0;
      iter = 0;
      prev = { bid = 0.0; ask = 0.0; volume = 0.0; last = 0.0 };
    }
  ;;

  let estimate_next_ticker t (ticker : ticker) =
    T.estimate_fair_value ~bid:ticker.bid ~ask:ticker.ask
    >>= fun fv ->
    let fv = fv +. Random.float 3.0 -. 1.5 in
    (* Here is a bunch of non sensical calculations , but the structure of
     * the calculation is something that might that might appeat in the real
     * world.
     *
     * We use [estimate_fair_value] a lot of times.
     *)
    let bid =
      T.estimate_fair_value ~bid:(t.pnl +. fv) ~ask:(t.prev.bid *. 3.0)
    and ask =
      T.estimate_fair_value ~bid:(ticker.bid +. 1.0) ~ask:ticker.ask
    and volume =
      T.estimate_fair_value ~bid:ticker.bid ~ask:(ticker.ask +. 3.0)
    and last =
      T.estimate_fair_value ~bid:(ticker.bid +. 5.0) ~ask:ticker.ask
    in
    Deferred.both (Deferred.both bid ask) (Deferred.both volume last)
    >>| fun ((bid, ask), (volume, last)) ->
    { bid; ask; volume; last; }
  ;;
end

let main () =
  let seed = { bid = 0.0; ask = 0.0; volume = 0.0; last = 0.0 } in
  Deferred.return seed
  >>= fun ticker ->
  let module T = struct
    let weights =
      { bid = 7.8; ask = 1.2; volume = 9.3; last = 12.4; }
    ;;

    let estimate_fair_value ~bid ~ask =
      Deferred.return 1.0 >>= fun a ->
      Deferred.return 2.0 >>= fun b ->
      Deferred.return 3.0 >>| fun c ->
      bid *. (a +. b +. c) +. ask
    ;;

  end
  in
  let get_market_variance () = Deferred.return (Random.float 10.0) in
  let make_normalizer ~fv ~spread =
    get_market_variance ()
    >>| fun var -> (fun x -> x +. (fv *. spread) +. x /. 100.0 *. var)
  in
  let module M = Make_state(T) in
  Deferred.repeat_until_finished M.init (fun state ->
    if state.iter = 10000
    then Deferred.return (`Finished ())
    else begin
      stock_ticker state.prev
      >>= fun ticker ->
      M.estimate_next_ticker state ticker
      >>= fun next_ticker ->
      let fv = (next_ticker.ask +. next_ticker.bid) /. 2.0 in
      let spread = ticker.ask -. ticker.bid in
      make_normalizer ~fv ~spread
      >>= fun normalizer ->
      Deferred.return (
        `Repeat ({
          M.
          pnl = normalizer state.pnl;
          iter = state.iter + 1;
          prev = ticker;
      }))
    end
  )
;;

let () =
  Random.init 1000;  (* Reproduciability *)
  don't_wait_for (main ());
  never_returns @@ Scheduler.go ()
;;
