# Run antigen initialization script.
source ~/antigen/antigen.zsh

# Antigen setup
antigen use oh-my-zsh
antigen bundle git
antigen bundle tmux
antigen bundle docker
antigen bundle aws
antigen bundle vi-mode
antigen theme robbyrussell
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

eval "$(direnv hook zsh)"

export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
