ZSH_CUSTOM="$HOME/.dotfiles/zsh/oh-my-zsh-custom"

# plugins
plugins=(git git-open thefuck sublime git-extras postgres zsh-syntax-highlighting gradle docker)

# Source OS-specific .zshrc
source "$DOTFILES/zsh/.zshrc_$BOGDAN_OSID"

# Per-machine dotfiles (optional, in ~/.zsh_custom_machines)
if [[ -f "$HOME/.zsh_custom_machines" ]]; then
	source "$HOME/.zsh_custom_machines"

	for machine in $ZSH_CUSTOM_MACHINES; do
		source $DOTFILES"/zsh/.zshrc_"$BOGDAN_OSID"_"$machine
	done
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
source /opt/ros/kinetic/setup.zsh
