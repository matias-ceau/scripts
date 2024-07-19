#!/usr/bin/bash

#DOC#@UTILS@=2024-07= "sync scripts repository"

# Color definitions
BLUE_BG="\e[44m"
GREEN_BG="\e[42m"
RESET="\e[0m"

# Function to print messages with colored background
print_message() {
    echo -e "\n${BLUE_BG}$1${RESET}\n"
}

# Function to print command-like messages
print_command() {
    echo -e "\n${GREEN_BG}$ $1${RESET}\n"
}

ORIGINAL_DIR=$(pwd)
SCRIPT_DIR="$HOME/.scripts"

print_message "Moving to $SCRIPT_DIR"
cd $SCRIPT_DIR

REMOTE="$(git remote)"
LOCAL="$(git branch --show-current)"
print_message "Pulling from $(git remote -v | sed -n '1p')"
print_message "Local branches are $(git branch -l)" 

print_command "git pull $REMOTE $LOCAL"
git pull "$REMOTE" "$LOCAL"

print_command "git status"
git status

print_command "git add -A"
git add -A

print_message "Changes staged for commit:"
git status -s --color=always

if [ -z "$1" ]; then
    print_message "No commit message provided\n    [D]efault?\n    [i]nteractive?"

    read -r user_input
    user_input=${user_input:-d}
    if [ "$user_input" == "i" ]; then
        print_command "Running 'git commit --interactive'"
        git commit --interactive
    else
        MESSAGE="$(git status -s | wc -l) changes from $USER@$HOSTNAME" 
        print_command "git commit -m \"$MESSAGE\""
        git commit -m "$MESSAGE"
    fi
else
    print_command "git commit -m \"$1\""
    git commit -m "$1"
fi

print_command "git push $REMOTE $LOCAL"
git push "$REMOTE" "$LOCAL"

cd "$ORIGINAL_DIR"
