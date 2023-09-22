#!/usr/bin/env bash

##
# Interactive search.
#
[[ -n $1 ]] && cd "$1" # go to provided folder or noop

export FZF_DEFAULT_COMMAND="rg --column --line-number --no-heading --color=always -- ''"
selected=$(
  fzf \
    --ansi \
    --delimiter : \
    --bind "f12:execute-silent:(code -g $PWD/{1..3})" \
    --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
    --preview 'bat -f --highlight-line={2} {1}' | cut -d":" -f1,2,3
)

[[ -n $selected ]] && code -g "$PWD"/"$selected"
