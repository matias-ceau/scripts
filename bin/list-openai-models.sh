#!/usr/bin/bash

CACHE="$XDG_CACHE_HOME/openai-model-list.tsv"
[[ -f "$CACHE" ]] &&
[[ $(( $(date +%s) - $(stat --format="%Y" "$CACHE") )) -lt 86400 ]] &&
DONTUPDATE=1

gen-model-list() {
    openai api models.list |
    jq -c '.["created", "id"]' |
    while read -r line;
    do
        date -d '@'$line +%Y-%m-%d 2>/dev/null \
            || echo "$line"
    done |
    tr '\n' '\t' |
    sed 's/"\t/"\n/g' |
    sort > "$CACHE"
}

if [[ "$DONTUPDATE" ]]; then
    bat -ppltsv "$CACHE"
else
    gen-model-list && bat -ppltsv "$CACHE"
fi
