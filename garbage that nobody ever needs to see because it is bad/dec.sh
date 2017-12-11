#!/bin/bash
if [[ -p /dev/stdin ]]; then
    # stdin is a pipe
    # print the output of decrypting stdin
    printf -- "%s\n" "$(keybase pgp decrypt < /dev/stdin)"
else
    if [[ -n $1 ]]; then
        # first argument is not blank
        if [[ -f $1 ]]; then
            # first argument is a file
            # print the output of decrypting the file
            printf -- "%s\n" "$(keybase pgp decrypt -i "$1")"
        else
            if [[ $1 == "-f" ]]; then
                # first argument is "-f"
                # output decrypted version of file to file with same basename but without ".encrypted" and remove the original file
                keybase pgp decrypt -i "$2" -o "$(basename "$2" .encrypted)" && rm "$2"
            else
                if [[ $1 == "-c" ]]; then
                    # first argument is "-c"
                    # print output of decrypting the output of /home/"$USER"/scripts/clipboard.sh
                    printf -- "%s\n" "$(/home/"$USER"/scripts/clipboard.sh | keybase pgp decrypt)"
                else
                    if [[ $1 == "-h" ]] || [[ $1 == "--help" ]]; then
                        # first argument is "-h" or "--help"
                        # echo the following
                        echo "dec - a script so I don't need to remember keybase arguments"
                        echo ""
                        echo "Usage:"
                        echo "  dec"
                        echo "  dec <file name>"
                        echo "  dec -f <file name>"
                        echo "  <stdin> | dec"
                        echo "  dec -c"
                        echo "  dec (-h | --help)"
                        echo ""
                        echo "Options:"
                        echo ""
                        echo "-f                  Decrypts a file, creating an output file."
                        echo "-c                  Decrypts from clipboard"
                        echo "-h, --help          Shows this help."
                        echo ""
                    fi
                fi

            fi
        fi

    else 
        sleep .25 && echo "No argument or stdin provided."
    fi
fi