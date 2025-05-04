#!/usr/bin/env bash

CACHE="/dev/shm/fzfmenu_path_cache"
PATH="$HOME/.local/bin:/usr/bin:$PATH"

build_cache() {
    IFS=:
    for dir in $PATH; do 
        fd . -u -tx -tl --search-path "$dir" --maxdepth=1 --color=always 2>/dev/null
    done | sort -u
}

# If cache exists, output it immediately; otherwise build and store the cache.
if [[ -f "$CACHE" ]]; then
    cat "$CACHE"
else
    build_cache | tee "$CACHE"
fi &

# Always rebuild the cache in the background for next time.
build_cache > "$CACHE".tmp && mv "$CACHE".tmp "$CACHE" &
