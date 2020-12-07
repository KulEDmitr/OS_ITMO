#!/bin/bash

echo -e  "Please, select to:\n\t\033[32m1 -> open nano\n\t2 -> open vi\n\t3 -> open links\n\t4 -> exit\033[0m"

read command

case "$command" in
	1) nano ;;
	2) vi ;;
	3) links ;;
	4) exit ;;
esac
