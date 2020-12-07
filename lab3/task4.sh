#!/bin/bash

script="/home/user/laba3/task4_c.sh"

nice -n 19 "$script" &
pid1="$!"
echo "$pid1"

"$script" &
pid2="$!"

"$script" &

sleep 10 && kill "$!" &

sleep 10 && kill "$pid1" && kill "$pid2"
