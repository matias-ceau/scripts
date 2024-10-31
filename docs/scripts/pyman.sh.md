# Python Manual Browser (pyman.sh)

---

**pyman.sh**: A script to browse Python documentation topics, keywords, built-in functions, and site-packages using `fzf`.

---

### Dependencies

The script requires the following dependencies:
- `python`: Provides the ability to run Python commands.
- `pydoc`: Python documentation tool for the built-in pydoc server.
- `bat`: A `cat` clone with syntax highlighting and Git integration.
- `fd`: A simple, fast, and user-friendly alternative to `find`.
- `rg` (Ripgrep): A fast tool for searching files.
- `fzf`: A command-line fuzzy finder.
- `ranger`: A file manager with a VI keybindings.

### Description

This script, `pyman.sh`, is designed to help users explore Python documentation by providing a convenient interface that shows topics, keywords, built-in functions, and site-packages from the installed Python version. It utilizes the `fzf` fuzzy finder to allow easy navigation and retrieval of documentation content. The script sets a cache directory and generates caching paths to temporarily store session-specific data.

Several functions are defined to fetch different Python-related information:
- **`get_topics()`**: Retrieves Python documentation topics.
- **`get_keywords()`**: Retrieves Python keywords.
- **`get_site_packages()`**: Lists installed Python packages in the site-packages directory.
- **`get_submodules()`**: Lists submodules of a given package.
- **`get_builtins()`**: Lists Python built-in functions.

`fzf` is used to present this information to the user and allows filtering and previewing through the `bat` utility. The script is intended to be interactive and is executed in a shell environment.

### Usage

Run the script directly from the terminal to start the interactive documentation browser:

```bash
./pyman.sh
```

Inside the `fzf` interface:
- Use `Alt-l` to load site-packages, `Alt-b` for built-ins, `Alt-k` for keywords, and `Alt-t` for topics.
- Navigate between options and press `Enter` to view detailed information.
- To view a file in the terminal, `bat` is used with colorized output, while directories open with `ranger`.
- Use `Alt-m` to view submodules. 

Ensure the script has executable permissions:

```bash
chmod +x /home/matias/.scripts/bin/pyman.sh
```

---

> [!CAUTION]  
> One potential improvement for the script could be to handle edge cases such as missing commands or incorrect environment variables more gracefully. Additionally, relying on specific versions of `fzf` and `bat` may cause compatibility issues if they are updated significantly. Consider adding version checks or documentation on compatible versions.