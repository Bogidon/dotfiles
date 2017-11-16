export ZSH="$HOME/.dotfiles/zsh/oh-my-zsh"
export DOTFILES="$HOME/.dotfiles"
export TERM="xterm-256color"

case "$(uname -s)" in
    Linux*)     BOGDAN_OSID=linux;;
    Darwin*)    BOGDAN_OSID=macos;;
    CYGWIN*)    echo "Your OS isn't supported by Bogdan's dotfiles.";;
    MINGW*)     echo "Your OS isn't supported by Bogdan's dotfiles.";;
    *)          echo "Your OS is not recognized by Bogdan's dotfiles.";;
esac

export BOGDAN_OSID
source "$DOTFILES/zsh/.zshenv_$BOGDAN_OSID"