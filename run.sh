#!/bin/bash
trap "rm server;kill 0" EXIT

go build -o server
./server -port=8001 &
./server -port=8002 &
./server -port=8003 -api=1 &

sleep 2
echo ">>> start test"
curl "http://localhost:9999/api?key=KingBob" &
curl "http://localhost:9999/api?key=KingBob" &
curl "http://localhost:9999/api?key=KingBob" &
curl "http://localhost:9999/api?key=KingBob" &
curl "http://localhost:9999/api?key=KingBob" &
curl "http://localhost:9999/api?key=KingBob" &
sleep 2
curl "http://localhost:9999/api?key=KingBob" &
curl "http://localhost:9999/api?key=Jane" &
curl "http://localhost:9999/api?key=Nike" &
sleep 2
curl "http://localhost:9999/api?key=KingBob" &
curl "http://localhost:9999/api?key=Jane" &
curl "http://localhost:9999/api?key=Nike" &
wait