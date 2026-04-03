# `.zshenv` runs for every zsh process, unlike `.zshrc` which only loads for interactive shells
# Leader Key automation depends on this PATH to run Homebrew apps
# Set PATH for Homebrew and system binaries when zsh starts
export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
