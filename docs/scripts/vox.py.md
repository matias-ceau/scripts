# Vox Amp Options List

---

**vox.py**: A Python script to list and describe Vox amplifier options.

---

### Dependencies

- `pandas`: Used for data manipulation and analysis. This library provides data structures and functions needed to manage the amp options data.
- `tabulate`: A package that makes it easy to create attractive tabular output. It formats the DataFrame into a readable table for the user.
- `sys`: This module provides access to command line arguments.

### Description

The `vox.py` script manages a collection of Vox amplifier models, their modes, descriptions, and associated information. It utilizes the `pandas` library to create a DataFrame, encapsulating details of various Vox amps, including their names, modes (standard, split, custom), colors, associated amps, and descriptions.

Upon execution, the script checks for command line arguments to determine how to display the information from the DataFrame:

1. **No Arguments**: Displays a summary of all amp descriptions truncated to 40 characters.
2. **Numeric Index**: If a valid index number is provided, it displays detailed information about the corresponding amp, including the name, mode, amp name, and full description.
3. **Color Filter**: Pass 'g', 'o', or 'r' to show amps filtered by their color codes.
4. **Name Search**: If a part of an amp's name is provided, it retrieves and shows all matching entries.

### Usage

To use `vox.py`, execute it from the command line. Here are some examples:

- Display all Vox amp options with brief descriptions:
  ```
  python vox.py
  ```

- Get detailed information about a specific amp by its index (for example, index 2):
  ```
  python vox.py 2
  ```

- Filter amps by color (for example, color 'g'):
  ```
  python vox.py g
  ```

- Search for amps containing 'CLEAN' in their name:
  ```
  python vox.py CLEAN
  ```

---

> [!TIP]
> The script could benefit from enhanced error handling. Currently, if a non-numeric or an invalid index is provided, it may not give clear feedback. Consider using try-except blocks to capture such errors gracefully and provide informative messages to the user. Additionally, separating the data loading logic from the command handling logic would improve maintainability and clarity.