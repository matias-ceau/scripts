#! /usr/bin/env bash

#INFO:#@RUN@=2024-06= "Dmenu run replacement with fzf and a floating xterm terminal"

dmenu_path | fzfmenu.sh | xargs -I {} bash -c "{}" &
