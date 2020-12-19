# Run antigen initialization script.
source /usr/local/share/antigen/antigen.zsh

# Antigen setup
antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle pipenv
antigen bundle tmux
antigen bundle docker
antigen bundle vi-mode
antigen bundle sindresorhus/pure
antigen theme pure
antigen apply

# Don't use AUTO_CD!
unsetopt AUTO_CD

bindkey "^p" up-line-or-search
bindkey "^n" down-line-or-search

# Load fzf if possible.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set nvim as default if possible
if type 'nvim'>/dev/null
then
    alias vim=nvim
fi

# Hook in pyenv and direnv if possible
if type 'pyenv'>/dev/null
then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi
if type 'direnv'>/dev/null
then
    eval "$(direnv hook zsh)"
fi
