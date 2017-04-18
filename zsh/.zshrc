# aliases
alias emustart='$(which emulator) -avd $(emulator -avd -list-avds | head -n 1)'

ZSH_CUSTOM="$HOME/.dotfiles/zsh/oh-my-zsh-custom"

# Plugins
plugins=(git git-open thefuck osx xcode sublime git-extras postgres)

# Theme
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

# completion system
autoload -U compinit
compinit -u

# keys
bindkey '^_' undo # undo completion with ctrl + _

# iTerm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# enable extended pattern matching
setopt extended_glob

# source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# rbenv
rbenv() {
	arg1=$1
	if [ "$arg1" = "init" ]; then
		eval "$(rbenv init -)"
		EXIT=$?
		if [ $EXIT = 0 ]; then
			unset -f rbenv
		else
			echo -e '\e[1;33mMessage from Bogdan: rbenv failed to initialize.'
		fi 
	elif; then
		echo -e '\e[1;33mMessage from Bogdan: rbenv not initialized. Run "rbenv init".'
	fi
}

# nvm
nvm() {
	arg1=$1
	if [ "$arg1" = "init" ] 
	then
		export NVM_DIR="/usr/local/nvm"
		[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
		[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
	elif
	then
		echo -e '\e[1;33mMessage from Bogdan: NVM not initialized. Run "nvm init".'
	fi
}
eval $(/usr/libexec/path_helper -s)
