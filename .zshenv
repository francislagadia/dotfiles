# `.zshenv` runs for every zsh process, unlike `.zshrc` which only loads for interactive shells
# Leader Key automation depends on this PATH to run Homebrew apps
# Set PATH for pyenv, Homebrew, and system binaries when zsh starts
export PYENV_ROOT="$HOME/.pyenv"

# Keep pyenv ahead of Homebrew/system Python
export PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
