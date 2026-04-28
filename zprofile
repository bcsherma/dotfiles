# Loaded for login shells. Keep one-shot setup here.

# Homebrew (sets PATH, MANPATH, INFOPATH, HOMEBREW_PREFIX, fpath additions)
# brew shellenv
[ -x /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# OrbStack
[ -f "$HOME/.orbstack/shell/init.zsh" ] && source "$HOME/.orbstack/shell/init.zsh"
