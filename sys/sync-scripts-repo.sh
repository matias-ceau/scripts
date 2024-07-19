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
    echo -e "$1" | bat -lmd --style="grid" --highlight-line 1 --theme="Solarized (dark)"
}

# Function to print commands
print_command() {
    echo -e "${GREEN}$ ${BLUE}$1${RESET}" | bat -lzsh --style='rule' --highlight-line 1 --theme="gruvbox-dark"
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

echo -e "Moving to ${BOLD}$SCRIPT_DIR${RESET}\nThis is the script directory." | bat -lmd --style="grid,numbers" --theme="Solarized (dark)"
cd $SCRIPT_DIR

REMOTE="$(git remote)"
LOCAL="$(git branch --show-current)"

print_header "PULL"
echo -e "Remote: ${BOLD}$(git remote -v | sed -n '1p')${RESET}\n Local branch: ${BOLD}$LOCAL${RESET}\n" | bat -lmd --style="grid,numbers" --theme="Solarized (dark)"

run_command "git pull $REMOTE $LOCAL"

print_header "PUSH"

print_header "Current Status"
run_command "git status"

print_header "ADD"
run_command "git add -A"

print_header "COMMIT"
if [ -z "$1" ]; then
    echo -e "No commit message provided. Choose:\n${BOLD}[D]${RESET}efault or ${BOLD}[i]${RESET}nteractive" | bat -lmd --style="grid,numbers" --theme="Solarized (dark)"
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

echo -e "Changes committed:\n" | bat -lmd --style="grid,numbers" --theme="Solarized (dark)"
run_command "git status -s"

print_header "PUSH"
run_command "git push $REMOTE $LOCAL"

print_header "SYNC COMPLETE"
echo -e "Scripts repository has been successfully synced.\n" | bat -lmd --style="grid,numbers" --theme="Solarized (dark)"

cd "$ORIGINAL_DIR"
