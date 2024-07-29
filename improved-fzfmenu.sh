#!/usr/bin/env bash

#DOC#=2024-07= "Similar to dmenu but with fzf and urxvt (this is only the helper function)"

# Escape each argument
args=()
for arg in "$@"; do
    args+=("$(printf %q "$arg")")
done

# Join the escaped arguments
fzf_args="${args[*]}"

alacritty -T 'fzfmenu' -o window.dimensions.columns=150 -o window.dimensions.lines=30 -e bash -c "fzf $fzf_args < /proc/$$/fd/0 > /proc/$$/fd/1"
