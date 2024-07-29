# get_repos_present_on_host.sh

# Git Repository Collector Script Documentation

This script is designed to collect a list of Git repositories within a specified directory and save the results into text files. The script ensures that the necessary environment variables are set, formats the output to include only the desired repositories, and maintains an aggregated list of all found repositories.

## Prerequisites

Before running the script, ensure that the following environment variables are defined:

- `GIT_REPOS`: The root directory where your Git repositories are located.
- `LOCALDATA`: The base directory where the output data will be stored.

## Script Overview

```bash
#!/bin/bash

# Ensure the required environment variables are set
if [ -z "$GIT_REPOS" ] || [ -z "$LOCALDATA" ]; then
  echo "GIT_REPOS and LOCALDATA environment variables must be set."
  exit 1
fi

# Get the hostname
HOSTNAME=$(hostname)

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
```

## Functionalities

1. **Environment Variable Check**: The script begins by verifying that the `GIT_REPOS` and `LOCALDATA` environment variables are set. This is crucial for the script to know where to look for Git repositories and where to store the output.

2. **Hostname Retrieval**: It retrieves the hostname of the machine and assigns it to a variable, which is used for naming the output files.

3. **Define Output Paths**: The script defines paths for two output files:
   - `OUTPUT_FILE`: Stores the list of repositories found in the current execution, named with the hostname.
   - `ALL_REPOS_FILE`: Aggregates lists from all executions.

4. **Directory Creation**: If the target output directory does not exist, it is created.

5. **Repository Finding and Formatting**: The script searches for directories named `.git` within the specified `GIT_REPOS` directory. It formats the results to include only the sub-path (i.e., it removes the base path and `.git` suffix).

6. **Sorting and Deduplication**:
   - The list is sorted, and duplicates are removed in the output file for the current execution.
   - The current list is appended to the aggregate `ALL_REPOS_FILE`, which is then also sorted and deduplicated.

7. **Completion Message**: A message is printed to indicate that the repository list has been successfully updated.

## Usage

1. Ensure the required environment variables are set:
    ```bash
    export GIT_REPOS="/path/to/git/repos"
    export LOCALDATA="/path/to/local/data"
    ```

2. Run the script:
    ```bash
    ./script.sh
    ```

## Notes

- Ensure that you have appropriate permissions to read the Git repositories and write to the output directories.
- The script processes repositories that are exactly two levels deep.

## Example

Assuming the environment variables are set as follows:
```bash
export GIT_REPOS="/home/user/projects"
export LOCALDATA="/home/user/data"
```

Running the script on a machine with hostname `machine123` will:
- Search for repositories within `/home/user/projects`.
- Output the list to `/home/user/data/docs/git_repos/machine123-repos.txt`.
- Append and maintain a deduplicated list of all repositories in `/home/user/data/docs/git_repos/all-repos.txt`. 

## Output Structure

```
/home/user/data/
└── docs/
    └── git_repos/
        ├── all-repos.txt
        └── machine123-repos.txt
```

Each file will contain a sorted list of repository paths relative to the `GIT_REPOS` directory, without duplicates.
