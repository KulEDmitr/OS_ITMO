#!/bin/bash

file_f="res7_1.txt"
file_s="res7_2.txt"

function check {
	for cur in $(ps -aux | awk '{print $2" "$11}' | sed 1d)
	do
		path=$(awk '{print "/proc/"$1"/io"}' <<< "$cur")
		if [[ -f $path ]]
			then
				bytes=$(awk '/read_bytes/ {print $2}' $path)
				echo "$cur" | awk '{print $1" "$2" "$bytes}'
		fi
	done
}

check > "$file_f"
sleep 60s
check > "$file_s"

for cur in $(cat $file_f)
do
	pid=$(echo "$cur" | awk '{print $1}')
	s_byte=$(awk '$1 == $pid {print $2}' $file_s)
	f_byte=$(echo "$cur" | awk '{print $2}')
	if [[ -z s_byte ]]
		then
			continue
	fi
	delta=$(bc <<< $s_byte-$f_byte)
	cmd=$(echo "$cur" | awk '{print $3}')
	echo "$pid:$cmd:$delta"
done |
sort -t ":" -nrk3 |
head -n 3 > res7.txt

rm res7_1.txt res7_2.txt
cat res7.txt
