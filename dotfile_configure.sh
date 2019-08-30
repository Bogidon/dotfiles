# 
# General
# 
configure() {
  echo "Symlink (general)"
  symlink() {
    ln -s -f $HOME/.dotfiles/zsh/.zshrc $HOME
    ln -s -f $HOME/.dotfiles/zsh/.zshenv $HOME
    ln -s -f $HOME/.dotfiles/git/.gitconfig $HOME
    ln -s -f $HOME/.dotfiles/vim/.vimrc $HOME
    ln -s -f $HOME/.dotfiles/tmux/gpakosz_tmux/.tmux.conf $HOME
    ln -s -f $HOME/.dotfiles/tmux/.tmux.conf.local $HOME
    ln -s -f $HOME/.dotfiles/npm/.npmrc $HOME
  } ; symlink

  case "$BOGDAN_OSID" in
    linux*)     configure_linux;;
    macos*)     configure_macos;;
  esac

  echo "√√ Configuration complete √√"
}

# 
# Linux
# 
configure_linux() {
  install_dependencies() {
    yes | sudo apt-get install \
      ttf-ancient-fonts \
      dconf-cli \
      python-pip \
      python3 \
      python3-pip \
      vim

    sudo pip install --upgrade pip
    sudo pip3 install --upgrade pip
    sudo pip3 install thefuck
  } ; install_dependencies

  move_assets() {
    echo "Moving assets..."
    mkdir -p "$HOME/.fonts"
    cp "$DOTFILES/assets/Meslo LG M DZ Regular for Powerline.otf" "$HOME/.fonts"
    echo "Finished moving assets."
  } ; move_assets

  configure_gnome_terminal() {
    echo "Configuring gnome-terminal..."
    profile=$(gsettings get org.gnome.Terminal.ProfilesList default)
    profile=${profile:1:-1}
    schema="org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/"
    schemapath="$schema:$profile/"

    palette=(
      "'#000000'", # normal black
      "'#b71800'", # normal red
      "'#C6B85B'", # normal green
      "'#ffd42b'", # normal yellow
      "'#46ace2'", # normal blue
      "'#ca30c7'", # normal magenta
      "'#00c5c7'", # normal cyan
      "'#c7c7c7'", # normal white
      "'#686868'", # bright gray
      "'#ff2600'", # bright red
      "'#a2cf76'", # bright green
      "'#fff786'", # bright yellow
      "'#afdfff'", # bright blue
      "'#ff77ff'", # bright magenta
      "'#60fdff'", # bright cyan
      "'#ffffff'" # bright white
    )
    palette="[$(printf "%s" "${palette[@]}")]" # join and surround in []

    gsettings set $schemapath palette $palette
    gsettings set $schemapath background-color "#353f42"
    gsettings set $schemapath foreground-color "#d6d6d6"
    gsettings set $schemapath bold-color "#ffffff"
    gsettings set $schemapath allow-bold "true"
    gsettings set $schemapath use-transparent-background "false"
    gsettings set $schemapath use-theme-transparency 'false' # don't use default system theme transparency
    gsettings set $schemapath font "'Meslo LG M DZ for Powerline 12'"
    gsettings set $schemapath use-system-font "false"
    gsettings set $schemapath bold-color-same-as-fg "false"
    gsettings set $schemapath rewrap-on-resize "true"
    gsettings set $schemapath use-theme-colors "false" # don't use default system theme colors
    gsettings set $schemapath visible-name "bogdan (dotfiles)"
    gsettings set $schemapath cursor-shape "underline"
    gsettings set $schemapath encoding "'UTF-8'"
    gsettings set $schemapath scrollback-unlimited "false"
    gsettings set $schemapath scrollback-lines 10000
    gsettings set $schemapath use-custom-command "true"
    gsettings set $schemapath custom-command "'/usr/bin/zsh'"
    gsettings set $schemapath login-shell "false"
    gsettings set $schemapath exit-action "close"

    echo "Finished configuring gnome-terminal."
  } ; configure_gnome_terminal

  echo "Configuration complete. Please restart your terminal session."
} ;

# 
# macOS
# 
configure_macos() {
  echo "Configure for macOS..."

  echo "== Configure Settings =="
  configure_settings() {
    echo "Configure macOS settings"
    sh ./macos/.macos
  } ; configure_settings

  echo "== Install Dependencies =="
  install_dependencies() {
    which -s brew
    if [[ $? != 0 ]] ; then
        echo "Install Homebrew"
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        echo "Update Homebrew"
        brew update
    fi

    mas account
    if [[ $? != 0 ]] ; then
      echo "Please sign in to the App Store"
      exit 1
    fi

    echo "Install from Brewfile"
    ln -s -f $HOME/.dotfiles/homebrew/.Brewfile $HOME 
    yes | brew bundle install --global

    echo "Install GVM"
    curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer | sh
  } ; install_dependencies

  echo "== Change default shell to zsh =="
  change_shell() {
    # append homebrew zsh to /etc/shells
    ZSHPATH='/usr/local/bin/zsh'
    sudo grep -xq $ZSHPATH /etc/shells || echo $ZSHPATH | sudo tee -a /etc/shells
    ln -s -f $ZSHPATH /bin/zsh
    chsh -s /usr/local/bin/zsh
  } ; change_shell

  echo "== Configure iTerm =="
  configure_iterm() {
    curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
  } ; configure_iterm

  echo "== Move assets =="
  move_assets() {
    cp "$DOTFILES/assets/Meslo LG M DZ Regular for Powerline.otf" "$HOME/Library/Fonts"
  } ; move_assets
} ;

# 
# -- execute --
# 
./zsh/.zshenv && configure