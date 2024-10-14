# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -d ~/afs/bin ] ; then
	export PATH=~/afs/bin:$PATH
fi

if [ -d ~/.local/bin ] ; then
	export PATH=~/.local/bin:$PATH
fi

export LANG=en_US.utf8
export NNTPSERVER="news.epita.fr"

export EDITOR=vim
#export EDITOR=emacs

# Color support for less
#export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
#export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
#export LESS_TERMCAP_me=$'\E[0m'           # end mode
#export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
#export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
#export LESS_TERMCAP_ue=$'\E[0m'           # end underline
#export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

alias ls='ls --color=auto'
alias grep='grep --color -n'
PS1='[\u@\h \W]\$ '

PS1='\e[0;31m\][\u \W]\$ \e[0;092m\]'
PS0='\[\e[m\]'

LS_COLORS=

workspace="$HOME/afs/epita-ing-assistants-acu-piscine-2027-simon.lecubin"

#proj
proj_path="$workspace/evalexpr";
alias proj="cd $proj_path"
alias  src="cd $proj_path/src"
alias  inc="cd $proj_path/include"
alias test="cd $proj_path/tests"


#basic tools
alias aut='cp $HOME/afs/.base/AUTHORS ./'
alias ign='cp $HOME/afs/.base/.gitignore ./'
alias gccc='gcc -Wall -Wextra -Werror -std=c99 -Wvla -pedantic'
alias m='make clean;clear;make'
alias bashrc='vim ~/afs/.confs/bashrc'
alias pis="cd $workspace"
alias gpt="git push --follow-tags"
alias i3c="cd $HOME/afs/.confs/config/i3/"

go () {
    if [ $# -lt 1 ]; then
        echo "expected 1 argument"
    fi

    cd "$workspace/$1"
}
new () {
    if [ -e $workspace/$1 ]; then
        go $1
        return
    fi

    if [ $# -lt 1 ]; then
        echo "expected 1 argument"
    fi

    mkdir "$workspace/$1"
    go "$1"
    touch "$1.c"
    
}
newh () {
    if [ -e $workspace/$1 ]; then
        go $1
        return
    fi

    new $1
    tmp=$1
    echo -e "#include \"$tmp.h\"\n\n#include <stddef.h>\n\n" > "$1.c"
    echo -e "#ifndef ${tmp^^}_H\n#define ${tmp^^}_H\n\n\n#endif /* ! ${tmp^^}_H */"> "$1.h"
    echo -e "#include \"$tmp.h\"\n\n#include <stdio.h>\n#include <stddef.h>\n\nint main(void)\n{\n\n\n}" > "main.c"
}

tag () {
	if [ $# -lt 2 ]; then
		echo "expected 2 parameters"
	else
		git commit -m "osef"
        echo "tag: exercises-$1-$2"
		git tag -a "exercises-$1-$2" -m ""
	fi
}

ding ()
{
    sleep $(($1 * 60))
    shift
    i3-nagbar -t warning -m 'Ding Ding Ding !!!' &
    $@
}

#sleep 10
#python $HOME/afs/.confs/config/i3/accueil.py
