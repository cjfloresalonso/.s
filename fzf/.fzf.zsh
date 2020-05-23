# Setup fzf
# ---------
if [[ ! "$PATH" == */home/cfa/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/cfa/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/cfa/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/cfa/.fzf/shell/key-bindings.zsh"
