# Vox Amp Options (vox.py)

---

List available Vox amp options with descriptions.

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

- Python 3
- pandas
- tabulate

<a name="description" />

### Description

<a name="overview" />

#### Overview

This script lists various Vox amplifier settings and their descriptions using data stored in a pandas DataFrame. It allows users to view amp names, modes, associated amp names, and short descriptions. The script can filter options based on color, numeric index, or name similarity, providing a versatile way to access information on different Vox settings.

The data is structured into four main columns:

- `name`: The name of the amp setting.
- `mode`: The mode of the amp (e.g., STD, SPL, CST).
- `color`: A single character representing the color of the amp setting (e.g., 'g' for green).
- `amp_name`: The name of the physical amp model associated with the setting.
- `description`: A brief explanation of the amp's characteristics and sound.

The script formats the output using the `tabulate` library for better readability.

---

<a name="usage" />

#### Usage

To use this script, run it from the command line. You can optionally pass arguments:

1. **No arguments**: Lists all Vox amp options in a formatted table.
2. **Numeric index**: Provides detailed information about a specific amp setting based on its index (0-32).
3. **Color filters**: Use one of the following colors ('g', 'o', 'r') to filter results.
4. **Partial name match**: Input part of an amp's name to filter amp settings by name.

Example command usages:

```bash
python3 /home/matias/.scripts/vox.py          # List all options
python3 /home/matias/.scripts/vox.py 1       # Get details for the setting at index 1
python3 /home/matias/.scripts/vox.py g       # List all green options
python3 /home/matias/.scripts/vox.py Vox     # Find all options with 'Vox' in the name
```

<a name="examples" />

#### Examples

1. List all Vox amp options:
   ```bash
   python3 /home/matias/.scripts/vox.py
   ```

2. Details of the amp setting at index 2:
   ```bash
   python3 /home/matias/.scripts/vox.py 2
   ```

3. Show entries for a specific color (green):
   ```bash
   python3 /home/matias/.scripts/vox.py g
   ```

4. Find amp options with 'CLEAN' in the name:
   ```bash
   python3 /home/matias/.scripts/vox.py CLEAN
   ```

---

<a name="notes" />

### Notes

- Ensure that the script file is executable (`chmod +x /home/matias/.scripts/vox.py`).
- This script requires `pandas` and `tabulate`, so ensure they are installed in your Python environment (`pip install pandas tabulate`).
- The script is structured for readability and maintainability but could benefit from additional comments for complex logic sections.

> **Critique:** 
> The script has a reasonable structure, but the use of magic numbers (like `32` for the index range) should be avoided in favor of dynamic checks. Additionally, error handling can be improved for cases where the user inputs invalid options. You may want to consider implementing logging or exception handling for robustness.