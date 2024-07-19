#!/usr/bin/bash

#DOC#@UTILS@=2024-07= "sync scripts repository"

# Color definitions
BLUE="\e[34m"
GREEN="\e[32m"
YELLOW="\e[33m"
RESET="\e[0m"
BOLD="\e[1m"

# Function to print section headers
print_header() {
    echo -e "${YELLOW}$(printf '%.s-' {1..50})${RESET}\n"
    echo -e "${BOLD}${BLUE}$1${RESET}" #needs to have a subtle background color
    echo -e "${YELLOW}$(printf '%.s-' {1..50})${RESET}" # i removed the newline, the yellow line you added is enough
}

# Function to print commands
print_command() {
    echo -e "${GREEN}$ $1${RESET}"
}

# Function to run command and print its output in real-time
run_command() {
    print_command "$1"
    eval "$1"
    echo
}

ORIGINAL_DIR=$(pwd)
SCRIPT_DIR="$HOME/.scripts"

print_header "SYNC SCRIPTS REPOSITORY"

echo -e "Moving to ${BOLD}$SCRIPT_DIR${RESET}\n"
cd $SCRIPT_DIR

REMOTE="$(git remote)"
LOCAL="$(git branch --show-current)"

print_header "PULL"
echo -e "Remote: ${BOLD}$(git remote -v | sed -n '1p')${RESET}"
echo -e "Local branch: ${BOLD}$LOCAL${RESET}\n"

run_command "git pull $REMOTE $LOCAL"

print_header "PUSH"

print_header "Current Status"
run_command "git status"

print_header "ADD"
run_command "git add -A"

print_header "COMMIT"
if [ -z "$1" ]; then
    echo -e "No commit message provided. Choose:\n${BOLD}[D]${RESET}efault or ${BOLD}[i]${RESET}nteractive"
    read -r user_input
    user_input=${user_input:-d}
    if [ "$user_input" == "i" ]; then
        run_command "git commit --interactive"
    else
        MESSAGE="$(git status -s | wc -l) change(s) from $USER@$HOSTNAME" #small edit in case there's only one change
        run_command "git commit -m \"$MESSAGE\""
    fi
else
    run_command "git commit -m \"$1\""
fi

echo -e "Changes committed:\n"
run_command "git status -s"

print_header "PUSH"
run_command "git push $REMOTE $LOCAL"

print_header "SYNC COMPLETE"
echo -e "Scripts repository has been successfully synced.\n"

cd "$ORIGINAL_DIR"
