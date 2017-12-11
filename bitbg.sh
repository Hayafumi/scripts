#!/bin/bash

if [[ -n $1 ]]; then
	readlink -f "$1" > ~/scripts/lastbitbg
	xsetroot -bitmap $1 -bg "$(sed -n 11,25p ~/.Xresources | cut -c 16- | sed -n 4p)" -fg "$(sed -n 11,25p ~/.Xresources | cut -c 16- | sed -n 1p)" && echo "Success!"
else
	cat ~/scripts/lastbitbg
fi
