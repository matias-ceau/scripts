# Vox Amp Options List

---

**[vox.py](/vox.py)**: A script for listing and displaying options for Vox amplifiers.

---

### Dependencies

- `pandas`: A data manipulation and analysis library for Python. Required for creating and handling tabular data.
- `tabulate`: A library for pretty-printing tabular data in a visually appealing format. Used for outputting the amplifier options in a table.

### Description

This Python script provides a user-friendly interface to view specifications and descriptions of various Vox amplifier options. It uses the `pandas` library to manage data in a structured DataFrame, which includes fields such as amplifier name, mode, color, and a detailed description of each amp's characteristics.

The `tabulate` library is utilized to format the output into a readable table, enhancing the user experience when browsing through the options.

Key features of the script:
- Users can list all Vox amp options succinctly.
- It allows filtering options by numerical index, color codes (g, o, r), or name search.
- Displays detailed information about a specific amplifier when a valid index is given.

### Usage

To use the script, it can be run in the terminal. Here are some usage examples:

- To list all amplifier options:
  
  ```bash
  python3 /home/matias/.scripts/vox.py
  ```
  
- To display a specific amplifier's details by its index (for example, index `0`):
  
  ```bash
  python3 /home/matias/.scripts/vox.py 0
  ```

- To filter amplifiers by color (for example, 'g' for green amps):
  
  ```bash
  python3 /home/matias/.scripts/vox.py g
  ```

- To search for amplifiers containing a specific name (for example, 'VOX'):
  
  ```bash
  python3 /home/matias/.scripts/vox.py VOX
  ```

Outputs are neatly formatted for easy reading, displaying only the most relevant information.

---

> [!TIP] 
> Consider adding command-line argument validation to ensure input is handled gracefully. Additionally, expanding the dataset to include more amplifiers or adding a more interactive user interface (such as a simple CLI menu) could enhance usability.
