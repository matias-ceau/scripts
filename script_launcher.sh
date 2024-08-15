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

fd . -tx --format '{/}' "$SCRIPTS" |
	improved-fzfmenu.sh \
		--preview "$preview_cmd_docs" \
		--preview-window='70%' \
		--bind "enter:become(bash -c {})" \
		--bind "alt-enter:execute($SCRIPTS/terminal_with_command.sh {})" \
		--bind "alt-e:become(nvim \$(which {}))" \
		--bind "insert:execute($SCRIPTS/nvim_in_new_terminal.sh \$(which {}))" \
		--header '<A-E> →- edit' \
		--header-first \
		--preview-label 'DOC (<A-s>: source)' \
		--bind "alt-s:change-preview@$preview_cmd_source@+change-preview-label('SOURCE (<A-d>: doc)')" \
		--bind "alt-d:change-preview@$preview_cmd_docs@+change-preview-label('DOC (<A-s>: source)')" \
		--bind "resize:refresh-preview"

#TODO: option to render a pdf/html of the documentation
