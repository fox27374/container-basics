for i in $(seq 1 64); do
    ( nc -z -w1 10.42.22.$i 22 2>/dev/null && echo "10.42.22.$i: 22 open" ) &
done
wait