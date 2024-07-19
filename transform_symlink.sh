#!/bin/bash

# Check if there is exactly one argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <symlink>"
    exit 1
fi

symlink=$1

# Check if the file is a symlink
if [ ! -L "$symlink" ]; then
    echo "$symlink is not a symbolic link."
    exit 1
fi

# Get the target of the symlink
target=$(readlink "$symlink")

# Copy the target file to a new file with the same name as the original symlink
cp "$target" "$symlink"

echo "Symlink $symlink has been replaced with the actual file $target."
