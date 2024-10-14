#!/bin/sh

backup="$HOME/afs/.confs/.bckupf/"
lock="$HOME/afs/.lock"

replace(){

    if [ ! -d "$backup" ]; then
        echo "Backup not found. Creating one"
    fi
}

init(){
    echo "init"

    touch $lock
}

reverse(){
    echo "reverse"

    rm $lock
}

if [ -f $lock ]; then
    reverse
else
    init
fi
