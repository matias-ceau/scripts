#!/bin/bash

#INFO:#@RUN@ "Open an ardour session"

SHELL=$(which bash)
export AUDIO_PROJECTS="$HOME/audio/PROJECTS"

search_cmd() {
    fd -tf -g '*.ardour' \
        --search-path="$AUDIO_PROJECTS" |
    xargs stat -c "%Y===%n" |
    sort -nr |
    sed -e 's/.*===/"\\e\[0\;33m/' \
        -e 's#/home/matias/audio/PROJECTS/##' \
        -e 's#/#/\\e\[0\;36m#' \
        -e 's#ardour$#ardour\\e[0m"#' |
    xargs -I "{}" echo -e "{}"
}

strip_ansi() {
    sed -r 's/\x1B\[[0-9;]*[a-zA-Z]//g'
}

get_path() {
    echo "$AUDIO_PROJECTS/$1" | strip_ansi
}

preview_cmd() {
    bat -lxml \
        --color=always \
        --style=full \
        --wrap=auto \
        --terminal-width=$FZF_PREVIEW_COLUMNS \
        "$(get_path "$1")"
}

export -f search_cmd
export -f strip_ansi
export -f preview_cmd
export -f get_path

selected="$(search_cmd |
    improved-fzfmenu.sh \
        --terminal-title=open-ardour \
        --pipe \
        --ansi \
        --preview-window='60%' \
        --preview "preview_cmd {}" \
    --bind "resize:refresh-preview")"

ardour "$(get_path "$selected")"
#--bind "enter:execute#setsid ardour $(get_path {}) &#"

# session="$(find /home/matias/audio/PROJECTS | grep "\.ardour$" | sed 's/\/home\/matias\/audio\/PROJECTS//' | dmenu -i -l 30)"
# ardour "/home/matias/audio/PROJECTS/$session"
