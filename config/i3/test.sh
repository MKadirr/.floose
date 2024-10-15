#!/bin/sh

echo "lets fucking go !!!!!!!!!!!!!!"
sleep 2

#62 ding
space=""
for i in $(seq 0 20); do
    space=$space"     "
done

ding=""
for i in $(seq 0 60); do
    ding=$ding" ding"
done

while :; do
    str=""
    for i in $(seq 1 45); do
        str=$str" ding"
        printf "$ding $space $str"
        sleep 0.01
    done
    for i in $(seq 45 -1 1); do
        str=""
        for j in $(seq 1 $i); do
            str=$str" ding"
        done

        printf "$ding $space $str"
        sleep 0.01
    done

    printf "$str"
done


while :; do
    varrand=$(($(date +%s) % 8 + 30))

    printf "ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding ding"
    sleep 0.07
    echo " "
    sleep 0.07
done
