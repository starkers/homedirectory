# Setup fzf
# ---------
if [[ ! "$PATH" == */home/starkers/.fzf/bin* ]]; then
  export PATH="$PATH:/home/starkers/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/starkers/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/starkers/.fzf/shell/key-bindings.zsh"

