#!/bin/bash
echo "user, UID:"
awk -F: '{print $1 ", " $3}' /etc/passwd | sort -nk2
