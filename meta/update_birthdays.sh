#!/usr/bin/bash

BDAYS=$SCRIPTS/bdays.csv

echo > "$BDAYS.temp"

fd . -tx --search-path $SCRIPTS | while read -r line; do
echo "$(git log --follow --format=%ai "$line" |
    tail -n 1 |
    cut -d' ' -f1), $(basename "$line")" >> "$BDAYS.temp"
done

cat "$BDAYS.temp" | sed "s/^, /$(date +%Y-%m-%d), /" | sort > "$BDAYS"
rm "$BDAYS.temp"


