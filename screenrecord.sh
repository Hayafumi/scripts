#!/bin/bash

chgif(){
	export FILE="${HOME}/rec_$(date +%Y_%m_%d_%H_%M_%S).mp4";
	ffmpeg -f x11grab -show_region 1 $(slop -f "-s %wx%h -i :0.0+%x,%y") \
	-c:v libx264 -c:a flac "${FILE}";
	test ["?$"="255"] &&
	i3-input -P "Do you want to upload it?(y/n) " |
	grep output |
	grep -q y &&
	~/scripts/gfycat "${FILE}"
	rm $FILE
}

outf(){
	if [[ -n "${1}" ]]; then
		if [[ "${1}" == "-g" ]]; then
			chgif
		else
			outfile="${1}"
		fi
	if [[ "${1}" == "-n" ]]; then
		outfile="$HOME/rec_$(date +%Y_%m_%d_%H_%M_%S).mp4"
	fi
	else
		outfile="rec_$(date +%Y_%m_%d_%H_%M_%S).mp4"
	fi
}

main(){
	outf "${@}"

	if [[ ! "${1}" == "-g" ]]; then
		ffmpeg -f x11grab -show_region 1 $(slop -f "-s %wx%h -i :0.0+%x,%y") \
		-c:v libx264 -c:a flac "${outfile}"
	fi
}

main "${@}"
