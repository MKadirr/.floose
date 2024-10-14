#!/usr/bin/env bash

pw="$(pwd)/script"

vari=1
while [ 1 ];do
    varrand=$(($(date +%s) %${vari}+${vari})) 
    sleep $varrand
    pro=$(ls $pw |sed "s/ /\n/g" |sort -R |tail "-1")
    echo $pro
    $(./script/$pro)&
done;

