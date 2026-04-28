# Interactive shell config. Modular bits live in $DOTFILES/zsh/.
# direnv hook is configured in zsh/tools.zsh (this comment is here so
# core/dev-setup/setup.sh's grep for "direnv hook" succeeds without
# appending a duplicate to the symlinked file).

# Modular config — explicit order: init (compinit + options) first,
# paths before tool-detection, prompt last.
for _f in init paths history fzf tools aliases projects; do
  _path="$DOTFILES/zsh/$_f.zsh"
  [ -r "$_path" ] && source "$_path"
done
unset _f _path

# Optional machine-local overrides (gitignored)
[ -r "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"

# Prompt — last so nothing overrides it
command -v starship >/dev/null && eval "$(starship init zsh)"
