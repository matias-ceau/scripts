#!/bin/bash

prev() {
    cmd=("$1" "-h")
    "${cmd[@]}" |
    bat --color=always -pplhelp
}
export -f prev

doc() {
    echo -e "pw-cat\npw-config\npw-dot\npw-dump\npw-jack\npw-loopback\npw-mididump\npw-midirecord\npw-play\npw-record\npw-top\npw-cli\npw-container\npw-dsdplay\npw-encplay\npw-link\npw-metadata\npw-midiplay\npw-mon\npw-profiler\npw-reserve"
}

doc | fzf --bind focus:refresh-preview \
    --preview 'prev {}'
