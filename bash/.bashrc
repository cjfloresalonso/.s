case $- in
    *i*) ;;
      *) return;;
esac

# is this on a remote box?
SSH_BOX=1

# login shell setup

[ -z $EDITOR ] && export EDITOR=vi
[ -z $VISUAL ] && export VISUAL=vi

# have tmux always start
[ -n `command -v tmux` ] && [ -z "$TMUX"  ] && exec tmux new-session && exit

# history cntl
HISTCONTROL=ignoreboth
HISTFILE=~/.bash_history
HISTSIZE=65535

# shell options
set -o vi		# vi mode
set -o noclobber 	# accidental file clobbering
set -o ignoreeof 	# accidental eof
# set -o nohup		# don't kill bg jobs

shopt -s checkwinsize
shopt -s histappend
shopt -s globstar

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'

    export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
    export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
    export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
    export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
    export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
    export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
    export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
fi


alias tree='tree -aC'
alias g=grep
alias mx='chmod a+x'
alias h="history | grep "	# search history
alias f="find . 2> /dev/null | grep "	# search files in pwd

alias untar='tar -xvf'

# safe source
ssource () { [ -n $1 ] && [ -f $1 ] && source $1 || true; }

ssource ~/.nmaps
ssource /usr/share/bash-completion/bash_completion
ssource /etc/bash_completion

# colour
NORMAL="\033[0m"
RED="\033[31m"
WHITE="\033[37;1m"

PS1='`last=$? ; [ $last != 0 ] && echo -e "${NORMAL}[${RED}${last}${NORMAL}] "`'"${WHITE}\$ $NORMAL"

function __setprompt
{
	local last=$?
	PS1=""

	[ $last -ne 0 ] && PS1+="${NORMAL}[${RED}${last}${NORMAL}] "
	[ $SSH_BOX -ne 0 ] && PS1+="${NORMAL}\h"

	PS1+="${WHITE}\$ ${NORMAL}"
}
PROMPT_COMMAND='__setprompt'
