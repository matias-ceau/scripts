#!/bin/bash

#INFO:#=2024-07= "Fzfmenu with alacritty, can pipe the output"

title=i_fzfmenu
title_prefix=--terminal-title=
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
    fi
done

fzfcmd="fzf $fzf_args < /proc/$$/fd/0"
if [ "$pipe" -eq 1 ]; then
    fzfcmd="$fzfcmd > /proc/$$/fd/1"
fi

# Prefer footclient (requires running foot server), fall back to foot, alacritty, kitty
if command -v footclient &>/dev/null && footclient --server-socket &>/dev/null 2>&1; then
    exec systemd-run --user --scope --quiet \
        footclient -T "$title" -W 100x30 --app-id "$class" -- bash -c "$fzfcmd"
elif command -v foot &>/dev/null; then
    exec systemd-run --user --scope --quiet \
        foot -T "$title" -W 100x30 --app-id "$class" -- bash -c "$fzfcmd"
elif command -v alacritty &>/dev/null; then
    exec systemd-run --user --scope --quiet \
        alacritty -T "$title" --class "$class" -e bash -c "$fzfcmd"
elif command -v kitty &>/dev/null; then
    exec systemd-run --user --scope --quiet \
        kitty --title "$title" --class "$class" bash -c "$fzfcmd"
else
    echo "improved-fzfmenu: no supported terminal found (foot/footclient/alacritty/kitty)" >&2
    exit 1
fi

#
#TODO:
# + add option to change the terminal (kitty for graphics)
# + add sizing modification options ?
