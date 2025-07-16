#!/bin/bash

#INFO:# "Run scripts with fzf"

# Load environment
source "$(dirname "$(realpath "$0")")/../lib/env.sh"
load_env "colors"

if [ "$1" = "--embedded" ] || [ "$1" = "-E" ] ; then
    fzf_cmd="fzf"
else
    fzf_cmd="improved-fzfmenu.sh title_is_script_launcher"
fi

preview_docs='bat \
    -lmd $SCRIPTS/docs/scripts/{2}.md \
    --wrap=auto \
    --terminal-width=$FZF_PREVIEW_COLUMNS \
    --color=always \
    --style=grid'
preview_src='bat \
    --style=full \
    --wrap=auto \
    --terminal-width=$FZF_PREVIEW_COLUMNS \
    --color=always $(which {2})'

hex2ansi() { pastel format ansi-24bit $1 ; }
orange="$(hex2ansi $FLEXOKI_ORANGE)"
yellow="$(hex2ansi $FLEXOKI_YELLOW)"
cyan="$(hex2ansi $FLEXOKI_CYAN)"
magenta="$(hex2ansi $FLEXOKI_MAGENTA)"
blue="$(hex2ansi $FLEXOKI_BLUE)"
green="$(hex2ansi $FLEXOKI_GREEN)"
# purple="$(hex2ansi $FLEXOKI_PURPLE)"
# red="$(hex2ansi $FLEXOKI_RED)"
reset="\e[0m"

header="$(echo -e "${orange}A-cr${reset} exec (W) \n\
    ${magenta}C-e${reset} edit ${cyan}A-e${reset} (W)")"

label_source="$(echo -e " ${yellow}SOURCE${reset} (${yellow}A-d${reset}: doc) ")"
label_doc="$(echo -e " ${blue}DOC${reset} (${yellow}A-s${reset}: source) ")"


format_shown_line() {
    fd . -tx --format '{/}' "$SCRIPTS" | while read -r line; do
        if echo "$line" | rg -q '\.xsh$'; then
            echo -e "${yellow}\U1f41a $line${reset}"
        elif echo "$line" | rg -q '\.py.*$'; then
            echo -e "${green}\Uf0320 $line${reset}"
        elif echo "$line" | rg -q '\.sh$'; then
            echo -e "${cyan}\uf489 $line${reset}"
        else
            echo -e "${magenta}\Uf40d $line${reset}"
        fi
    done
}

cmd-full-path() {
    expr='fd -tx $1 --absolute-path --search-path $SCRIPTS'
    $(eval "$expr") "$2"
}
export -f cmd-full-path

format_shown_line |
$fzf_cmd \
    --ansi \
    --nth=2 \
    --preview "$preview_src" \
    --preview-window='70%' \
    --bind "enter:become(bash -c {2})" \
    --bind "alt-enter:execute(cmd-full-path terminal_with_command.sh {2})" \
    --bind "ctrl-e:become(nvim \$(which {2}))" \
    --bind "alt-e:execute(cmd-full-path nvim_in_new_terminal.sh \$(which {2}))" \
    --header "$header" \
    --header-first \
    --preview-label "$label_doc" \
    --bind "alt-s:change-preview@$preview_docs@+change-preview-label($label_source)" \
    --bind "alt-d:change-preview@$preview_src@+change-preview-label($label_doc)" \
    --bind "resize:refresh-preview"

#TODO: option to render a pdf/html of the documentation
# page up and down for preview
# add arguments to functions (print query?)
# toggle header
# multiple selection ?
# editing in specific dir
# stats and logger function
