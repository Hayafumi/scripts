#!/bin/bash

while read a; do
	./16script.sh $a ./16scriptpart2
done < ~/.cache/16script/list
