#!/bin/bash

# Ensure the required environment variables are set
if [ -z "$GIT_REPOS" ] || [ -z "$LOCALDATA" ]; then
    echo "GIT_REPOS and LOCALDATA environment variables must be set."
    exit 1
fi

# Get the hostname
HOSTNAME=$(hostnamectl hostname)

# Define the output file paths
OUTPUT_FILE="$LOCALDATA/docs/git_repos/${HOSTNAME}-repos.txt"
ALL_REPOS_FILE="$LOCALDATA/docs/git_repos/all-repos.txt"

# Create the output directory if it doesn't exist
mkdir -p "$(dirname "$OUTPUT_FILE")"

# Find all git repositories and format the output
find "$GIT_REPOS" -type d -name ".git" | sed "s|$GIT_REPOS/||;s|/.git||" | awk -F/ 'NF==2' >"$OUTPUT_FILE"

# Sort and remove duplicates
sort -u -o "$OUTPUT_FILE" "$OUTPUT_FILE"

# Append to the all-repos file
cat "$OUTPUT_FILE" >>"$ALL_REPOS_FILE"

# Sort and remove duplicates in the all-repos file
sort -u -o "$ALL_REPOS_FILE" "$ALL_REPOS_FILE"

echo "Repository list updated successfully."
