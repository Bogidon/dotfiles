ZSH_CUSTOM="$HOME/.dotfiles/zsh/oh-my-zsh-custom"

# plugins
plugins=(git git-open git-extras sublime postgres zsh-syntax-highlighting gradle docker)

# Source OS-specific .zshrc
source "$DOTFILES/zsh/.zshrc_$BOGDAN_OSID"

# Per-machine dotfiles (optional, in ~/.zsh_custom_machines)
if [[ -f "$HOME/.zsh_localrc" ]]; then
	source "$HOME/.zsh_localrc"
fi

# theme
ZSH_THEME="bullet-train"
BULLETTRAIN_PROMPT_ORDER=(
  dir
  git
)
BULLETTRAIN_GIT_ADDED=" "
BULLETTRAIN_GIT_DELETED=" "
BULLETTRAIN_GIT_MODIFIED=" "
BULLETTRAIN_GIT_RENAMED=" "
BULLETTRAIN_GIT_UNTRACKED=" "

# completion system
autoload -U compinit
compinit -u

# keys
bindkey '^_' undo # undo completion with ctrl + _

# enable extended pattern matching
setopt extended_glob

# source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# exclude items from completion
zstyle ':completion:*' ignored-patterns '__nvmrc_loader|__nvm_forward'

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/bogdanvitoc/Code/core-api/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/bogdanvitoc/Code/core-api/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/bogdanvitoc/Code/core-api/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/bogdanvitoc/Code/core-api/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/bogdanvitoc/Code/core-api/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/bogdanvitoc/Code/core-api/node_modules/tabtab/.completions/slss.zsh
