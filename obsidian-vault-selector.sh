#!/bin/bash

#INFO:# "Opens any obsidian vault

vault=$(
    fd -td \
        -Hg \
        '.obsidian' \
        "$HOME/PKM" |
        awk -F/ '{print $(NF-2)}' |
        fzfmenu.sh \
            --preview='eza -T --sort=modified --color=always $HOME/PKM/{}'
)

if [ -n "$vault" ]; then
    cmd="obsidian://open?vault=$vault"
    obsidian "$cmd"
else
    notify-send "Obsidian Vault Selector" "No vault selected!"
fi
