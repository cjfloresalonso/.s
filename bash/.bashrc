# is this on a remote box?
SSH_BOX=1

# login shell setup

[ -z $EDITOR ] && export EDITOR=vi
[ -z $VISUAL ] && export VISUAL=vi

# have tmux always start
[ -n `command -v tmux` ] && [ -z "$TMUX"  ] && exec tmux new-session && exit

# history cntl
HISTCONTROL=erasedups:ignoredups:ignorespace
HISTFILE=~/.bash_history
HISTSIZE=65535

# shell options
set -o vi		# vi mode
set -o noclobber 	# accidental file clobbering
set -o ignoreeof 	# accidental eof
# set -o nohup		# don't kill bg jobs

shopt -s checkwinsize
shopt -s histappend

alias tree='tree -aC'
alias g=grep
alias mx='chmod a+x'
alias h="history | grep "	# search history
alias f="find . 2> /dev/null | grep "	# search files in pwd

alias untar='tar -xvf'

# safe source
ssource () { [ -n $1 ] && [ -f $1 ] && source $1 || true; }

ssource ~/.nmaps

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
