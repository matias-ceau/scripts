#! /bin/bash

#INFO:# "Run scripts with fzf"

preview_cmd_docs='bat -lmd $SCRIPTS/docs/scripts/{}.md --color=always --style=grid'
preview_cmd_source='bat --style=numbers --color=always $(fd {} -tx $SCRIPTS | rg '{}')'

fd '' -tx --format '{/}' "$SCRIPTS" |
	improved-fzfmenu.sh \
		--algo=v1 \
		--preview "$preview_cmd_docs" \
		--preview-window='70%' \
		--bind "enter:become(bash -c {})" \
		--bind "alt-e:become(nvim \$(which {}))" \
		--bind alt-s:change-preview@"$preview_cmd_source"@ \
		--bind alt-d:change-preview@"$preview_cmd_docs"@

#fd '' -tx --format '{/}' "$SCRIPTS" |
#	improved-fzfmenu.sh \
#		--preview "bat -lmd $SCRIPTS/docs/scripts/{}.md --color=always --style=grid" \
#		--preview-window='70%' \
#		--bind "enter:become(bash -c {})"
##	xargs -I {} bash -c "{}" &
