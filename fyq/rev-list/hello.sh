for i in $(seq 10 100); do
    echo "|> Revlist.rappend (fun () -> print_int_native $i)"
done
