
---

Open a note in vim using fzf for file selection

---

### Table of contents

- [Dependencies](#dependencies)
- [Description](#description)
    - [Overview](#overview)
    - [Usage](#usage)
    - [Examples](#examples)
- [Notes](#notes)

---

<a name="dependencies" />

### Dependencies

- `fzf`: A general-purpose command-line fuzzy finder
- `vim`: The text editor used to open notes
- `bash` or a compatible shell

<a name="description" />

### Description

<a name="overview" />

#### Overview

This script is a simple utility for users who store notes in a `~/notes` directory. It utilizes `fzf`, a powerful fuzzy-finder tool, to allow users to quickly and interactively select a note file from the command line. Once a file is selected, the script opens the selected note in the Vim text editor. This enhances the workflow for users working with notes, allowing for efficient access without needing to type the exact filename.

The script works by using the `ls` command to list all the notes in the specified `~/notes` directory, passing that list to `fzf`, which handles interactive selection. The selected note is then passed as an argument to `vim`.

---

<a name="usage" />

#### Usage

To use the script, simply run it from the terminal:

```bash
./vimwiki.sh
```

The script does not take any command-line arguments. Once executed, it prompts you with a list of files from `~/notes`. You can navigate through the list using your keyboard, and press Enter to open the selected file in Vim.

If you want this script to run conveniently, you might consider assigning it to a keybinding in your window manager or creating an alias in your shell configuration file.

<a name="examples" />

#### Examples

1. To run the script from a terminal:
   ```bash
   ./vimwiki.sh
   ```

2. If you prefer a shortcut, add this line to your `~/.bashrc`:
   ```bash
   alias vimwiki='~/scripts/vimwiki.sh'
   ```
   Then, run it anytime with:
   ```bash
   vimwiki
   ```

---

<a name="notes" />

### Notes

- Ensure you have the `fzf` and `vim` installed on your Arch Linux system for the script to function correctly.
- The script assumes that the `~/notes` directory exists and is populated with note files. If the directory is empty, the script will not function as expected.

> **Critique:** 
> The script currently relies on the basic output of `ls`, which may not handle filenames with spaces or special characters well. A potential improvement could include `find` or properly quoting file names with `printf` for better handling of file names. Additionally, including an exit condition if no files are found would prevent potential errors during execution.