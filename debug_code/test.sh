#!/bin/bash
cmd=(0x7b 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x7b 0x7d)
# 0-2: header
# 3-4: speed x-axis (direction + forward / - backward)
cmd[3]=0x00
cmd[4]=0x00
# 5-6: speed y-axis (not use)
# 7-8: speed z-axis (wheel turn + left / - right)
cmd[7]=0x00
cmd[8]=0x00
# 9: BBC check bit (XOR operation)
cmd[9]=$(( ${cmd[0]}^${cmd[1]}^${cmd[2]}^${cmd[3]}^${cmd[4]}^${cmd[5]}^${cmd[6]}^${cmd[7]}^${cmd[8]} ))
# cmd_check="\x"$(printf '%x' $cmd_check)
# output='\x'$(printf '%x' ${cmd[0]})
i=0
for hex in "${cmd[*]}" 
do
    printf '%x' $hex
done
