#!/bin/bash

declare -A vids

#Make a newline a delimiter instead of a space
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

usb=`cat /boot/looperconfig.txt | grep usb | cut -c 5- | tr -d '\r' | tr -d '\n'`

FILES=/home/pi/videos/

if [[ $usb -eq 1 ]]; then
    FILES=/media/USB/videos/
fi

var_1=""
for f in `ls $FILES | grep ".mp4"`
do
    var_1="$var_1 $FILES$f}"
done

#Reset the IFS
IFS=$SAVEIFS

while true; do
if pgrep omxplayer > /dev/null
then
	echo 'running'
else
	/home/pi/omxplayer-dist/usr/bin/omxplayer -r -o hdmi "$var_1"
fi
done
