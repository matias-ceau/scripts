#!/bin/sh

#INFO:#@RUN@ "Pick any pdf in home folder and open it with evince"

file="$(fd -tf '\.pdf$' "$HOME" --color=always 2>/dev/null |
    improved-fzfmenu.sh --ansi)"
[[ ! -f "$file" ]] && exit 0
evince "$file" || xdg-open "$file"
