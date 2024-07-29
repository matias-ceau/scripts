#! /bin/bash

#DOC# "Run scripts with fzf"

fd '' -tx "$SCRIPTS" |
	xargs -I {} basename {} |
	improved-fzfmenu.sh \
		--preview "bat -lmd $SCRIPTS/docs/scripts/{}.md --color=always --style=grid" \
		--preview-window='70%' |
	xargs -I {} bash -c "{}" &
