#!/bin/bash

# Cache file path
CACHE_FILE="${XDG_CACHE_HOME:-$HOME/.cache}/fzfmenu_path"

# Function to process each path
process_path() {
    path="$1"
    if [[ -n "$path" && -e "$path" ]]; then
        basename=$(basename "$path")
        file_output=$(file -b "$path")
        pacman_output=$(pacman -Qo "$path" 2>/dev/null | awk '{print $5 " " $6}' || echo "Not packaged")
        if [[ -L "$path" ]]; then
            link_target=$(readlink -f "$path")
            echo -e "$basename\034$path\034$file_output | $pacman_output | -> $link_target"
        else
            echo -e "$basename\034$path\034$file_output | $pacman_output"
        fi
    fi
}

# Function to update cache
update_cache() {
    ./fd_exec_path.sh | grep -v '^$' |
        while IFS= read -r path; do
            process_path "$path"
        done >"$CACHE_FILE"
}

# Check if cache needs updating
if [[ ! -f "$CACHE_FILE" || $(find "$CACHE_FILE" -mmin +60) ]]; then
    update_cache
fi

# Output cache content
cat "$CACHE_FILE"

# Update cache in the background if it's older than an hour
if [[ $(find "$CACHE_FILE" -mmin +60) ]]; then
    (update_cache &) &>/dev/null
fi
