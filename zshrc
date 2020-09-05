# Run antigen initialization script.
source /usr/local/share/antigen/antigen.zsh

# Antigen setup
antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle tmux
antigen bundle vi-mode
antigen bundle command-not-found
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle chrissicool/zsh-256color
antigen theme pure
antigen apply

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
