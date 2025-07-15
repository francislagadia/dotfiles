# ── Early Exit for Non-Interactive Shells ────────────────────────────────────
# Skip loading the rest of this file if not running an interactive shell
[[ $- != *i* ]] && return

# ── Environment Variables ──────────────────────────────────────────────────
export SSH_AUTH_SOCK="$HOME/.1password/agent.sock"  # Use 1Password as SSH agent
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"        # Custom config for ripgrep
export SSL_CERT_FILE="/Library/Application Support/Netskope/STAgent/data/nscacert.pem"  # CA cert for Netskope
export NODE_EXTRA_CA_CERTS="$HOME/.aws/nskp_config/netskope-cert-bundle.pem"            # Extra certs for Node.js

# ── Editor Defaults ───────────────────────────────────────────────────────
export EDITOR=nvim     # Default CLI editor
export VISUAL=nvim     # Default editor for visual modes (e.g. git commit)

# ── PATH Configuration ─────────────────────────────────────────────────────
[[ -d "$HOME/bin" ]]         && path=($HOME/bin $path)              # Add ~/bin if it exists
[[ -d "$HOME/.local/bin" ]] && path=($HOME/.local/bin $path)        # Add ~/.local/bin (for pip/npm tools)
[[ -d "$HOME/.tmp" ]]       && export TMPDIR="$HOME/.tmp"           # Custom temp directory

# ── Powerlevel10k Instant Prompt ─────────────────────────────────────────────
# Speed up shell startup by enabling the instant prompt
[[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]] &&
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"

# ── Zinit Bootstrap ──────────────────────────────────────────────────────────
# Install Zinit (if missing) and load it
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
if [[ ! -d $ZINIT_HOME/.git ]]; then
  mkdir -p "$(dirname "$ZINIT_HOME")"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# ── Zinit Plugins ────────────────────────────────────────────────────────────

# Install FZF from GitHub Releases as a binary and load shell integration
zinit ice from"gh-r" as"program" pick"bin/fzf"
zinit light junegunn/fzf
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh  # FZF shell integration

# Python version manager (pyenv)
zinit light pyenv/pyenv
command -v pyenv &>/dev/null && eval "$(pyenv init -)" 2>/dev/null

# Shell enhancements: syntax highlighting and autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

# Enhanced tab completions using fzf-tab
zinit light Aloxaf/fzf-tab

# Load lightweight Zinit annexes to extend Zinit features
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# ── Completion Configuration (no compinit here) ──────────────────────────────
# Improve tab completion UI and behavior
zstyle ':completion:*' rehash true
zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '%F{yellow}%d%f'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# ── History & Atuin ─────────────────────────────────────────────────────────
HISTFILE=~/.zsh_history      # File to save history
HISTSIZE=100000              # Max number of commands kept in memory
SAVEHIST=200000              # Max number of commands saved to file

# History options for improved behavior
setopt append_history        # Don't overwrite history file
setopt inc_append_history    # Save each command as it's run
setopt share_history         # Share history across sessions
setopt hist_ignore_dups      # Skip duplicates
setopt hist_ignore_all_dups
setopt hist_reduce_blanks    # Remove extra spaces
setopt hist_verify           # Let you edit before running history expansions
setopt extended_history      # Save timestamps
setopt bang_hist             # Enable history expansion with !foo

# Load Atuin for searchable shell history
command -v atuin &>/dev/null && eval "$(atuin init zsh)"

# ── Shell Behavior & Keybindings ────────────────────────────────────────────
setopt ignore_eof            # Prevent Ctrl-D from closing the shell
bindkey -e                   # Use Emacs keybindings in Zsh

# ── Keybinding: Edit current command line in $EDITOR (Ctrl-x Ctrl-e) ────────
autoload -Uz edit-command-line        # Load the widget
zle -N edit-command-line              # Register the widget
bindkey '^x^e' edit-command-line      # Bind Ctrl-x Ctrl-e to it

# ── UI: Prompt, Colors, Terminal Title ──────────────────────────────────────
autoload -U colors && colors  # Enable color support
case "$TERM" in
  xterm*|rxvt*) precmd() { print -Pn "\e]0;%n@%m: %~\a" } ;;  # Set terminal title
esac

# Powerlevel10k theme (prompt configuration)
[[ -f ~/.powerlevel10k/powerlevel10k.zsh-theme ]] &&
  source ~/.powerlevel10k/powerlevel10k.zsh-theme
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ── Notifications ───────────────────────────────────────────────────────────
# macOS notification for long-running commands
alias alert='osascript -e "display notification \"Command finished\" with title \"Terminal\""'

# ── Aliases ────────────────────────────────────────────────────────────────
# Enhanced ls aliases
alias ls='ls -G'             # Colorized listing
alias ll='ls -alF'           # Long listing
alias la='ls -A'             # All but . and ..
alias l='ls -CF'             # Classify entries with indicator

# Quick reload and edit of Zsh config
alias rezsh='source ~/.zshrc && echo "Reloaded ~/.zshrc"'
alias ezsh='nvim ~/.zshrc'
alias erezsh='nvim ~/.zshrc && rezsh'
alias evim='nvim ~/.vimrc'

# Git bare repo alias for managing dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# ── Custom Scripts ─────────────────────────────────────────────────────────
[[ -f ~/.zsh_functions ]] && source ~/.zsh_functions  # Load custom Zsh functions
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases
# [[ -f ~/.bash_functions ]] && source ~/.bash_functions

# ── Optional Visual Tweaks ────────────────────────────────────────────────
# Load Gruvbox color palette for 256-color terminals
[[ -f "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh" ]] &&
  source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

# VSCode shell integration (uncomment if using VSCode as terminal)
# [[ "$TERM_PROGRAM" == "vscode" ]] && source "$(code --locate-shell-integration-path zsh)"
