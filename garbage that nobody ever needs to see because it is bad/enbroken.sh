#!/bin/bash
if [[ $1 == "-m" ]]; then
    if [[ -n $2 ]]; then
        if [[ -p /dev/stdin ]]; then
            keybase pgp encrypt "$2" -m < /dev/stdin
        else
            keybase pgp encrypt "$2" -m "$3"
        fi
    fi
else
    if [[ $1 == "-m" ]]; then
        if [[ -p /dev/stdin ]]; then
            keybase pgp encrypt -m < /dev/stdin
        else
            keybase pgp encrypt -m "$2"
        fi
    fi
fi
if [[ $1 == "-h" ]] || [[ $1 == "--help" ]]; then
    echo "en - a script so I don't need to remember keybase arguments"
    echo ""
    echo "Usage:"
    echo "  en"
    echo "  en <file name>"
    echo "  en -f <file name>"
    echo "  <stdin> | en -m <user>"
    echo "  en -c"
    echo "  en (-h | --help)"
    echo ""
    echo "Options:"
    echo ""
    echo "-f                  Encrypts a file, creating an output file."
    echo "-h, --help          Shows this help."
    echo ""
else
    if [[ $1 == "-f" ]]; then
        if [[ -f $2 ]]; then
            if [[ -n $3 ]]; then
                keybase pgp encrypt $3 -i "$2" -b -o "$2".encrypted && rm "$2"
            else
                keybase pgp encrypt -i "$2" -b -o "$2".encrypted && rm "$2"
            fi
        else
            echo "No file provided."
        fi
    fi
fi
if [[ -z $1 ]]; then
    echo "No arguments provided."
fi
