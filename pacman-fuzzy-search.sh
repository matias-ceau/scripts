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
        --terminal-width=$FZF_PREVIEW_COLUMNS \
        --wrap=character |
    sed -E 's/\[installed\]/\x1b[0m\x1b[1;97m\[installed\x1b[97m\]\x1b[0m/g'
}
export -f preview_cmd

paruSl() {
    paru -Sl --color=always | sed -E 's/;35m/;33m/'
}
export -f paruSl

search_cmd() {
    local repo
    local inst
    [[ "$FZF_BORDER_LABEL" =~ 'A' ]] && repo='^aur '
    [[ "$FZF_BORDER_LABEL" =~ 'I' ]] && inst='\[installed\]'
    local rg_filter="$repo"'|'"$inst"
    [[ "$rg_filter" == '|' ]] && paruSl || paruSl | rg -v "$rg_filter"
}
export -f search_cmd

blabel() {
    if [[ "$1" == 'a' ]]; then
        [[ "$FZF_BORDER_LABEL" =~ 'A' ]] && repo=a || repo=A
    elif [[ "$1" == 'i'  ]]; then
        [[ "$FZF_BORDER_LABEL" =~ 'I' ]] && inst=i || inst=I
    else
        [[ -z "$FZF_BORDER_LABEL" ]] && repo=A && inst=I
    fi
    echo -e "|\e[35m <${repo}> - <${inst}> \e[0m|"
}
export -f blabel

fzf_cmd() {
    fzf \
        -q "$1" \
        -m \
        --border 'bold' \
        --border-label "$(blabel)" \
        --border-label-pos "top" \
        --preview='preview_cmd "{}" {1} {2}' \
        --bind 'resize:refresh-preview' \
        --bind 'alt-p:change-preview-window(right,60%|up,40%,border-horizontal|hidden|right)' \
        --bind 'alt-a:transform-border-label(blabel a)+reload(search_cmd)' \
        --bind 'alt-i:transform-border-label(blabel i)+reload(search_cmd)' \
        --ansi \
        --preview-window '60%' \
        --bind 'enter:become:paru -S {+2}'
}
# --bind 'alt-h:transform:[[ ! $FZF_PROMPT =~ H ]] && echo "change-prompt(H> )+reload(search_cmd)" || echo "change-prompt(> )+reload()"' \
    paruSl | fzf_cmd -q "$1"
