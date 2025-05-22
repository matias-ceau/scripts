# Update File Birthdays Utility

---

**update_birthdays.sh**: Extracts and records the creation date ("birthday") of all files in your scripts directory using git history.

---

### Dependencies

- `fd`: A simple, fast and user-friendly alternative to `find`. Required for efficient file discovery.
- `git`: Used to determine the historical creation date of files.
- `sed`: For line manipulation and text substitution.
- `basename`: Extracts the filename from a path.
- `sort`, `cut`, `tail`, `cat`, `rm`: Standard UNIX utilities.
- Assumes `$SCRIPTS` environment variable is set, pointing to your scripts directory.
- Files must be tracked by `git` for the birthdays to be accurate.

### Description

This script populates a CSV file (`bdays.csv` in your `$SCRIPTS` directory) with the creation ("birthday") dates for every tracked file under `$SCRIPTS`. For each file found, it analyzes its git log using:

```
git log --follow --format=%ai <file> | tail -n 1
```

This pipeline ensures the script finds the earliest commit date associated with each file (including across renames). The output lines contain `YYYY-MM-DD, filename`.

After constructing an intermediate `.temp` file, the script substitutes any empty date fields (which could occur if a file is untracked by git) with today's date. It then sorts the CSV for better readability and reference.

This is especially useful for tracking when scripts were first committed in a long-running dotfiles or scripts repository.

### Usage

You can run this script at any time to update your birthday records:

```
bash ~/.scripts/meta/update_birthdays.sh
```

If you often edit or add new scripts, consider binding this script to a key sequence in your `qtile` config or having a cron or systemd timer trigger it periodically.

**Sample `$bdays.csv` output:**

```
2022-03-01, launch_steam.sh
2023-02-16, get_wifi_info.sh
2024-05-02, update_birthdays.sh
```

Just ensure that `$SCRIPTS` is set in your environment (e.g., in your `.bashrc`):

```
export SCRIPTS="$HOME/.scripts"
```

---

> [!TIP]
> - Files not tracked by git will have today's date as their "birthday", which may not reflect their true age.
> - All `basename` calls strip directory paths; if multiple files have identical names in different directories, you'll lose location context.
> - Using `echo > "$BDAYS.temp"` truncates the file but leaves an empty line at the top of the CSV. Consider using `: > "$BDAYS.temp"` and filtering out empty lines.
> - To improve efficiency, process substitution or parallelization might help with large numbers of files.
> - Consider adding error handling (e.g., if `$SCRIPTS` isn't set, or if `fd`/`git` aren't available).