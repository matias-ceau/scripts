#!/bin/bash

#INFO:# "Opens any obsidian vault

SHELL="$(which bash)"

preview_cmd() {
    eza -T \
        --sort=modified \
        --color=always \
        "$HOME/PKM/$1"
}

open_vault() {
    if [ -n "$1" ]; then
        cmd="obsidian obsidian://open?vault=$1"
        setsid bash -c "$cmd" &
    else
        notify-send "Obsidian Vault Selector" "No vault selected!"
    fi
}

export -f preview_cmd
export -f open_vault

vault="$(fd -td \
    -Hg \
    '.obsidian' \
    "$HOME/PKM" |
    awk -F/ '{print $(NF-2)}' |
    improved-fzfmenu.sh  \
        --pipe \
        --preview='preview_cmd {}')"

open_vault "$vault"