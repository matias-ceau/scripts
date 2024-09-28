# Vimwiki Note Opener

---

**vimwiki.sh**: Opens a note from the `~/notes` directory in Vim using `fzf` for selection.

---

### Dependencies

- `vim`: A highly configurable text editor built to enable efficient text editing.
- `fzf`: A general-purpose command-line fuzzy finder used for interactive filtering.

### Description

This script is designed to simplify the process of opening your notes stored in the `~/notes` directory using Vim. It leverages `fzf`, a fuzzy finder, to interactively select the note you wish to open. Once a note is selected, the script opens it in Vim, allowing you to quickly access and edit your documents.

The script is a minimal one-liner that ties together listing notes, filtering them with `fzf`, and opening the selection with `vim`. This provides a seamless experience for users who frequently manage a large collection of notes and prefer using Vim for text editing.

### Usage

To use this script, ensure that your notes are stored in the `~/notes` directory. You can run this script in a terminal or bind it to a key sequence in your qtile configuration for quick access.

**Command**:  
```sh
./vimwiki.sh
```

**Example**:  
When executed, the script will display a list of files in the `~/notes` folder using `fzf`. Use the interface to fuzzy search and select the desired note. Upon selection, the note opens in Vim.

---

> [!TIP]
> The script currently assumes that all files in `~/notes` are plain text notes that can be opened with Vim. It doesn't handle directories or files with specific extensions. Consider updating the script to perform checks or expand its functionality by adding pattern matching with `fzf` to filter only specific types of files (e.g., `.md` for markdown notes).