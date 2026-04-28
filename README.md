# dotfiles

Personal zsh setup. Run `./install.sh` to symlink everything into `~`.

## Layout

```
zshenv                env vars + secrets sourcing (runs for ALL shells)
zprofile              login-shell setup (orbstack)
zshrc                 interactive setup; sources zsh/*.zsh in order
zsh/
  paths.zsh           PATH munging (deduped via `typeset -U path`)
  history.zsh         history file + setopts
  fzf.zsh             FZF_* opts + shell integration
  tools.zsh           pyenv, nvm (lazy), bun, direnv, kubectl completion
  aliases.zsh         general-purpose aliases
  projects.zsh        wandb / core-repo aliases (dev / devall / qa)
install.sh            symlinks files into ~ and creates the secrets dir
```

## Secrets

API keys and per-machine secrets live in `~/.config/zsh/secrets.zsh`
(chmod 600, gitignored, NOT in this repo). `zshenv` sources it if present.

`projects.zsh` references `$WANDB_DEVALL_API_KEY` from that file via
single-quoted aliases — the variable expands at use-time, so the secret
never appears in `alias` output.
