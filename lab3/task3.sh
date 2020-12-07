#!/bin//bash

day=$(date +%u)
echo "*/5 * * * $day /home/user/laba3/task1.sh" | crontab
