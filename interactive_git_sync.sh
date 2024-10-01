#!/bin/bash

#INFO:# "automated script for a bunch of repos"

opts="\
$CHEZMOI
$SCRIPTS
$LOCALDATA
$PSYRIS
$GIT_REPOS/matias-ceau/ondansetron"

cmd="$SCRIPTS/sync-repo.sh"
[[ "$1" == "--dry-run" ]] && cmd+=' --dry-run' && shift

cmd_list="$(echo -e "$opts" |
    awk "{print \"$cmd\",\$1}")"

cmd="$(echo -e "$cmd_list" |
    fzf --select-1 --height=~100% -q "$1")"

[[ -n "${cmd}" ]] && eval "$cmd"
