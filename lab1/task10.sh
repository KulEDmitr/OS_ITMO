#!/bin/bash

man bash |
grep -oi "[[:alnum:]]\{4,\}" |
tr [:upper:] [:lower:] |
sort |
uniq -c |
sort -rnk1 -k2 |
head -3 |
awk '{print $2}'

