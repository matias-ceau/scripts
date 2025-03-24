#!/bin/bash

# location="$(xdotool getmouselocation)"
# x=$(echo "$location" | cut -d' ' -f1 | sed 's/x://')
# y=$(echo "$location" | cut -d' ' -f2 | sed 's/y://')
# text=$($1 | fzfmenu.sh)
# xdotool mousemove x y &&

# Escape each argument
args=()
for arg in "$@"; do
    args+=("$(printf %q "$arg")")
done

fzf_args="${args[*]}"

xterm -T 'fzfmenu' -e bash -c "fzf $fzf_args < /proc/$$/fd/0 > /proc/$$/fd/1" |
    xargs xdotool type
