#!/bin/bash

paru -S --needed - < <(
    cat <<EOF
git
fd
bat
fzf
ripgrep
neovim
chezmoi
dmenu
findutils
rofi
dunst
python-pandas
python-colorama
light
xdotool
EOF
)
