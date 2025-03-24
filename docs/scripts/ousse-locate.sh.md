# Ousse Locate Utility Script

---

**/home/matias/.scripts/dev/ousse-locate.sh**: File locator tool leveraging eza and custom AWK calculations

---

### Dependencies

- `bash` – The script interpreter.
- `du` – Used for calculating the total size of the target directory.
- `eza` – An enhanced replacement for ls; formats and sorts file listings.
- `awk` – Processes and computes file size ratios and time differences.
- `date` – Provides current timestamp for time computations.

---

### Description

This script is designed to generate a detailed overview of the files within the .local/share/ousse directory. Primarily tailored for an Arch Linux environment running the qtile window manager, it computes key information by first determining the total byte size of the directory with the `du` command. The output is then formatted using `eza` with parameters such as sorting by size, modification time, and absolute paths.

After fetching the complete list of files, the script performs a series of calculations with `awk`. The first calculation normalizes individual file sizes by scaling them relative to the total size and adapting the output to the current terminal width (using the `$COLUMNS` variable) to potentially display a progress-like bar. The second calculation computes the difference between each file's timestamp and the current epoch time, possibly for age-based filtering or updates. Finally, a third AWK command extracts a specific field that is reprocessed by eza for further styled output.

The script also contains commented sections hinting at future enhancements:
- Implementation of an fzf-like file selector.
- Piping support to tools like `bat` and `rg` for a more interactive search experience.
- A potential integration of basic plocate search parameters.

These additions suggest a roadmap for a more comprehensive and interactive file location and selection tool.

---

> [!TIP]
> Consider handling edge cases such as missing dependencies or empty directories, and validating file paths before performing operations. Refining the commented-out sections into modular functions could simplify maintenance and improve readability. Additionally, integrating error handling and user feedback (like notifying when the database is outdated) would enhance the overall robustness of the script. Future improvements might also include a more interactive preview system for file selection.