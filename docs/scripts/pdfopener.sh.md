# PDF Opener Script

---

**pdfopener.sh**: Select and open a PDF from your home directory using Evince and dmenu

---

### Dependencies

- `find`: A command-line tool to search for files in a directory hierarchy.
- `dmenu`: A dynamic menu for X, used here for displaying and selecting PDF files.
- `evince`: A document viewer for multiple document formats, primarily intended to display PDF files.

### Description

This script allows you to pick any PDF document located in your home directory and open it using Evince, the document viewer. It uses the `find` command to search for `.pdf` files and pipes the list of found files to `dmenu`, a minimalistic menu utility, to let you choose which PDF file to open.

The `grep "\.pdf$"` part of the command ensures that only files ending with `.pdf` are considered. The option `-i` for `dmenu` enables case-insensitive matching, and `-l 30` displays up to 30 lines in the menu.

### Usage

To use this script, you should run it from a terminal. It can also be tied to a keybinding in your window manager (e.g., in qtile). The script does not take any command-line arguments.

```bash
sh /home/matias/.scripts/bin/pdfopener.sh
```

This will display a menu of PDF files found in your home directory. Use the arrow keys or type to filter the list, and press Enter to open the selected file with Evince.

---

> [!TIP]
> This script assumes that all PDF files are in the user's home directory. Consider modifying the `find` command to include deeper directories if necessary.
> 
> Redirecting `find` errors to `/dev/null` effectively silences any potential permission errors, but it might also obscure other issues; reconsider if debugging issues.
> 
> You could enhance the user experience by adding checks to ensure that a file was indeed selected before attempting to open it with Evince, reducing potential error messages if the user exits `dmenu` without a choice.