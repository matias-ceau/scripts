#!/bin/bash

#DOC#=2024-07=@RUN@ "Check if picom is running"

if pgrep -x "picom" >/dev/null; then
    notify-send "Toggle Picom" "Picom is running. Stopping picom..."
    pkill picom
else
    notify-send "Toggle Picom" "Picom is not running. Starting picom..."
    picom -b
fi
