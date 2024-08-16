#! /bin/bash

#INFO:# "Run scripts with fzf"

preview_cmd_docs='bat \
	-lmd $SCRIPTS/docs/scripts/{}.md \
	--wrap=auto \
	--terminal-width=$FZF_PREVIEW_COLUMNS \
	--color=always \
	--style=grid'
preview_cmd_source='bat \
	--style=full \
	--wrap=auto \
	--terminal-width=$FZF_PREVIEW_COLUMNS \
	--color=always $(which {})'

ye="\033[38;2;188;82;21m"
cy="\033[38;2;36;131;123m"
ma="\033[38;2;160;47;111m"
Rs="\033[0m"

header="\
${ye}A-cr${Rs} exec (W) \n\
${ma}A-E${Rs} edit \n\
${cy}C-E${Rs} edit (W)"

fd . -tx --format '{/}' "$SCRIPTS" |
	improved-fzfmenu.sh \
		--preview "$preview_cmd_docs" \
		--preview-window='70%' \
		--bind "enter:become(bash -c {})" \
		--bind "alt-enter:execute($SCRIPTS/terminal_with_command.sh {})" \
		--bind "ctrl-e:become(nvim \$(which {}))" \
		--bind "alt-e:execute($SCRIPTS/nvim_in_new_terminal.sh \$(which {}))" \
		--header "$(echo -e "$header")" \
		--header-first \
		--preview-label 'DOC (<A-s>: source)' \
		--bind "alt-s:change-preview@$preview_cmd_source@+change-preview-label('SOURCE (<A-d>: doc)')" \
		--bind "alt-d:change-preview@$preview_cmd_docs@+change-preview-label('DOC (<A-s>: source)')" \
		--bind "resize:refresh-preview"

#TODO: option to render a pdf/html of the documentation
# page up and down for preview
# add arguments to functions
# toggle header
# customize preview label
# multiple selection
# editing in specific dir 
# stats and logger function
