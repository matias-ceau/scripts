
---

Open PDF files from the home directory using Evince.

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

- `dmenu`: A dynamic menu for X, required to select the PDF file.
- `evince`: The document viewer used to open PDF files.

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `pdfopener.sh` script provides a simple way to open PDF files located in the user's home directory. It utilizes `find` to search for files with the `.pdf` extension, and presents those files in a menu using `dmenu`. Once a user selects a file, it opens in Evince, the GNOME document viewer. This allows for quick access to PDF documents without needing to navigate through a file manager.

The script functions as follows:
1. It executes a `find` command to search for PDF files in the home directory.
2. The output of the `find` command is filtered by `grep` to include only files with the `.pdf` extension.
3. `dmenu` displays the list of found files, allowing the user to choose one.
4. Finally, Evince is called with the selected file as an argument to open it for viewing.

---

<a name="usage" />

#### Usage

To use the script, you can run it directly from the terminal:

```bash
sh /home/matias/.scripts/pdfopener.sh
```

Alternatively, it can be bound to a key combination in a window manager like Qtile for quicker access.

<a name="examples" />

#### Examples

1. Run the script directly to open a PDF:
   ```bash
   sh /home/matias/.scripts/pdfopener.sh
   ```
2. Bind the script to a key in your Qtile configuration:
   ```python
   Key([mod], "p", lazy.spawn("sh /home/matias/.scripts/pdfopener.sh")),
   ```

---

<a name="notes" />

### Notes

- Ensure that both `dmenu` and `evince` are installed on your system.
- If there are many PDFs, consider adjusting the `-l` option in `dmenu` to show more items in the menu.
- The script currently does not handle cases where there are no PDF files or if the user cancels the selection in `dmenu`, which may result in Evince being called without a file.

> **Critique:** The script lacks error handling for cases where no PDF files are found. To improve it, consider adding a check before calling Evince. For instance, you can test if `file` is empty and provide feedback to the user before attempting to open it, enhancing the user experience.