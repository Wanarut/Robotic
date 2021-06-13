#!/bin/bash
port="/dev/ttyUSB1" # Serial Port
cmd_forward="\x7B\x00\x00\x0F\xFF\x00\x00\x00\x00\x8B\x7D"
# cmd_left="\x7B\x00\x00\x00\x00\x00\x00\x00\xFF\x84\x7D"
# cmd_right="\x7B\x00\x00\x00\x0\x00\x00\xFF\x00\x84\x7D"
cmd_forwleft="\x7B\x00\x00\x00\xFF\x00\x00\x00\xFF\x7B\x7D"
cmd_backleft="\x7B\x00\x00\xFF\x00\x00\x00\x00\xFF\x7B\x7D"
cmd_forwright="\x7B\x00\x00\x00\xFF\x00\x00\xFF\x00\x7B\x7D"
cmd_backright="\x7B\x00\x00\xFF\x00\x00\x00\xFF\x00\x7B\x7D"

cmd_backward="\x7B\x00\x00\xFF\xF0\x00\x00\x00\x00\x8B\x7D"
cmd_stop="\x7B\x00\x00\x00\x00\x00\x00\x00\x00\x7B\x7D"

echo "Press 'WASD X' to control"
echo "Press 'q' to exit"
count=0
dir=0
while : ; do
    read -n 1 k <&1
if [[ $k = q ]] ; then
    printf "\nQuitting from the program\n"
    break
elif [[ $k = w ]] ; then
    echo ": move forward"
    echo -e -n $cmd_forward > $port
    dir=1
elif [[ $k = s ]] ; then
    echo ": move backward"
    echo -e -n $cmd_backward > $port
    dir=-1
elif [[ $k = a ]] ; then
    echo ": turn left"
    if [[ $dir == 1 ]]; then
        echo -e -n $cmd_forwleft > $port
    else
        echo -e -n $cmd_backleft > $port
    fi
    # echo -e -n $cmd_left > $port
elif [[ $k = d ]] ; then
    echo ": turn right"
    if [[ $dir == 1 ]]; then
        echo -e -n $cmd_forwright > $port
    else
        echo -e -n $cmd_backright > $port
    fi
    # echo -e -n $cmd_right > $port
elif [[ $k = x ]] ; then
    echo ": stop"
    echo -e -n $cmd_stop > $port
else
    ((count=$count+1))
    printf "\nIterate for $count times\n"
    echo "Press 'q' to exit"
    echo -e -n $cmd_stop > $port
fi
done