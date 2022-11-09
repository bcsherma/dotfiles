# Use oh my zsh wherever we can
export ZSH="$HOME/.oh-my-zsh"

# Set plugins
plugins=(git docker)

# Source zshrc
if [ -f /opt/homebrew/opt/spaceship/spaceship.zsh ]; then
    source /opt/homebrew/opt/spaceship/spaceship.zsh
else
    ZSH_THEME="bureau"
fi
source $ZSH/oh-my-zsh.sh

# Don't use AUTO_CD!
unsetopt AUTO_CD

# This allow ctrl-p/n for search navigation
bindkey "^p" up-line-or-search
bindkey "^n" down-line-or-search

# Load fzf if possible.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set nvim as default if possible
if type 'nvim'>/dev/null
then
    alias vim=nvim
fi

# Enable kubectl autocompletion if possible
if type 'kubectl'>/dev/null
then
    source <(kubectl completion zsh)
fi

if type 'pyenv'>/dev/null
then
    export PYENV_ROOT=$HOME/.pyenv
    export PATH=$PYENV_ROOT/bin:$PATH
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

if type 'direnv'>/dev/null
then
    eval "$(direnv hook zsh)"
fi
