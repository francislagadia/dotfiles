# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/flagadia/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/flagadia/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/flagadia/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/flagadia/.fzf/shell/key-bindings.bash"
