#!/bin/zsh
alias reload='source ~/.zshenv && source ~/.zshrc'
alias dotedit="subl $DOTFILES"
alias sm='smerge'

# git
alias gxb='git xbranch'
alias gbn='git rev-parse --abbrev-ref HEAD' # print branch name
alias gdn='git diff --name-status' # print files changed between commits
alias gpoh='git push -u origin head' # push current head to origin

# Tmux
alias tas="tmux attach-session"

# Filesystem

## `ls -l` + chmod code for each item https://stackoverflow.com/a/1796009/1888489
alias lschmod="ls -l | awk   '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\"%0o \",k);print}'"