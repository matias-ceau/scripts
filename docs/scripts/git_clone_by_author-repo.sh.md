# GitHub Clone by `author/repo` Script

---

**git_clone_by_author-repo.sh**: Clone a GitHub repository via SSH, HTTPS, or from a local path with developer-oriented subfolder convention.

---

### Dependencies

- `git` — Required for cloning repositories.
- Bash (standard on Arch Linux)
- [Environment variable] `GIT_REPOS` — (Optional) To set the base directory for cloned repositories. Defaults to `$HOME/git`.

---

### Description

This script simplifies cloning GitHub repositories based on the familiar `developer/package` notation, with support for:

- **Cloning via HTTPS (default):** Standard GitHub HTTPS URL.
- **Cloning via SSH:** If you pass `-s` or `--ssh`, it uses the SSH protocol (e.g., `git@github.com:author/package.git`).
- **Cloning from a local repository:** With `-l <path>`, it clones from a provided local path.

**Features:**
- All repos are placed in the target dir `$GIT_REPOS/author/package`.
- Automatically creates the developer (`author`) directory if it doesn't exist.
- Defensive argument parsing: mutually exclusive options for SSH/local, validation of required arguments.
- Designed for interactive CLI use, but easily mapped to a keybinding or qtile command.

---

### Usage

**Clone a repo from GitHub via HTTPS (default):**
```
$ ~/git_clone_by_author-repo.sh matias/myproject
```
Clones into: `$GIT_REPOS/matias/myproject`

**Clone using SSH:**
```
$ ~/git_clone_by_author-repo.sh -s matias/myproject
```
or
```
$ ~/git_clone_by_author-repo.sh --ssh matias/myproject
```
Clones from `git@github.com:matias/myproject.git`.

**Clone from a local repo:**
```
$ ~/git_clone_by_author-repo.sh -l /some/path/to/repo matias/myproject
```
or
```
$ ~/git_clone_by_author-repo.sh --local /some/path/to/repo matias/myproject
```
Clones from `/some/path/to/repo` into the appropriately named folder.

**Set custom base directory (optional):**
```
$ export GIT_REPOS=~/Projects
$ ~/git_clone_by_author-repo.sh matias/myproject
```

---

> [!TIP]
> - The script is robust and well-organized for its purpose, but a few usability improvements are possible:
>   - Currently, the script doesn’t validate if the input is correctly in the `author/repo` format (no error if e.g. only one element is given).
>   - Error handling in case the `git clone` command fails is absent; consider checking the exit code for a better user experience.
>   - Consider supporting custom hosting (e.g., GitLab) via additional flags or config in the future.
>   - The usage message could be a bit clearer about argument requirements for `-l`. 
>   - Flag handling would benefit from using standard tools such as `getopts` for more scalable option parsing.
