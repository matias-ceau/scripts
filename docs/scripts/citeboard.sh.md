# citeboard.sh

# Paper Finder Script

This script provides a convenient way to find a paper from a bibliography and either open the paper or copy its citation to the clipboard. It utilizes `findutils`, `xsel`, and `dmenu` to accomplish this task.

## Dependencies

- `findutils`
- `xsel`
- `dmenu`

Ensure these dependencies are installed on your system before running the script.

## Usage

To run the script, use the following command in your terminal:

```sh
./scriptname.sh
```

Replace `scriptname.sh` with the actual name of your script file.

## Functionality

1. **Fetch Paper References**: The script searches through files in the `data/bib/` directory for lines that start with `@` and end with a comma. It then extracts the references, which are displayed in `dmenu` for selection.
   
2. **Select Action**: The user can choose from two options displayed in `dmenu`:
   - `open`: Opens the selected paper in `evince`.
   - `clipboard`: Copies the selected citation to the clipboard using `xsel`.

3. **Perform Action**: Based on the user's choice:
   - If `clipboard` is selected, the citation is copied to the clipboard.
   - If `open` is selected, the script searches for the file associated with the reference in the `data/zotero/storage/` directory and opens it using `evince`.

## Script Details

```sh
#! /bin/sh

# Find a paper and either open the paper or copy the paper citation
# Dependencies: findutils, xsel, dmenu

# Fetch the paper references from the bibliography files
ref=$(grep -h "^@" data/bib/* | grep ,$ | sed 's/@.*{//g ; s/,$//g' | dmenu -l 30 | sed 's/\n$//g')

# Prompt the user to select an action (open or copy to clipboard)
sel=$(echo -e "open\nclipboard" | dmenu)

# Exit if no reference is selected
[ "$ref" = "" ] && exit 

# Copy the reference to the clipboard if 'clipboard' is selected
[ "$sel" = "clipboard" ] && echo "$ref" | xsel -b

# Open the paper in evince if 'open' is selected
[ "$sel" = "open" ] && 
    find data/zotero/storage | grep "$ref" | xargs evince
```

## Notes

- The script uses `dmenu` to display a list of paper references and actions. Ensure `dmenu` is properly configured and installed on your system.
- This script assumes that your bibliography files are located in the `data/bib/` directory and your papers are stored in the `data/zotero/storage/` directory.
- The script uses `evince` for opening PDF files. Adjust the script if you prefer using a different PDF viewer.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

---

Feel free to customize this documentation to better fit your GitHub repository structure and any additional requirements you might have.