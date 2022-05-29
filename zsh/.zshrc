###############################################################################
# ZSH                                                                         #
###############################################################################

ZSH_CUSTOM="$DOTFILES/zsh/oh-my-zsh-custom"

# plugins
plugins=(git git-open git-extras sublime postgres zsh-syntax-highlighting gradle docker tmux)

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

# keys
bindkey '^_' undo # undo completion with ctrl + _

# enable extended pattern matching
setopt extended_glob

# source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# completion system
autoload -U compinit
compinit -u
_comp_options+=(globdots) # show hidden files and folders

# mass rename files
autoload zmv

# exclude items from completion
zstyle ':completion:*' ignored-patterns '__nvmrc_loader|__nvm_forward'

###############################################################################
# Other software                                                              #
###############################################################################

# z - jump around
. "$DOTFILES/external/z_jump-around/z.sh"

# bat - better cat
export MANPAGER="sh -c 'col -bx | bat -l man -p'" # colorize man pages
export MANROFFOPT="-c"

# nvm (node)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pyenv (Python)
eval "$(pyenv init -)"

###############################################################################
# Other dotfiles                                                              #
###############################################################################

# OS-specific .zshrc
source "$DOTFILES/zsh/.zshrc_$BOGDAN_OSID"

# Machine specific .zshrc
if [[ -f "$HOME/.zshrc_local" ]]; then
  source "$HOME/.zshrc_local"
fi

# Aliases
source "$DOTFILES/aliases/common"
source "$DOTFILES/aliases/$BOGDAN_OSID"
