#!/bin/zsh
alias emustart='$(which emulator) -avd $(emulator -avd -list-avds | head -n 1)'
alias jn='jupyter notebook'
alias vs='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'
alias cgrep='grep --color=always' # grep preserving color

# Open editors with z autocomplete
sz() { st $(_z -e "$1") }
vz() { vs $(_z -e "$1") }
