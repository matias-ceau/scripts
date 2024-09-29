# PDF Opener Script

---

**pdfopener.sh**: A simple script to select and open PDF files from the home directory using Evince.

---

### Dependencies

- `dmenu`: A dynamic menu for X11 can be used for selecting the PDF files.
- `evince`: A GNOME document viewer used to open PDF files.

### Description

This script provides a straightforward way to open PDF files located in the user's home directory. Once executed, it performs the following steps:

1. **Finding PDF Files**: It uses the `find` command to search for all files in the home directory and filters the results for files ending with the `.pdf` extension using `grep`.

2. **User Selection**: The list of found PDF files is presented in a graphical menu powered by `dmenu`, allowing the user to select their desired file. The `dmenu` options include case-insensitive searching and a limit to 30 visible entries.

3. **Opening the File**: After a selection is made, `evince`, the designated PDF viewer, is called to open the chosen PDF file.

### Usage

To use this script, follow these simple steps:

1. Open a terminal.
2. Run the script directly:

```bash
sh /home/matias/.scripts/pdfopener.sh
```

3. A `dmenu` prompt will appear, listing PDF files from your home directory. Use the arrow keys or type to highlight/select a PDF.
4. Press `Enter` to open the selected file with Evince.

This script can also be assigned to a keybinding in your window manager for quicker access, enhancing your workflow.

---

> [!TIP]  
> Consider implementing error handling for scenarios where no PDF files are found or when Evince fails to open. You can add conditions to check if `$file` is empty and provide user feedback accordingly. Additionally, using `xdg-open` could allow for more flexibility, opening files with the default PDF viewer rather than being tied to Evince specifically.