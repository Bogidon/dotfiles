#
# Linux
#
configure_linux() {
  echo "Configure for Linux..."

  echo "== Install Dependencies (Linux) =="
  install_dependencies() {
    sudo apt-get install -y \
      bat \
      ttf-ancient-fonts \
      dconf-cli \
      python-pip \
      python3 \
      python3-pip \
      vim

    echo "Install NVM"
    curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh" | sh
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"

    sudo pip install --upgrade pip
    sudo pip3 install --upgrade pip
    sudo pip3 install thefuck
  } ; install_dependencies

  echo "== Move assets (Linux) =="
  move_assets() {
    echo "Moving assets..."
    mkdir -p "$HOME/.fonts"
    cp -r "$DOTFILES/common/assets/fonts/." "$HOME/.fonts"
    echo "Finished moving assets."
  } ; move_assets

  echo "== Configure Gnome Terminal (Linux) =="
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
    gsettings set $schemapath font "'MesloLGS NF 10'"
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

  echo "Liinux configuration complete. Please restart your terminal session."
} ;

#
# macOS
#
configure_macos() {
  echo "Configure for macOS..."

  echo "== Configure Settings (macOS) =="
  configure_settings() {
    echo "Configure macOS settings"
    sh ./macos/.macos
  } ; configure_settings

  echo "== Install Dependencies (macOS) =="
  install_dependencies() {
    which -s brew
    if [[ $? != 0 ]] ; then
        echo "Install Homebrew"
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        echo "Update Homebrew"
        brew update
    fi

    brew install mas
    mas account
    if [[ $? != 0 ]] ; then
      echo "Please sign in to the App Store"
      exit 1
    fi

    echo "Install from Brewfile"
    ln -s -f $DOTFILES/macos/homebrew/.Brewfile $HOME
    yes | brew bundle install --global

    echo "Install GVM"
    curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer | sh

    echo "Install nvm"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | sh
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
  } ; install_dependencies

  echo "== Change default shell to zsh (macOS) =="
  change_shell() {
    # append homebrew zsh to /etc/shells
    ZSHPATH='/usr/local/bin/zsh'
    sudo grep -xq $ZSHPATH /etc/shells || echo $ZSHPATH | sudo tee -a /etc/shells
    ln -s -f $ZSHPATH /bin/zsh
    chsh -s /usr/local/bin/zsh
  } ; change_shell

  echo "== Configure iTerm (macOS) =="
  configure_iterm() {
    curl -L https://iterm2.com/shell_integration/zsh -o "$HOME/.iterm2_shell_integration.zsh"
  } ; configure_iterm

  echo "== Move assets (macOS) =="
  move_assets() {
    cp "$DOTFILES/common/assets/Meslo LG M DZ Regular for Powerline.otf" "$HOME/Library/Fonts"
  } ; move_assets
} ;

#
# General
#
configure() {
  echo "== Symlink (general) =="
  symlink() {
    ln -s -f $DOTFILES/common/zsh/.zshrc $HOME
    ln -s -f $DOTFILES/common/zsh/.zshenv $HOME
    ln -s -f $DOTFILES/common/git/.gitconfig $HOME
    ln -s -f $DOTFILES/common/git/.gitignore_global $HOME
    ln -s -f $DOTFILES/common/vim/.vimrc $HOME
    ln -s -f $DOTFILES/common/tmux/.tmux.conf.local $HOME
    ln -s -f $DOTFILES/common/npm/.npmrc $HOME
    ln -s -f $DOTFILES/common/eslint/.eslintrc $HOME
    ln -s -f $DOTFILES/external/gpakosz_tmux/.tmux.conf $HOME
  } ; symlink

  echo "osid: $BOGDAN_OSID"
  case "$BOGDAN_OSID" in
    linux*)     configure_linux;;
    macos*)     configure_macos;;
  esac

  echo "== Install Dependencies (general) =="
  install_dependencies() {
    echo "Install global npm packages"
    $DOTFILES/common/npm/install-global-npm.sh
  } ; install_dependencies

  echo "√√ Configuration complete √√"
}

#
# -- execute --
source ./common/zsh/.zshenv && configure
