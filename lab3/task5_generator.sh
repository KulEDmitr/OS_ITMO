#!/bin/bash

echo $$ > task5.pid
mkfifo pipe
./task5_handler.sh &

while [[ true ]]
do
	read line
	echo "$line" >> pipe

	if [[ "$line" == "QUIT" ]]
	then
		rm pipe
		exit
	fi

done
