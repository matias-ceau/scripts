#!/usr/bin/bash

#INFO:#@UTILS@=2024-07= "sync git repository"

# Color definitions
BLUE="\e[34m"
GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
RESET="\e[0m"
BOLD="\e[1m"

# Check for bat and glow
if ! command -v bat &>/dev/null; then
    echo -e "${YELLOW}Warning: 'bat' is not installed. Output might look less pretty.${RESET}"
    USE_BAT=false
else
    USE_BAT=true
fi

if ! command -v glow &>/dev/null; then
    echo -e "${YELLOW}Warning: 'glow' is not installed. Output might look less pretty.${RESET}"
    USE_GLOW=false
else
    USE_GLOW=true
fi

# Function to strip ANSI escape sequences
strip_ansi() {
    echo "$1" | sed 's/\x1b\[[0-9;]*m//g'
}

# Function to print commands
print_command() {
    if $USE_BAT; then
        echo -e "${GREEN}$ ${BLUE}$1${RESET}" | bat -lzsh --style='rule' --highlight-line 1 --theme="gruvbox-dark"
    else
        echo -e "${GREEN}$ ${BLUE}$1${RESET}"
    fi
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

# Function to print usage
print_usage() {
    echo -e "${YELLOW}Usage: $0 <repository_path>${RESET}"
    echo -e "Example: $0 ~/.scripts"
}

# Function to print formatted message
print_formatted() {
    if $USE_BAT; then
        echo -e "$1" | bat -lmd --style="grid" --theme="Solarized (dark)"
    else
        echo -e "$1"
    fi
}

# Function to print glow message
print_glow() {
    if $USE_GLOW; then
        strip_ansi "$1" | glow
    else
        echo -e "$1"
    fi
}

# Function to handle conflicts
handle_conflicts() {
    echo -e "${YELLOW}Conflicts detected during rebase. Here are your options:${RESET}"
    echo "1. Open your default editor to resolve conflicts manually"
    echo "2. Abort the rebase and return to the previous state"
    echo "3. Skip this commit and continue with the next one"
    read -p "Enter your choice (1/2/3): " choice

    case $choice in
    1)
        git status
        echo "Opening editor to resolve conflicts..."
        ${EDITOR:-vim} $(git diff --name-only --diff-filter=U)
        git add .
        git rebase --continue
        ;;
    2)
        git rebase --abort
        echo "Rebase aborted. Repository is back to its previous state."
        ;;
    3)
        git rebase --skip
        echo "Skipped conflicting commit. Continuing rebase..."
        ;;
    *)
        echo "Invalid choice. Aborting rebase."
        git rebase --abort
        ;;
    esac
}

# Function to display sync summary
display_summary() {
    local changes=$(git diff --stat @{1} 2>/dev/null)
    if [ -n "$changes" ]; then
        echo -e "\n${BOLD}Sync Summary:${RESET}"
        echo -e "${changes}"
        echo -e "\nTotal: $(echo "$changes" | tail -n 1)"
    else
        echo -e "\n${BOLD}No changes were made during this sync.${RESET}"
    fi
}

# Check if a repository path is provided
if [ $# -eq 0 ]; then
    print_usage
    exit 1
fi

REPO_DIR="$1"
ORIGINAL_DIR="$(pwd)"

# Check if the provided path is a directory
if [ ! -d "$REPO_DIR" ]; then
    handle_error "The provided path is not a directory: $REPO_DIR"
fi

# Change to the repository directory
cd "$REPO_DIR" || handle_error "Failed to change directory to $REPO_DIR"

# Check if it's a git repository
if [ ! -d ".git" ]; then
    handle_error "The provided directory is not a git repository: $REPO_DIR"
fi

REMOTE="$(git remote)"
LOCAL="$(git branch --show-current)"

print_formatted "Syncing repository in ${BOLD}$REPO_DIR${RESET}"

# Fetch the latest changes without merging
run_command "git fetch $REMOTE $LOCAL" || handle_error "Failed to fetch latest changes"

# Check if there are any changes to pull
if git diff --quiet $LOCAL $REMOTE/$LOCAL; then
    echo "No changes to pull. Local repository is up to date."
else
    # Stash any local changes
    run_command "git stash" || handle_error "Failed to stash local changes"

    # Pull changes with rebase
    if ! run_command "git pull --rebase $REMOTE $LOCAL"; then
        handle_conflicts
    fi

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

print_glow "# Repository in **$REPO_DIR** has been successfully synced."

# Display sync summary
display_summary

cd "$ORIGINAL_DIR" || handle_error "Failed to return to original directory"
