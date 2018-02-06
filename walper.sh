#!/bin/bash

if [[ "$1" == base16-*.png ]]; then
	~/scripts/16script/16script.sh "${1::-4}" ~/scripts/16script/16scriptpart2.sh
	echo "${1::-4}" > ~/.background/16script
	if [[ -e ~/.background/wal ]]; then
		rm ~/.background/current
		ln -s "$(< ~/.background/wal)" ~/.background/current
		rm ~/.background/wal
	fi
elif [[ "$1" == "-g" ]]; then
	rm ~/.background/wal
	rm ~/.background/current
	ln -s "$(readlink -f "$2")" ~/.background/current
	feh --bg-fill ~/.background/current
elif [[ "$1" == "-e" ]]; then
	if [[ -e ~/.background/wal ]]; then
		wal -i "$(< ~/.background/wal)"
		~/scripts/16script/16scriptpart2.sh
	else
		feh --bg-fill ~/.background/current
	fi
elif [[ "$1" == "-s" ]]; then
	[[ -e ~/.background/wal ]] && (cat ~/.cache/wal/sequences &)
	[[ -e ~/.background/16script ]] && ~/.config/base16-shell/scripts/"$(< ~/.background/16script).sh"
else
	wal -i "$1"
	rm ~/.background/current
	rm ~/.background/16script
	readlink -f "$1" > ~/.background/wal
fi
