#!/bin/bash

#INFO:# "Gives the top researched manual entries"

usage() {
    cmd="$(basename "$0")"
    bat -plhelp <<EOF

A tool to check history manual searches with man or batman

Usage:  $cmd [-h/--help] [-n/--number <n>] [-m/--more-than [<n>]] [-a/--all]
        $cmd [<rg_arguments>]

Arguments:
    Default        -- gets the 10 most searched (no arguments)
    [<arguments>]  -- passes all arguments (including options) to <ripgrep> to search the full list

Options:
    -n/--number <nb>      --  gets the <nb> most searched
    -m/--more-than [<nb>] --  gets searches than where done more than <nb> times (default 1)
    -a/--all              --  gets all searches
EOF
}

get_searches() {
    cat "$XDG_STATE_HOME/zsh/history" "$XDG_STATE_HOME/bash/history" |
        sed 's/^: [0-9]\+:[0-9];//' |
        rg '^(bat)?man ' |
        sed -E 's/^(bat)?man //; /^-/d' |
        cut -d' ' -f1 |
        sort | uniq -c | sort -nr |
        awk '{printf "%s %d\n", $2, $1}'
}

case $1 in
'')
    get_searches | head
    ;;
-h | --help)
    usage
    ;;
-n | --number)
    get_searches | head -n $2
    ;;
-m | --mo*)
    get_searches | awk -v threshold="$2" '$NF > threshold'
    ;;
-a | --all)
    get_searches
    ;;
*)
    get_searches | rg "$@"
    ;;
esac
