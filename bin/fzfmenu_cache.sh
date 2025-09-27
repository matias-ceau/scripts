#!/usr/bin/env bash

CACHE="/dev/shm/fzfmenu_path_cache"
PATH="$HOME/.local/bin:/usr/bin:$PATH"

build_cache() {
    IFS=:
    for dir in $PATH; do 
        fd . -u -tx -tl --search-path "$dir" --maxdepth=1 --color=always 2>/dev/null
    done | sort -u
}

usage() {
    cat <<EOF
Usage: ${0##*/} [--refresh]

Options:
  --refresh   Rebuild the cache only (no output, no background jobs).
EOF
}

refresh_only=false

while [[ $# -gt 0 ]]; do
    case "$1" in
        --refresh)
            refresh_only=true
            shift
            ;;
        --help|-h)
            usage
            exit 0
            ;;
        *)
            usage >&2
            exit 1
            ;;
    esac
done

if [[ "$refresh_only" == true ]]; then
    tmp_file="${CACHE}.tmp.$$"
    trap 'rm -f "$tmp_file"' EXIT
    if build_cache > "$tmp_file"; then
        mv "$tmp_file" "$CACHE"
        trap - EXIT
    else
        rm -f "$tmp_file"
        exit 1
    fi
    exit 0
fi

# If cache exists, output it immediately; otherwise build and store the cache.
if [[ -f "$CACHE" ]]; then
    cat "$CACHE"
else
    build_cache | tee "$CACHE"
fi &

# Always rebuild the cache in the background for next time.
build_cache > "$CACHE".tmp && mv "$CACHE".tmp "$CACHE" &
