#!/bin/bash

SHELL=$(which bash)

preview_command() {
    if [ -f "$1" ]; then
        bat --style=numbers --color=always --terminal-width="$FZF_PREVIEW_COLUMNS" "$HOME/$1" \
            -m '*autosave:INI' -m '*.conf:INI' \
    elif [ -d "$1" ]; then
        eza -1 --color=always --icons=always --sort=modified -m "$HOME/$1"
    fi
}

colorize_file_list() {
    # ANSI color codes
    RESET="\033[0m"
    FOLDER="\033[34m"
    BASE="\033[36m"
    FILE="\033[35m"

    while IFS= read -r line; do
        if [ -d "$HOME/$line" ]; then
            # Directories are bold blue
            echo -e "${line}/"
        else
            # Files are not colorized
            base_name="$(basename "$line")"
            dir_name="$(dirname "$line")/"
            if [ "$dir_name" = "./" ]; then
                dir_name=''
            fi
            echo -e "${BASE}${dir_name}${RESET}${FILE}${base_name}${RESET}"
        fi
    done
}

#    --preview 'if [ -f {} ]; then bat --style=numbers --color=always --terminal-width="$FZF_PREVIEW_COLUMNS" {}; elif [ -d {} ]; then eza -1 --color="always" --icons=always --sort=modified -m {}; fi' \
export -f preview_command
export -f colorize_file_list

# Launch fzf with improved preview
selected=$(
    chezmoi managed | colorize_file_list | fzf \
        --ansi \
        --preview='preview_command {}' \
        --preview-window=right:60%:wrap \
        --walker-root="$HOME"
)

if [ -n "$selected" ]; then
    EDITOR=nvim chezmoi edit "$HOME/$selected"
fi
