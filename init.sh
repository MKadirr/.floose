#!/bin/sh

configf="$HOME/afs/.confs"
backup="$configf/.bckupf"
lock="$HOME/afs/.lock"

target="bashrc config/alacritty config/i3"

replace(){
    echo " - Replacing $1"
    printf "%s" "   Saving: "
    cp -r $configf/$1 $backup/$1 && echo "Done" || (echo "Failed"; return 0)

    printf "%s" "   Removing folder: "
    rm -rf $configf/$1 && echo "Done" || echo "Failed"
    printf "%s" "   Replacing: "
    if [ -d ./$1 ]; then
        cp -r ./$1/* $configf/$1/ && echo "Done" || echo "Failed"
    else
        cp -r ./$1 $configf/$1 && echo "Done" || echo "Failed"
    fi

    echo ""
}

reverse(){
    echo " - Restauring $1"
    printf "%s" "   Restaure: "i
    rm -rf $configf/$1

    cp -r $backup/$1 $configf/$1
    echo "Done"
}

init(){
    echo "Init:"

    if [ ! -d $backup ]; then
        echo " - Creating backup folder"
        mkdir $backup
        mkdir $backup/config
    else
        echo " - cleaning backup"
        rm -rf $backup/*
        mkdir $backup/config
    fi

    for d in $target; do
        replace $d
    done

    touch $lock
}

unfloose(){
    echo "Reverse:"

    if [ ! -d $backup ]; then
        echo "Backup folder not found. Exiting"
        rm $lock
        return
    fi

    for d in $target; do
        reverse $d
    done

    echo "Remove $lock to restart it"
}

if [ $# -eq 1 ]; then
    printf "Be carefull with that script, it will replace all the config the config or reset it\nThis will save everything in the $backup folder and erase the folder to replace them.\n to use the programme please add and argument"
    exit 0
fi

if [ -f $lock ]; then
    unfloose
else
    init
fi
