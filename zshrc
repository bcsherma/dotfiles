# Interactive shell config. Modular bits live in $DOTFILES/zsh/.

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
plugins=(git docker)
[ -f "$ZSH/oh-my-zsh.sh" ] && source "$ZSH/oh-my-zsh.sh"

# Modular config — explicit order so PATH is set before tool-detection runs.
for _f in paths history fzf tools aliases projects; do
  _path="$DOTFILES/zsh/$_f.zsh"
  [ -r "$_path" ] && source "$_path"
done
unset _f _path

# Optional machine-local overrides (gitignored)
[ -r "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"

# Prompt — last so nothing overrides it
command -v starship >/dev/null && eval "$(starship init zsh)"
