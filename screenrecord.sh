#!/bin/bash

outf(){
	if [[ -n "${1}" ]]; then
		outfile="${1}"
	else
		outfile="${HOME}/rec_$(date +%Y_%m_%d_%H_%M_%S).mp4"
	fi
}

main(){
	outf "${@}"

	ffmpeg -f alsa -i pulse -filter:a "volume=0" -f x11grab -show_region 1 $(slop -f "-s %wx%h -i :0.0+%x,%y") \
	-c:v libx264 -c:a flac "${outfile}"
}

main "${@}"
