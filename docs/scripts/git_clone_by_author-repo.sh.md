# Git Repository Cloner by Author/Repo

---

**git_clone_by_author-repo.sh**: Clone a Git repository by specifying the developer/package format.

---

### Dependencies

- `git`: Required to clone repositories.
- A directory path defined in `$GIT_REPOS` environment variable, defaulting to `$HOME/git`.

### Description

The script **git_clone_by_author-repo.sh** facilitates cloning of Git repositories by allowing you to specify them in the format `developer/package`. It provides options for cloning via SSH or from a local path. By default, it clones repositories using HTTPS.

- **Modes of Operation:**
  - **SSH Mode**: Clone using the SSH protocol (`git@github.com:developer/package.git`).
  - **Local Mode**: Clone from a specified local repository path.
  - **HTTPS Mode**: Clone using HTTPS (`https://github.com/developer/package.git`).

- **Behavior:**
  - The script checks for valid input and ensures the correct combination of options is used.
  - Target directories are automatically created under the path defined by the `$GIT_REPOS` environment variable.

### Usage

Run the script from a terminal with appropriate options:

```bash
# Default usage with HTTPS
./git_clone_by_author-repo.sh developer/package

# Clone using SSH
./git_clone_by_author-repo.sh -s developer/package

# Clone from a local repository path
./git_clone_by_author-repo.sh -l /path/to/local/repo developer/package
```

- **Options:**
  - `-s, --ssh`: Use SSH for cloning.
  - `-l <path>, --local <path>`: Use a local repository for cloning, followed by the local path.

Make sure `$GIT_REPOS` is set or default to `$HOME/git`.

---

> [!NOTE]
> This script could be improved by adding more robust error handling, such as checking for the presence of the `git` command or verifying network connectivity before attempting to clone. Currently, the script assumes all dependencies are correctly set without validation.