#! /bin/bash

#INFO:# "Run scripts with fzf"

preview_cmd_docs='bat -lmd $SCRIPTS/docs/scripts/{}.md --color=always --style=grid'
preview_cmd_source='bat --style=full --color=always $(which {})'

fd '' -tx --format '{/}' "$SCRIPTS" | \
	improved-fzfmenu.sh \
		--preview "$preview_cmd_docs" \
		--preview-window='70%' \
		--bind "enter:become(bash -c {})" \
		--bind "alt-e:become(nvim \$(which {}))" \
		--header '<A-E> -> edit' \
		--header-first \
		--preview-label 'DOC (<A-s>: source)' \
		--bind "alt-s:change-preview@$preview_cmd_source@+change-preview-label('SOURCE (<A-d>: doc)')" \
		--bind "alt-d:change-preview@$preview_cmd_docs@+change-preview-label('DOC (<A-s>: source)')"

#fd '' -tx --format '{/}' "$SCRIPTS" |
#	improved-fzfmenu.sh \
#		--preview "bat -lmd $SCRIPTS/docs/scripts/{}.md --color=always --style=grid" \
#		--preview-window='70%' \
#		--bind "enter:become(bash -c {})"
##	xargs -I {} bash -c "{}" &
