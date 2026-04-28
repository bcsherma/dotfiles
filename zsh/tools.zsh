# Python: managed by uv (https://docs.astral.sh/uv/). No shell init needed —
# `uv venv`, `uv run`, and `uv python` handle everything. pyenv is intentionally
# absent; core's dev-setup/pre-flight.sh enforces this.

# nvm — fast load: put default node on PATH, then source nvm with --no-use
# to skip the slow `nvm use` (~1.1s).
if [ -d "$NVM_DIR" ]; then
  __nvm_default="$(cat "$NVM_DIR/alias/default" 2>/dev/null)"
  if [ -n "$__nvm_default" ]; then
    __nvm_default_bin="$NVM_DIR/versions/node/v$(ls "$NVM_DIR/versions/node" 2>/dev/null | grep "^v${__nvm_default}\." | sort -V | tail -1 | sed 's/^v//')/bin"
    [ -d "$__nvm_default_bin" ] && path=("$__nvm_default_bin" $path)
  fi
  unset __nvm_default __nvm_default_bin
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi

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
