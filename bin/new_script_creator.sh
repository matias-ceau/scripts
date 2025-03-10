#!/bin/bash

#INFO:# "Just create a script"

usage() {
    bat -plhelp <<EOF
Usage:
    $(basename "$0") [script] | [-f <path>]

Options:
    -f, --from <filename> : change an existing file into a user script
    '' (no args)          : get prompted for script name
    <filename>            : create this script (templating if ext)
    -h, --help            : show this help
EOF
}

SCRIPT_PATH="$SCRIPTS/bin"

templater() {
    echo "$1" | rg -q '\.sh$' && template="bash"
    echo "$1" | rg -q '\.py$' && template="python"
    echo "$1" | rg -q '\.xsh$' && template="env xonsh"
    echo -e '#!/usr/bin/'"${template}\n\n"
}

ensure_extension() {
    if (echo "$1" | rg -q '\.[a-zA-Z]+$'); then
        echo "$1"
    else
        read -p "[S]hell/[p]ython/[x]onsh? " lang
        if [[ "$lang" == 's' ]]; then
            echo "$1.sh"
        elif [[ "$lang" == 'p' ]]; then
            echo "$1.py"
        elif [[ "$lang" == 'x' ]]; then
            echo "$1.xsh"
        else
            echo "$1"
        fi
    fi
}

validate_script() {
    if [ "$(wc -m "$1")" -gt 22 ]; then
        chmod +x "$1"
        utils_update_symlimks.sh
        echo "Created script $2"
        bat "$1"
    else
        echo "No script created!"
    fi
}


script_creator() {
    path="$SCRIPT_PATH/$1"
    templater "$1" > "$path"
    nvim "$path" && validate_script "$path" "$1"
}

case "$1" in
    --help | -h)
        usage
        exit 0
        ;;
    --from | -f)
        chmod +x "$2"
        mv "$2" "$SCRIPT_PATH"
        utils_update_symlimks.sh
        nvim "$SCRIPT_PATH/$2"
        ;;
    "")
        read -p "Filename? " filename
        script_creator "$(ensure_extension "$filename")"
        ;;
    *)
        script_creator "$(ensure_extension "$1")"
        ;;
esac
