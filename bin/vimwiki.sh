#!/usr/bin/bash

#INFO:#@CLI@ "Open a note in vim with fzf"

fd -tf '\.md$' --base-directory="$HOME/notes" --color=always |
    fzf \
    --ansi \
    --preview 'bat -pplmd $HOME/notes/{}' \
    --bind 'enter:become(nvim $HOME/notes/{})'

# vim ~/notes/"$( ls ~/notes | fzf )"
