#!/bin/bash

#DOC#@CLI@=2024-07= "Simple script that extracts color palettes from config files"

usage() {
  echo -e "USAGE:\n    <stdout> | $(basename $0) [-x|--hex-code] [-r|--rgb] [-c|--color]\n    $(basename $0) [-x|--hex-code] [-r|--rgb] [-c|--color] <file(s)>" | bat -plhelp
  exit 1
}


main() {
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
      echo -e "\e[48;2;${r};${g};${b}m       \e[0m $output "
    else
      echo "$output"
    fi
  done
}


# Check if something is piped into the script
if [ ! -t 0 ]; then
    main "$@"
else
    # Check if no arguments are passed
    if [ $# -eq 0 ]; then
        usage
    else
        # Separate options and non-options
        opts=()
        args=()
        for arg in "$@"; do
            if [[ $arg == -* ]]; then
                opts+=("$arg")
            else
                args+=("$arg")
            fi
        done

        # Run the command with separated options and arguments
        if [ ${#args[@]} -eq 0 ]; then
            usage
        else
            cat "${args[@]}" | main "${opts[@]}"
        fi
    fi
fi
