#!/bin/bash

#INFO:#=2024-07= "Fzfmenu with alacritty, can pipe the output"

# Escape each argument
#args=()
pipe=0
fzf_args=""

for arg in "$@"; do
    if [[ "$arg" == "--pipe" ]]; then
            pipe=1
        else
            fzf_args+=$(printf "%q " "$arg")
            #args+=("$(printf %q "$arg")")
    fi
done

# Join the escaped arguments
#fzf_args="${args[*]}"

if [ "$pipe" -eq 0 ]; then
    alacritty \
        -T 'fzfmenu' \
        -e bash -c "fzf $fzf_args < /proc/$$/fd/0" 
else
    alacritty \
        -T 'fzfmenu' \
        -e bash -c "fzf $fzf_args < /proc/$$/fd/0 > /proc/$$/fd/1"
fi

#
#TODO:
# + add option to change the terminal (kitty for graphics)
# + add sizing modification options ?
