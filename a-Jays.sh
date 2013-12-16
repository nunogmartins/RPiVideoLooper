declare -A list

FILEPATH='/home/pi/Music/*'

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
i=0

for files in $FILEPATH
  do
    list[$i]="$files"       #load files into list
    let i+=1
    echo $files           #display loaded files
  done
  
max=$i
i=0
IFS=$SAVEIFS

while true;
  do
    if pgrep omxplayer > /dev/null
      then echo 'playing'
    else
      omxplayer "${list[$i]}"
      let i+=1
      if [ i -ge max ]
        then break            #if end of list has been reached, then break
      fi
    fi
  done
echo back!
