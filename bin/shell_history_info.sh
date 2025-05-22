#!/bin/bash

#INFO:# "gets the most frequent lines/words/characters in shell history files (>10)"

get_history() {
	cat "$XDG_STATE_HOME/zsh/history"\
	    "$XDG_STATE_HOME/bash/history" 2>/dev/null |
	    sed -E 's/^: [0-9]+:[0-9];//' # remove extra zsh indications
}

split_by_word() {
	sed -E 's/ /\n/g'
}

clean_up() {
	# remove empty lines
	# remove trailing whitespaces
	rg -v '^$' |
		sed 's/^ *//' |
		sed 's/ *$//'
}

sort_by_occurence() {
	sort | 
	uniq -c | sort -n |
	# remove trailing whitespace
	# replace the first space by a tab
	# remove where occurence <5
	sed 's/^ *//; s/ /\t/; /^[1-5]\t/d'
}

#<DOC>
case $1 in
	-l|--lines)
		get_history |
			clean_up | 
			sort_by_occurence
		;;
	-w|--words)
		get_history |
			split_by_word |
			clean_up | 
			sort_by_occurence
		;;
	-c|--character)
		get_history |
			# remove all spaces
			tr -d '[:space:]' |
			# newline after each characters
			sed 's/./&\n/g' |
			sort_by_occurence
		;;
	-o|--option)
		get_history |
			split_by_word |
			clean_up | 
			rg '^-' |
			sort_by_occurence
		;;
	*)
		echo "Wrong argument, check the code:"
		cat "$0" | sed -n '/#<DOC>/,/#<\/DOC>/p' | sed '1d;$d' |
			bat --no-pager -plbash
		;;
esac
#</DOC>
