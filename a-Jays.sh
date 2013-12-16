declare -A list

FILEPATH='/home/pi/Music/*'

#make copy of Internal Field Separator, modify it to make newline the terminator.
#later, revert this.
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

#the ever so used loop-counter
i=0

for files in $FILEPATH
  do
    list[$i]="$files"       #load files into list
    let i+=1
    echo $files           #display loaded files, not required
  done
  
max=$i                    #total number of files (actually files+1)
i=0
IFS=$SAVEIFS              #reverted

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
echo 'back!'
