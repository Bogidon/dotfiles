#!/bin/zsh
alias open="xdg-open"
alias vs="code"

# Copy & paste to/from general clipboard
alias xc="xclip -selection clipboard"
alias xp="xclip -o -selection clipboard"

alias ctop="docker run --rm -ti --name=ctop --volume /var/run/docker.sock:/var/run/docker.sock:ro quay.io/vektorlab/ctop:latest"