# pyman.sh: Python Manual Navigation Script

---

**pyman.sh**: A utility script to browse Python documentation, keywords, topics, and packages.

---

### Dependencies

- `python`: Required for obtaining version information, documentation, and built-in modules.
- `pydoc`: For fetching Python documentation and associated data.
- `bat`: Used to colorize and preview outputs.
- `sed`: Text stream editor for parsing and replacements.
- `tr`: To transform strings.
- `sort`, `uniq`, `cut`: Core Linux utilities used for text processing.
- `fd`: A fast alternative to `find` for directory traversal.
- `rg` (ripgrep): For fast pattern searching.
- `fzf`: Fuzzy finder for interactive navigation.
- `ranger`: (Optional) For browsing directories once selected.

---

### Description

`pyman.sh` is a powerful script designed for Python developers on Arch Linux with `qtile` setup to navigate Python documentation and inspect Python libraries dynamically. Here's what the script does:

- Detects the installed Python version and configures the correct `site-packages` path for library inspection.
- Provides functions to:
  - List Python *topics* via `get_topics()`
  - Show Python *keywords* using `get_keywords()`
  - Inspect libraries in `site-packages` with `get_site_packages()`
  - Explore *submodules* within selected libraries using `get_submodules()`
  - View Python *built-in functions* and objects using `get_builtins()`
- Integrates a robust preview mechanism using `bat` to view details of selected items (documentation or code), dynamically adapting language for `rst`, `man`, or Python files.
- Utilizes `fzf` for an interactive UI, offering keybindings to switch between:
  - *Built-ins* - ALT+B
  - *Keywords* - ALT+K
  - *Topics* - ALT+T
  - *Libraries* (site-packages) - ALT+L
  - *Modules* - ALT+M (within a library)
- Offers multiple utilities for better code exploration:
  - Preview source files (`bat`)
  - Open directories in `ranger` if selected.
  - Dynamic prompts and labels to track the current context.

---

### Usage

Run the script interactively for navigation:

```bash
bash /home/matias/.scripts/bin/pyman.sh
```

Keybindings for `fzf`:

- **ALT + L**: Load `site-packages` libraries.
- **ALT + B**: Show built-in Python functions or objects.
- **ALT + T**: Explore Python topics.
- **ALT + K**: List Python keywords.
- **ALT + M**: View submodules (within selected library-category).
- **CR (Enter)**: Open the corresponding source/document in `bat` or `ranger`.
- **ALT + P**: Enable/Disable Preview.

The script auto-refreshes library content as you switch contexts.

---

> [!TIP]
> - **Optimization**: The script generates cache files on every run unnecessarily when they are not used later—consider removing or using them.
> - **Error Handling**: Add better error handling; for example, provide warnings for missing dependencies (e.g., `fd`, `bat`, `fzf`, `rg`).
> - **Customization**: Configuration can be made modular by externalizing keybindings, colors, or paths as parameters to avoid hardcoding.
> - **Performance**: Multiple `sed` and `rg` calls could be optimized for faster processing.