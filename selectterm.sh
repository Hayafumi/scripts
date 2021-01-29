#!/bin/bash

# Simple script to handle a DIY shutdown menu. When run you should see a bunch of options (shutdown, reboot etc.)
#
# Requirements:
# - rofi
# - systemd, but you can replace the commands for OpenRC or anything else
#
# Instructions:
# - Save this file as power.sh or anything
# - Give it exec priviledge, or chmod +x /path/to/power.sh
# - Run it

chosen=$(echo -e "urxvt\nalacritty\nkitty\nxterm" | rofi -dmenu -i -lines 4 -width 20)
# Info about some states are available here:
# https://www.freedesktop.org/software/systemd/man/systemd-sleep.conf.html#Description

if [[ $chosen = "urxvt" ]]; then
	urxvt
elif [[ $chosen = "alacritty" ]]; then
	alacritty
elif [[ $chosen = "kitty" ]]; then
	kitty
elif [[ $chosen = "xterm" ]]; then
	xterm
fi
