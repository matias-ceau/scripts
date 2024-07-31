#!/bin/bash

usage() {
    echo "Usage: $0 <base_dir> <file or directory>"
    echo "Arguments:"
    echo "  <base_dir>              Base directory to make links relative to (with leading slash)"
    echo "  <file or directory>     Markdown file or directory containing markdown files to process"
}

process_file() {
    local file="$1"
    local base_dir="$2"

    # Add leading slash to links that don't already have one
    sed -i -E 's/\[(.*?)\]\(([^/].*?)\)/[\1](\/\2)/g' "$file"
    echo "Processed $file"
}

if [[ $# -ne 2 ]]; then
    echo "Error: Incorrect number of arguments"
    usage
    exit 1
fi

base_dir="$1"
target="$2"

if [[ -z "$base_dir" ]]; then
    echo "Error: Base directory not provided"
    usage
    exit 1
fi

if [[ -z "$target" ]]; then
    echo "Error: Target file or directory not specified"
    usage
    exit 1
fi

if [[ -d "$target" ]]; then
    find "$target" -type f -name "*.md" | while read -r file; do
        process_file "$file" "$base_dir"
    done
elif [[ -f "$target" ]]; then
    process_file "$target" "$base_dir"
else
    echo "Error: Invalid target. Must be a file or directory."
    usage
    exit 1
fi

echo "Link fixing completed."