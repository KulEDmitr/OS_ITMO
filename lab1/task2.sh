#!/bin/bash

string=''

read tmp

while [[ "$tmp" != "q" ]]
	do
		string="$string$tmp"
		read tmp
done

echo "The result strinh is: $string"

