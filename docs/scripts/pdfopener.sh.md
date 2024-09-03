# PDF Opener Script

---

**pdfopener.sh**: A script to select and open any PDF file from the home folder using Evince.

---

### Dependencies

- `dmenu`: A dynamic menu for X11 that allows for file selection in the script.
- `evince`: A document viewer for PDF and other file formats.

### Description

The `pdfopener.sh` script is designed for users of Arch Linux and the Qtile window manager who need a quick and efficient way to open PDF files. The script utilizes the `find` command to search for all PDF files within the user’s home directory. The results are then piped into `dmenu`, which provides an interactive graphical menu for the user to select from.

Once a PDF file is selected, `evince` is invoked to open the chosen document. This makes it a handy tool for users who may have numerous PDF files and prefer a streamlined method for viewing them without navigating through folders manually.

Here’s a breakdown of the main components:

- **`find ~ 2>/dev/null`**: Searches the user's home directory for files, suppressing any error messages that might arise from inaccessible directories.
- **`grep "\.pdf$"`**: Filters the results to include only files ending with the `.pdf` extension.
- **`dmenu -i -l 30`**: Launches dmenu in case-insensitive mode, allowing the user to select from a list of up to 30 PDF files.
- **`evince "$file"`**: Opens the selected PDF file using Evince.

### Usage

To use the script, simply run it in your terminal or bind it to a key combination in your window manager configuration. Here's how to execute it:

```bash
/home/matias/.scripts/pdfopener.sh
```

Alternatively, you can set a keybinding in Qtile's configuration:

```python
# Example of Qtile configuration to bind this script to Mod + P
Key([mod], "p", lazy.spawn('/home/matias/.scripts/pdfopener.sh')),
```

---

> [!TIP]
> Consider adding error handling to your script. If no PDF files are found or if the user cancels the `dmenu` selection, the script may fail to execute `evince` gracefully. You could implement checks to ensure a valid selection was made before trying to open a file.