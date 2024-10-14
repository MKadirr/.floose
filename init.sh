#!/bin/sh

configf="$HOME/afs/.confs"
backup="$configf/.bckupf"
lock="$HOME/afs/.lock"

target="bashrc config/alacritty config/i3"

replace(){
    echo " - Replacing $1"
    printf "%s" "   Saving: "
    cp -r $configf/$1 $backup/$1
    echo "Done"
    printf "%s" "   Replacing: "
    echo -- "cp -r ./$1 $configf/$1"
    echo "Done"
}

reverse(){
    echo " - Restauring $1"
    printf "%s" "   Restaure: "
    cp -r $backup/$1 $configf/$1
    echo "Done"
}

init(){
    echo "Init:"

    if [ ! -d $backup ]; then
        echo " - Creating backup folder"
        mkdir $backup
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

    reverse bashrc

    echo "Remove $lock to restart it"
}


if [ -f $lock ]; then
    unfloose
else
    init
fi
