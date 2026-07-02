#!/bin/sh
HOST=www.google.at

while true; do
    # 1. DNS check
    if nslookup "$HOST" >/dev/null 2>&1; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') DNS OK"
    else
        echo "$(date '+%Y-%m-%d %H:%M:%S') DNS FAILED"
        sleep 30
        continue
    fi

    # 2. Ping check - mean ms over 5 pings
    avg=$(ping -c 5 "$HOST" | awk -F'/' '/rtt|round-trip/ {print $5}')
    echo "$(date '+%Y-%m-%d %H:%M:%S') Ping mean: ${avg} ms"

    sleep 30
done