 #!/bin/bash

 #DOC#@CLI@=2024-07= "Simple script that extracts color palettes from config files"

 usage() {
   echo "Usage: $0 [-x|--hex-code] [-r|--rgb] [-c|--color]"
   exit 1
 }

 hex_output=false
 rgb_output=false
 color_output=false

 while [[ "$#" -gt 0 ]]; do
   case $1 in
     -x|--hex-code) hex_output=true ;;
     -r|--rgb) rgb_output=true ;;
     -c|--color) color_output=true ;;
     *) usage ;;
   esac
   shift
 done

 if $hex_output && $rgb_output; then
   echo "Error: -x/--hex-code and -r/--rgb are incompatible."
   usage
 fi

 grep -oE '#[0-9a-fA-F]{6}' | sort -u | while read -r color; do
   r=$(printf '%d' 0x${color:1:2})
   g=$(printf '%d' 0x${color:3:2})
   b=$(printf '%d' 0x${color:5:2})

   if $hex_output; then
     output="$color"
   elif $rgb_output; then
     output="rgb($r, $g, $b)"
   else
     output="$r, $g, $b"
   fi

   if $color_output; then
     echo -e "$output \e[48;2;${r};${g};${b}m       \e[0m"
   else
     echo "$output"
   fi
 done