# Setup fzf
# ---------
if [[ ! "$PATH" == */home/francis/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/francis/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/francis/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/francis/.fzf/shell/key-bindings.bash"
