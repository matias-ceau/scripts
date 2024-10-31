#!/usr/bin/bash

SHELL='/usr/bin/bash'
VERS="$(python -V | sed -E 's/^[Pa-z]+ ([0-9]\.[0-9]{2})\..*/\1/')"
SEARCH_PATH="/usr/lib/python${VERS}/site-packages/"
export VERS
export SHELL
export SEARCH_PATH

PYMAN_CACHE_DIR="$XDG_CACHE_HOME/pyman"
mkdir -p "$PYMAN_CACHE_DIR"
PYMAN_CUR_FILE="${PYMAN_CACHE_DIR}/file_$(date +%s)"
PYMAN_CUR_DIR="${PYMAN_CACHE_DIR}/file_$(date +%s)"
export PYMAN_CUR_DIR
export PYMAN_CUR_FILE

get_topics() {
    pydoc topics | bat -r 4: | tr '\n' ' ' | sed -E 's/\s+/,/g; s/,/\n/g' | sort
}
export -f get_topics

get_keywords() {
    pydoc keywords | bat -r 4: | tr '\n' ' ' | sed -E 's/\s+/,/g; s/,/\n/g' | sort | bat -pplpy --color=always
}
export -f get_keywords

get_site_packages() {
    fd . "$SEARCH_PATH" -E '*.so' -E '*.dist-info' -E '*.egg-info' -E '*__pycache__' -E '*.pth' -E '*.json' -E '.txt'|
    cut -d/ -f6 | sort | uniq | rg -v '^_' |
    while read -r line ; do
        if echo "$line" | rg -q '\.py$'; then
            l="$(echo "$line" | sed 's/\.py$//')"
            echo -e "\e[32m${l}\e[0m"
        else
            l="$(echo "$line" | sed 's/$/\//')"
            echo -e "\e[33m${l}\e[0m"
        fi
    done
}
export -f get_site_packages

get_submodules() {
    local arg="$(echo "$1" | sed 's#/$##')" 
    fd . "$SEARCH_PATH/$arg" -E '*.so' -E '*.dist-info' -E '*.egg-info' -E '*__pycache__' -E '*.pth' -E '*.json' -E '.txt' |
    cut -d/ -f6- | sort | uniq | rg -v '\.[hc]$' | sed 's#/#\.#g' |
    while read -r line ; do
        if echo "$line" | rg -q '\.py$'; then
            l="$(echo "$line" | sed 's/\.py$//')"
            echo -e "\e[32m${l}\e[0m"
        elif echo "$line" | rg -q '\.$'; then
            l="$(echo "$line" | sed 's/\.$/\//')"
            echo -e "\e[33m${l}\e[0m"
        fi
    done
}
export -f get_submodules

get_builtins() {
    python -c "[print(b) for b in dir(__builtins__)]" | bat -pplpy --color=always
}
export -f get_builtins

bat_preview() {
    if [ "$FZF_PROMPT" == 'L> ' ]; then
        batlang='rst'
    else
        batlang='man'
    fi
    pydoc "$(echo "$1" | sed 's#/$##')" | bat -ppl"$batlang" --color=always --wrap=character --terminal-width=$FZF_PREVIEW_COLUMNS
}
export -f bat_preview

enter_cmd() {
    if [ "$FZF_BORDER_LABEL" = 'BUILTINS' ]; then
        bat_preview "$1"
    elif [ "$FZF_BORDER_LABEL" = 'TOPICS' ]; then
        bat_preview "$1"
    elif [ "$FZF_BORDER_LABEL" = 'KEYWORDS' ]; then
        bat_preview "$1"
    else
        if echo "$1" | rg -qv '/$'; then
            suffix=".py"
        fi
        local src="${SEARCH_PATH}$(echo "$1" | sed -E "s#\.#/#g; s#'##g; s#//#/#g")$suffix"
        notify-send "$src" ""
        if [ -d "$src" ]; then
            ranger "$src"
        elif [ -f "$src" ]; then
            bat --paging=always "$src"
        fi
    fi
}
export -f enter_cmd

fzf_cmd() {
    fzf \
        --ansi \
        --preview-window=70% \
        --border=rounded \
        --border-label '' \
        --border-label-pos=bottom \
        --preview 'bat_preview {}' \
        --preview-label-pos 'top' \
        --prompt=' L> ' \
        --info=inline-right \
        --header "$(echo -e "\e[31m  ┏━\e[32mB\e[0muiltins/\e[33mK\e[0meywords/\e[34mT\e[0mopics
\e[91mA\e[31m━╋━\e[35mL\e[0mibs \e[31m━━\e[95mM\e[0modules
\e[31m  ┗━\e[36mP\e[0mreview | \e[1;37m<CR>\e[0m src")" \
        --header-first \
        --bind 'focus:transform-preview-label:echo {}' \
        --bind 'alt-l:change-prompt( L> )+reload(get_site_packages)+change-border-label()' \
        --bind 'alt-b:change-prompt( B> )+reload(get_builtins)+change-border-label(BUILTINS)' \
        --bind 'alt-k:change-prompt( K> )+reload(get_keywords)+change-border-label(KEYWORDS)' \
        --bind 'alt-t:change-prompt( T> )+reload(get_topics)+change-border-label(TOPICS)' \
        --bind 'alt-m:transform:[[ $FZF_PROMPT =~ L ]] && echo "change-prompt( M> )+reload(get_submodules {})+change-border-label({})"' \
        --bind 'enter:execute(enter_cmd {})' \
        --bind 'alt-p:toggle-preview' \
        --bind change:first \
        --bind 'resize:refresh-preview'
}
export -f fzf_cmd

get_site_packages | fzf_cmd
