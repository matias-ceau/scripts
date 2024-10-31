#!/bin/bash

REPO_DIR="$1"
cd "$REPO_DIR" || exit 1

# Check if OPENAI_API_KEY is set
if [ -z "$OPENAI_API_KEY" ]; then
    echo "Error: OPENAI_API_KEY is not set. Please set it in your environment."
    exit 1
fi

# Get the list of modified files
modified_files=$(git diff --name-only)

# Prepare the file information for the API call
file_info=""
for file in $modified_files; do
    if [[ "$file" == *.md ]]; then
        file_info+="$file (documentation change)\n"
    else
        changes=$(git diff --unified=0 "$file" | tail -n +5)
        file_info+="$file:\n$changes\n\n"
    fi
done

# Make the API call

curl "https://api.openai.com/v1/chat/completions" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $OPENAI_API_KEY" \
    --json '{ "model": "gpt-4o-mini", "messages": [ { "role": "system", "content": "You are an AI assistant that generates git commit messages. Follow the git commit convention: a one-line summary (50 chars or less) followed by a blank line and then a more detailed description. Focus on the WHAT and WHY of the changes, not the HOW." }, { "role": "user", "content": "Generate a commit message for the following changes:' \
    --json "$file_info." \
    --json '    } ] }'

# echo "$response" | jq
#
# # Extract the commit message from the response
# commit_message=$(echo "$response" | jq -r '.choices[0].message.content')
#
# # Output the commit message
# echo "$commit_message"
