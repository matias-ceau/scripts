#!/usr/bin/bash

# Find .desktop files and use fzf to select one
CACHE_FILE="$XDG_CACHE_HOME/desktop-script.txt"
CURR_DATE=$(date '+%s')
MIN_ACCEPTABLE_DATE=$((CURR_DATE - 7200))

update-the-cache() {
    echo "$CURR_DATE"  > "$CACHE_FILE"
    fd -tf -u --color always '\.desktop$' --search-path / >> "$CACHE_FILE"
}

[[ "${1}" == "--update" ]] && update-the-cache
[[ $(head -n 1 "$CACHE_FILE" 2>/dev/null) -gt $MIN_ACCEPTABLE_DATE ]] || update-the-cache


selected_file="$(bat -r 2: "$CACHE_FILE" | fzf --ansi --preview 'bat --color=always {}')"

if [[ -z "$selected_file" ]]; then
    echo "No file selected."
    exit 0
fi

# Extract the Exec line from the selected .desktop file
exec_line=$(grep '^Exec=' "$selected_file" | head -n 1 | cut -d '=' -f 2-)

if [[ -z "$exec_line" ]]; then
    echo "No Exec line found in $selected_file."
    exit 1
fi

# Execute the command specified in the Exec line
echo "Running: $exec_line"
eval "$exec_line"

