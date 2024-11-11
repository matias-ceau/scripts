# Sync Repo Script

---

**sync-repo.py**: Automates syncing of a git repository and handles conflicts

---

### Dependencies

- `python` with the `argparse` module: Utilized for parsing command-line arguments.
- `rich`: A Python library for beautiful and flexible terminal output.
- `git`: Essential for the repository synchronization operations.

### Description

This Python script, `sync-repo.py`, is designed to automate the synchronization of a git repository. It handles various complexities such as fetching updates, stashing, merging, resolving conflicts, committing, and pushing changes. The script utilizes the `rich` library to provide an enhanced terminal output with progress bars, panels, and syntax highlighting, helping users understand the operations taking place under the hood.

The script begins by parsing a single argument that specifies the directory of the git repository to be maintained. It then checks the validity of this directory and various prerequisites (such as git being initialized). The script employs subprocess calls to execute git commands and seamlessly manages merge conflicts and stash conflicts by prompting the user to make choices regarding file resolutions. Furthermore, if any changes are detected, the script constructs a commit message, adds all changes, and commits them. 

### Usage

This script should be executed from the terminal. Here’s how you can run it:

```bash
python sync-repo.py /path/to/your/repository
```

**Example Usage:**

```bash
python sync-repo.py /home/matias/projects/my_project
```

The script can be integrated into a daily or regular synchronization process or assigned to a keybinding in your window manager (such as QTile for Arch Linux) for quick access.

---

> [!TIP] While the script handles merge conflicts and stash conflicts efficiently, consider adding more structured error handling for network-related issues (e.g., connection failures) during git fetch, pull, and push operations. Additionally, the script could improve user interaction by allowing all prompts to include a timeout fallback to a default action, useful for automated environments.