#!/bin/bash

#INFO:#=2024-06= "Similar to dmenu but with fzf and xterm (this is only the helper function)"

# Escape each argument
args=()
for arg in "$@"; do
    args+=("$(printf %q "$arg")")
done

# Join the escaped arguments
fzf_args="${args[*]}"

alacritty -T 'fzfmenu' -e "fzf $fzf_args < /proc/$$/fd/0 > /proc/$$/fd/1"
