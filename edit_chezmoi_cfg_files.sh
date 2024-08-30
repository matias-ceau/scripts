#!/bin/bash

SHELL=$(which bash)

preview_command() {
    if [ -f "$1" ]; then
        bat --style=full --color=always --terminal-width="$FZF_PREVIEW_COLUMNS" "$HOME/$1" \
            -m '*autosave:INI' -m '*.conf:INI'
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
            base_name="$(basename "$line")"
            dir_name="$(dirname "$line")/"
            if [ "$dir_name" = "./" ]; then
                dir_name=''
            fi
            echo -e "${BASE}${dir_name}${RESET}${FILE}${base_name}${RESET}"
        fi
    done
}


export -f preview_command
export -f colorize_file_list

# Launch fzf with improved preview
selected=$(
    chezmoi managed --include files |
        colorize_file_list |
        fzf \
        --ansi \
        --multi \
        --preview='preview_command {}' \
        --preview-window=right:60%:wrap \
        --preview-label="FILES" \
        --header 'A-D> dirs ­ tab> select' \
        --header-first \
        --bind 'focus:transform-preview-label:basename {}' \
        --bind 'alt-d:reload(chezmoi managed --include dirs)' \
        --bind 'alt-f:reload(chezmoi managed --include files | colorize_file_list)' \
        #--walker-root="$HOME"
)

path="$(chezmoi source-path "$HOME/$selected")"

if [ -f "$path" ]; then
    nvim "$path"
elif [ -d "$path" ]; then
    nvim $(fd . -tf "$path")
else
    exit 0
fi

read -p $'- [a] (default): Chezmoi apply\n- [s]: Chezmoi apply and sync repo\n- [x]: exit\n > ' input

if [[ "$input" == "x" ]]; then
    exit 0
elif [[ "$input" == "s" ]]; then
    chezmoi apply
    $SCRIPTS/sync-repo.sh $CHEZMOI
else
    chezmoi apply
fi
