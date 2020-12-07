#!/bin/bash

ps -Ao command,pid |
awk '/^\/sbin\// {print $0}' |
grep -Eo "[0-9]+" > res2.txt

cat res2.txt
