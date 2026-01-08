#!/bin/bash

#INFO:# "Opens any obsidian vault"

# Ensure XDG_CONFIG_HOME is set
: "${XDG_CONFIG_HOME:=$HOME/.config}"

# Create a temporary file for the functions to ensure they are available in the fzf subshell
FUNC_FILE=$(mktemp)
trap "rm -f $FUNC_FILE" EXIT

# Define functions and write them to the temp file
cat << 'EOF' > "$FUNC_FILE"
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
        cmd="obsidian obsidian://open?vault=$vault_name"
        setsid bash -c "$cmd" &
    else
        notify-send "Obsidian Vault Selector" "No vault selected!"
    fi
}

plabel_cmd() {
    eza --oneline --list-dirs --color=always --icons=always "$1"
}
EOF

# Command to source the functions
SOURCE_CMD="source $FUNC_FILE"

search_cmd() {
    if [ -f "$XDG_CONFIG_HOME/obsidian/obsidian.json" ]; then
        cat "$XDG_CONFIG_HOME/obsidian/obsidian.json" |
        jq '.vaults .[] .path' | sed 's/"//g' |
        eza --oneline --color=always --icons=never --stdin --list-dirs
    else
        echo "Error: Obsidian config not found at $XDG_CONFIG_HOME/obsidian/obsidian.json" >&2
    fi
}

search_cmd | improved-fzfmenu.sh \
    --terminal-title=obsidian-open-vault \
    --with-nth -2 \
    --delimiter / \
    --ansi \
    --border \
    --info inline-right \
    --preview-window='top,70%,border-bottom' \
    --bind="resize:refresh-preview" \
    --preview-label="" \
    --preview-label-pos bottom \
    --bind 'focus:transform-preview-label:bash -c "$SOURCE_CMD; plabel_cmd {1..-1}"' \
    --bind "enter:execute(bash -c \"$SOURCE_CMD; open_vault {}\")" \
    --preview "bash -c \"$SOURCE_CMD; preview_cmd {}\""