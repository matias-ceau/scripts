#!/usr/bin/bash

# checkout: https://github.com/junegunn/fzf/blob/master/ADVANCED.md#toggling-between-data-sources
#
SHELL=$(which bash)

get_color() {
    env | rg 'FLEXOKI' | rg $1 | head -n 1 | sed 's/^.*=//' |
    pastel format ansi-24bit-escapecode | sed -E 's/^.*\[//'
}
export -f get_color

eza_def() {
    eza \
        --long \
        --color=always \
        --icons=always \
        --time-style='+%y-%m-%d:%H%M' \
        --group \
        --modified \
        --no-quotes \
        --color-scale-mode gradient \
        --color-scale all \
        "$@"
}
export -f eza_def

ls_cmd() {
    eza_def \
        --reverse \
        --group-directories-first \
        --sort=name \
        --dereference \
        "$@"
}
export -f ls_cmd
# --git --git-repos

preview_cmd() {
    local inputpath=""
    for word in "$@"; do
        inputpath+="$word "
    done
    local path="$(echo "$inputpath" | sed 's/ $//')"
    eza_def \
        --list-dirs "$path" |
    cut -d' ' -f6- |
    bat \
        --highlight-line 1 \
        -p \
        --force-colorization \
        --terminal-width=$((FZF_PREVIEW_COLUMNS+2))
    file --brief -i "$path" | bat -lcsv -pp --force-colorization --highlight-line 1 --terminal-width=$FZF_PREVIEW_COLUMNS
    if [[ -d "$(readlink -f "$path")" ]]; then
        eza_def -T --level 2 --width $FZF_PREVIEW_COLUMNS "$(readlink -f "$path")"
    elif (echo "$(file --brief -i "$path")" | rg -q '^image/'); then
        echo kitten icat
        dim=${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES-3}
        kitten icat --clear --transfer-mode=memory --unicode-placeholder --stdin=no --place="$dim@0x0" "$path" | sed '$d' | sed $'$s/$/\e[m/'
    else
        bat \
            --force-colorization \
            --style=grid,snip \
            --terminal-width=$FZF_PREVIEW_COLUMNS \
            --wrap=auto \
            "$path"
    fi
}
preview_label_cmd() {
    local inputpath=""
    for word in "$@"; do
        inputpath+="$word "
    done
    local path="$(echo "$inputpath" | sed 's/ $//')"
    eza_def --list-dirs -X "$path" | cut -d' ' -f-5
}
full_screen_preview() {
    bat --paging=always $1
}
info_cmd() {
    echo -e "fuzzy - $FZF_INFO "
}
export -f preview_label_cmd
export -f preview_cmd
export -f full_screen_preview
export -f info_cmd

cmd_list() {
    echo -e "help - help menu\nlist - jil" |
    fzf --height=~100%
}
export -f cmd_list

fzf_cmd() {
    fzf \
        --multi \
        --with-nth=6.. \
        --ansi \
        --border=rounded \
        --margin 0 \
        --padding 0 \
        --border-label=" $(pwd) " \
        --highlight-line \
        --info=inline-right \
        --info-command='info_cmd' \
        --prompt='> ' \
        --header='header' \
        --header-first \
        --preview='preview_cmd {7..}' \
        --preview-label-pos=bottom \
        --bind 'alt-p:toggle-preview' \
        --preview-window '~3,70%' \
        --bind 'focus:transform-preview-label:preview_label_cmd {7..}' \
        --bind 'alt-space:execute(full_screen_preview {7..})' \
        --bind 'alt-h:transform:[[ ! $FZF_PROMPT =~ H ]] && echo "change-prompt(H> )+reload(ls_cmd --all)" || echo "change-prompt(> )+reload(ls_cmd)"' \
        --bind 'alt-f:jump' \
        --bind 'resize:refresh-preview' \
        --color=disabled:$FLEXOKI_BLACK
    # --bind 'esc:execute(cmd_list)' \
        # --bind '/:enable-search+clear-query'
    # --bind escapejump -> change preview
}
export -f fzf_cmd
# --no-info = hide
#
ls_cmd "$@" "$(pwd)" | fzf_cmd
