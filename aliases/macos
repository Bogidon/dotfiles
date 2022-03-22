#!/bin/zsh
alias emustart='$(which emulator) -avd $(emulator -avd -list-avds | head -n 1)'
alias jn='jupyter notebook'
alias vs='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'
alias cgrep='grep --color=always' # grep preserving color

# git
alias gxb='git xbranch'
alias gbn='git rev-parse --abbrev-ref HEAD' # print branch name
alias gdn='git diff --name-status' # print files changed between commits
alias gpoh='git push -u origin head' # push current head to origin

# Open editors with z autocomplete
sz() { st $(_z -e "$1") }
vz() { vs $(_z -e "$1") }
