#!/bin/bash

# Initialize variables
session=""
window=""
command=""

# Function to display usage
usage() {
    echo "Usage: $0 -s <session-name> -w <window-name> -c <command>"
    echo "All options are mandatory:"
    echo "  -s    Session name for tmux"
    echo "  -w    Window name for tmux"
    echo "  -c    Command to run in tmux (enclose in quotes)"
    exit 1
}

# Parse command line options
while getopts "s:w:c:" opt; do
    case $opt in
        s) session="$OPTARG";;
        w) window="$OPTARG";;
        c) command="$OPTARG";;
        ?) usage;;
    esac
done

# Check if all mandatory options are provided
if [ -z "$session" ] || [ -z "$window" ] || [ -z "$command" ]; then
    echo "Error: All options are mandatory"
    usage
fi

# Run the tmux command
tmux new-session -d -s "$session" -n "$window" "$command"

# Display the command that was executed (for verification)
echo "Created tmux session with:"
echo "Session name: $session"
echo "Window name: $window"
echo "Command: $command"