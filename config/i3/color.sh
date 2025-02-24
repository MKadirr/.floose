#!/usr/bin/env bash

#config=$HOME/afs/.confs/config/i3/config
config=./config

cp $config.proto $config

names="client.focused client.focused_inactive client.unfocused client.urgent client.placeholder"

full=""
for name in $names; do
    tname=$name
    for i in $(seq 1 5); do
        varrand=$(($(date +%s%N) %16777215))
        tname=$tname"$(printf " #%x" "$varrand")"
    done
    full="$full$tname\n"
done

varrand=$(($(date +%s%N) %100))

full=$full"$(printf "gaps inner %dpx\n" "$varrand")\n"

printf "$full" >> $config
