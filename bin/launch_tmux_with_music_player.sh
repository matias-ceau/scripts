#! /usr/bin/bash

#INFO:#=2024-07=@CLI@ "Script to create new tmux session called music and open cmus inside (without actually opening a terminal)"

tmux new-session -d -s MUSIC -n cmus 'cmus'
