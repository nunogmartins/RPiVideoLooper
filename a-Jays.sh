declare -A list

SAVEIFS=$IFS
i=0

for files in /home/pi/Music/*
  do
    list[$i]=$files       #load files into list
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
      if [ i -ge max ]
        then break            #if end of list has been reached, break
      fi
      omxplayer "${list[$i]}"
      let i+=1
    fi
  done
echo back!
