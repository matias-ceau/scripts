#!/bin/bash

#INFO:# "Opens a floating terminal to edit a file with nvim"

setsid alacritty -T nvim-term --class 'floating' -e nvim "$1" &
