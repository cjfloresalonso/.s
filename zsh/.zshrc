# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=10000
setopt incappendhistory extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/cfa/.zshrc'

if [[ ! -z $TMUX ]]; then
    ~/.s/tmux/dracula.tmux
fi

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias netflix='chromium --app="http://netflix.com"'

# git customisation
alias g='git'

# editor
export EDITOR=nvim
export VISUAL=nvim
alias e='$EDITOR'
alias ':e'='$EDITOR'

bindkey jj vi-cmd-mode
fpath=(path/to/zsh-completions/src $fpath)

export SOURCELIB_ROOT=$HOME/csse3010/sourcelib
export MYLIB_ROOT=$HOME/csse3010/mylib

PS1='%(?..[%F{red}%?%f] )%(!.%F{red}.%F{green})%#%f '

export PATH=/home/cfa/csse4011/ei-freertos/tools:$PATH
export PYTHONPATH=/home/cfa/csse4011/ei-freertos/pyclasses:$PYTHONPATH
export PATH=/home/cfa/.local/bin:$PATH

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
