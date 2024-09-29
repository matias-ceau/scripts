# VimWiki: Quick Note Opener

---

**vimwiki.sh**: Open a note in vim using fzf for selection.

---

### Dependencies

- `vim`: A highly configurable text editor used for creating and editing notes.
- `fzf`: A command-line fuzzy finder that provides an interface for selecting files interactively.

### Description

The `vimwiki.sh` script allows users to quickly open notes stored in the `~/notes` directory using Vim. By leveraging `fzf`, a fuzzy finder, it provides an interactive interface for selecting a note file. The user simply executes the script, and it presents a list of available notes, allowing them to select one to edit within Vim.

This script operates by using the `ls` command to list the contents of the `~/notes` directory, which are then piped to `fzf`. Once the user makes a selection, the chosen file is passed to Vim, enabling immediate editing.

Here's a breakdown of the script:

1. The shebang (`#! /bin/sh`) indicates that this script should be run in a Bourne shell environment.
2. The command `ls ~/notes | fzf` retrieves the list of notes in the specified directory, and `fzf` facilitates the user’s selection.
3. The selected note path is then used as an argument in the `vim` command, allowing the note to be opened for editing.

### Usage

To use the script, simply execute it from the terminal:

```bash
sh /home/matias/.scripts/vimwiki.sh
```

Upon execution, you will see a list of notes from the `~/notes` directory displayed by `fzf`. You can start typing to filter the list, then press `Enter` to open the selected note in Vim.

For convenience, you might consider binding this script to a key shortcut in your window manager so you can quickly access your notes without navigating through the terminal manually.

---

> [!TIP]  
> The current implementation of the script relies on the standard output of `ls`, which may not handle files with spaces or special characters well. To improve robustness, consider using `find ~/notes -mindepth 1 -maxdepth 1 -print0 | fzf --read0` instead, which handles filenames more reliably.