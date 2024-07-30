#!/usr/bin/env bash

#INFO:#=2024-07= "Fzfmenu with alacritty, requires a --bind argument to exit fzf"

# Escape each argument
args=()
for arg in "$@"; do
    args+=("$(printf %q "$arg")")
done

# Join the escaped arguments
fzf_args="${args[*]}"

alacritty \
    -T 'fzfmenu' \
    -o window.dimensions.columns=150 \
    -o window.dimensions.lines=30 \
    -e bash -c "fzf $fzf_args < /proc/$$/fd/0"

# > /proc/$$/fd/1"
