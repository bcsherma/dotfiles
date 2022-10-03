# Run antigen initialization script.
source ~/antigen/antigen.zsh

# Antigen setup
antigen use oh-my-zsh
antigen bundle git
antigen bundle tmux
antigen bundle docker
antigen bundle aws
antigen bundle gcloud
antigen theme bureau
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

export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(direnv hook zsh)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
