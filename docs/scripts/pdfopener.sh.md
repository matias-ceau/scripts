# PDF Opener Script

---

**pdfopener.sh**: Select and open a PDF file in your home directory with `evince`

---

### Dependencies

- `dmenu`: A dynamic menu for X, used for presenting a list of PDF files to choose from.
- `evince`: A document viewer for PDF files on Linux.

### Description

This script allows you to interactively select a PDF file from your home directory and open it using `evince`. It accomplishes this task in two main steps:

1. **File Selection**: The script uses `find` to search for `.pdf` files within your home directory. This list is then piped into `dmenu`, which presents these options in a graphical menu where you can type to filter results and select the desired file.
   
2. **File Opening**: Once a PDF is selected, it is opened using `evince`.

This script is handy for users who often need to quickly find and open PDF files without manually searching through directories.

### Usage

To use this script, you can execute it directly from the terminal or bind it to a key combination in your window manager (e.g., qtile). Make sure the script is executable. Here’s a step-by-step usage example:

1. Open a terminal and navigate to the directory containing the script.
2. Ensure the script is executable:
   ```bash
   chmod +x /home/matias/.scripts/pdfopener.sh
   ```
3. Run the script:
   ```bash
   /home/matias/.scripts/pdfopener.sh
   ```
4. A `dmenu` prompt will appear with a list of PDFs. Start typing to filter through the options and press `Enter` to open the selected file in `evince`.

Alternatively, you can bind the script to a key in qtile for quick access.

---

> [!NOTE]
> The script currently searches the entire home directory, which might include many non-relevant directories and result in slow performance or large menu lists if your home directory is vast. Consider restricting the search to specific directories or adding more filters for performance improvement. Additionally, handling empty selections (i.e., if the user cancels out of `dmenu` without selecting a file) would make the script more robust.