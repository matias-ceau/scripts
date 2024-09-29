# Git Clone by Author Repo

---

**git_clone_by_author-repo.sh**: A script to clone git repositories by specifying the developer/package format.

---

### Dependencies

- `git`: This script requires Git to be installed on your system for cloning repositories.

### Description

The `git_clone_by_author-repo.sh` script is designed to simplify the process of cloning Git repositories from GitHub based on a specified developer/package format (e.g., `username/repository`). It provides options to clone using SSH or from a local path, making it flexible for various workflows.

The script starts by defining a `usage` function that displays how to use the script if the provided arguments are incorrect or insufficient. 

It handles command-line arguments to determine the preferred method of cloning:
- `-s` or `--ssh`: Use SSH for cloning (requires SSH setup with GitHub).
- `-l` or `--local`: Indicates that a local repository will be cloned from a specified path.

The script processes the incoming arguments, ensuring that only one cloning method (SSH or local) can be used at a time. It constructs the target directory for the cloned repository under the defined environment variable `GIT_REPOS`, defaulting to `$HOME/git` if not set. The script then carries out the cloning operation based on user input, handling errors and usage notifications appropriately.

### Usage

To use this script, run it from the terminal with the required arguments. Here are some examples:

```bash
# Clone a repository using HTTPS (default method)
./git_clone_by_author-repo.sh username/repository

# Clone a repository using SSH
./git_clone_by_author-repo.sh -s username/repository

# Clone a local repository
./git_clone_by_author-repo.sh -l /path/to/local/repo username/repository
```

Note that the script requires you to provide either the SSH or local option but not both. If neither option is specified, it defaults to cloning via HTTPS.

---

> [!TIP]
> This script could benefit from additional error handling, especially for cases where the clone operation fails (e.g., due to network issues or incorrect paths). Additionally, consider adding functionality for more user feedback during the cloning process, such as progress indicators. It might also be useful to provide an option to specify a custom directory for the `GIT_REPOS` variable through command-line arguments.