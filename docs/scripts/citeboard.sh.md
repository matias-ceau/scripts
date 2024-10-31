# Citeboard: Paper Finder and Citation Manager

---

**citeboard.sh**: Script to find a paper and either open it or copy its citation.

---

### Dependencies

- `findutils`: Used to search for files in directories.
- `xsel`: A command-line tool to manipulate the X selection, allowing clipboard operations.
- `dmenu`: A dynamic menu for X, used to make selections. 

### Description

The **citeboard.sh** script is a simple utility tailored for Arch Linux users with the qtile window manager, aiming to streamline the process of either opening a paper or copying its citation to the clipboard. The script pulls from a bibliography database located in `data/bib/*`, using the BibTeX citation format. 

- It starts by extracting references from the BibTeX files, using `grep` to identify lines beginning with `@` and removing unwanted characters through `sed`.
- It then presents a menu using `dmenu` to allow the user to select which reference to use.
- Depending on the subsequent choice (open the paper or copy the citation), it either copies the reference to the clipboard using `xsel` or finds and opens the corresponding paper in the `data/zotero/storage` directory using `evince`.

### Usage

To use the script, follow these steps:

1. Execute the script from the terminal:
   ```bash
   ~/.scripts/bin/citeboard.sh
   ```
2. Upon execution, a menu appears listing all available references (based on your BibTeX files). 
3. Select the desired reference and another menu pops up asking to either `open` the file or copy to `clipboard`.
4. Depending on your choice:
   - If `clipboard` is selected, the reference is copied and ready to be pasted.
   - If `open` is selected, the paper is opened using Evince.

This script can also be bound to a keybinding in qtile for quicker access.

---

> [!NOTE]
> One potential improvement could be handling non-existent or improperly indexed papers more gracefully. Additionally, consider extending the script to support other PDF viewers or reference managers. Integrating error handling such as notifying the user if a paper cannot be found when 'open' is selected would enhance user experience.