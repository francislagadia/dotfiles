# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ── Early Exit for Non-Interactive Shells ────────────────────────────────
[[ $- != *i* ]] && return

# ── Zinit Bootstrap ─────────────────────────────────────────────────────
if [[ ! -f "$HOME/.local/share/zinit/zinit.git/zinit.zsh" ]]; then
  mkdir -p "$HOME/.local/share/zinit"
  git clone https://github.com/zdharma-continuum/zinit.git "$HOME/.local/share/zinit/zinit.git"
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

# ── Plugin Management ───────────────────────────────────────────────────
# FZF binary and keybindings
zinit ice from"gh-r" as"program" pick"bin/fzf"
zinit light junegunn/fzf
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# Python version management
zinit light pyenv/pyenv
eval "$(pyenv init -)"

# Syntax highlighting and autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

# Enhanced tab completion with fzf
zinit light Aloxaf/fzf-tab

# ── Completion Styles ───────────────────────────────────────────────────
zstyle ':completion:*' rehash true
zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '%F{yellow}%d%f'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# ── Shell History Configuration ─────────────────────────────────────────
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=200000

setopt append_history
setopt inc_append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_verify
setopt extended_history
setopt bang_hist

# ── Atuin Initialization (if installed) ─────────────────────────────────
if command -v atuin &> /dev/null; then
  eval "$(atuin init zsh)"
fi

# ── Prompt & Powerlevel10k ──────────────────────────────────────────────
# Color support
autoload -U colors && colors

# Terminal title bar
case "$TERM" in
  xterm*|rxvt*) precmd() { print -Pn "\e]0;%n@%m: %~\a" } ;;
esac

# Powerlevel10k theme and config
source ~/.powerlevel10k/powerlevel10k.zsh-theme
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ── Shell Behavior & Keybindings ────────────────────────────────────────
setopt ignore_eof
bindkey -e

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

# ── Paths and Temp Directory ────────────────────────────────────────────
[[ -d "$HOME/bin" ]] && path=($HOME/bin $path)
[[ -d "$HOME/.local/bin" ]] && path=($HOME/.local/bin $path)
[[ -d "$HOME/.tmp" ]] && export TMPDIR="$HOME/.tmp"

# ── Editor Configuration ────────────────────────────────────────────────
export VISUAL=nvim
export EDITOR=nvim

# ── Environment Variables ───────────────────────────────────────────────
export SSH_AUTH_SOCK="$HOME/.1password/agent.sock"
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
export SSL_CERT_FILE="/Library/Application Support/Netskope/STAgent/data/nscacert.pem"
export NODE_EXTRA_CA_CERTS="$HOME/.aws/nskp_config/netskope-cert-bundle.pem"

# ── Optional Visual Enhancements ────────────────────────────────────────
[[ -f "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh" ]] && source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"
# [[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"
