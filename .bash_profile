[ -r ~/.bashrc ] && source ~/.bashrc
[ -r ~/.profile ] && source ~/.profile


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
#  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# Created by `userpath` on 2020-01-27 02:06:41
export PATH="$PATH:/Users/flagadia/.local/bin"
#eval "$(register-python-argcomplete pipx)"

alias pipx='PYENV_VERSION=pipx pipx'
# pipx completion, place after pyenv init
if command -v pipx 1>/dev/null 2>&1; then
  eval "$(PYENV_VERSION=pipx register-python-argcomplete pipx)"
fi

# export EDITOR=vim
VISUAL=nvim; export VISUAL EDITOR=nvim; export EDITOR

# Setting PATH for Python 3.9
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
export PATH

export GPG_TTY=$(tty)
