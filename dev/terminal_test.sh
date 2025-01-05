#!/bin/bash

# Number of test iterations
[[ -n "${1}" ]] && ITERATIONS="$1" || ITERATIONS=10
TMPFILE="$HOME/.cache/$0.tsv"

echo "Testing terminal launch speeds..."
echo "Running $ITERATIONS iterations for each terminal..."
echo

# Function to test a terminal
test_terminal() {
    terminal=$1
    command=$2
    total=0
    
    echo "Testing $terminal..."
    for i in $(seq 1 $ITERATIONS); do
        start_time=$(date +%s.%N)
        $command >/dev/null 2>&1
        end_time=$(date +%s.%N)
        
        # Calculate duration
        duration=$(echo "$end_time - $start_time" | bc)
        total+="\t${duration}"
        
        printf "  Run %2d: %.3f seconds\n" $i $duration
    done
    echo -e "${terminal}$(date '+%s')${total}" >> "$TMPFILE"
}

kitty -1 --title floating -e fzf
test_terminal "Kitty" "kitty --title floating -e ls"
alacritty --title floating -e fzf
test_terminal "Alacritty" "alacritty --title floating -e ls"
xterm -title floating -e fzf
test_terminal "XTerm" "xterm -title floating -e ls"
urxvt -title floating -e fzf
test_terminal "URxvt" "urxvt -title floating -e ls"
wezterm start --class floating -- fzf
test_terminal "WezTerm" "wezterm start --class floating -- ls"
st -t floating -e fzf 
test_terminal "ST" "st -t floating -e ls"
