#!/bin/bash

echo $$ > task6.pid

num=1
mod="+"

add() {
	mod="+"
}

mul() {
	mod="*"
}

term() {
	echo "got SIGTERM signal"
	rm task6.pid
	exit
}

calculate() {
	case "$mod" in
	"+")
		num=$(( "$num" + 2 ))
	;;

	"*")
		num=$(( "$num" * 2 ))
	;;

	esac
}


trap 'add' USR1
trap 'mul' USR2
trap 'term' SIGTERM

while [[ true ]]
do
	calculate
	echo "New result = $num"
	sleep 1
done
