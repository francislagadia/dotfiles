# ── Powerlevel10k Instant Prompt ─────────────────────────────────────────────
[[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]] &&
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"

# ── Early Exit for Non-Interactive Shells ────────────────────────────────────
[[ $- != *i* ]] && return

# ── Zinit Setup ──────────────────────────────────────────────────────────────
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
[[ ! -d $ZINIT_HOME ]] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# ── Plugin Loading ───────────────────────────────────────────────────────────

# FZF binary + integration
zinit ice from"gh-r" as"program" pick"bin/fzf"
zinit light junegunn/fzf
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# Python version management
zinit light pyenv/pyenv
eval "$(pyenv init -)" 2>/dev/null

# Syntax highlighting and autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

# Enhanced tab completions
zinit light Aloxaf/fzf-tab

# ── Completion Setup ─────────────────────────────────────────────────────────
autoload -Uz compinit && compinit
zstyle ':completion:*' rehash true
zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '%F{yellow}%d%f'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# ── History Configuration ────────────────────────────────────────────────────
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=200000

setopt append_history inc_append_history share_history
setopt hist_ignore_dups hist_ignore_all_dups hist_reduce_blanks
setopt hist_verify extended_history bang_hist

# Atuin integration
if command -v atuin &>/dev/null; then
  eval "$(atuin init zsh)"
fi

# ── UI & Prompt ──────────────────────────────────────────────────────────────
autoload -U colors && colors
case "$TERM" in
  xterm*|rxvt*) precmd() { print -Pn "\e]0;%n@%m: %~\a" } ;;
esac

source ~/.powerlevel10k/powerlevel10k.zsh-theme
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ── Keybindings ──────────────────────────────────────────────────────────────
bindkey -e
setopt ignore_eof

# ── Notifications ────────────────────────────────────────────────────────────
alias alert='osascript -e "display notification \"Command finished\" with title \"Terminal\""'

# ── Common Aliases ───────────────────────────────────────────────────────────
alias ls='ls -G'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias rezsh='source ~/.zshrc && echo "Reloaded ~/.zshrc"'
alias ezsh='nvim ~/.zshrc'
alias erezsh='nvim ~/.zshrc && rezsh'
alias evim='nvim ~/.vimrc'

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# ── Custom Scripts ───────────────────────────────────────────────────────────
[[ -f ~/.zsh_functions ]] && source ~/.zsh_functions

# ── PATH Configuration ───────────────────────────────────────────────────────
[[ -d "$HOME/bin" ]]         && path=($HOME/bin $path)
[[ -d "$HOME/.local/bin" ]] && path=($HOME/.local/bin $path)
[[ -d "$HOME/.tmp" ]]       && export TMPDIR="$HOME/.tmp"

# ── Environment Variables ────────────────────────────────────────────────────
export VISUAL=nvim
export EDITOR=nvim

export SSH_AUTH_SOCK="$HOME/.1password/agent.sock"
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
export SSL_CERT_FILE="/Library/Application Support/Netskope/STAgent/data/nscacert.pem"
export NODE_EXTRA_CA_CERTS="$HOME/.aws/nskp_config/netskope-cert-bundle.pem"

# ── Optional Visual Enhancements ─────────────────────────────────────────────
[[ -f "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh" ]] &&
  source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

# VSCode shell integration (commented, uncomment if needed)
# [[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"
