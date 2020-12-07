#!/bin/bash

ps -Ao pid,start_time --sort=start_time |
tail -n 1 > res3.txt

cat res3.txt
