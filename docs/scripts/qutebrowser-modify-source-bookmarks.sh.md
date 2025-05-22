# qutebrowser Bookmark & Session Sync Script

---

**qutebrowser-modify-source-bookmarks.sh**: Synchronizes qutebrowser bookmarks, quickmarks, and sessions with chezmoi dotfiles.

---

### Dependencies

- `qutebrowser`  
  *Web browser—must have bookmarks and quickmarks functionality enabled.*

- `chezmoi`  
  *A dotfiles manager, used here to track changes and source control your config files.*

- `fd`  
  *Simple, fast file search utility used for finding `.yml` session files.*

- `git` (commented out in script)  
  *For version control of synced files within chezmoi repository.*

- **Environment variables required:**  
  - `$XDG_CONFIG_HOME`
  - `$XDG_DATA_HOME`
  - `$CHEZMOI`
  - `$LOCALDATA`

---

### Description

This script is intended to be used on an Arch Linux system, specifically by users managing `qutebrowser` bookmarks, quickmarks, and session files with `chezmoi`. It synchronizes your current browser data (from local qutebrowser config locations) to your chezmoi-managed dotfiles directory. 

Key actions:

- Waits 20 seconds to ensure new quickmarks are written (e.g., after adding via qutebrowser).
- Copies local bookmarks and quickmarks files to your chezmoi repository.
- Finds all `.yml` session files and ensures they're tracked in chezmoi. If not already under chezmoi control, adds them with `chezmoi add`.
- Copies updated session files to a parallel session storage directory (`$LOCALDATA/qutebrowser/sessions`).
- Contains optional (commented out) steps for automatically committing and pushing changes to a git repository within the chezmoi directory.

---

### Usage

**Basic usage:**

```bash
~/.scripts/bin/qutebrowser-modify-source-bookmarks.sh
```

**Practical integration:**

- Run this script after making changes to your bookmarks or quickmarks in qutebrowser.
- For smoother workflow, consider binding it to a qtile key or running it via a custom menu, e.g.:
  ```python
  # in your qtile config
  Key([mod], "F8", lazy.spawn("~/.scripts/bin/qutebrowser-modify-source-bookmarks.sh"))
  ```

**Example cronjob (if you want periodic syncs):**
```
*/30 * * * * /home/matias/.scripts/bin/qutebrowser-modify-source-bookmarks.sh
```

---

> [!TIP]
> - The script assumes all relevant environment variables are set and directories exist. If not, it will fail silently or produce confusing errors.
> - The 20 second sleep before copying quickmarks could be optimized (e.g., watching file change instead of a fixed sleep).
> - Consider uncommenting and robustifying the git commit/push section for automatic version control.
> - You might want to add error handling for missing files or unset variables for robustness.
> - For performance, using `rsync` instead of `cat`/file copying could be considered, especially when large session files are involved.
