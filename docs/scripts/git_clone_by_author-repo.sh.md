# Git Clone by Author-Repo

---

**git_clone_by_author-repo.sh**: Clone a GitHub repository by specifying the developer and package name with an option for SSH or a local path.

---

### Dependencies

- `git`: The core tool required for cloning repositories.

### Description

This script facilitates cloning GitHub repositories directly under a specified directory structure, organizing them by developer. By default, it clones repositories into a directory specified by the `GIT_REPOS` environment variable, defaulting to `"$HOME/git"` if not set. You have the option to use HTTPS, SSH, or a local path for cloning:

- **HTTPS**: Default method for cloning via URL.
- **SSH**: Enables cloning with SSH when `-s` or `--ssh` is specified (e.g., `git@github.com:developer/package.git`).
- **Local Path**: Use a specified local directory as the source when `-l` or `--local <path>` is provided.

### Usage

Ensure the `git` tool is installed on your Arch Linux system. You can execute the script directly in a terminal. Below is a practical guide on how to utilize the script:

```bash
# Clone using HTTPS by default
./git_clone_by_author-repo.sh developer/package

# Clone using SSH
./git_clone_by_author-repo.sh -s developer/package

# Clone using a specified local directory
./git_clone_by_author-repo.sh -l /path/to/local/repo developer/package
```

- Adjust `$GIT_REPOS` environment variable if different directory structures are desired.
- Ensure you have correctly set up your SSH keys if opting for SSH cloning.

---

> [!TIP]
> - **Error Handling**: The script currently exits on any argument parsing issues. Implement enhanced error messages or logging for better debugging, especially if invalid paths are given or network errors occur during cloning.
> 
> - **Flexibility**: Consider allowing additional options like shallow cloning (`--depth 1`) for faster clones when the full history isn't needed.
> 
> - **Code Duplicity**: The while loop could be optimized by refactoring repeated code lines or using arrays for option arguments.