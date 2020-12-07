#!/bin/bash

grep -s "VmRSS" /proc/*/status |
tr '/' ' ' |
sort -rnk4 |
head -n1 |
awk '{print "ProcessID="$2, "Memory="$4}' > res6.txt

top -b -n1 -o RES |
tail -n+8 |
head -n1 |
awk '{print "ProcessID="$1, "Memory="$6}'>> res6.txt

cat res6.txt
