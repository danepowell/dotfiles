#!/bin/bash
for i in `seq 4`
do
    if amixer -c $i | grep -i headset; then
        amixer -c $i cset numid=6 95
        break
    fi
done
