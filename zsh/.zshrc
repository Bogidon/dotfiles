###############################################################################
# ZSH                                                                         #
###############################################################################

ZSH_CUSTOM="$DOTFILES/zsh/oh-my-zsh-custom"

# plugins
plugins=(git git-open git-extras sublime postgres zsh-syntax-highlighting gradle docker)

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

# Source OS-specific .zshrc
source "$DOTFILES/zsh/.zshrc_$BOGDAN_OSID"

# Machine specific dotfile
if [[ -f "$HOME/.zshrc_local" ]]; then
	source "$HOME/.zshrc_local"
fi

###############################################################################
# Other software                                                              #
###############################################################################

# z - jump around
. "$DOTFILES/external/z_jump-around/z.sh"

# bat - better cat
export MANPAGER="sh -c 'col -bx | bat -l man -p'" # colorize man pages
