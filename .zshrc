# ── Powerlevel10k Instant Prompt ─────────────────────────────────────────────
[[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]] &&
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"

# ── Early Exit for Non-Interactive Shells ────────────────────────────────────
[[ $- != *i* ]] && return

# ── Zinit Bootstrap ──────────────────────────────────────────────────────────
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
if [[ ! -d $ZINIT_HOME/.git ]]; then
  mkdir -p "$(dirname "$ZINIT_HOME")"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# ── Zinit Plugins ────────────────────────────────────────────────────────────

# FZF binary + shell integration
zinit ice from"gh-r" as"program" pick"bin/fzf"
zinit light junegunn/fzf
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# Python version manager
zinit light pyenv/pyenv
command -v pyenv &>/dev/null && eval "$(pyenv init -)" 2>/dev/null

# Syntax and autosuggestions (after compinit — now handled in .zprofile)
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

# FZF-enhanced completions
zinit light Aloxaf/fzf-tab

# Zinit annexes
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# ── Completion Configuration (no compinit here) ──────────────────────────────
zstyle ':completion:*' rehash true
zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '%F{yellow}%d%f'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# ── History & Atuin ─────────────────────────────────────────────────────────
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=200000

setopt append_history inc_append_history share_history
setopt hist_ignore_dups hist_ignore_all_dups hist_reduce_blanks
setopt hist_verify extended_history bang_hist

command -v atuin &>/dev/null && eval "$(atuin init zsh)"

# ── UI: Prompt, Colors, Terminal Title ──────────────────────────────────────
autoload -U colors && colors
case "$TERM" in
  xterm*|rxvt*) precmd() { print -Pn "\e]0;%n@%m: %~\a" } ;;
esac

# Powerlevel10k
[[ -f ~/.powerlevel10k/powerlevel10k.zsh-theme ]] &&
  source ~/.powerlevel10k/powerlevel10k.zsh-theme
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ── Shell Behavior & Keybindings ────────────────────────────────────────────
setopt ignore_eof
bindkey -e

# ── Notifications ───────────────────────────────────────────────────────────
alias alert='osascript -e "display notification \"Command finished\" with title \"Terminal\""'

# ── Aliases ────────────────────────────────────────────────────────────────
alias ls='ls -G'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias rezsh='source ~/.zshrc && echo "Reloaded ~/.zshrc"'
alias ezsh='nvim ~/.zshrc'
alias erezsh='nvim ~/.zshrc && rezsh'
alias evim='nvim ~/.vimrc'

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# ── Custom Scripts ─────────────────────────────────────────────────────────
[[ -f ~/.zsh_functions ]] && source ~/.zsh_functions
# [[ -f ~/.bash_aliases ]] && source ~/.bash_aliases
# [[ -f ~/.bash_functions ]] && source ~/.bash_functions

# ── PATH Configuration ─────────────────────────────────────────────────────
[[ -d "$HOME/bin" ]]         && path=($HOME/bin $path)
[[ -d "$HOME/.local/bin" ]] && path=($HOME/.local/bin $path)
[[ -d "$HOME/.tmp" ]]       && export TMPDIR="$HOME/.tmp"

# ── Editor Defaults ───────────────────────────────────────────────────────
export EDITOR=nvim
export VISUAL=nvim

# ── Environment Variables ──────────────────────────────────────────────────
export SSH_AUTH_SOCK="$HOME/.1password/agent.sock"
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
export SSL_CERT_FILE="/Library/Application Support/Netskope/STAgent/data/nscacert.pem"
export NODE_EXTRA_CA_CERTS="$HOME/.aws/nskp_config/netskope-cert-bundle.pem"

# ── Optional Visual Tweaks ────────────────────────────────────────────────
[[ -f "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh" ]] &&
  source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

# [[ "$TERM_PROGRAM" == "vscode" ]] && source "$(code --locate-shell-integration-path zsh)"
