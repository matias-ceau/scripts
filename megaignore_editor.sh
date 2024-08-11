#!/bin/bash

while true; do
    fd '.megaignore' \
        -tf \
        -H \
        --search-path="$HOME" \
        --search-path="/mnt" |
        fzf --preview 'bat {}' \
            --bind 'enter:become(nvim {})' \
            --bind 'ctrl-d:execute(rm {})'
    read -p "Continue? [y]/n: " input
    if [[ "$input" == "n" ]]; then
        break
    fi
done
