#!/bin/bash

date=$(date +%F_%T)
path=~/test

mkdir -p "$path" 2>/dev/null && {
	echo "catalog was created successfully" > ~/report;
	touch "$path/$date";
}

ping www.net_nikogo.ru 2>/dev/null || echo "$(date +%F_%T) error: no one at \"www.net_nikogo\"" >> ~/report
