#!/bin/bash

main(){
	convert -size 1920x1080 canvas:"$(xrdb -query | grep color2 | cut -f2)" ~/.cache/16script/background.jpg
	feh --bg-fill ~/.cache/16script/background.jpg
}

main "$@"
