[ -r ~/.bashrc ] && source ~/.bashrc


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# Created by `userpath` on 2020-01-27 02:06:41
export PATH="$PATH:/Users/flagadia/.local/bin"
eval "$(register-python-argcomplete pipx)"
