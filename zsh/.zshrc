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

# Source OS-specific .zshrc
source "$DOTFILES/zsh/.zshrc_$BOGDAN_OSID"

# Machine specific dotfile
if [[ -f "$HOME/.zshrc_local" ]]; then
	source "$HOME/.zshrc_local"
fi

# z - jump around
. "$DOTFILES/lib/z/z.sh"

# bat - better cat
export MANPAGER="sh -c 'col -bx | bat -l man -p'" # colorize man pages
