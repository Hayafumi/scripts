#!/bin/bash

if [[ -z $1 ]]; then
	< ~/scripts/wallarg
else
	if [[ "$1" == base16-*.png ]]; then
		~/scripts/16script/16script.sh "${1::-4}" ~/scripts/16script/16scriptpart2.sh
	else
		wal -i $1 -t -o ~/scripts/walscript.sh
	fi
fi
