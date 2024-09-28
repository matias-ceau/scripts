# Python Manual Script for Arch Linux

---

**pyman.sh**: Navigate and explore Python documentation and site-packages interactively.

---

### Dependencies

- `python`: The main programming language interpreter.
- `pydoc`: Provides help documentation for Python modules.
- `bat`: A cat clone with syntax highlighting and Git integration.
- `fd`: A simple, fast, and user-friendly alternative to find.
- `rg` (ripgrep): A line-oriented search tool.
- `fzf`: A command-line fuzzy finder.
- `ranger`: A console file manager with VI key bindings.
- `sed`, `tr`, `cut`, `sort`, `uniq`, `notify-send`: Various Unix utilities used within script for text processing and notifications.

### Description

The `pyman.sh` script acts as a robust tool for browsing and interacting with Python documentation and installed site-packages in an Arch Linux environment. It utilizes a combination of shell scripting and command-line utilities for displaying Python topics, keywords, site-packages, and built-in functions with enhanced formatting and preview capabilities.
  
- **Environment Setup**: The script initializes by setting variables for the shell, the Python version and related directories, ensuring that the correct Python environment is utilized.
  
- **Functions**: It defines several functions such as `get_topics`, `get_keywords`, `get_site_packages`, `get_submodules`, and `get_builtins` to retrieve and format Python-related data.
  
- **Fuzzy Finder Integration**: The `fzf_cmd` function crafts an interactive user interface, leveraging `fzf` to provide a responsive and visual way to navigate documentation and code files with rich previews using `bat`.

### Usage

Run the script in a terminal to launch the interface:
```bash
bash /home/matias/.scripts/pyman.sh
```

- Use **Alt**+**L** to view libraries, **Alt**+**B** for built-ins, **Alt**+**K** for keywords, and **Alt**+**T** for topics.
- Select items to get detailed documentation, highlighted and paginated with `bat`.
- Use **Alt**+**P** to toggle previews, resizing them with the resize bindings.

This script can be assigned to a keybinding using `qtile` for easier access.

---

> [!NOTE]
> The script assumes `fzf`, `bat`, and `rg` are installed, which might not be available by default. Consider adding checks or installation prompts for these dependencies. Additionally, using `bat` assumes that highlighted syntax files are correctly configured for different languages (`rst`, `man`, `python`), which requires proper setup.