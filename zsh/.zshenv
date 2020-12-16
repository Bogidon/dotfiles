export DOTFILES="$HOME/.dotfiles"
export ZSH="$DOTFILES/external/oh-my-zsh"
export TERM="xterm-256color"

if [[ -f "$HOME/.zshenv_local" ]]; then
	source "$HOME/.zshenv_local"
fi

source "$DOTFILES/osid.sh"
source "$DOTFILES/zsh/.zshenv_$BOGDAN_OSID"
