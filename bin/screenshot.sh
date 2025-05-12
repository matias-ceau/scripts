#!/bin/bash

_OUTPUT_DIR=$HOME/Pictures
_NAME=$(date +%F)-screenshot-$(date +%s).png

if [[ $1 == --select ]] ; then
	grim -g "$(slurp)" $_OUTPUT_DIR/$_NAME
	notify-send "screenshot.sh" "Selection saved as $_NAME"
else
	grim $_OUTPUT_DIR/$_NAME
	notify-send "screenshot.sh" "Selection saved as $_NAME"
fi



