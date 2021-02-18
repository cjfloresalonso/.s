# have tmux always start
[ -n `command -v tmux` ] && [ -z "$TMUX"  ] && { exec tmux new-session && exit;}

# login shell setup
[ -z $EDITOR ] && export EDITOR=vi
[ -z $VISUAL ] && export VISUAL=vi

# history cntl
HISTCONTROL=ignoredups:ignorespace
HISTFILE=~/.ksh_history
HISTSIZE=65535

# shell options
set -o vi		    # vi mode
set -o noclobber 	# accidental file clobbering
set -o ignoreeof 	# accidental eof
set -o nohup		# don't kill bg jobs
