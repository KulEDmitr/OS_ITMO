#!/bin/bash

prev_ppid=$(cat res4.txt | head -n1 | awk -F ':' '{print $2}' | awk -F '=' '{print $2}')

result=""
count=0
sum_art=0

echo "" > res5.txt

while read line
do
	echo $line >> ch5.txt

	pid=$(echo $line | awk -F ':' '{print $1}' | awk -F '=' '{print $2}')
	art=$(echo $line | awk -F ':' '{print $3}' | awk -F '=' '{print $2}')
	ppid=$(echo $line | awk -F ':' '{print $2}' | awk -F '=' '{print $2}')

	if [[ $prev_ppid -eq $ppid ]]
		then
			count=$(bc <<< $count+1)
			sum_art=$(bc -l <<< $sum_art+$art)

		else
			sum_art=$(bc -l <<< $sum_art/$count)

			echo "Average_Sleeping_Children_of_ParentID="$prev_ppid" is "$sum_art >> res5.txt
			prev_ppid=$ppid
			count=1
			sum_art=$art
	fi

	echo $line >> res5.txt
done < res4.txt

sum_art=$(bc -l <<< $sum_art/$count)
echo "Average_Slipping_Children_of_ParentID="$ppid" is "$sum_art >> res5.txt

less res5.txt

