#!/usr/bin/bash

SHELL=/usr/bin/bash

if [[ -f "$1" ]]; then
    FILE="$1"
else 
    FILE="$(fd . -tf --color=always | fzf --ansi)"
fi
export FILE

preview_cmd() {
    lang="-l$(echo "$1" |
    rg -v '^ +' |
    rg ':' |
    cut -d: -f2 |
    cut -d, -f1)"
    bat "$lang" -pp --color=always "$FILE"
}
export -f preview_cmd

bat --list-languages |
sed -E 's/^(.+):/\x1b[34m\1\x1b[0m:/' |
fzf \
    --ansi \
    --preview='preview_cmd {}'
