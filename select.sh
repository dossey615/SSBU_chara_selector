#!/bin/bash

random=`echo $(((RANDOM%78) + 1))`

echo $random
chara=`awk "NR==${random}" charactors.txt`
echo $chara

