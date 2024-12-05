# PDF Opener Script

---

**pdfopener.sh**: Open any PDF in the home directory using Evince or the default application

---

### Dependencies

- `fd`: A fast and user-friendly alternative to `find`.
- `fzfmenu.sh`: A custom script presumably a wrapper around `fzf`, used for filtering.
- `evince`: A popular document viewer for PDFs and other document formats.
- `xdg-open`: Used to open files with the default application when `evince` is not suitable.

### Description

This script is designed to help users quickly locate and open PDF files within their home directory. It uses `fd` to search for PDF files efficiently. The found files are then passed to a script `fzfmenu.sh` for interactive selection, which likely enhances the filtering with color and display options.

Once a file is selected, the script checks if it's a valid file and attempts to open it using `evince`, a dedicated PDF viewer. If `evince` cannot handle the file for any reason, the script falls back to `xdg-open`, which determines the default application associated with the file type on the system.

### Usage

To use the `pdfopener.sh` script, simply execute it in your terminal:

```sh
/home/matias/.scripts/bin/pdfopener.sh
```

This will list all PDF files in your home directory allowing you to select one using `fzfmenu.sh`. Once you make a selection, the chosen PDF file will open in `evince`. If `evince` is unable to open the file, it will open with any default application available.

You can also integrate this script into your qtile configuration to bind it to a keyboard shortcut for ease of use. For example:

```python
Key([mod], "p", lazy.spawn("~/.scripts/bin/pdfopener.sh")),
```

This shortcut will map the script to `mod + p`, executing it whenever these keys are pressed.

---

> [!NOTE] 
> You may consider replacing `evince` directly with `xdg-open` which will simplify the logic while maintaining the functionality if the system’s default PDF viewer is acceptable. Additionally, the script's selection process relies on the presence and correct functioning of `fzfmenu.sh`. Ensure this script exists and operates as expected to prevent errors.