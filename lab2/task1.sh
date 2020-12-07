#!/bin/bash

process=$(ps -U user -o "%p : %c")

echo "$process" | tail -n +2 | wc -l > res1.txt
echo "$process" >> res1.txt

cat res1.txt
