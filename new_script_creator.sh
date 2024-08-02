#!/bin/bash

#INFO:# "Just create a script"

#TODO: remove if not saved

usage() {
	echo -e "Usage:"
	echo -e "    $(basename $0) [script]"
}

script_creator() {
	path="$SCRIPTS/$1"
	touch "$path"
	chmod +x "$path"
	ln -s "$path" "$HOME/.local/bin/$1"
	nvim "$path"
}

if [ $# -eq 0 ]; then
	usage | bat -plhelp
	exit 1
else
	script_creator "$1"
fi
