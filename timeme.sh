echo 'enter the time in seconds'
read seconds
hr=$(( $seconds/3600 ))
a=$(( $seconds%3600 ))
min=$(( $a/60 ))
sec=$(( $a%60 ))
echo "the converted time is $hr:$min:$sec"
