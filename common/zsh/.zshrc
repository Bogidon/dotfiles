# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

###############################################################################
# ZSH                                                                         #
###############################################################################

ZSH_CUSTOM="$DOTFILES/common/zsh/oh-my-zsh-custom"

# plugins
plugins=(git git-open git-extras sublime postgres zsh-syntax-highlighting gradle docker tmux nix-shell)

# P10K Prompt (ZSH Theme)
# To customize prompt, run `p10k configure` or edit $POWERLEVEL9K_CONFIG_FILE
ZSH_THEME="powerlevel10k"
POWERLEVEL9K_CONFIG_FILE=$DOTFILES/common/zsh/p10k.zsh
[[ ! -f $POWERLEVEL9K_CONFIG_FILE ]] || source $POWERLEVEL9K_CONFIG_FILE

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


# Terraform
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

# Direnv
# eval "$(direnv hook zsh)" 

# # Silence direnv noisy diff messages
# # from: https://github.com/direnv/direnv/issues/68#issuecomment-1003426550
# copy_function() {
#   test -n "$(declare -f "$1")" || return 
#   eval "${_/$1/$2}"
# }

# copy_function _direnv_hook _direnv_hook__old

# _direnv_hook() {
#   _direnv_hook__old "$@" 2> >(egrep -v '^direnv: (export)')
# }


###############################################################################
# Other dotfiles                                                              #
###############################################################################

# OS-specific .zshrc
source "$DOTFILES/$BOGDAN_OSID/zsh/.zshrc_$BOGDAN_OSID"

# Machine specific .zshrc
if [[ -f "$HOME/.zshrc_local" ]]; then
  source "$HOME/.zshrc_local"
fi

# Aliases
for f in $DOTFILES/common/aliases/*; do source $f; done
for f in $DOTFILES/$BOGDAN_OSID/aliases/*; do source $f; done
