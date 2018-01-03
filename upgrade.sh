#!/usr/bin/env bash
clear
echo ""
RED='\033[0;31m' # Red
NC='\033[0m' # No Color
printf ${RED}
echo "  █    ██  ██████    ▄████  ██▀███   ▄▄▄      ▓█████▄ ▓█████" 
echo "  ██  ▓██▒▓██░  ██▒ ██▒ ▀█▒▓██ ▒ ██▒▒████▄    ▒██▀ ██▌▓█   ▀" 
echo " ▓██  ▒██░▓██░ ██▓▒▒██░▄▄▄░▓██ ░▄█ ▒▒██  ▀█▄  ░██   █▌▒███"   
echo " ▓▓█  ░██░▒██▄█▓▒ ▒░▓█  ██▓▒██▀▀█▄  ░██▄▄▄▄██ ░▓█▄   ▌▒▓█  ▄" 
echo " ▒▒█████▓ ▒██▒ ░  ░░▒▓███▀▒░██▓ ▒██▒ ▓█   ▓██▒░▒████▓ ░▒████▒"
echo " ░▒▓▒ ▒ ▒ ▒▓▒░ ░  ░ ░▒   ▒ ░ ▒▓ ░▒▓░ ▒▒   ▓▒█░ ▒▒▓  ▒ ░░ ▒░ ░"
echo " ░░▒░ ░ ░ ░▒ ░       ░   ░   ░▒ ░ ▒░  ▒   ▒▒ ░ ░ ▒  ▒  ░ ░  ░"
echo "  ░░░ ░ ░ ░░       ░ ░   ░   ░░   ░   ░   ▒    ░ ░  ░    ░"   
echo "    ░                    ░    ░           ░  ░   ░       ░  ░" && printf ${NC}
echo "  Manjaro Upgrade V.0.0.1                        by dave"
echo ""
echo ""
sleep 1
echo "You have 5 seconds to abort this operation."
echo "Press (ctrl+c) to abort."
echo ""
sleep 4
yaourt -Syua
echo ""
echo "Finished.  Upgrade Complete!"
echo "Your system has been updated, cleaned and polished successfully."
echo ""