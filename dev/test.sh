#!/usr/bin/env bash

if [ ! -t 0 ]; then
    # There is data in stdin
    while read line; do
        echo "$line"
    done
else
	echo no stdin heres stdout
fi
