#!/usr/bin/bash

#DOC#@UTILS@=2024-07= "sync scripts repository"

# Check if glow is installed
if ! command -v glow &> /dev/null; then
    echo "glow is not installed. Please install it using: sudo pacman -S glow"
    exit 1
fi

# Function to render markdown
render_markdown() {
    echo "$1" | glow -
}

# Initialize markdown content
markdown_content="# SYNC SCRIPTS REPOSITORY\n\n---\n"

ORIGINAL_DIR=$(pwd)
SCRIPT_DIR="$HOME/.scripts"

markdown_content+="## SETUP\n\nMoving to \`$SCRIPT_DIR\`\n"
cd $SCRIPT_DIR

REMOTE="$(git remote)"
LOCAL="$(git branch --show-current)"
markdown_content+="Remote: \`$(git remote -v | sed -n '1p')\`\n"
markdown_content+="Local branch: \`$LOCAL\`\n\n---\n"

markdown_content+="## PULL\n\n\`\`\`\ngit pull $REMOTE $LOCAL\n\`\`\`\n"
pull_output=$(git pull "$REMOTE" "$LOCAL" 2>&1)
markdown_content+="$pull_output\n\n---\n"

markdown_content+="## PUSH\n\n### Current Status\n\n\`\`\`\n$(git status)\n\`\`\`\n"

markdown_content+="### ADD\n\n\`\`\`\ngit add -A\n\`\`\`\n"
git add -A

markdown_content+="### COMMIT\n\n"
if [ -z "$1" ]; then
    markdown_content+="No commit message provided. Choose:\n- [D]efault\n- [i]nteractive\n"
    read -r user_input
    user_input=${user_input:-d}
    if [ "$user_input" == "i" ]; then
        markdown_content+="\`\`\`\ngit commit --interactive\n\`\`\`\n"
        git commit --interactive
    else
        MESSAGE="$(git status -s | wc -l) changes from $USER@$HOSTNAME"
        markdown_content+="\`\`\`\ngit commit -m \"$MESSAGE\"\n\`\`\`\n"
        git commit -m "$MESSAGE"
    fi
else
    markdown_content+="\`\`\`\ngit commit -m \"$1\"\n\`\`\`\n"
    git commit -m "$1"
fi

markdown_content+="Changes committed:\n\n\`\`\`\n$(git status -s)\n\`\`\`\n"

markdown_content+="### PUSH\n\n\`\`\`\ngit push $REMOTE $LOCAL\n\`\`\`\n"
push_output=$(git push "$REMOTE" "$LOCAL" 2>&1)
markdown_content+="$push_output\n\n---\n"

markdown_content+="Scripts repository has been successfully synced.\n"

cd "$ORIGINAL_DIR"

# Render the markdown content
render_markdown "$markdown_content"
