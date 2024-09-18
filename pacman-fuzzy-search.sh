#!/usr/bin/bash

SHELL=/usr/bin/bash

preview_cmd() {
    local cmd='-Si'
    local prefix=''
    echo "$1" | rg -q '\[installed\]' && cmd='-Qi' || prefix="$2/"
    paru "$cmd" "$prefix$3" |
    sed -E 's/^ +(.+: )/  \1/' |
    sed -E 's/(^.*): *(.*: .*$)/\1:\n  \2/' |
    sed -E 's/None/No/; /[Ss]ize/s/([MGkK]iB)/# \1/' |
    sed -E 's/^([A-Za-z]+.*[A-Za-z])( +):/\1:\2/' |
    sed -E 's/(.+~:)/  \1/g' |
    bat \
        -pplyaml \
        --color=always \
        --terminal-width=100 \
        --wrap=character |
    sed -E 's/\[installed\]/\x1b[0m\x1b[1;97m\[installed\x1b[97m\]\x1b[0m/g'
}
export -f preview_cmd

paru -Sla --color=always | sed -E 's/;35m/;33m/' |
fzf \
    -q "$1" \
    -m \
    --preview='preview_cmd "{}" {1} {2}' \
    --ansi \
    --preview-window '60%'
