#!/bin/bash

#INFO:# "Opens any obsidian vault

SHELL="$(which bash)"

preview_cmd() {
    eza -la --list-dirs --time=modified --no-permissions --time-style=long-iso --total-size --color=always --icons=always "$1"
    eza \
        -T \
        --sort=modified \
        --color=always \
        --icons=always \
        "$1" |
    rg -v '\.js|\.css|\.png|\.gif|\.svg|\.zip' | bat -r 2: -pp --color=always
}

open_vault() {
    if [ -n "$1" ]; then
        vault_name="$(echo "$1" | awk -F/ '{print $(NF)}')"
        cmd="obsidian obsidian://open?vault=$1"
        setsid bash -c "$cmd" &
    else
        notify-send "Obsidian Vault Selector" "No vault selected!"
    fi
}

search_cmd() {
    cat $XDG_CONFIG_HOME/obsidian/obsidian.json |
    jq '.vaults .[] .path' | sed 's/"//g' |
    eza --oneline --color=always --icons=never --stdin --list-dirs
}
# fd -td -Hg '.obsidian' "$HOME/PKM" -E ".debris" awk -F/ '{print $(NF-2)}'

plabel_cmd() {
    eza --oneline --list-dirs --color=always --icons=always "$1"
}

export -f preview_cmd
export -f open_vault
export -f search_cmd
export -f plabel_cmd

vault="$(search_cmd |
    improved-fzfmenu.sh  \
        title_is_obsidian-open-vault \
        --pipe \
        --with-nth -1 \
        --delimiter / \
        --ansi \
        --border \
        --info inline-right \
        --preview-window='top,70%,border-bottom' \
        --bind="resize:refresh-preview" \
        --preview-label="" \
        --preview-label-pos bottom \
        --bind 'focus:transform-preview-label:plabel_cmd {1..-1}' \
    --preview='preview_cmd {}')"

open_vault "$vault"
