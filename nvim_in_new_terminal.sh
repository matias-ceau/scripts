#!/bin/bash

#INFO:# "Opens a floating terminal to edit a file with nvim"

alacritty -T 'floating' -e nvim "$1"
