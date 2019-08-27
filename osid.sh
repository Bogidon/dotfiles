# Finds the current OS for the purposes of these dotfiles
case "$(uname -s)" in
    Linux*)     BOGDAN_OSID=linux;;
    Darwin*)    BOGDAN_OSID=macos;;
    CYGWIN*)    echo "Your OS isn't supported by Bogdan's dotfiles."; exit 1 ;;
    MINGW*)     echo "Your OS isn't supported by Bogdan's dotfiles."; exit 1 ;;
    *)          echo "Your OS is not recognized by Bogdan's dotfiles."; exit 1 ;;
esac

export BOGDAN_OSID