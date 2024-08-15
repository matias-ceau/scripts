#!/bin/bash

#INFO:# "Opens a floating terminal to run a command (and see the output)"

cmd="$(which "$1")"
setsid alacritty -T 'floating' -e bash -c "$cmd; exec $SHELL" &
