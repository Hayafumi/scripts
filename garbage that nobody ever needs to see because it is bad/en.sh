#!/bin/bash
RECIP=$2
MESSAGE=$3
if [[ $1 == "-m" ]]
then
  keybase pgp encrypt "$RECIP" -m "$MESSAGE"
else
  if [[ $1 == "-h" ]] || [[ $1 == "--help" ]]
  then
    printf "
    \033[0;36men FILE\033[0m\n
    encrypts a file.\n
    \033[0;36men -m USER MESSAGE\033[0m\n
     encrypts a message for a specified user. You can also use stdin instead of a message.\n
    \033[0;36men --help\033[0m   or   \033[0;36men -h\033[0m\n
     shows this message!\n
    \033[0;36men -c USER\033[0m\n
     encrypts a message from the clipboard.\n"
  else
    if  [[ $1 == "-c" ]]
    then
      printf -- "%s\n" "$(/home/"$USER"/scripts/clipboard.sh  | keybase pgp encrypt "$RECIP")"
    else
  keybase pgp encrypt -i "$1" -b -o "$1".encrypted && rm "$1"
  fi
 fi
fi
