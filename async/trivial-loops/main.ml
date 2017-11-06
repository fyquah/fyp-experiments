open Core
open Async

let run () =
  let i = 0 in
  Deferred.repeat_until_finished i (fun i ->
    if i > 0
    then Deferred.return (`Finished i)
    else Deferred.return (`Repeat (i + 1))
  )
  >>| fun a -> printf "%d\n" (a + 1)

let () =
  ignore (run ());
  never_returns (Scheduler.go ())
