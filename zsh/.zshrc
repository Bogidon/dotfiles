export ZSH=$HOME/.dotfiles/zsh/oh-my-zsh

ZSH_CUSTOM=$HOME/.dotfiles/zsh/oh-my-zsh-custom

# Plugins
plugins=(git thefuck osx xcode)

# Theme
ZSH_THEME="bullet-train"
BULLETTRAIN_PROMPT_ORDER=(
  dir
  context
  git
)
BULLETTRAIN_DIR_BG=blue
BULLETTRAIN_DIR_FG=white_bright

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# iTerm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
