#!/bin/sh

#INFO:#@RUN@ "Pick any pdf in home folder and open it with evince"

# file=$(find ~ 2>/dev/null | grep "\.pdf$" | dmenu -i -l 30)
# evince "$file"

file="$(fd -tf '\.pdf$' "$HOME" --color=always 2>/dev/null |
    fzfmenu.sh --ansi)"
[[ -f "$file" ]] && evince "$file" || xdg-open "$file"
