# pdfopener.sh

# Pick and Open PDF Script

This script allows users to pick any PDF file within their home folder and open it using the document viewer `evince`. The script uses `dmenu` for selecting the file interactively.

## Script Details

```sh
#! /bin/sh

# Pick any pdf in home folder and open it with evince

file=$(find ~ 2>/dev/null | grep "\.pdf$" | dmenu -i -l 30)
evince "$file"
```

### Functionalities

- **Find PDF Files**: 
  The script uses `find` command to search for all files in the user's home directory (`~`), filtering out errors (`2>/dev/null`).
  
- **Filter PDF Files**:
  The `grep "\.pdf$"` command filters the results of the `find` command to include only files with a `.pdf` extension.

- **Interactive Selection**:
  It then pipes the list of PDF files to `dmenu`, a dynamic menu for X, which enables the user to interactively select a file. The `-i` option enables case-insensitive matching, and the `-l 30` option sets the list to display up to 30 lines.

- **Open PDF with Evince**:
  The selected file from `dmenu` is stored in the variable `file`, and then opened with the `evince` document viewer.

## Requirements

- `find`: This command-line utility should be available to search for files.
- `grep`: Used to filter the list of files to include only PDFs.
- `dmenu`: A dynamic menu for X, which allows for interactive selection of files.
- `evince`: A document viewer for PDF and other document formats.

## Usage

Make sure the script is executable. You can make the script executable by running:

```sh
chmod +x script.sh
```

Then, you can run the script as follows:

```sh
./script.sh
```

You will be presented with a list of PDF files within your home directory in `dmenu`. Use the arrow keys or type to search for your desired PDF, press `Enter`, and the selected file will open in `evince`.