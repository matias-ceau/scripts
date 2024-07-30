#! /bin/bash

#INFO:# "Run scripts with fzf"

fd '' -tx "$SCRIPTS" |
	xargs -I {} basename {} |
	improved-fzfmenu.sh \
		--preview "bat -lmd $SCRIPTS/docs/scripts/{}.md --color=always --style=grid" \
		--preview-window='70%' \
		--bind "enter:become(bash -c {})"
#	xargs -I {} bash -c "{}" &
