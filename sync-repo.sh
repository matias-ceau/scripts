#!/usr/bin/bash

#INFO:#@UTILS@=2024-10= "improved sync git repository"

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
    cmd_name="$(basename "$0")"
    echo -e "\n${YELLOW}USAGE:${RESET}"
    echo -e "    ${RED}./$cmd_name${RESET}  ${BOLD}<repository_path>${RESET} [--dry-run]\n"
    echo -e "${YELLOW}EXAMPLES:${RESET}"
    echo -e "    ${RED}$cmd_name${RESET}  ~/.scripts"
    echo -e "    ${RED}$cmd_name${RESET}  ${GREEN}\$SCRIPTS${RESET}    ---  (if var is set)"
    echo -e "    ${BLUE}git_sync      ${GREEN}\$SCRIPTS${RESET}    ---  (if alias is set)"
    echo -e "    ${RED}$cmd_name${RESET}  ${GREEN}\$SCRIPTS${RESET} --dry-run    ---  (perform a dry run)"
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
    echo -e "${YELLOW}Conflicts detected during merge. Here are your options:${RESET}
    [e] - Open your default editor to resolve conflicts manually
    (a) - Abort the merge and return to the previous state
    (s) - Skip this commit and continue with the next one"
    read -r choice
    case $choice in
        a)
            git merge --abort
            echo "Merge aborted. Repository is back to its previous state."
            ;;
        s)
            git reset --hard
            echo "Skipped conflicting commit. Continuing sync..."
            ;;
        *)
            git status
            echo "Opening editor to resolve conflicts..."
            ${EDITOR:-vim} $(git diff --name-only --diff-filter=U)
            git add .
            git commit
            ;;
    esac
}

# Function to display sync summary
display_summary() {
    print_glow '# Git log'
    local changes=$(git diff --stat @{1} 2>/dev/null)
    if [ -n "$changes" ]; then
        echo "                $(date +"%Y-%m-%d %H:%M:%S %z")"
        echo "Current commit: $(git show -s --format=%ci HEAD)"
        echo "  Previous one: $(git show -s --format=%ci HEAD^)"
        echo "Last changes"
        git diff --stat HEAD^
    else
        echo -e "\n${BOLD}No changes were made during this sync.${RESET}"
    fi
}

# Parse command line arguments
DRY_RUN=false
REPO_DIR=""

while [[ $# -gt 0 ]]; do
    case $1 in
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        *)
            if [ -z "$REPO_DIR" ]; then
                REPO_DIR="$(realpath "$1")"
            else
                print_usage
                exit 1
            fi
            shift
            ;;
    esac
done

# Check if a repository path is provided
if [ -z "$REPO_DIR" ]; then
    print_usage
    exit 1
fi

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
REPO_NAME="$(git remote -v | grep fetch | awk '{print $2}' | sed 's/.*\/\(.*\)\.git/\1/')"

print_formatted "Syncing repository in ${BOLD}$REPO_NAME${RESET}"

if $DRY_RUN; then
    echo -e "${YELLOW}Performing dry run. No changes will be made.${RESET}"
fi

# Fetch the latest changes from all remotes and prune obsolete references
if ! $DRY_RUN; then
    run_command "git fetch --all --prune" || handle_error "Failed to fetch latest changes"
else
    print_command "git fetch --all --prune"
fi

# Check if there are any changes to pull
if git diff --quiet "$LOCAL" "@{u}"; then
    echo "No changes to pull. Local branch is up to date."
else
    # Check for local changes
    if ! git diff-index --quiet HEAD --; then
        if ! $DRY_RUN; then
            run_command "git stash" || handle_error "Failed to stash local changes"
        else
            print_command "git stash"
        fi
    fi

    # Try to fast-forward
    if ! $DRY_RUN; then
        if ! run_command "git merge --ff-only @{u}"; then
            echo "Cannot fast-forward. Attempting to rebase..."
            if ! run_command "git pull --rebase $REMOTE $LOCAL"; then
                handle_conflicts
            fi
        fi
    else
        print_command "git merge --ff-only @{u}"
        print_command "git pull --rebase $REMOTE $LOCAL"
    fi

    # Apply stashed changes if any
    if ! $DRY_RUN && [[ $(git stash list) ]]; then
        run_command "git stash pop" || handle_error "Failed to apply stashed changes"
    fi
fi

run_command "git status -s"

# Only proceed with commit and push if there are changes
if [[ -n $(git status -s) ]]; then
    if ! $DRY_RUN; then
        run_command "git add -A"

        NB="$(git status -s | wc -l)"
        MESSAGE="$NB change(s) from $USER@$HOSTNAME"
        run_command "git commit -m \"$MESSAGE\""

        if ! run_command "git push $REMOTE $LOCAL"; then
            echo -e "${YELLOW}Push failed. Pulling latest changes and trying again...${RESET}"
            run_command "git pull --ff-only $REMOTE $LOCAL" || handle_error "Failed to pull latest changes"
            run_command "git push $REMOTE $LOCAL" || handle_error "Failed to push changes"
        fi
    else
        print_command "git add -A"
        print_command "git commit -m \"...changes from $USER@$HOSTNAME\""
        print_command "git push $REMOTE $LOCAL"
    fi
else
    echo "No local changes to commit and push."
fi

if ! $DRY_RUN; then
    run_command "git maintenance run"
else
    print_command "git maintenance run"
fi

print_glow "# Repository in **$REPO_DIR** has been successfully synced."

# Display sync summary
if ! $DRY_RUN; then
    display_summary
fi

cd "$ORIGINAL_DIR" || handle_error "Failed to return to original directory"
