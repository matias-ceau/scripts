# PDF Opener (pdfopener.sh)

---

A simple script to find and open PDF files using Evince.

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

- `dmenu` - A dynamic menu for X.
- `evince` - Document viewer for PDF and other formats.
- `find` - Command-line utility for searching files in a directory hierarchy.

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `pdfopener.sh` script is a shell script designed for quick access to PDF files stored in the user's home directory. Upon execution, it searches for PDF files and presents them in a menu using `dmenu`, allowing the user to select a file. Once the user makes a selection, the script opens the chosen PDF file using `Evince`, a popular document viewer. 

Internally, the script utilizes the `find` command to search for all PDF files, redirects any error output to `/dev/null` to avoid cluttering the terminal with error messages, and filters the results through `grep` to match files ending with `.pdf`. It then limits the displayed list to a manageable number of entries (30) to enhance usability.

---

<a name="usage" />

#### Usage

To use this script, simply execute it in your terminal or bind it to a keyboard shortcut in your window manager (Qtile). Running the command:

```bash
sh /home/matias/.scripts/pdfopener.sh
```

will prompt you with a dmenu interface showing available PDF files. Select the desired file to open it with Evince.

<a name="examples" />

#### Examples

- Open a terminal and execute:
  ```bash
  sh /home/matias/.scripts/pdfopener.sh
  ```
  This will display a list of all PDF files in your home directory for selection.

---

<a name="notes" />

### Notes

- It is recommended to ensure that your home directory (or the directory you want to search) contains the PDFs you want to open. The script may take some time to execute if there are many files.
- The script will not find PDFs in hidden directories unless they are explicitly included in the search.

> **Critique:** While the script is functional, there are a few potential improvements:
> - Consider adding error handling for cases where no PDF files are found, to provide user feedback.
> - To enhance performance, the script could limit the search to a specific directory rather than searching the entire home directory.
> - Adding an option for filtering PDFs by a specific keyword or date could improve usability for users with a large number of PDF files.