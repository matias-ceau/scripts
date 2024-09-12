#!/bin/bash

SHELL=$(which bash)

remove_icons() {
    tr -cd '[:print:]' | sed 's/^ *//'
}
export -f remove_icons

preview_command() {
    path=$HOME/"$(echo "$1" | remove_icons)"
    if [ -f "$path" ]; then
        bat --style=full --color=always --terminal-width="$FZF_PREVIEW_COLUMNS" "$path" \
            -m '*autosave:INI' -m '*.conf:INI'
    elif [ -d "$path" ]; then
        eza -T --color=always --icons=always "$path"
    fi
}
export -f preview_command

search_files() {
    chezmoi managed --include=files |
        eza --stdin -1 --sort=modified --color=always --icons=always
}
export -f search_files

search_dirs() {
    chezmoi managed --include=dirs |
        eza --stdin -d --icons=always -1 --color=always --sort=name
}
export -f search_dirs

# export -f preview_command
# export -f colorize_file_list

INITIAL_DIR="$(pwd)"
cd $HOME
# Launch fzf with improved preview
selected=$(
    search_files |
        fzf \
            --ansi \
            --preview='preview_command {}' \
            --preview-window=right:60%:wrap \
            --header 'A-D> dirs' \
            --header-first \
            --bind 'alt-d:reload(search_dirs)' \
            --bind 'alt-f:reload(search_files)' |
            remove_icons
)

if [ -n "$selected" ]; then
    path="$(chezmoi source-path "$HOME/$selected")" || exit 0
fi

# INITIAL_DIR="$(pwd)"

if [ -f "$path" ]; then
    cd "$CHEZMOI" && nvim "$path"
elif [ -d "$path" ]; then
    cd "$CHEZMOI" && nvim $(fd . -tf "$path")
else
    exit 0
fi

read -p $'- [a] (default): Chezmoi apply\n- [s]: Chezmoi apply and sync repo\n- [x]: exit\n > ' input

if [[ "$input" == "x" ]]; then
    cd "$INITIAL_DIR" && exit 0
elif [[ "$input" == "s" ]]; then
    chezmoi apply && $SCRIPTS/sync-repo.sh $CHEZMOI && cd "$INITIAL_DIR"
else
    chezmoi apply && cd "$INITIAL_DIR"
fi
