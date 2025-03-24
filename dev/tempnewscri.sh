#! /bin/bash

#INFO:# "Run scripts with fzf"

preview_cmd_docs='bat \
	-lmd $SCRIPTS/docs/scripts/{2}.md \
	--wrap=auto \
	--terminal-width=$FZF_PREVIEW_COLUMNS \
	--color=always \
	--style=grid'
preview_cmd_source='bat \
	--style=full \
	--wrap=auto \
	--terminal-width=$FZF_PREVIEW_COLUMNS \
	--color=always $(which {2})'

hex2ansi() { pastel format ansi-24bit $1 ; }
orange="$(hex2ansi $FLEXOKI_ORANGE)"
yellow="$(hex2ansi $FLEXOKI_YELLOW)"
cyan="$(hex2ansi $FLEXOKI_CYAN)"
magenta="$(hex2ansi $FLEXOKI_MAGENTA)"
blue="$(hex2ansi $FLEXOKI_BLUE)"
green="$(hex2ansi $FLEXOKI_GREEN)"
purple="$(hex2ansi $FLEXOKI_PURPLE)"
red="$(hex2ansi $FLEXOKI_RED)"
reset="\e[0m"

header="$(echo -e "${orange}A-cr${reset} exec (W) \n\
${magenta}C-e${reset} edit ${cyan}A-e${reset} (W)")"

label_source="$(echo -e " ${yellow}SOURCE${reset} (${yellow}A-d${reset}: doc) ")"
label_doc="$(echo -e " ${blue}DOC${reset} (${yellow}A-s${reset}: source) ")"

format_shown_line() {
	transformed_lines=""
	while IFS= read -r line; do
		if echo "$line" | rg -q '\.xsh$'; then
			echo -e "${yellow}\U1f41a $line${reset}"
		elif echo "$line" | rg -q '\.py.*$'; then
			echo -e "${green}\Uf0320 $line${reset}"
		elif echo "$line" | rg -q '\.sh$'; then
			echo -e "${cyan}\uf489 $line${reset}"
		else
			echo -e "${magenta}\Uf40d $line${reset}"
		fi
	done
}

fd_cmd() {
	fd . -tx --format '{/}' "$SCRIPTS"
}
fd_cmd | format_shown_line |
	improved-fzfmenu.sh \
		title_is_script_launcher \
		--ansi \
		--nth=2 \
		--preview "$preview_cmd_docs" \
		--preview-window='70%' \
		--bind "enter:become(bash -c {2})" \
		--bind "alt-enter:execute($SCRIPTS/terminal_with_command.sh {2})" \
		--bind "ctrl-e:become(nvim \$(which {2}))" \
		--bind "alt-e:execute($SCRIPTS/nvim_in_new_terminal.sh \$(which {2}))" \
		--header "$header" \
		--header-first \
		--preview-label "$label_doc" \
		--bind "alt-s:change-preview@$preview_cmd_source@+change-preview-label($label_source)" \
		--bind "alt-d:change-preview@$preview_cmd_docs@+change-preview-label($label_doc)" \
		--bind "resize:refresh-preview"

#TODO: option to render a pdf/html of the documentation
# page up and down for preview
# add arguments to functions (print query?)
# toggle header
# multiple selection ?
# editing in specific dir
# stats and logger function
