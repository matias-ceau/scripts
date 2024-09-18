#!/usr/bin/bash

if [ -n "$1" ]; then
    search_path="$(realpath "$1")"
else
    search_path="$(pwd)"
fi

ALL_FILES="$(fd '.md$' -tf --format '{/}' --search-path "$search_path")"

relations="$(rg \
    '\[\[(.*?)(?:\|.*?)?]]' \
    --replace '$1' \
    --only-matching \
    --no-line-number \
    "$search_path" |
    rg -v ':$' |
    sed 's/\.md:/.md ==> /')"

source_path="$(echo "$relations" | sed 's/ ==> .*$//')"
source_name="$(echo "$source_path" | sed 's/.*\///; s/\.md$//')"

target_name="$(echo "$relations" | sed 's/^.* ==> //')"
# echo $source_path
echo "$target_name"


mapfile -t target_array < <(echo "$target_name")
for line in "${target_array[@]}"; do
    pattern='^'
    pattern+="$line"
    pattern+='(\.md)?$'
    echo "$ALL_FILES" | rg -q "$pattern" || echo "$line not found" 
done

