# PDF Opener

---

**[pdfopener.sh](pdfopener.sh)**: A script to pick and open a PDF file using Evince

---

### Dependencies

- `dmenu`: A dynamic menu for X, used here for file selection.
- `evince`: A document viewer capable of opening PDF files.

### Description

This script simplifies the task of opening PDF files located in the user's home directory by utilizing `dmenu` for interactive file selection and `evince` for displaying the chosen PDF. The script performs the following steps:

1. It uses the `find` command to search for files ending with `.pdf` in the user's home directory.
2. Any errors from the `find` command are redirected to `/dev/null` to keep the output clean.
3. The list of found PDF files is piped into `dmenu`, where the user can interactively select any file from the list.
4. Finally, the selected file is opened with `evince`, creating a streamlined workflow for accessing PDF documents.

### Usage

To run the script, execute it in a terminal. Ensure it has executable permissions. You can do this by running:

```bash
chmod +x /home/matias/.scripts/pdfopener.sh
```

Then you can run the script with the following command:

```bash
/home/matias/.scripts/pdfopener.sh
```

After running, a `dmenu` prompt will appear displaying all PDF files in your home folder. Select a file and press Enter to open it with `evince`.

To assign this script to a keybinding in `qtile`, you can add it to your configuration as follows:

```python
Key([mod], "p", lazy.spawn("/home/matias/.scripts/pdfopener.sh")),
```

This binding allows you to quickly open the PDF opener using your specified key combination.

---

> [!TIP]  
> The script currently searches for PDF files in the entire home directory, which may take time if there are many files. Consider limiting the search scope or adding a configuration option to set the search directory. Also, handling cases where no PDF file is selected (e.g., if the user cancels the `dmenu`) could improve user experience.
