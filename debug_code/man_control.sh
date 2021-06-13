#!/bin/bash          
cmd_forward="\x7B\x00\x00\x00\xFF\x00\x00\x00\x00\x84\x7D"
cmd_left="\x7B\x00\x00\x00\x00\x00\x00\x00\xFF\x84\x7D"
cmd_backward="\x7B\x00\x00\xFF\x00\x00\x00\x00\x00\x84\x7D"
cmd_right="\x7B\x00\x00\x00\x0\x00\x00\xFF\x00\x84\x7D"
cmd_stop="\x7B\x00\x00\x00\x00\x00\x00\x00\x00\x7B\x7D"

echo "Press 'WASD X' to control"
echo "Press 'q' to exit"
count=0
while : ; do
    read -n 1 k <&1
if [[ $k = q ]] ; then
    printf "\nQuitting from the program\n"
    break
elif [[ $k = w ]] ; then
    echo ": move forward"
    echo $cmd_forward
elif [[ $k = a ]] ; then
    echo ": turn left"
    echo $cmd_left
elif [[ $k = s ]] ; then
    echo ": move backward"
    echo $cmd_backward
elif [[ $k = d ]] ; then
    echo ": turn right"
    echo $cmd_right
elif [[ $k = x ]] ; then
    echo ": stop"
    echo $cmd_stop
else
    ((count=$count+1))
    printf "\nIterate for $count times\n"
    echo "Press 'q' to exit"
fi
done