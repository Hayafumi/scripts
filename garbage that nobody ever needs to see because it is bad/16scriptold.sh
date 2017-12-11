#!/bin/bash

termitech(){
	echo "Setting termite colorscheme"
	if [[ -f ~/scripts/16script/termite/"$1.termite" ]]; then
		echo "termite config found in ~/scripts/16script/termite/ :)"
		cat ~/.config/termite/top > ~/.config/termite/config
		cat ~/scripts/16script/termite/"$1.termite" >> ~/.config/termite/config
		echo "termite config updated :)"
	else
		echo "termite config not found. Downloading from GitHub"
		if ! curl -s https://raw.githubusercontent.com/khamer/base16-termite/master/themes/"$1.config" | grep -q "404: Not Found"; then
			curl -s https://raw.githubusercontent.com/khamer/base16-termite/master/themes/"$1.config" > ~/scripts/16script/termite/"$1.termite"
			cat ~/.config/termite/top > ~/.config/termite.config
			cat ~/scripts/16script/termite/"$1.termite" >> ~/.config/termite/config
			echo "termite config updated :)"
		else
			echo "Could not download termite config from GitHub"
		fi
	fi
}

xresch() {
	echo "updating .Xresources"
	if [[ "$(head -n -14 ~/scripts/16script/Xresources/"$1.Xresources" 2> /dev/null | sed '1,62d')" == "$(head -n -14 ~/.Xresources | sed '1,62d' )" ]]; then
		echo "Xresources config file found in ~/scripts/16script/Xresources/ :)"
		cat ~/scripts/16script/Xresources/"$1.Xresources" > ~/.Xresources
		echo "Reloading xrdb"
		xrdb ~/.Xresources
		echo "Xresources updated :)"
	else
		echo "Config file not found or not matching. Downloading from GitHub."
		if ! curl -s https://raw.githubusercontent.com/0xdec/base16-rofi/master/themes/"$1".config | grep -q "404: Not Found" ; then
			(
			echo '!     _  __';
			echo '!    | |/ /________  _________  __  _______________  _____';
			echo '!    |   // ___/ _ \/ ___/ __ \/ / / / ___/ ___/ _ \/ ___/';
			echo '! _ /   |/ /  /  __(__  ) /_/ / /_/ / /  / /__/  __(__  )';
			echo '!(_)_/|_/_/   \___/____/\____/\__,_/_/   \___/\___/____/';
			echo '!';
			echo "";
			curl -s https://raw.githubusercontent.com/chriskempson/base16-xresources/master/xresources/"$1-256.Xresources";
			echo "";
			head -n -14 ~/.Xresources | sed '1,62d';
			echo "";
			curl -s https://raw.githubusercontent.com/0xdec/base16-rofi/master/themes/"$1.config" | sed -n '/! Enable the extended coloring options/,$p') > ~/scripts/16script/Xresources/"$1.Xresources"
			cat ~/scripts/16script/Xresources/"$1.Xresources" > ~/.Xresources
			xrdb ~/.Xresources
		else
			echo "Could not download Xresources config from GitHub"
		fi
	fi
}

xresch0(){
	if [[ -f ~/scripts/16script/Xresources/"$1.Xresources" ]]; then
		echo "Xresources file found :)"
		xres="$(cat ~/scripts/16script/Xresources/"$1.Xresources")"
		echo "Merging xrdb"
		xrdb -merge <<< "$xres"
	else
		echo "Xresources not found, Downloading from Github"
		curl -s https://raw.githubusercontent.com/chriskempson/base16-xresources/master/xresources/"$1-256.Xresources" > ~/scripts/16script/Xresources/"$1.Xresources"
		curl -s https://raw.githubusercontent.com/0xdec/base16-rofi/master/themes/"$1".config >> ~/scripts/16script/Xresources/"$1.Xresources"
		xres="$(cat ~/scripts/16script/Xresources/"$1.Xresources")"
		echo "Merging xrdb"
		xrdb -merge <<< "$xres"
	fi
}



xsetch() {
	~/scripts/bitbg.sh "$(~/scripts/bitbg.sh)"
}

i3ch(){
	echo "updating i3 config"
	if [[ "$(sed -e '1,25d' ~/scripts/16script/i3/"$1.i3" )" == "$(sed -e '1,25d' ~/.config/i3/config)" ]]; then
		echo "i3 config file found in ~/scripts/16script/i3/ :)"
		cat ~/scripts/16script/i3/"$1.i3" > ~/.config/i3/config
		echo "i3 config updated :)"
	else
		echo "i3 config not found. Downloading from GitHub."
		if ! curl -s https://raw.githubusercontent.com/khamer/base16-i3/master/colors/"$1".config | grep -q "404: Not Found"; then
			(
			echo "#    _ _____                     _____";
			echo "#   (_)__  /   _________  ____  / __(_)___ _";
			echo '#  / / /_ <   / ___/ __ \/ __ \/ /_/ / __ `/';
			echo "# / /___/ /  / /__/ /_/ / / / / __/ / /_/ /";
			echo '#/_//____/   \___/\____/_/ /_/_/ /_/\__, /';
			echo "#                                  /____/";
			echo "";
			echo "#Colors";
			curl -s https://raw.githubusercontent.com/khamer/base16-i3/master/colors/"$1".config | sed -n 6,21p;
			echo "";
			sed -e '1,25d' ~/.config/i3/config ) >  ~/scripts/16script/i3/"$1.i3"
			cat ~/scripts/16script/i3/"$1.i3" > ~/.config/i3/config
			echo "i3 config updated :)"
		else
			echo "Could not download i3 config from GitHub"
		fi
	fi
}

vimch(){
	echo "Updating vim..."
	( head -n -1 ~/.vimrc; echo "colorscheme $1" ) > ~/scripts/16script/vim/"$1.vimrc"
	cat ~/scripts/16script/vim/"$1.vimrc" > ~/.vimrc
	echo "vim config updated :)"
}

relthgs() {
	echo "Reloading all of the things."
	for term in /dev/pts/[0-9]*; do
		[[ -w "$term" ]] && ~/.config/base16-shell/scripts/"$1.sh" > "$term" &
	done
	i3-msg restart
	~/scripts/launch.sh &
	disown
}

main(){
	if [ "$#" -eq 1 ]; then
		if [[ "$1" == *.png ]]; then
			echo "${1::-4}" > ~/scripts/16script/lastarg
#			termitech "${1::-4}"
#			xresch "${1::-4}"
			xresch0 "${1::-4}"
#			xsetch
			convert -size 1920x1080 canvas:"$(xrdb -query | grep color2 | cut -f2)" ~/scripts/16script/background.jpg; feh --bg-fill ~/scripts/16script/background.jpg
			vimch "${1::-4}"
#			#i3ch "${1::-4}"
			relthgs "${1::-4}"
		else
			echo "lol unintended usage"
		fi
	else
		echo "lol unintended usage"
	fi
}

main $@
