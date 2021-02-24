#!/bin/sh
modules=(
  git-checkout-interactive # easily switch to recently used branches with `gci`
  @jarred/git-peek # very quickly open repo with editor locally with `git peek`
)

npm install -g ${modules[@]}