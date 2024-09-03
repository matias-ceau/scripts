# Citeboard Script

---

**citeboard.sh**: A script to find and manage paper citations from your bibliography.

---

### Dependencies

- `findutils`: Essential for file searching operations.
- `xsel`: Command-line tool to access and manipulate X selections.
- `dmenu`: Dynamic menu for fast selection from a list.

### Description

The `citeboard.sh` script is designed to facilitate the search and handling of paper citations from a bibliography file. It performs the following key functions:

1. **Extracting References**: 
   The script scans through BibTeX files located in the `data/bib` directory, extracting citation keys for entries that contain a comma and are formatted correctly. The extracted references are presented to the user in a list.

2. **User Interaction**: 
   The user interacts with `dmenu` to select a reference from the list, and then chooses between two options:
   - **Open the Paper**: If this option is selected, the script finds the corresponding PDF file in the `data/zotero/storage` directory and opens it using `evince`.
   - **Copy to Clipboard**: If this option is selected, it copies the citation key to the clipboard using `xsel`.

### Usage

To run the script, make sure it's executable and simply execute it in a terminal:

```bash
chmod +x /home/matias/.scripts/citeboard.sh
/home/matias/.scripts/citeboard.sh
```

#### Steps:

1. **Initiate the Script**: Running the script will open a `dmenu` interface with available references.
2. **Select a Citation**: Use the arrow keys to navigate and hit enter to select a citation.
3. **Choose Action**: After selecting a citation, a second `dmenu` will prompt you to either "open" the paper or copy the citation to the clipboard.

---

> [!TIP]  
> Consider implementing error handling within your script. For instance, if the PDF file is not found, it might be useful to notify the user with a message. Furthermore, handling empty cases where `dmenu` returns no selection would enhance user experience.