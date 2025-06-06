# Exit if not interactive
[[ $- != *i* ]] && return

### ── Zinit Bootstrap ─────────────────────────
if [[ ! -f "$HOME/.local/share/zinit/zinit.git/zinit.zsh" ]]; then
  mkdir -p "$HOME/.local/share/zinit"
  git clone https://github.com/zdharma-continuum/zinit.git "$HOME/.local/share/zinit/zinit.git"
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

### ── Plugin Management ───────────────────────
# FZF binary and keybindings
zinit ice from"gh-r" as"program" pick"bin/fzf"
zinit light junegunn/fzf
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# pyenv
zinit light pyenv/pyenv
eval "$(pyenv init -)"

# Zsh enhancements
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

# Fuzzy tab-completion
zinit light Aloxaf/fzf-tab

### ── Autocompletion System ───────────────────
autoload -Uz compinit
zstyle ':completion:*' rehash true
zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '%F{yellow}%d%f'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
compinit

### ── History (Zsh Recommended) ───────────────
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

### ── Atuin Initialization ─────────────────────
if command -v atuin &> /dev/null; then
  eval "$(atuin init zsh)"
fi

### ── Prompt and Title ────────────────────────
autoload -U colors && colors
PROMPT='%F{green}%n@%m%f:%F{blue}%~%f %# '
case "$TERM" in
  xterm*|rxvt*) precmd() { print -Pn "\e]0;%n@%m: %~\a" } ;;
esac

### ── Core Options ────────────────────────────
setopt ignore_eof
alias alert='osascript -e "display notification \"Command finished\" with title \"Terminal\""'

### ── Aliases ────────────────────────────────
alias ls='ls -G'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias rezsh='source ~/.zshrc && echo "Reloaded ~/.zshrc"'
alias ezsh='nvim ~/.zshrc'
alias erezsh='nvim ~/.zshrc && rezsh'
alias evim='nvim ~/.vimrc'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

### ── Path and Editor ─────────────────────────
[[ -d "$HOME/bin" ]] && path=($HOME/bin $path)
[[ -d "$HOME/.local/bin" ]] && path=($HOME/.local/bin $path)
[[ -d "$HOME/.tmp" ]] && export TMPDIR="$HOME/.tmp"

export VISUAL=nvim
export EDITOR=nvim

### ── Environment Variables ───────────────────
export SSH_AUTH_SOCK="$HOME/.1password/agent.sock"
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
export SSL_CERT_FILE="/Library/Application Support/Netskope/STAgent/data/nscacert.pem"
export NODE_EXTRA_CA_CERTS="$HOME/.aws/nskp_config/netskope-cert-bundle.pem"

# Gruvbox palette for truecolor (optional)
[[ -f "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh" ]] && source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

# VSCode integration (commented to avoid echo issues)
# [[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"
