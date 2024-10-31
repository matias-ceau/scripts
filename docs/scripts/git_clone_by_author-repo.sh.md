# Git Clone by Author/Repo

---

**git_clone_by_author-repo.sh**: Clone Git repositories by specifying developer and package.

---

### Dependencies

- `git`: The script requires `git` to clone repositories from GitHub. Make sure it is installed on your Arch Linux system.

### Description

This script provides a convenient way to clone Git repositories from GitHub using either SSH, HTTPS, or a local repository. The user can specify the desired method of cloning through command-line arguments, making it flexible for different workflows.

The script begins by setting a default directory for storing Git repositories, which can be overridden by changing the `GIT_REPOS` environment variable. It then parses the command-line arguments to determine which method to use for cloning the repository.

- **Arguments**:
  - `-s`, `--ssh`: Clones the repository using the SSH URL format.
  - `-l`, `--local <path>`: Clones a repository from a local path specified by the user.

Conditional checks ensure that both SSH and local options cannot be used simultaneously. If the provided arguments do not meet the requirements, the script displays a usage message and exits gracefully.

### Usage

To use the script, run it from the terminal with the appropriate arguments. Here are some examples:

1. **Clone using HTTPS** (default behavior):
   ```bash
   ./git_clone_by_author-repo.sh developer/package
   ```

2. **Clone using SSH**:
   ```bash
   ./git_clone_by_author-repo.sh -s developer/package
   ```

3. **Clone from a local path**:
   ```bash
   ./git_clone_by_author-repo.sh -l /path/to/local/repo developer/package
   ```

Make sure to replace `developer/package` with the appropriate values for the GitHub repository you want to clone.

---

> [!TIP]  
> Consider implementing error handling for the `git clone` command to manage issues like network errors, permissions problems, or a non-existent repository. This upgrade can make your script more robust and user-friendly.