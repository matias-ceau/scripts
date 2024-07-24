#!/bin/bash

# Path to the cached FZF-friendly PATH processor script
PROCESSOR_SCRIPT="./fzf_path_processor.sh"

# Run the processor script and pipe to fzfmenu
$PROCESSOR_SCRIPT | fzfmenu.sh --with-nth=1 --delimiter=$'\034' \
    --preview='echo -e "Path: {2}\nDetails: {3}"' \
    --preview-window=up:3:wrap |
    cut -d$'\034' -f2 | xargs -r -I {} bash -c '{}' &
