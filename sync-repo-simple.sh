#!/usr/bin/bash

# Function to run command and print its output in real-time
run_command() {
    echo "command: $1"
    eval "$1"
}

# Function to handle errors
handle_error() {
    echo -e "Error: $1" >&2
    exit 1
}

# Function to generate a commit message (using an llm and another script)
generate_commit_message() {
    echo "$(git status -s | wc -l) change(s) from $USER@$HOSTNAME"
}

# Function to handle conflicts
handle_merge_pull_conflicts() {
    echo -e "Conflicts detected during merge. Here are your options:
    [e] - Open your default editor to resolve conflicts manually
    (a) - Abort the merge and return to the previous state
    (s) - Skip this commit and continue with the next one"
    read -r choice
    case $choice in
        a)
            run_command "git merge --abort"
            echo "Merge aborted. Repository is back to its previous state."
            ;;
        s)
            run_command "git reset --hard"
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
    echo -e "Conflict detected when applying stashed changes in file: $file"
    echo -e "Options:"
    echo -e "  [r] - Use remote version (discard local changes)"
    echo -e "  [l] - Keep local version"
    echo -e "  [m] - Manually resolve conflict"
    read -pr "Choose an option [r/l/m]: " choice

    case "$choice" in
        r|R)
            run_command "git checkout --theirs -- \"$file\""
            run_command "git add \"$file\""
            echo -e "Remote version of $file has been applied."
            ;;
        l|L)
            run_command "git checkout --ours -- \"$file\""
            run_command "git add \"$file\""
            echo -e "Local version of $file has been kept."
            ;;
        m|M)
            ${EDITOR:-nvim} "$file"
            run_command "git add \"$file\""
            echo -e "Manual edits for $file have been staged."
            ;;
        *)
            echo -e "Invalid option. Keeping conflict markers for manual resolution later."
            ;;
    esac
}
# Function to display sync summary
display_summary() {
    echo "                $(date +"%Y-%m-%d %H:%M:%S %z")"
    echo "Current commit: $(git show -s --format=%ci HEAD)"
    echo "  Previous one: $(git show -s --format=%ci HEAD^)"
    echo "Last changes"
    git diff --stat HEAD^
}

####################################################################
echo
echo "        1. PARSING"
echo
####################################################################

# Parse command line arguments
REPO_DIR=""

while [[ $# -gt 0 ]]; do
    case $1 in
        --help|-h)
            echo "help"
            exit 0
            ;;
        *)
            if [ -z "$REPO_DIR" ]; then
                REPO_DIR="$(realpath "$1")"
            else
                echo "help"
                exit 1
            fi
            shift
            ;;
    esac
done

# Check if a repository path is provided
if [ -z "${REPO_DIR}" ]; then
    echo "help"
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

echo -e "Syncing $REPO_NAME: $LOCAL -> $REMOTE"


####################################################################
echo
echo "        2. FETCHING/PULLING"
echo
####################################################################

run_command "git fetch --all --prune" || handle_error "Failed to fetch latest changes"

# Check if there are any changes to pull
if git diff --quiet "$LOCAL" '@{u}'; then
    echo "No changes to pull. Local branch is up to date."
else
    # Check for local changes
    if ! git diff-index --quiet HEAD --; then
        run_command "git stash" || handle_error "Failed to stash local changes"
    fi

    # Try to fast-forward
    if ! run_command "git merge --ff-only @{u}"; then
        echo "Cannot fast-forward. Attempting to rebase..."
        if ! run_command "git pull --rebase $REMOTE $LOCAL"; then
            handle_merge_pull_conflicts
        fi
    fi

    # Apply stashed changes if any
    if ! [[ $(git stash list) ]]; then
        if ! run_command "git stash pop"; then
            echo -e "Conflicts detected when applying stashed changes"
            conflicted_files=$(git diff --name-only --diff-filter=U)
            for file in $conflicted_files; do
                handle_stash_conflict "$file"
            done
            run_command "git stash drop"
        fi
    fi
fi

####################################################################
echo
echo "        3. CHECKING STATUS - ADD AND COMMIT IF NEEDED"
echo
####################################################################

run_command "git status -s"

# Only proceed with commit and push if there are changes
if [[ -n $(git status -s) ]]; then
    run_command "git add -A"
    MESSAGE="$(generate_commit_message "$REPO_DIR")"
    run_command "git commit -m \"$MESSAGE\""

    if ! run_command "git push $REMOTE $LOCAL"; then
        echo -e "Push failed. Pulling latest changes and trying again..."
        run_command "git pull --ff-only $REMOTE $LOCAL" || handle_error "Failed to pull latest changes"
        run_command "git push $REMOTE $LOCAL" || handle_error "Failed to push changes"
    fi
else
    echo "No local changes to commit and push."
fi

####################################################################
echo
echo "        4. MAINTENANCE"
echo
####################################################################

run_command "git maintenance run"

####################################################################
echo
echo "        5. QUICK SUMMARY"
echo
####################################################################
echo "Repository in $REPO_DIR has been successfully synced."
# Display sync summary
display_summary

cd "$ORIGINAL_DIR" || handle_error "Failed to return to original directory"
