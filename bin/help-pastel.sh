#!/usr/bin/bash

line_number=$(pastel -h |
	rg 'SUBCOMMANDS' --line-number |
	cut -d':' -f1)

pastel -h |
	bat --line-range ${line_number}: |
	cat - <(echo "README.md") |
	rg -v ' *help' |
	bat -fpplhelp |
	fzf \
	--header-lines=1 \
	--ansi \
	--preview '[[ ! {1} =~ README ]] && (pastel {1} --help | bat -fpplhelp --highlight-line 1) || display_markdown.py <(curl -sSL https://raw.githubusercontent.com/sharkdp/pastel/master/README.md) $FZF_PREVIEW_COLUMNS'

