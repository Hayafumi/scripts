#!/bin/bash

while read a; do
	./16scriptver2.sh $a ./16scriptpart2
	maim -s -u "$a.png"
done < ~/.cache/16script/list
