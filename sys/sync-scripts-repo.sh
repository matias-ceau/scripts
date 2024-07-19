#!/usr/bin/bash

#DOC#@UTILS@=2024-07= "sync scripts repository"

# Color definitions
BLUE="\e[34m"
GREEN="\e[32m"
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

ORIGINAL_DIR=$(pwd)
SCRIPT_DIR="$HOME/.scripts"

cd "$SCRIPT_DIR"
REMOTE="$(git remote)"
LOCAL="$(git branch --show-current)"

echo -e "Moving to ${BOLD}$SCRIPT_DIR${RESET}" | bat -lmd --style="grid,snip" --theme="Solarized (dark)\nRemote: ${BOLD}$(git remote -v | sed -n '1p')${RESET}\n Local branch: ${BOLD}$LOCAL${RESET}" | bat -lmd --style="grid,snip" --theme="Solarized (dark)"

run_command "git pull $REMOTE $LOCAL"
run_command "git status -s"
run_command "git add -Av"

CHANGES=$(git status -s | wc -l)
TITLE="$CHANGES change(s) from $USER@$HOSTNAME"

COMMIT_MESSAGE=$(
    cat <<EOF
$TITLE

$COMMIT_MESSAGE
EOF
)

# Commit with the combined message
git commit -m "$COMMIT_MESSAGE"
run_command "git commit -m \"$MESSAGE\""

run_command "git push $REMOTE $LOCAL"
run_command "git maintenance run"

echo -e "# Scripts repository has been successfully synced." | glow

cd "$ORIGINAL_DIR"

# GO TO OTHER UTILS (SYMLINKS, DATABASE, etc)
