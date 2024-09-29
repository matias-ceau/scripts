# CiteBoard Script

---

**citeboard.sh**: A script to select and manage paper citations from a local BibTeX database.

---

### Dependencies

- `findutils`: Used for searching files in the filesystem.
- `xsel`: A utility to interact with the X selection buffer (clipboard).
- `dmenu`: A dynamic menu for X, used for creating interactive selections.

### Description

The `citeboard.sh` script is designed to help users quickly find and manage paper citations stored in a BibTeX file format. This script allows you to either open the full PDF of a selected paper or copy its citation directly to the clipboard.

Here’s a breakdown of how the script functions:

1. **Citation Retrieval**: It uses `grep` to search through all BibTeX files in the `data/bib/` directory. It extracts entries that contain a comma, indicating they are citations, and formats them for display.
2. **User Interface**: The formatted citations are then fed into `dmenu`, allowing users to select from a list of available references.
3. **Action Selection**: After a citation is chosen, users can decide whether to copy it to the clipboard or open the associated PDF file. This is also done through `dmenu`, which presents the options.
4. **Conditional Execution**: Depending on the user’s selection, the script either copies the citation using `xsel` or opens the PDF in `evince` by searching within the storage directory of Zotero.

### Usage

To utilize the `citeboard.sh` script, you can run it directly from the terminal or assign it to a keybinding in your window manager (qtile). 

Example command to run in the terminal:

```bash
bash /home/matias/.scripts/citeboard.sh
```

When executed, the script will display:

1. A list of paper citations to choose from.
2. The option to either "open" or "clipboard" the selected citation.

For example:

```
$ /home/matias/.scripts/citeboard.sh 

# Select a citation in the dmenu list
# After selection, choose to open in evince or copy to clipboard
```

---

> [!TIP] 
> Review the paths to ensure `data/bib/` and `data/zotero/storage` are accurate for your file structure. Consider adding error handling for cases where no PDF is found or the BibTeX file is empty. Enhancing user feedback during execution could also improve the experience.