#!/bin/bash

keyboard_script="$(which show_keyboard_layout.py)"
setsid xterm -T KB_layout_floating -fs 20 -e bash -c "$keyboard_script | bat --paging=always --style=plain" &
