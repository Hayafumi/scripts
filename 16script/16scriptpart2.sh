#!/bin/bash

foreground="$(xrdb -query | grep 'foreground' | cut -f2 | head -n 1)"
background="$(xrdb -query | grep 'background' | cut -f2 | head -n 1)"
color0="$(xrdb -query | grep 'color0' | cut -f2 | head -n 1)"
color1="$(xrdb -query | grep 'color1' | cut -f2 | head -n 1)"
color2="$(xrdb -query | grep 'color2' | cut -f2 | head -n 1)"
color3="$(xrdb -query | grep 'color3' | cut -f2 | head -n 1)"
color4="$(xrdb -query | grep 'color4' | cut -f2 | head -n 1)"
color5="$(xrdb -query | grep 'color5' | cut -f2 | head -n 1)"
color6="$(xrdb -query | grep 'color6' | cut -f2 | head -n 1)"
color7="$(xrdb -query | grep 'color7' | cut -f2 | head -n 1)"
color8="$(xrdb -query | grep 'color8' | cut -f2 | head -n 1)"
color9="$(xrdb -query | grep 'color9' | cut -f2 | head -n 1)"
color10="$(xrdb -query | grep 'color10' | cut -f2 | head -n 1)"
color11="$(xrdb -query | grep 'color11' | cut -f2 | head -n 1)"
color12="$(xrdb -query | grep 'color12' | cut -f2 | head -n 1)"
color13="$(xrdb -query | grep 'color13' | cut -f2 | head -n 1)"
color14="$(xrdb -query | grep 'color14' | cut -f2 | head -n 1)"
color15="$(xrdb -query | grep 'color15' | cut -f2 | head -n 1)"
color16="$(xrdb -query | grep 'color16' | cut -f2 | head -n 1)"
color17="$(xrdb -query | grep 'color17' | cut -f2 | head -n 1)"
color18="$(xrdb -query | grep 'color18' | cut -f2 | head -n 1)"
color19="$(xrdb -query | grep 'color19' | cut -f2 | head -n 1)"
color20="$(xrdb -query | grep 'color20' | cut -f2 | head -n 1)"
color21="$(xrdb -query | grep 'color21' | cut -f2 | head -n 1)"
cachedir="${HOME}/.cache/16script"
confdir="${HOME}/.config"
lastuse="$(< "${cachedir}/lastuse" )"
dunstdir="${cachedir}/dunst"

bgr(){
	convert -size 1920x1080 canvas:"$(xrdb -query | grep color2 | cut -f2)" ~/.cache/16script/background.jpg
	feh --bg-fill ~/.cache/16script/background.jpg
}

dunsch(){
	if [[ ! -d "${dunstdir}" ]]; then
		mkdir "${dunstdir}"
	fi
	sta="[urgency_low] [urgency_normal] [urgency_critical]"
	(
#	for c in ${sta}; do
#	echo "${c}"
#	echo "\	background = \"${background}\"\n\	background = ${background}\""
#	if [[ ! "${c}" == "[urgency_critical]"]]; then
#		echo "\	timeout = 4"
#	else
#		echo "\	frame_color=\"${color1}\"\n\	timeout = 0"
#	fi
#	done
	echo "[urgency_low]";
	echo "	background = \""${background}"\"";
	echo "	foreground = \""${foreground}"\"";
	echo "	timeout = 2";
	echo "";
	echo "[urgency_normal]";
	echo "	background = \""${background}"\"";
	echo "	foreground = \""${foreground}"\"";
	echo "	timeout = 4";
	echo "";
	echo "[urgency_critical]";
	echo "	background = \""${background}"\"";
	echo "	foreground = \""${foreground}"\"";
	echo "	frame_color = \""${color1}"\"";
	echo "	timeout = 0"
	) > "${dunstdir}/${lastuse}.dunst"
	(
	cat "${confdir}/dunst/origin.dunst";
	cat "${dunstdir}/${lastuse}.dunst"
	) > "${confdir}/dunst/dunstrc"
	sed -i "70i\	frame_color = \""${background}"\"" "${confdir}/dunst/dunstrc"
	killall dunst
	dunst &
	disown
}

main(){
	bgr
	dunsch
	notify-send "16script" "You're now using "${lastuse}"."
}

main "$@"
