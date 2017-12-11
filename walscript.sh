#!/bin/bash

diediediedie(){
	cat  ~/.config/termite/top
	termcolors -i xresources -o termite < ~/.cache/wal/colors.Xresources 
}

diediediedie > ~/.config/termite/config