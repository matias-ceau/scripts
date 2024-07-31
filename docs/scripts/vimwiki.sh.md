# VimWiki Script (vimwiki.sh)

---

Launch Vim with a selected note from the notes directory.

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

- `fzf`: A command-line fuzzy finder
- `vim`: A text editor available on Arch Linux

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `vimwiki.sh` script provides a quick way to open notes stored in a specified directory in Vim. It uses `fzf`, a powerful command-line fuzzy finder, to allow the user to select a file interactively. This simplifies the navigation of notes, especially when the number of files is large.

Upon execution, the script lists the contents of the `~/notes` directory and presents them in a fuzzy search interface. Once a file is selected, it utilizes Vim to open that specific note for editing.

The script is simple yet effective for users who manage their notes in plain text files and prefer a minimalist setup.

---

<a name="usage" />

#### Usage

To use this script, simply run it in the terminal:

```bash
sh /home/matias/.scripts/vimwiki.sh
```

Alternatively, you can assign it to a keybinding in your window manager or create an alias in your shell configuration file (e.g., `.bashrc`, `.zshrc`) for quicker access. 

Example alias:

```bash
alias vimwiki='sh /home/matias/.scripts/vimwiki.sh'
```

After adding the alias, you can run `vimwiki` from any terminal to activate the script.

<a name="examples" />

#### Examples

1. **Run the script directly:**
   ```bash
   sh /home/matias/.scripts/vimwiki.sh
   ```
   - This opens the fuzzy finder and lets you choose a note to edit.

2. **Using an alias:**
   ```bash
   vimwiki
   ```
   - Executes the script quickly if you have set up an alias.

---

<a name="notes" />

### Notes

- Ensure that the `~/notes` directory exists and contains text files to be able to utilize the script effectively.
- The script will not handle cases where there are no files in the specified directory, leading to potential errors or an empty `fzf` menu.

> **Critique:** 
> Consider implementing error handling in this script to manage situations where the `~/notes` directory may be empty or unavailable. Additionally, allowing for the specification of a different directory through a command-line argument could further enhance usability, making this script more flexible for various workflows.