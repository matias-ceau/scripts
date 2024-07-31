#!/bin/bash

#INFO:# "Transform symlinks"

usage() {
    local O='\033[0;33m'
    local M='\033[0;35m'
    local G='\033[0;32m'
    local B='\033[0;34m'
    local R='\033[0;31m'
    local b='\033[1m'
    local i='\033[3m'
    local x='\033[0m' # Reset

    echo -e "${O}NAME${x}"
    echo -e "        ${M}$(basename "$0")${x} - ${b}unsymlinking utility${x}"
    echo -e ""
    echo -e "${O}SYNOPSIS${x}"
    echo -e "        Transform symlinks into copies of their targets. "
    echo -e "        Works with symlinks to directories/files. "
    echo -e "        Doesn't do anything when the argument is not a symlink."
    echo -e ""
    echo -e "${O}USAGE${x} "
    echo -e "        ${M}$(basename "$0")${x} ${G}[OPTION]${x} ${B}[SYMLINK]...${x}"
    echo -e ""
    echo -e "${O}HELP${x}"
    echo -e "        ${G}-h, --help${x}    Display this help message and exit"
    echo -e ""
    echo -e "${O}ARGUMENTS${x}"
    echo -e "        ${B}[none]${x}    The script will use ${R}${i}fd${x} to find symlinks"
    echo -e "                  recursively (depth=5) and present them in an"
    echo -e "                  interactive ${R}${i}fzf${x} menu for selection."
    echo -e "        ${B}[1+]${x}      If one or more symlink paths are provided as"
    echo -e "                  arguments, the script will transform each of"
    echo -e "                  of them."
    echo -e ""
    echo -e "${O}EXAMPLES${x}"
    echo -e "        ${M}$(basename "$0")${x}                   -> Interactive mode with ${R}${i}fzf${x}"
    echo -e "        ${M}$(basename "$0")${x} ${B}/path/to/symlink${x}  -> Transform a single symlink"
    echo -e "        ${M}$(basename "$0")${x} ${B}link1 link2 ...${x}   -> Transform multiple symlinks"
}

transform_symlink() {
    local symlink_path="$1"

    if [[ ! -L "$symlink_path" ]]; then
        echo "Error: '$symlink_path' is not a symlink."
        return 1
    fi

    local target_path
    target_path=$(readlink "$symlink_path")

    if [[ ! -e "$target_path" ]]; then
        echo "Error: Target '$target_path' does not exist."
        return 1
    fi

    rm "$symlink_path"
    if cp -r "$target_path" "$symlink_path"; then
        echo "Symlink '$symlink_path' has been transformed into a copy of its target ('$target_path')."
    else
        echo "Error: Failed to copy target '$target_path' to '$symlink_path'."
        return 1
    fi
}

if [[ $# -eq 0 ]]; then
    selected=$(fd '' -tl -u -d5 "$PWD" |
        fzf \
            --preview 'bat {}' \
            --preview-window=right:70% \
            --header "Select a symlink to transform (press Enter to select)")
    transform_symlink "$selected"
elif [[ "$1" == "--help" || "$1" == "-h" ]]; then
    usage
    exit 0
else
    for symlink in "$@"; do
        transform_symlink "$symlink"
    done
fi
