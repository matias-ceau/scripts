# Vox Amp Models Lookup CLI

---

**vox.py**: Command-line utility to list and describe Vox amp modeling options

---

### Dependencies

- `python` (3.x): Script interpreter
- `pandas`: Data manipulation and filtering
- `tabulate`: Pretty-printing tables in the terminal

You can install python dependencies with:
```
pip install pandas tabulate
```

---

### Description

This Python script provides a command-line interface (CLI) for browsing, searching, and retrieving descriptions of various Vox amp models and modes, including clean, crunch, and metal options, with handy technical commentary for each. The data is organized in a `pandas` DataFrame and includes fields like `name`, `mode`, `color`, `amp_name`, and a descriptive text for each item.

#### Key features:
- **Tabular overview**: With no argument, a truncated table (40 chars of description) is shown for all amp models—quick for browsing.
- **Detail lookup**: Pass a row number, and you’ll get the detailed model/mode header, full name, and the complete amp description.
- **Filter by color**: Use `g`, `o`, or `r` as argument to filter the table by model "color" type.
- **Fuzzy text search**: Enter a substring (case-insensitive) to see matching model names.
- **Terminal output**: All results are formatted as easy-to-read tables via `tabulate`.

The script is great for quick information lookup from the terminal, especially useful for musicians or tinkerers who want to recall the sound profile or special features of a given amp model.

---

### Usage

**Display all Vox amp models (in brief):**
```
python /home/matias/.scripts/bin/vox.py
```

**Show full details for a specific model by index:**
```
python /home/matias/.scripts/bin/vox.py 17
```

**Filter models by "color" category:**
```
python /home/matias/.scripts/bin/vox.py g    # Green
python /home/matias/.scripts/bin/vox.py o    # Orange
python /home/matias/.scripts/bin/vox.py r    # Red
```

**Fuzzy search by part of amp name:**
```
python /home/matias/.scripts/bin/vox.py VOX
python /home/matias/.scripts/bin/vox.py CLEAN
```

You can bind this script to a keybinding in Qtile for fast pop-up queries, or run it from dmenu/rofi.

---

> [!TIP]  
> **Suggestions:**  
> - The script is very data-driven and easy to maintain, but:  
>   - The colors `g/o/r` could be explained (e.g., as amp classes or sound types) in the output or docstring.  
>   - There’s no usage/help output (`-h` or `--help`). Consider adding an argument to print instructions.  
>   - Filtering by amp name is uses a basic substring search; regex or more fuzzy searching (or tab-completion) could help.  
>   - Some columns like `amp_name` are often empty—maybe hide if empty? Or list those with named references separately.  
>   - Truncating description by default is good for performance, but a flag for "full description" in table would help.
>
> Overall, works well for bespoke terminal workflows or as a pop-up lookup window.