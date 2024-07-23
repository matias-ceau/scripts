#!/usr/bin/bash

#DOC#@UTILS@=2024-07= "sync locadata repository"

# Color definitions
BLUE="\e[34m"
GREEN="\e[32m"
RED="\e[31m"
RESET="\e[0m"
BOLD="\e[1m"

# Function to print commands
print_command() {
    echo -e "${GREEN}$ ${BLUE}$1${RESET}" | bat -lzsh --style='rule' --highlight-line 1 --theme="gruvbox-dark"
}

# Function to run command and print its output in real-time
run_command() {
    print_command "$1"
    eval "$1"
}

# Function to handle errors
handle_error() {
    echo -e "${RED}Error: $1${RESET}" >&2
    exit 1
}

ORIGINAL_DIR=$(pwd)
LOCALDATA_DIR="$HOME/.localdata"

cd "$LOCALDATA_DIR" || handle_error "Failed to change directory to $LOCALDATA_DIR"
REMOTE="$(git remote)"
LOCAL="$(git branch --show-current)"

echo -e "Moving to ${BOLD}$LOCALDATA_DIR${RESET}" | bat -lmd --style="grid" --theme="Solarized (dark)"

# Fetch the latest changes without merging
run_command "git fetch $REMOTE $LOCAL" || handle_error "Failed to fetch latest changes"

# Check if there are any changes to pull
if git diff --quiet $LOCAL $REMOTE/$LOCAL; then
    echo "No changes to pull. Local repository is up to date."
else
    # Stash any local changes
    run_command "git stash" || handle_error "Failed to stash local changes"

    # Pull changes with rebase
    run_command "git pull --rebase $REMOTE $LOCAL" || handle_error "Failed to pull and rebase changes"

    # Apply stashed changes if any
    if [[ $(git stash list) ]]; then
        run_command "git stash pop" || handle_error "Failed to apply stashed changes"
    fi
fi

run_command "git status -s"

# Only proceed with commit and push if there are changes
if [[ -n $(git status -s) ]]; then
    run_command "git add -Av"

    NB="$(git status -s | wc -l)"
    MESSAGE="$NB change(s) from $USER@$HOSTNAME"
    run_command "git commit -m \"$MESSAGE\""

    run_command "git push $REMOTE $LOCAL" || handle_error "Failed to push changes"
else
    echo "No local changes to commit and push."
fi

run_command "git maintenance run"

echo -e "# \`Localdata\` repository has been successfully synced." | glow

cd "$ORIGINAL_DIR" || handle_error "Failed to return to original directory"

# GO TO OTHER UTILS (SYMLINKS, DATABASE, etc)