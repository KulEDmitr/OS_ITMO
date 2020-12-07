#!/bin/bash

function error {
	echo "error occured"
	killall tail
	kill $(cat task5.pid)
	rm task5.pid
	rm pipe
}

num=1
mod="+"

(tail -n 0 -f pipe) |
while [[ true ]]
do
	read line

	case "$line" in
	"+")
		mod="+"
	;;

	"*")
		mod="*"
	;;

	"QUIT")
		killall tail
		exit
	;;

	[0-9]*)
		case "$mod" in
		"+")
			num=$(( "$num" + "$line" ))
		;;

		"*")
			num=$(( "$num" * "$line" ))
		;;

		*)
			error
			exit
		;;

		esac

		echo "New result = $num"
	;;

	*)
		error
		exit
	;;

	esac
done

exit
