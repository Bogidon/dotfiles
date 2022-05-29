export DOTFILES="$HOME/.dotfiles"
export TERM="xterm-256color"
export ZSH="$DOTFILES/external/oh-my-zsh"

export NVM_DIR="$HOME/.nvm"
export PYENV_ROOT="$HOME/.pyenv/"

if [[ -f "$HOME/.zshenv_local" ]]; then
	source "$HOME/.zshenv_local"
fi

# Custom path
export PATH=$(echo "
$HOME/bin-common
:$PYENV_ROOT/bin
:$PATH
" | tr -d '\n') # remove newlines

# OS-specific .zshenv
source "$DOTFILES/osid.sh"
source "$DOTFILES/zsh/.zshenv_$BOGDAN_OSID"
