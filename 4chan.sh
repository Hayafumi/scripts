function 4chan() {

    if [[ $# -ne 1 ]]
    then
        echo 'No URL specified! Give the URL to thread as the ONLY argument'
        return 1
    fi

    url=$1

    grep 'boards\.4chan\.org/[a-z0-9]\{1,4\}/thread/[0-9]\{4,12\}.*' <<< $url 2>&1 > /dev/null
    exit_code=$?    # I know this isn't the best approach, but it's the best I can come up with.
    if [[ $exit_code -ne 0 ]]
    then
        echo 'Malformed URL! Give the URL to thread as the ONLY argument'
        return 2
    fi

    curl -k -f -s $url 2>&1 > /dev/null
    exit_code=$?    # I know this isn't the best approach, but it's the best I can come up with.
    if [[ $exit_code -ne 0 ]]
    then
        echo 'Invalid URL! Or you don`t have permission to view the page'
        return 3
    fi

    if [[ $(grep '^http' <<< $url) ]]    # If thread doesn't have any protocol, add https
    then
        :
    else
        url=$(sed 's/^/https:\/\//' <<< $url)
    fi

    if [[ $(grep '^http:' <<< $url) ]]
    then
        url=$(sed 's/^http\(.*\)$/https\1/' <<< $url)
    fi

    total=$(curl -k -s $url | grep -o '\/\/i\.4cdn\.org\/.\{1,4\}\/[0-9]\{6,15\}\.[a-z]\{3,4\}' | uniq | wc -l)
    counter=1

    for image_url in $(curl -k -s $url | grep -o '\/\/i\.4cdn\.org\/.\{1,4\}\/[0-9]\{6,15\}\.[a-z]\{3,4\}' | uniq | sed 's/^/https:/')
    do
        echo -n Downloading image $counter of $total...
        wget --no-check-certificate -q -nc $image_url
        echo ' Done'
        counter=$(($counter + 1))
    done
}
