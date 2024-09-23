#!/usr/bin/bash

VERS="$(python -V | sed -E 's/^[Pa-z]+ ([0-9]\.[0-9]{2})\..*/\1/')"
SHELL='/usr/bin/bash'
export VERS
export SHELL

get_topics() {
    pydoc topics | bat -r 4: | tr '\n' ' ' | sed -E 's/\s+/,/g; s/,/\n/g' | sort
}
export -f get_topics

get_keywords() {
    pydoc keywords | bat -r 4: | tr '\n' ' ' | sed -E 's/\s+/,/g; s/,/\n/g' | sort | bat -pplpy --color=always
}
export -f get_keywords

get_site_packages() {
    fd . '/usr/lib/python3.12/site-packages' -E '*.so' -E '*.dist-info' -E '*.egg-info' -E '*__pycache__' -E '*.pth' -E '.txt' |
    cut -d/ -f6 | sort | uniq | rg -v '^_' |
    while read -r line ; do
        if echo "$line" | rg -q '\.py$'; then
            l="$(echo "$line" | sed 's/\.py$//')"
            echo -e "\e[32m${l}\e[0m"
        else
            l="$(echo "$line" | sed 's/\.$//')"
            echo -e "\e[33m${l}\e[0m"
        fi
    done
}
export -f get_site_packages

get_submodules() {
    fd . "/usr/lib/python3.12/site-packages/$1" -E '*.so' -E '*__init__.py*' -E '*.dist-info' -E '*.egg-info' -E '*__pycache__' -E '*.pth' -E '*.json' -E '.txt' | cut -d/ -f6- | sort | uniq | rg -v '\.[hc]$' | sed 's#/#\.#g' |
    while read -r line ; do
        if echo "$line" | rg -q '\.py$'; then
            l="$(echo "$line" | sed 's/\.py$//')"
            echo -e "\e[32m${l}\e[0m"
        elif echo "$line" | rg -q '\.$'; then
            l="$(echo "$line" | sed 's/\.$//')"
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
    if [ "$FZF_PROMPT" == 'M> ' ]; then
        batlang='rst'
    else
        batlang='man'
    fi
    pydoc "$1" | bat -ppl"$batlang" --color=always --wrap=character --terminal-width=$FZF_PREVIEW_COLUMNS
}
export -f bat_preview

fzf_cmd() {
    fzf \
        --ansi \
        --preview-window=80% \
        --preview 'bat_preview {}' \
        --prompt=' M> ' \
        --bind 'alt-m:change-prompt( M> )+reload(get_site_packages)' \
        --bind 'alt-b:change-prompt( B> )+reload(get_builtins)' \
        --bind 'alt-k:change-prompt( K> )+reload(get_keywords)' \
        --bind 'alt-t:change-prompt( T> )+reload(get_topics)' \
        --bind 'tab:transform:[[ FZF_PROMPT =~ M ]] && echo "change-prompt( S> )+reload(get_submodules {})"' \
        --bind 'shift-tab:transform:[[ FZF_PROMPT =~ S ]] && echo "change-prompt( M> )+reload(get_site_packages)"' \
        --preview-label '<Alt>-[m]odules/[b]uiltins/[k]eywords/[t]opics'\
        --preview-label-pos 'bottom'
}
export -f fzf_cmd

get_site_packages | fzf_cmd

