#!/bin/bash
if [[ -z $1 ]]; then
    thunar . &
    disown
elif [[ -d $1 ]]; then
    thunar $1 &
    disown
else
    echo "Directory provided does not exist"
fi
