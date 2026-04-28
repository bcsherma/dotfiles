# wandb / core repo aliases.
# Single quotes here are intentional: $WANDB_DEVALL_API_KEY expands at use-time,
# not at alias-definition-time. The variable comes from ~/.config/zsh/secrets.zsh.

alias dev='WF_TRACE_SERVER_URL=http://localhost:6345 WANDB_FRONTEND_URL=https://app.wandb.test WANDB_BASE_URL=https://api.wandb.ai'
alias devall='WF_TRACE_SERVER_URL=http://localhost:6345 WANDB_FRONTEND_URL=https://app.wandb.test WANDB_BASE_URL=https://api.wandb.test WANDB_API_KEY=$WANDB_DEVALL_API_KEY WANDB_ENTITY=ben-urmomsclothes'
alias qa='WF_TRACE_SERVER_URL=https://weave-trace.qa.wandb.ai WANDB_BASE_URL=https://api.qa.wandb.ai'
