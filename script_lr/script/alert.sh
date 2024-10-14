#!/bin/sh

for i in $(seq 10 -1 1 );do
    i3-nagbar -t warrning  -m "Your computer will stop in $i  ." &
    sleep "0.1"
done

#i3-msg exit
