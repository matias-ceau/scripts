#!/bin/bash

# Usage: ousse-locate [OPTION]... PATTERN...
# TODO:
# + check how old the databases are, inform and update in background
# + fzf style file select with dust .local/share/ousse -C -w $(( COLUMNS - 2 ))
# + basic plocate search (usage below) - locate -d <path> .
# + piping to fzf/rg
#   + collection of path to rg
#   + fuzzy refine


# dust .local/share/ousse -C -s --skip-total -p |
# sed -E "$(echo "s/^.* [a-z0-9]*\.db *(.*)$/\1/")" |
# bat -pp --color=always \

    total_size=$(du .local/share/ousse -b | cut -f1)
fulllist="$(eza -l .local/share/ousse --sort=size --time=modified --bytes --no-user --no-permissions --time-style='+%s' --absolute | tr -d ,)"
echo -e "$fulllist" | awk -v div="$total_size" -v cols="$COLUMNS"  '{print $1 / div * cols }'
echo -e "$fulllist" | awk -v currt="$(date +%s)" '{print $2 - currt }'
echo -e "$fulllist" | awk '{print  $3}' | eza -ll --stdin --sort=size --bytes
# eza -ll \
    #     --no-permissions \
    #     --octal-permissions \
    #     --color=always --icons=always \
    #     -U -m -h \
    #     --sort size \
    #     --bytes \
    #     --no-user \
    #     --color-scale all \
    #     --color-scale-mode gradient \
    #     --reverse \
    #     -F always \
    #     --time-style '+%s' \
    #     .local/share/ousse |
# bat -pp --color=always |
# fzf --multi --ansi \
    #     --height=~100% \
    #     --info inline-right \
    #     --no-separator \
    #     --preview "${preview_cmd[@]" \
    #     --preview-window right,70%,border-bottom

# Usage: plocate [OPTION]... PATTERN...
#
#   -b, --basename         search only the file name portion of path names
#   -c, --count            print number of matches instead of the matches
#   -d, --database DBPATH  search for files in DBPATH
#                          (default is /var/lib/plocate/plocate.db)
#   -i, --ignore-case      search case-insensitively
#   -l, --limit LIMIT      stop after LIMIT matches
#   -0, --null             delimit matches by NUL instead of newline
#   -N, --literal          do not quote filenames, even if printing to a tty
#   -r, --regexp  <D-=>         interpret patterns as basic regexps (slow)
#       --regex            interpret patterns as extended regexps (slow)
#   -w, --wholename        search the entire path name (default; see -b)
#       --help             print this help
#       --version          print version information
#
# rg --color=always --line-number --no-heading --smart-case "${*:-}" |
#       fzf --ansi \
    #             --color "hl:-1:underline,hl+:-1:underline:reverse" \
    #                   --delimiter : \
    #                         --preview 'bat --color=always {1} --highlight-line {2}' \
    #                               --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
    #                                     --bind 'enter:become(nvim {1} +{2})'
