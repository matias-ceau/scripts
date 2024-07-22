#!/bin/bash

# Launch fzf with improved preview
selected=$(chezmoi managed | fzf \
    --preview 'if [ -f {} ]; then bat --style=numbers --color=always --terminal-width="$FZF_PREVIEW_COLUMNS" {}; elif [ -d {} ]; then eza -1 --color="always" --icons=always --sort=modified -m {}; fi' \
    --preview-window=right:60%:wrap\
    --walker-root="$HOME")

if [ -n "$selected" ]; then
    EDITOR=nvim chezmoi edit "$selected"
fi
