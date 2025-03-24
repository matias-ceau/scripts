# QTile Window Extractor

---

**get-windows.sh**: Retrieves and formats window details from qtile

---

### Dependencies

- `qtile`: The window manager from which the script retrieves window data.
- `uv`: A command runner used here to execute an embedded Python snippet.
- `bash`: The shell used to execute the script.

### Description

This script is designed to extract window information from your running qtile session on Arch Linux. The script leverages qtile's command object interface by running "qtile cmd-obj -o root -f windows" to fetch details about each window. It then passes this output to an embedded Python script via `uv run -`, which processes the data.

Inside the Python snippet, the script defines a list called `keylist` consisting of window attributes: `id`, `group`, `name`, and `wm_class`. The snippet iterates over every window entry from the qtile output (stored in the variable `win`), and for each entry, it extracts only the key-value pairs where the key exists in the `keylist`. The values are then converted to strings and aggregated into sublists. Finally, the script outputs each window's details as a tab-separated line, making it easier to read or use in other command-line utilities.

This approach is particularly useful when you want to quickly list and inspect open windows within a qtile session from a command-line interface. By filtering only the essential attributes, you avoid clutter and focus on identifying windows based on their grouping, identifier, class, or name.

### Usage

To execute the script, simply run it from your terminal:

  $ /home/matias/.scripts/dev/get-windows.sh

You can also bind this script to a key in your qtile configuration. For example, add an entry in your qtile keybindings to run the script with a terminal command. The output will be printed directly to the terminal, showing each window on a new line with relevant details separated by tabs.

---

> [!TIP]
> Consider checking whether the `uv` command is installed and properly configured in your environment.
> You might also want to add error handling in case the `qtile` command fails or returns unexpected data. This would improve the script's resilience and make debugging easier if future changes occur in the qtile API.