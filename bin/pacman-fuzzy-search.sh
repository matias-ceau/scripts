#!/usr/bin/bash

export SHELL=/usr/bin/bash
export CACHE_DIR=$HOME/.cache/pacman-fuzzy-search
for tool in paru yay pacman; do
    if command -v "$tool" >/dev/null 2>&1; then
        export AUR_PKG_MGR="$tool"
        break
    fi
done
mkdir -p "$CACHE_DIR"

preview_cmd() {
    local cmd='-Si'
    local prefix=''
    echo "$1" | rg -q '\[installed\]' && cmd='-Qi' || prefix="$2/"
    $AUR_PKG_MGR "$cmd" "$prefix$3" |
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

pacSl() {
    $AUR_PKG_MGR -Sl --color=always 2>/dev/null | sed -E 's/;35m/;33m/; s/unknown-version/unknown/'
}
export -f pacSl

search_cmd() {
    local args
    local repo
    local inst
    [[ "${FZF_BORDER_LABEL}" =~ a ]] && repo='^aur '
    [[ "${FZF_BORDER_LABEL}" =~ i ]] && inst='\[installed\]'
    [[ "$repo" ]] && args="${repo}"
    [[ "$repo" && "$inst" ]] && args+='|' # implies empty if both false
    [[ "$inst" ]] && args+="${inst}"
    if [[ "$args" ]]; then
        notify-send "pac" "repo: $repo\ninst: $inst\n${args}"
        pacSl | rg -v "${args}"
    else
        pacSl
    fi
}
export -f search_cmd


fzf_cmd() {
    fzf \
        --ansi \
        --multi \
        --border 'bold' \
        --border-label "" \
        --border-label-pos "top" \
        --preview-window '60%' \
        --preview='preview_cmd "{}" {1} {2}' \
        --bind 'resize:refresh-preview' \
        --bind 'alt-w:change-preview-window(right,50%|up,40%,border-horizontal|hidden)' \
        --bind 'enter:become:$AUR_PKG_MGR -S {+2}' \
        --bind 'alt-h:transform:[[ ! $FZF_PROMPT =~ H ]] && echo "change-prompt(H> )+reload(search_cmd)" || echo "change-prompt(> )+reload()"' \
        --bind 'alt-a:change-border-label#"$(blabel -a)"#' \
        --bind 'alt-i:change-border-label#"$(blabel -i)"#' \
        --bind 'alt-a:transform-border-label#blabel -a#' --bind 'alt-a:+reload-sync#search_cmd#' \
        --bind 'alt-i:transform-border-label#blabel -i#' --bind 'alt-a:+reload-sync#search_cmd#'
}

# --topdown Print search results from top to bottom. Repo packages will print first. This is the default.
# --bottomup Print search results from bottom to top. AUR packages will print first.
# j
#ctrl-r reload in normal search
#ctrl-s search term
#ctrl-x
#
# alt-m mode --mode = aur|repo|pkgbuilds E.g. --mode=ar or --mode=arp.
# alt-p pacman only
# alt-o sort SortBy = <votes|popularity|name|base|submitted|modified|id|baseid>
# alt c SearchBy = <name|name-desc|maintainer|depends|checkdepends|makedepends|optdepends>
#               Defaults to name-desc. Search AUR packages according to the options in "Search by" visible here: https://aur.archlinux.org/packages/
#
#        Limit = N
#               Limit the number of packages returned in a search to the given amount. Defaults to 0 (no limit). This applies separately to repo and AUR packages.
export -f fzf_cmd

pacSl | fzf_cmd
