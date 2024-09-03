# Read the Fucking Manual

---

**read_the_fucking_manual.sh**: A tool to view commonly searched manual entries.

---

### Dependencies

- `bat`: A modern replacement for `cat`, providing syntax highlighting and Git integration.
- `ripgrep (rg)`: A fast, recursive search tool that works similar to `grep`.
- `sed`: A stream editor for filtering and transforming text.
- `awk`: A programming language often used for pattern scanning and processing.

### Description

`read_the_fucking_manual.sh` is a Bash script designed to help users find the most searched entries in their manual pages using their shell's history. It specifically looks through the history logs of both Zsh and Bash to find commands that start with `man` or `batman`. 

The script utilizes several utilities:

- `cat` joins the contents of the Bash and Zsh history files.
- `rg` filters commands that search manuals.
- `sed` and `cut` clean up the output to isolate the manual commands.
- `sort` and `uniq` are utilized to tally occurrences.
- `awk` is implemented for formatted output using a specified threshold.

### Usage

Run the script directly from the command line:

```bash
./read_the_fucking_manual.sh
```

This fetches the 10 most searched manual entries by default. Below are additional options you can use:

- Display help information:

```bash
./read_the_fucking_manual.sh -h
```

- Get a specified number of top searched entries:

```bash
./read_the_fucking_manual.sh -n 5
```
This fetches the top 5 searched entries.

- Show searches that occurred more than a certain number of times:

```bash
./read_the_fucking_manual.sh -m 2
```
This displays entries searched more than 2 times.

- Retrieve all searches:

```bash
./read_the_fucking_manual.sh -a
```

- Pass additional arguments to filter results with `ripgrep`:

```bash
./read_the_fucking_manual.sh search_term
```

---

> [!TIP] 
The script currently depends on specific paths for the history files. Consider checking for the existence of these files and providing user-friendly error messages if they are not found. Additionally, adding error handling for invalid input (like non-numeric values for `-n` or `-m`) could enhance its robustness.