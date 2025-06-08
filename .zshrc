# Exit early if shell is not interactive (e.g., a script or cron job)
[[ $- != *i* ]] && return

### ── Zinit Bootstrap ─────────────────────────
# Ensure Zinit is installed and sourced for plugin management
if [[ ! -f "$HOME/.local/share/zinit/zinit.git/zinit.zsh" ]]; then
  mkdir -p "$HOME/.local/share/zinit"
  git clone https://github.com/zdharma-continuum/zinit.git "$HOME/.local/share/zinit/zinit.git"
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

### ── Plugin Management ───────────────────────
# Load fzf binary and keybindings
zinit ice from"gh-r" as"program" pick"bin/fzf"
zinit light junegunn/fzf
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh  # Enable fzf keybindings if available

# Load pyenv for Python version management
zinit light pyenv/pyenv
eval "$(pyenv init -)"

# Enable syntax highlighting and autosuggestions in Zsh
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

# Enhanced tab completion with fzf
zinit light Aloxaf/fzf-tab

### ── Completion Styles ───────────────────────
# Configure Zsh's autocompletion behavior and style
zstyle ':completion:*' rehash true
zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '%F{yellow}%d%f'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

### ── History (Zsh Recommended) ───────────────
# Configure shell history behavior for reliability and detail
HISTFILE=~/.zsh_history             # File where history is stored
HISTSIZE=100000                     # Number of commands kept in memory
SAVEHIST=200000                     # Number of commands saved to file
setopt append_history              # Append to history file, don't overwrite
setopt inc_append_history          # Save each command as it's typed
setopt share_history               # Share history across terminals
setopt hist_ignore_dups            # Ignore duplicate commands
setopt hist_ignore_all_dups        # Remove all earlier duplicate entries
setopt hist_reduce_blanks          # Remove extra whitespace
setopt hist_verify                 # Edit recalled command before executing
setopt extended_history            # Timestamp each command
setopt bang_hist                   # Enable ! command history expansion

### ── Atuin Initialization ─────────────────────
# Initialize Atuin (shell history replacement) if installed
if command -v atuin &> /dev/null; then
  eval "$(atuin init zsh)"
fi

### ── Prompt and Title ────────────────────────
# Load color support
autoload -U colors && colors
# Define prompt: user@host:current_directory %
PROMPT='%F{green}%n@%m%f:%F{blue}%~%f %# '
# Set terminal title bar to user@host:cwd
case "$TERM" in
  xterm*|rxvt*) precmd() { print -Pn "\e]0;%n@%m: %~\a" } ;;
esac

### ── Core Options ────────────────────────────
setopt ignore_eof  # Prevent Ctrl-D from closing the shell
# macOS notification when a long-running command completes
alias alert='osascript -e "display notification \"Command finished\" with title \"Terminal\""'
# Enable Emacs keybindings
bindkey -e

### ── Aliases ────────────────────────────────
alias ls='ls -G'         # Use colorized output with BSD-style ls
alias ll='ls -alF'       # Long listing, show all, classify
alias la='ls -A'         # List all except . and ..
alias l='ls -CF'         # Column output, classify entries
alias rezsh='source ~/.zshrc && echo "Reloaded ~/.zshrc"'  # Reload shell
alias ezsh='nvim ~/.zshrc'               # Edit zshrc
alias erezsh='nvim ~/.zshrc && rezsh'    # Edit and reload zshrc
alias evim='nvim ~/.vimrc'               # Edit Vim config
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'  # Manage dotfiles via bare repo

### ── Custom Files (Commented) ────────────────
# Uncomment if using shared bash aliases or functions
# [[ -f ~/.bash_aliases ]] && source ~/.bash_aliases
# [[ -f ~/.bash_functions ]] && source ~/.bash_functions

### ── Path and Editor ─────────────────────────
# Prepend custom paths if they exist
[[ -d "$HOME/bin" ]] && path=($HOME/bin $path)
[[ -d "$HOME/.local/bin" ]] && path=($HOME/.local/bin $path)
[[ -d "$HOME/.tmp" ]] && export TMPDIR="$HOME/.tmp"

# Set default editor to Neovim
export VISUAL=nvim
export EDITOR=nvim

### ── Environment Variables ───────────────────
export SSH_AUTH_SOCK="$HOME/.1password/agent.sock"                       # 1Password SSH agent socket
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"                            # RipGrep config
export SSL_CERT_FILE="/Library/Application Support/Netskope/STAgent/data/nscacert.pem"  # Netskope SSL cert
export NODE_EXTRA_CA_CERTS="$HOME/.aws/nskp_config/netskope-cert-bundle.pem"           # Netskope CA for Node

# Load Gruvbox palette (optional, for truecolor)
[[ -f "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh" ]] && source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

# VSCode shell integration (disabled due to echo issues)
# [[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"
