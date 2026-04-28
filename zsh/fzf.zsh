export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
export FZF_CTRL_T_OPTS="--preview 'if [[ -f {} ]]; then bat --style=numbers --color=always --line-range :500 {}; elif [[ -d {} ]]; then ls -la --color=always {}; else echo {}; fi'"
export FZF_ALT_C_OPTS="--preview 'ls -la --color=always {}'"

command -v fzf >/dev/null && source <(fzf --zsh)
