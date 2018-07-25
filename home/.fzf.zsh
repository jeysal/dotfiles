# Setup fzf
# ---------
if [[ ! "$PATH" == */home/seckinger/.fzf/bin* ]]; then
  export PATH="$PATH:/home/seckinger/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/seckinger/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/seckinger/.fzf/shell/key-bindings.zsh"

