#!/usr/bin/env bash
clear
echo ""
BLUE='\033[0;35m' # Blue
NC='\033[0m' # No Color
(
printf ${BLUE}
echo "  █    ██  ██████    ▄████  ██▀███   ▄▄▄      ▓█████▄ ▓█████"
echo "  ██  ▓██▒▓██░  ██▒ ██▒ ▀█▒▓██ ▒ ██▒▒████▄    ▒██▀ ██▌▓█   ▀"
echo " ▓██  ▒██░▓██░ ██▓▒▒██░▄▄▄░▓██ ░▄█ ▒▒██  ▀█▄  ░██   █▌▒███"
echo " ▓▓█  ░██░▒██▄█▓▒ ▒░▓█  ██▓▒██▀▀█▄  ░██▄▄▄▄██ ░▓█▄   ▌▒▓█  ▄"
echo " ▒▒█████▓ ▒██▒ ░  ░░▒▓███▀▒░██▓ ▒██▒ ▓█   ▓██▒░▒████▓ ░▒████▒"
echo " ░▒▓▒ ▒ ▒ ▒▓▒░ ░  ░ ░▒   ▒ ░ ▒▓ ░▒▓░ ▒▒   ▓▒█░ ▒▒▓  ▒ ░░ ▒░ ░"
echo " ░░▒░ ░ ░ ░▒ ░       ░   ░   ░▒ ░ ▒░  ▒   ▒▒ ░ ░ ▒  ▒  ░ ░  ░"
echo "  ░░░ ░ ░ ░░       ░ ░   ░   ░░   ░   ░   ▒    ░ ░  ░    ░"
echo "    ░                    ░    ░           ░  ░   ░       ░  ░") | pv -qL 1000 && printf ${NC}
echo "  Arch Upgrade V.0.0.1                        by dave"
echo "You have 5 seconds to abort this operation."
echo "Press (ctrl+c) to abort."
sleep 1; echo "4..."
sleep 1; echo "3..."
sleep 1; echo "2..."
sleep 1; echo "1..."
sleep 1
trizen -Syu
echo ""
echo "Finished.  Upgrade Complete!"
echo "Your system has been updated, cleaned and polished successfully."
echo ""
