#!/bin/sh
modules=(
  git-checkout-interactive # easily switch to recently used branches with `gci`
  @jarred/git-peek # very quickly open repo with editor locally with `git peek`
  ntl # quickly select an npm run-script to run
)

npm install -g ${modules[@]}
