#!/bin/bash
day="$(date +%d)"
cal="$(cal | sed "s/$day/\<span color=\'#4d9de0\'\>\<b\>$day\<\/b\>\<\/span\>/" | sed '1d')"
top="$(cal | sed '1!d')"

notify-send "$top" "$cal"
