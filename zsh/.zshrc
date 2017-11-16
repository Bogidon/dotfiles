ZSH_CUSTOM="$HOME/.dotfiles/zsh/oh-my-zsh-custom"

# plugins
plugins=(git git-open thefuck sublime git-extras postgres zsh-syntax-highlighting gradle docker)

# Source OS-specific .zshrc
source "$HOME/.dotfiles/zsh/.zshrc_$BOGDAN_OSID"

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

# shell envs
EDITOR=st

# keys
bindkey '^_' undo # undo completion with ctrl + _

# enable extended pattern matching
setopt extended_glob

# source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# exclude items from completion
zstyle ':completion:*' ignored-patterns '__nvmrc_loader|__nvm_forward'
