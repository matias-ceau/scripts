# Vox Amp Options List

---

**vox.py**: A Python script to list and describe Vox amp options in a formatted manner.

---

### Dependencies

- `pandas`: A powerful data manipulation library for Python. It is used to create and manage a DataFrame for the amp options.
- `tabulate`: A library to display data in a tabular format for better readability in the console.

### Description

The `vox.py` script provides an interactive command-line interface to list and describe various Vox amplifier models. Featuring an internal DataFrame constructed with the names, modes, colors, and descriptions of different amp models, the script allows users to query information quickly and effectively.

The main functionalities include:

- Displaying a brief description of each amp model when no arguments are provided.
- Extracting detailed information about a specific amplifier when the corresponding index is provided.
- Filtering amplifier models based on their color (represented as a single character).
- Searching amp names by partial strings input by the user.

The program achieves this by leveraging pandas for data management and tabulate for rendering neat tables in the terminal.

### Usage

To run the script, execute it from the command line. The following examples illustrate its usage:

1. **List All Amplifier Options:**

```bash
python vox.py
```

2. **Get Details for a Specific Amp by Index (e.g., index 5):**

```bash
python vox.py 5
```

3. **Filter by Color (e.g., green 'g'):**

```bash
python vox.py g
```

4. **Search Amp Names by Partial Match:**

```bash
python vox.py CLEAN
```

For any of these commands, the output will be formatted in an easy-to-read table, making it simple to compare and choose amp options.

---

> [!TIP]  
> The script could benefit from improved input validation and error handling. Specifically, it would be helpful to notify users when an out-of-range index is supplied or when no amps match the search query. Additionally, consider allowing the script to support more flexible color options for the filtering feature. This way, user experience will be enhanced significantly.