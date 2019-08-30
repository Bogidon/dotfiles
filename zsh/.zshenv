export ZSH="$HOME/.dotfiles/zsh/oh-my-zsh"
export DOTFILES="$HOME/.dotfiles"
export TERM="xterm-256color"

if [[ -f "$HOME/.zshenv_local" ]]; then
	source "$HOME/.zshenv_local"
fi

source "$DOTFILES/osid.sh"
source "$DOTFILES/zsh/.zshenv_$BOGDAN_OSID"
