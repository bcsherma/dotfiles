# Loaded for ALL zsh invocations (interactive, non-interactive, scripts).
# Keep this minimal: env vars only, no commands that produce output.

export DOTFILES="${DOTFILES:-$HOME/repos/dotfiles}"

# Tool roots
export NVM_DIR="$HOME/.nvm"
export BUN_INSTALL="$HOME/.bun"

# Go
export GOARCH=arm64

# Misc app config
export GOVERNOR_TEXT_ONLY=true

# Secrets (API keys, etc) — kept outside this repo and gitignored elsewhere.
# Sourced here so non-interactive shells (scripts, Bash tool) also see them.
[ -f "$HOME/.config/zsh/secrets.zsh" ] && source "$HOME/.config/zsh/secrets.zsh"
