PATH="$PATH:~/bin:/usr/local/sbin"

export ZSH=$HOME/.dotfiles/zsh/oh-my-zsh
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/ruby/2.0.0/bin:$PATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

ZSH_CUSTOM=$HOME/.dotfiles/zsh/oh-my-zsh-custom

# Plugins
plugins=(git thefuck osx xcode sublime git-extras postgres pyenv)

# Theme
ZSH_THEME="bullet-train"
BULLETTRAIN_PROMPT_ORDER=(
  dir
  context
  git
)

# keys
bindkey '^_' undo # undo completion with ctrl + _

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# iTerm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# enable extended pattern matching
setopt extended_glob

# source oh-my-zsh
source $ZSH/oh-my-zsh.sh
