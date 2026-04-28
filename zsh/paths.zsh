# PATH munging. `typeset -U` keeps `path` deduplicated automatically.
typeset -U path PATH

path=(
  "$HOME/.local/bin"
  "$HOME/.cargo/bin"
  "$BUN_INSTALL/bin"
  "$HOME/go/bin"
  "$HOME/wf/bin"
  "$HOME/devtools/bin"
  "/opt/homebrew/opt/openjdk/bin"
  "/opt/homebrew/opt/mysql-client@8.4/bin"
  "/opt/homebrew/bin"
  $path
)
