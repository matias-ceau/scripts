#!/bin/bash

#INFO:# "Opens a floating terminal to run a command (and see the output)"

# cmd="$(which "$1")"
# setsid alacritty -T term_w_cmd --class 'floating' -e bash -c "$cmd; exec $SHELL" &

alacritty -T term_w_cmd --class 'floating' \
    -e bash -i -c '
        "$@"
        exec "$SHELL"
    ' _ "$@"
