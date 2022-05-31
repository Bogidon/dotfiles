export DOTFILES="$HOME/.dotfiles"
export TERM="xterm-256color"
export ZSH="$DOTFILES/external/oh-my-zsh"

export NVM_DIR="$HOME/.nvm"
export PYENV_ROOT="$HOME/.pyenv/"

# Machine specific .zshenv 
if [[ -f "$HOME/.zshenv_local" ]]; then
	source "$HOME/.zshenv_local"
fi

# Sets $BOGDAN_OSID
source "$DOTFILES/osid.sh"

# Custom path
export PATH=$(echo "
$DOTFILES/$BOGDAN_OSID/bin
:$DOTFILES/common/bin
:$HOME/bin
:$PYENV_ROOT/bin
:$PATH
:$DOTFILES/common/zsh/oh-my-zsh-custom/plugins/git-open
" | tr -d '\n') # remove newlines

# OS-specific .zshenv
source "$DOTFILES/$BOGDAN_OSID/zsh/.zshenv_$BOGDAN_OSID"
