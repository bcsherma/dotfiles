# Core zsh options
unsetopt AUTO_CD
setopt PROMPT_SUBST
setopt INTERACTIVE_COMMENTS

# ctrl-p / ctrl-n: search history starting with the current prefix
bindkey "^p" up-line-or-search
bindkey "^n" down-line-or-search

autoload -U colors && colors

# Completion system. Cache the dump and skip the security audit unless
# the dump file is older than 24h. -C is the fast path; full compinit
# only runs once per day (or on first shell after install).
autoload -Uz compinit
zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
if [[ -n "$zcompdump"(#qN.mh-24) ]]; then
  compinit -C -d "$zcompdump"
else
  compinit -d "$zcompdump"
fi
unset zcompdump
