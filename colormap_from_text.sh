#!/bin/bash

#DOC#@CLI@=2024-07= "Simple script that extract colorpaelttes from config files"

grep -oE '#[0-9a-fA-F]{6}' | sort -u | while read -r color; do
  r=$(printf '%d' 0x${color:1:2})
  g=$(printf '%d' 0x${color:3:2})
  b=$(printf '%d' 0x${color:5:2})
  echo "$r, $g, $b"
done
