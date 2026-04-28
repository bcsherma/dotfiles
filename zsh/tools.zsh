# Python: managed by uv (https://docs.astral.sh/uv/). No shell init needed —
# `uv venv`, `uv run`, and `uv python` handle everything. pyenv is intentionally
# absent; core's dev-setup/pre-flight.sh enforces this.

# Node: managed by flox per-project. nvm is intentionally absent; core's
# dev-setup/pre-flight.sh refuses to run with nvm in the shell. For node
# outside flox envs, install via `brew install node` or use bun.

# bun completions
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# direnv
command -v direnv >/dev/null && eval "$(direnv hook zsh)"

# kubectl completion — cached to disk; regenerated only when the kubectl
# binary changes (mtime check). Saves ~100ms per shell.
if command -v kubectl >/dev/null; then
  _kc_cache="$HOME/.cache/zsh/kubectl-completion.zsh"
  _kc_bin="$(command -v kubectl)"
  if [[ ! -f "$_kc_cache" || "$_kc_bin" -nt "$_kc_cache" ]]; then
    mkdir -p "${_kc_cache:h}"
    kubectl completion zsh > "$_kc_cache"
  fi
  source "$_kc_cache"
  unset _kc_cache _kc_bin
fi
