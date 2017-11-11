# aliases
alias emustart='$(which emulator) -avd $(emulator -avd -list-avds | head -n 1)'
alias jn='jupyter notebook'

ZSH_CUSTOM="$HOME/.dotfiles/zsh/oh-my-zsh-custom"

# Plugins
plugins=(git git-open thefuck osx xcode sublime git-extras postgres zsh-syntax-highlighting gradle docker)

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

# shell envs
EDITOR=st

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

# nvmrc loader
__nvmrc_loader() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

# nvm forward
__nvm_forward() {
	nvm "$@"
}

# nvm
nvm() {
	echo -e '\e[1;33mMessage from Bogdan: initializing nvm...\e[0m'
	export NVM_DIR="/usr/local/nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # load nvm
	__nvmrc_loader # configure .nvmrc loader
	autoload -Uz add-zsh-hook
	add-zsh-hook chpwd __nvmrc_loader
	if ! [ $# -eq 0 ]; then # forward arguments to nvm, if supplied
		echo -e '\e[1;33mRerouting arguments to nvm...\e[0m'
		__nvm_forward "$@";
	fi
	echo -e '\e[1;32mDone!'
}

# jntmp
jntmp() {
	TEMP=$(mktemp -d /tmp/jn_tmp.XXXXX)
	cp ~/.dotfiles/templates/ipynb.ipynb $TEMP
	jupyter notebook $TEMP/ipynb.ipynb
}

# exclude items from completion
zstyle ':completion:*' ignored-patterns '__nvmrc_loader|__nvm_forward'

eval $(/usr/libexec/path_helper -s)

export PATH="$HOME/.yarn/bin:$PATH"

# elixir
test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"
[[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"