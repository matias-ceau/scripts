# VOX Amp Options List

---

**vox.py**: Lists VOX amplifier options and their details.

---

### Dependencies

- `pandas`: A powerful data analysis and manipulation library for Python.
- `tabulate`: A library for formatting tables.

### Description

This script, `vox.py`, is designed to list and manage VOX amplifier models and their associated details, which include model names, modes, amp names, and brief descriptions. The data is organized in a pandas DataFrame, allowing for efficient lookups and information display. 

The script supports various query mechanisms:
- By default, it displays a summary of all VOX amp options.
- If passed a numeric index, it provides detailed information about that specific amplifier.
- It accepts color filters (specified as `g`, `o`, or `r`) to narrow down displayed options.
- Additionally, it can search for amp names based on user input.

The output is organized and printed in a table format, thanks to the `tabulate` library.

### Usage

To run the script, execute it from the terminal with the desired options. Here are some examples:

```bash
# Display a list of all amp options
python vox.py

# Get detailed information for a specific amp by its index
python vox.py 0

# Filter amps by color (green)
python vox.py g

# Search for amps by name (e.g., 'CLEAN')
python vox.py CLEAN
```

The argparse library can be implemented for better command-line argument handling in future versions.

---

> [!TIP] 
This script handles basic functionality well but could benefit from enhanced documentation. Consider adding usage examples directly in the help output to clarify its operations. Additionally, integrating error handling (for invalid inputs) will improve user experience. For large data sets, you may want to implement pagination or search suggestions for better usability.