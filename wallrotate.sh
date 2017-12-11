#!/bin/bash
walper () {
	wal -i $1 -t -o ~/scripts/walscript.sh
}

for f in /home/reed/.wallpapers/*
do
	walper "$f"
	sleep 3
done