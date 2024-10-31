# PDF Opener Script

---

**pdfopener.sh**: Open a PDF file from the home directory using `evince` with `dmenu` for selection

---

### Dependencies

- `find`: Used to search and list PDF files within the home directory.
- `grep`: Filters the results to include only files ending with `.pdf`.
- `dmenu`: An efficient and minimal looking menu for X, used here to select a PDF file.
- `evince`: A document viewer for the GNOME desktop environment, used for opening PDF files.

### Description

This script allows you to quickly and efficiently pick a PDF file from your home directory and open it using the `evince` PDF viewer. It leverages the `find` command to locate all PDF files, filters the paths using `grep` to keep only those ending with `.pdf`, and then presents them in an interactive menu using `dmenu`. Once a file is selected, the script opens it with `evince`. This combination offers a smooth way to search and open documents quickly without needing to navigate through directories manually.

### Usage

Ensure all dependencies are installed on your Arch Linux system. Place the script in a directory within your `PATH` or run it directly from its location. You can bind this script to a key combination within your window manager, like `qtile`, for easy access. 

To use the script:

```bash
sh /home/matias/.scripts/bin/pdfopener.sh
```

- A menu will pop up (via `dmenu`), listing all PDF files in your home directory.
- Use the keyboard to navigate and select the desired PDF file.
- The selected PDF will open in `evince`.

To bind this script to a keybinding in `qtile`, you can modify your qtile config file as follows:

```python
Key([mod], "p", lazy.spawn("sh /home/matias/.scripts/bin/pdfopener.sh")),
```

---

> [!IMPORTANT]
> Currently, the script does not handle cases where no PDF file is selected or if `dmenu` is closed without selecting anything. Enhancing the script to check for an empty file path could improve user experience and prevent potential error messages. Additionally, integrating this script with desktop notifications could provide feedback if a selected file fails to open for any reason. Consider these improvements for robustness.