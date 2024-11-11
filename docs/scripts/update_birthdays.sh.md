# Update Birthdays Script

---

**update_birthdays.sh**: Updates a CSV file with the creation dates of files in a directory.

---

### Dependencies

- `bash`: The script is written for the Bash shell.
- `fd`: A simple and fast general-purpose file search tool.
- `git`: Used to retrieve the history of file modifications.
- `sed`: A stream editor for filtering and transforming text.
- `cut`: Utility to extract sections from lines of files.
- `sort`: Used to sort lines of text files.

### Description

The script `update_birthdays.sh` is designed to track the "birthdates" of files. These "birthdates" are retrieved as the first commit dates in a git repository for each file in the specified directory (`$SCRIPTS`).

Here's how it works: 
1. It initializes an empty temporary file (`bdays.csv.temp`).
2. It uses `fd` to find files in the `$SCRIPTS` directory and processes each file to determine the date of the initial git commit.
3. This date along with the filename is written to the temporary file.
4. After processing all files, it replaces any empty "birthdate" entry with the current date and sorts the file.
5. The sorted results are saved to `bdays.csv`, and the temporary file is deleted.

### Usage

To use this script, ensure you have the required dependencies installed and the correct environment variables set. The script reads files from the `$SCRIPTS` directory:

```bash
export SCRIPTS="/path/to/your/scripts"
bash /home/matias/.scripts/meta/update_birthdays.sh
```

This script is non-interactive and can be run directly from the terminal. You can also automate its execution using `cron` jobs or integrate it into your window manager's configuration (like a keybinding in qtile).

---

> [!TIP]
> Ensure that every file in your `$SCRIPTS` directory is part of a git repository; otherwise, the script won't find any commit history. As an improvement, consider adding error handling for cases where a file isn't part of a git repo. Additionally, using absolute paths for `$SCRIPTS` and handling cases where `fd`, `git`, or other commands aren't available would make the script more robust.