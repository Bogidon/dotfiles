PATH="$PATH:~/bin:/usr/local/sbin"

export ZSH="$HOME/.dotfiles/zsh/oh-my-zsh"
export PATH="$PATH:$GEM_HOME/ruby/2.0.0/bin"
export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"

ZSH_CUSTOM="$HOME/.dotfiles/zsh/oh-my-zsh-custom"

# Plugins
plugins=(git git-open thefuck osx xcode sublime git-extras postgres)

# Theme
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

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# iTerm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# rbenv
eval "$(rbenv init -)"

# enable extended pattern matching
setopt extended_glob

# source oh-my-zsh
source $ZSH/oh-my-zsh.sh

export NVM_DIR="/usr/local/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
