# Citeboard Script

---

**citeboard.sh**: A script to find and handle research papers by opening or copying citations.

---

### Dependencies

- `findutils`: A utility to search files and directories.
- `xsel`: A tool to copy and paste data to and from the X clipboard.
- `dmenu`: A dynamic menu for X, often used for selecting options in scripts.

### Description

The `citeboard.sh` script is designed to assist users in locating and managing their research papers efficiently on an Arch Linux system with the qtile window manager. The script begins by searching through BibTeX bibliography files located in the `data/bib/` directory. It extracts BibTeX entry keys (the text following the `@`) and presents them using `dmenu` for selection.

Once a bibliography key is selected, it prompts the user whether they want to open the paper or copy its citation to the clipboard. If "clipboard" is selected, the chosen key is copied to the clipboard using `xsel`. If "open" is chosen, the script will search for the corresponding paper in the `data/zotero/storage` directory and open it with `evince`, a popular PDF reader.

### Usage

This script is typically run from a terminal or hooked to a keybinding in environments like qtile. Ensure you have all the dependencies installed before using the script.

To execute the script, use the following command in your terminal:

```sh
sh /home/matias/.scripts/citeboard.sh
```

You can bind this script to a shortcut key in your qtile configuration to make it more accessible.

**Example:**

Running the script:
- Opens a selection menu with your papers' citations.
- Allows you to choose between opening the document or copying the citation.

```sh
# Run the script and choose a paper
sh /home/matias/.scripts/citeboard.sh
```

---

> [!TIP]
> A potential improvement would include error checking if `evince` fails to open a PDF. The script could also benefit from handling cases where `find` does not locate any files. Additionally, consider adding support for different file viewers or export formats for more flexibility.