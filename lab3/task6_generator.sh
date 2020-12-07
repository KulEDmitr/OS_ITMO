#!/bin/bash

./task6_handler.sh &

while [[ true ]]
do
	read line

	case "$line" in
	"+" )
		kill -USR1 $(cat task6.pid)
	;;

	"*" )
		kill -USR2 $(cat task6.pid)
	;;

	"stop" )
		kill -SIGTERM $(cat task6.pid)
		exit
	;;

	esac
done
