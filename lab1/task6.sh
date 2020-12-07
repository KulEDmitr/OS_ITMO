#!/bin/bash

awk '$3 == "(WW)" {$3="Warning:" ; print $0}' /var/log/anaconda/X.log > full.log
awk '$3 == "(II)" {$3="Information:" ; print $0}' /var/log/anaconda/X.log >> full.log

less full.log

#less /var/log/anaconda/X.log
#awk '{print $3}' /var/log/anaconda/X.log
