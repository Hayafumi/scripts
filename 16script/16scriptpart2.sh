#!/bin/bash

color00="$( xrdb -query | grep 'color0'     | cut -f2 | head -n 1 )"
color01="$( xrdb -query | grep 'color1'     | cut -f2 | head -n 1 )"
color02="$( xrdb -query | grep 'color2'     | cut -f2 | head -n 1 )"
color03="$( xrdb -query | grep 'color3'     | cut -f2 | head -n 1 )"
color04="$( xrdb -query | grep 'color4'     | cut -f2 | head -n 1 )"
color05="$( xrdb -query | grep 'color5'     | cut -f2 | head -n 1 )"
color06="$( xrdb -query | grep 'color6'     | cut -f2 | head -n 1 )"
color07="$( xrdb -query | grep 'color7'     | cut -f2 | head -n 1 )"
color08="$( xrdb -query | grep 'color8'     | cut -f2 | head -n 1 )"
color09="$( xrdb -query | grep 'color9'     | cut -f2 | head -n 1 )"
color10="$( xrdb -query | grep 'color10'    | cut -f2 | head -n 1 )"
color11="$( xrdb -query | grep 'color11'    | cut -f2 | head -n 1 )"
color12="$( xrdb -query | grep 'color12'    | cut -f2 | head -n 1 )"
color13="$( xrdb -query | grep 'color13'    | cut -f2 | head -n 1 )"
color14="$( xrdb -query | grep 'color14'    | cut -f2 | head -n 1 )"
color15="$( xrdb -query | grep 'color15'    | cut -f2 | head -n 1 )"
color16="$( xrdb -query | grep 'color16'    | cut -f2 | head -n 1 )"
color17="$( xrdb -query | grep 'color17'    | cut -f2 | head -n 1 )"
color18="$( xrdb -query | grep 'color18'    | cut -f2 | head -n 1 )"
color19="$( xrdb -query | grep 'color19'    | cut -f2 | head -n 1 )"
color20="$( xrdb -query | grep 'color20'    | cut -f2 | head -n 1 )"
color21="$( xrdb -query | grep 'color21'    | cut -f2 | head -n 1 )"
fg="$(      xrdb -query | grep 'foreground' | cut -f2 | head -n 1 )"
bg="$(      xrdb -query | grep 'background' | cut -f2 | head -n 1 )"
cachedir="${HOME}/.cache/16script"
confdir="${HOME}/.config"
lastuse="$( < ${cachedir}/lastuse )"
dunstdir="${cachedir}/dunst"

grad(){
	convert -size 1366x768 xc: -sparse-color  Barycentric \
	"0,%h ${color05}    90,90 ${color02}" \
	"${cachedir}/bg.png"
	feh --bg-fill "${cachedir}/bg.png"
}

dunsch(){
	if [[ ! -e "${dunstdir}" ]]; then
		mkdir "${dunstdir}"
	fi
	if [[ -e "${dunstdir}/${lastuse}.dunst" ]]; then
		cat "${dunstdir}/${lastuse}.dunst" > "${confdir}/dunst/dunstrc"
	else; (
			sta="[urgency_low] [urgency_normal] [urgency_critical]"
			for c in ${sta}; do
				echo "${c}"
				printf "\tbackground = \"${bg}\"\n\tforeground = \"${fg}\"\n"
				if [[ ! "${c}" == "[urgency_critical]" ]]; then
					printf "\ttimeout = 4\n"
				else
					printf "\tframe_color=\"${color01}\"\n\ttimeout = 0\n"
				fi
			done
		) > "${dunstdir}/${lastuse}.dunst"; (
			cat "${confdir}/dunst/origin.dunst";
			cat "${dunstdir}/${lastuse}.dunst"
		) > "${confdir}/dunst/dunstrc"
		cat "${confdir}/dunst/dunstrc" > "${dunstdir}/${lastuse}.dunst"
	fi
	sed -i "70i\	frame_color = \"${bg}\"" "${confdir}/dunst/dunstrc"

	killall dunst
	dunst &
	disown
	if [[ "$(grep -o '^[0-9]\+' < /proc/uptime)" -gt "5" ]]; then
		notify-send "16script" "You're now using ${lastuse}."
	fi
}

main(){
	grad
	#hset
	dunsch
}

main "${@}"
