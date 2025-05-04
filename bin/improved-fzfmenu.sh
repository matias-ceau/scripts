#!/bin/bash

#INFO:#=2024-07= "Fzfmenu with alacritty, can pipe the output"

# Escape each argument
#args=()
term=alacritty
title=i_fzfmenu
title_prefix=title_is_
class=floating
pipe=0
fzf_args=""

for arg in "$@"; do
    if [[ "$arg" == "--pipe" ]]; then
        pipe=1
    elif [[ "$arg" == $title_prefix* ]]; then
        title="${arg#$title_prefix}"
    else
        fzf_args+=$(printf "%q " "$arg")
        #args+=("$(printf %q "$arg")")
    fi
done

# if [ "$pipe" -eq 0 ]; then
#     $term \
#         -T "$title" \
#         --class "$class" \
#         -e bash -c "fzf $fzf_args < /proc/$$/fd/0"
# else
#     $term \
#         -T "$title" \
#         --class "$class" \
#         -e bash -c "fzf $fzf_args < /proc/$$/fd/0 > /proc/$$/fd/1"
# fi

fzfcmd="fzf $fzf_args < /proc/$$/fd/0"
if [ "$pipe" -eq 1 ]; then
    fzfcmd="$fzfcmd > /proc/$$/fd/1"
fi

exec systemd-run --user --scope --quiet \
    $term \
        -T "$title" \
        --class "$class" \
        -e bash -c "$fzfcmd"

#
#TODO:
# + add option to change the terminal (kitty for graphics)
# + add sizing modification options ?
