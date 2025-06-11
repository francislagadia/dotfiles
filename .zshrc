# ── Powerlevel10k Instant Prompt ─────────────────────────────────────────
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ── Early Exit for Non-Interactive Shells ───────────────────────────────
[[ $- != *i* ]] && return

# ── Zinit Bootstrap ─────────────────────────────────────────────────────
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# ── Plugins ─────────────────────────────────────────────────────────────
# FZF binary & integration
zinit ice from"gh-r" as"program" pick"bin/fzf"
zinit light junegunn/fzf
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# Python version management
zinit light pyenv/pyenv
eval "$(pyenv init -)"

# Syntax & autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

# FZF-enhanced tab completion
zinit light Aloxaf/fzf-tab

# ── Completion Configuration ────────────────────────────────────────────
zstyle ':completion:*' rehash true
zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '%F{yellow}%d%f'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# ── History & Atuin ─────────────────────────────────────────────────────
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=200000

setopt append_history             # Don’t overwrite history file
setopt inc_append_history         # Save after each command
setopt share_history              # Share across sessions
setopt hist_ignore_dups           # Ignore duplicate commands
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_verify
setopt extended_history
setopt bang_hist

# Atuin history manager (if available)
if command -v atuin &>/dev/null; then
  eval "$(atuin init zsh)"
fi

# ── UI: Prompt, Colors, Title ───────────────────────────────────────────
autoload -U colors && colors

# Terminal tab/window title
case "$TERM" in
  xterm*|rxvt*) precmd() { print -Pn "\e]0;%n@%m: %~\a" } ;;
esac

# Powerlevel10k
source ~/.powerlevel10k/powerlevel10k.zsh-theme
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ── Shell Behavior & Keybindings ────────────────────────────────────────
setopt ignore_eof
bindkey -e  # Emacs keybindings

# ── Notifications ───────────────────────────────────────────────────────
alias alert='osascript -e "display notification \"Command finished\" with title \"Terminal\""'

# ── Aliases ─────────────────────────────────────────────────────────────
alias ls='ls -G'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias rezsh='source ~/.zshrc && echo "Reloaded ~/.zshrc"'
alias ezsh='nvim ~/.zshrc'
alias erezsh='nvim ~/.zshrc && rezsh'

alias evim='nvim ~/.vimrc'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# ── Custom Script Sourcing ──────────────────────────────────────────────
[[ -f ~/.zsh_functions ]] && source ~/.zsh_functions
# [[ -f ~/.bash_aliases ]] && source ~/.bash_aliases
# [[ -f ~/.bash_functions ]] && source ~/.bash_functions

# ── Paths ───────────────────────────────────────────────────────────────
[[ -d "$HOME/bin" ]] && path=($HOME/bin $path)
[[ -d "$HOME/.local/bin" ]] && path=($HOME/.local/bin $path)
[[ -d "$HOME/.tmp" ]] && export TMPDIR="$HOME/.tmp"

# ── Editor Settings ─────────────────────────────────────────────────────
export VISUAL=nvim
export EDITOR=nvim

# ── Environment Variables ───────────────────────────────────────────────
export SSH_AUTH_SOCK="$HOME/.1password/agent.sock"
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
export SSL_CERT_FILE="/Library/Application Support/Netskope/STAgent/data/nscacert.pem"
export NODE_EXTRA_CA_CERTS="$HOME/.aws/nskp_config/netskope-cert-bundle.pem"

# ── Optional Visual Tweaks ──────────────────────────────────────────────
[[ -f "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh" ]] && source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"
# [[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
