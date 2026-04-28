#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing oh-my-zsh..."
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Back up any existing real (non-symlink) files so we never silently overwrite work.
backup_dir="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"
backup_made=0
for f in .zshenv .zprofile .zshrc; do
  target="$HOME/$f"
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    if [ "$backup_made" -eq 0 ]; then
      mkdir -p "$backup_dir"
      backup_made=1
    fi
    mv "$target" "$backup_dir/$f"
  fi
done

# Symlink dotfiles
ln -sf "$DOTFILES_DIR/zshenv"   "$HOME/.zshenv"
ln -sf "$DOTFILES_DIR/zprofile" "$HOME/.zprofile"
ln -sf "$DOTFILES_DIR/zshrc"    "$HOME/.zshrc"

# Secrets directory — outside this repo, not version controlled.
mkdir -p "$HOME/.config/zsh"
chmod 700 "$HOME/.config/zsh"
if [ ! -f "$HOME/.config/zsh/secrets.zsh" ]; then
  cat > "$HOME/.config/zsh/secrets.zsh" <<'EOF'
# API keys and per-machine secrets. NEVER commit this file.
# Sourced by ~/.zshenv on every zsh start.
EOF
  chmod 600 "$HOME/.config/zsh/secrets.zsh"
fi

if [ "$backup_made" -eq 1 ]; then
  echo "Backed up replaced files to: $backup_dir"
fi
echo "Done. Open a new shell, or run: exec zsh"
