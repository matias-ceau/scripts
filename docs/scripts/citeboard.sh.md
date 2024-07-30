# Citeboard (citeboard.sh)

---

A script to find a paper and open it or copy its citation.

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

- findutils
- xsel
- dmenu

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `citeboard.sh` script is designed for users who need to quickly access paper citations. It searches for references in BibTeX files and offers the user a simple interface to either copy the citation to the clipboard or open the corresponding PDF file using Evince. The script uses several utilities:

- **grep**: To filter and extract references from `.bib` files.
- **sed**: For text manipulation to format the references properly.
- **dmenu**: Provides a graphical interface for selecting options.
- **xsel**: Enables copying selected text to the clipboard.

The references are extracted by searching for lines that begin with `@` in all BibTeX files located in the specified `data/bib` directory, while eliminating unnecessary characters to maintain a clean citation format. A subsequent menu allows the user to decide whether to open the selected paper or copy its citation.

---

<a name="usage" />

#### Usage

To run the script, simply execute it from the terminal. You may bind it to a key combination in your window manager, such as Qtile, for faster access. 

```bash
sh /home/matias/.scripts/citeboard.sh
```

Upon execution, a dmenu prompt will appear showing a list of citation references. Once a selection is made, a second prompt will appear to choose between "open" or "clipboard."

<a name="examples" />

#### Examples

1. Run the script:
   ```bash
   sh /home/matias/.scripts/citeboard.sh
   ```
2. Select a reference from the list presented by dmenu.
3. Choose "open" to view the document or "clipboard" to copy the citation.

---

<a name="notes" />

### Notes

- Ensure that the path to your BibTeX files and the storage directory are correctly specified in the script.
- Verify that you have Evince installed for opening files.
- You might want to adjust the `dmenu` options for better visual preferences.

> **Critique:** The script currently relies on hardcoded paths, which might not adapt well if the directory structure changes. A potential improvement could involve accepting the path as a command-line argument or allowing the user to set it in a configuration file. Additionally, error handling is minimal; if no reference or selection is made, the script exits without feedback. Adding messages or logs would enhance user experience and troubleshooting.