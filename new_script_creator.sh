#!/bin/bash

#INFO:# "Just create a script"

#TODO: add templating

usage() {
	bat -plhelp <<EOF
Usage:
    $(basename "$0") [script]
EOF
}

script_creator() {
	path="$SCRIPTS/$1"
	nvim "$path"
	if [ "$(du "$path" | cut -f1)" -ne 0 ]; then
		chmod +x "$path"
		ln -s "$path" "$HOME/.local/bin/$1"
		echo "Created script $1"
		bat "$path"
	else
		echo "No script created!"
	fi
}

if [ $# -eq 0 ]; then
	usage
	exit 1
else
	script_creator "$1"
fi
