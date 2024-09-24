#!/usr/bin/bash

folder="$(locate \
    --regex '\.git$' |
    sed 's/\.git$//' |
    eza --oneline --stdin --list-dirs --color=always --icons=always |
    sed 's#/home/matias#~#' |
    fzf --ansi |
    awk '{print $2}')"

if [ -n "$folder" ]; then
    dest="$(echo "$folder" | sed 's#~#/home/matias#')"
    echo "$dest"
    cd "$dest"
fi
