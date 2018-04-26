# # Setup fzf
# # ---------
# if [[ ! "$PATH" == *${HOME}/.fzf/bin* ]]; then
#   export PATH="$PATH:${HOME}/.fzf/bin"
# fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/share/fzf/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/usr/share/fzf/key-bindings.zsh"

