#!/usr/bin/bash

preview_cmd() {
	echo -e "\
FZF_LINES -> ${FZF_LINES}            Number of lines fzf takes up excluding padding and margin
FZF_COLUMNS -> ${FZF_COLUMNS}          Number of columns fzf takes up excluding padding and mar‐ gin
FZF_TOTAL_COUNT -> ${FZF_TOTAL_COUNT}      Total number of items
FZF_MATCH_COUNT -> ${FZF_MATCH_COUNT}      Number of matched items
FZF_SELECT_COUNT -> ${FZF_SELECT_COUNT}     Number of selected items
FZF_POS -> ${FZF_POS}              Vertical position of the cursor in the list starting from 1
FZF_QUERY -> ${FZF_QUERY}            Current query string
FZF_PROMPT -> ${FZF_PROMPT}           Prompt string
FZF_PREVIEW_LABEL -> ${FZF_PREVIEW_LABEL}    Preview label string
FZF_BORDER_LABEL -> ${FZF_BORDER_LABEL}     Border label string
FZF_ACTION -> ${FZF_ACTION}           The name of the last action performed
FZF_KEY -> ${FZF_KEY}              The name of the last key pressed
FZF_PORT -> ${FZF_PORT}             Port number when --listen option is used
FZF_PREVIEW_TOP -> ${FZF_PREVIEW_TOP}      Top position of the preview window
FZF_PREVIEW_LEFT -> ${FZF_PREVIEW_LEFT}     Left position of the preview window
FZF_PREVIEW_LINES -> ${FZF_PREVIEW_LINES}    Number of lines in the preview window
FZF_PREVIEW_COLUMNS -> ${FZF_PREVIEW_COLUMNS}  Number of columns in the preview window"
}

export -f preview_cmd

fd -tf '\.md' |
	fzf \
	--preview='preview_cmd' \
	--preview-window='top,80%'


