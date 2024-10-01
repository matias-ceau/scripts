#!/usr/bin/bash

#INFO:#@UTILS@=2024-10= "improved sync git repository"

################ DEFINITIONS ####################################################
# Color definitions
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[36m"
CYAN="\e[36m"
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

################ FUNCTIONS  ####################################################
# Function to strip ANSI escape sequences
strip_ansi() {
    echo "$1" | sed 's/\x1b\[[0-9;]*m//g'
}

# Function to print commands
print_command() {
    if $USE_BAT; then
        echo -e "${GREEN}$ ${BLUE}$1${RESET}" | bat -lzsh --style='rule' --highlight-line 1 --theme="gruvbox-dark"
    else
        echo -e "${GREEN}\$ ${BLUE}$1${RESET}"
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
    echo -e "    ${RED}./$cmd_name${RESET}  ${BOLD}<repository_path>${RESET} [--dry-run] [--help]\n"
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

# Function to generate a commit message (using an llm and another script)
generate_commit_message() {
    local message
    which generate_commit_message.sh > /dev/null 2>&1 \
        && message="$(generate_commit_message.sh "$1")"
    if [ -z "$message" ]; then
        NB="$(git status -s | wc -l)"
        message="$NB change(s) from $USER@$HOSTNAME"
    fi
    echo -e "$message"
}

# Function to handle conflicts
handle_merge_pull_conflicts() {
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

handle_stash_conflict() {
    local file="$1"
    echo -e "${YELLOW}Conflict detected when applying stashed changes in file: $file${RESET}"
    echo -e "Options:"
    echo -e "  [r] - Use remote version (discard local changes)"
    echo -e "  [l] - Keep local version"
    echo -e "  [m] - Manually resolve conflict"
    read -p "Choose an option [r/l/m]: " choice

    case "$choice" in
        r|R)
            run_command "git checkout --theirs -- \"$file\""
            run_command "git add \"$file\""
            echo -e "${GREEN}Remote version of $file has been applied.${RESET}"
            ;;
        l|L)
            run_command "git checkout --ours -- \"$file\""
            run_command "git add \"$file\""
            echo -e "${GREEN}Local version of $file has been kept.${RESET}"
            ;;
        m|M)
            ${EDITOR:-nvim} "$file"
            run_command "git add \"$file\""
            echo -e "${GREEN}Manual edits for $file have been staged.${RESET}"
            ;;
        *)
            echo -e "${RED}Invalid option. Keeping conflict markers for manual resolution later.${RESET}"
            ;;
    esac
}
# Function to display sync summary
display_summary() {
    print_glow '# Git log'
    local changes
    changes=$(git diff --stat '@{1}' 2>/dev/null)
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

################ START ####################################################

# Parse command line arguments
DRY_RUN=false
REPO_DIR=""

while [[ $# -gt 0 ]]; do
    case $1 in
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        --help|-h)
            print_usage
            exit 0
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
if [ -z "${REPO_DIR}" ]; then
    print_usage
    handle_error "No path provided"
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

# Display repo name and involved branches
REMOTE="$(git remote)"
LOCAL="$(git branch --show-current)"
REPO_NAME="$(git remote -v | grep fetch | awk '{print $2}' | sed 's/.*\/\(.*\)\.git/\1/')"

print_formatted "Syncing ${BOLD}$REPO_NAME${RESET}"
print_formatted "   ${CYAN}${LOCAL}${RESET} -> ${MAGENTA}${REMOTE}${RESET}"

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
if git diff --quiet "$LOCAL" '@{u}'; then
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
    ##

    # Try to fast-forward
    if ! $DRY_RUN; then
        if ! run_command "git merge --ff-only @{u}"; then
            echo "Cannot fast-forward. Attempting to rebase..."
            if ! run_command "git pull --rebase $REMOTE $LOCAL"; then
                handle_merge_pull_conflicts
            fi
        fi
    else
        print_command "git merge --ff-only @{u}"
        print_command "git pull --rebase $REMOTE $LOCAL"
    fi

    # Apply stashed changes if any
    if ! $DRY_RUN && [[ $(git stash list) ]]; then
        if ! run_command "git stash pop"; then
            echo -e "${YELLOW}Conflicts detected when applying stashed changes.${RESET}"
            conflicted_files=$(git diff --name-only --diff-filter=U)
            for file in $conflicted_files; do
                handle_stash_conflict "$file"
            done
            # After resolving conflicts, finalize the stash application
            run_command "git stash drop"
        fi
    fi
fi

run_command "git status -s"

# Only proceed with commit and push if there are changes
if [[ -n $(git status -s) ]]; then
    if ! $DRY_RUN; then
        run_command "git add -A"
        MESSAGE="$(generate_commit_message "$REPO_DIR")"
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
