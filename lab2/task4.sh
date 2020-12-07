#!/bin/bash

for pid in $(ps -eo pid | sed 1d)
do
	path="/proc/"$pid

	ppid=$(awk '/^PPid/ {print $2}' ${path}/status 2>/dev/null)
	if [ -z $ppid ]
		then
			continue
	fi

	ser=$(awk '/^se\.sum_exec_runtime/ {print $3}' ${path}/sched 2>/dev/null)
	nrs=$(awk '/nr_switches/ {print $3}' ${path}/sched 2>/dev/null)

	if [ -z $ser ] || [ -z $nrs ]
		then
			art=0
		else
			art=$(bc -l <<< $ser/$nrs)
	fi

	echo "$pid $ppid $art"
done |
sort -nk2 |
awk '{print "ProcessId="$1 " : " "Parent_ProcessID="$2 " : " "Average_Running_Time="$3}' > res4.txt

less res4.txt
