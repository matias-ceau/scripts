# PyMan: Interactive Python Manual Navigator

---

**pyman.sh**: Interactive fuzzy finder for Python topics, keywords, builtins, and installed modules/packages.

---

### Dependencies

- `python` _(with pydoc utility)_: For module info, builtins, keywords, topics extraction
- `fzf` _(fuzzy-finder)_: UI for interactive searching and navigation
- `bat` _(cat clone with syntax highlighting)_: For previewing python/manual text nicely
- `fd` _(find alternative)_: For fast filesystem searching within site-packages
- `rg` _(ripgrep)_: For filtering/searching, used extensively in subcommands
- `ranger` _(file manager, optional)_: Opens directories inside site-packages
- `notify-send`: For quick-notification popups (feedback when navigating to source)
- `$XDG_CACHE_HOME` (recommended set)
  
> _You may want to install these via your package manager if they're missing:_
>
> ```sh
> sudo pacman -S python fzf bat fd ripgrep ranger libnotify
> ```

---

### Description

This script is designed to serve as a "manual browser" for Python within your terminal, leveraging `fzf` for live, interactive exploration of:

- Installed site-packages and their modules
- Module submodules (recursively)
- Python builtins, keywords, help topics

**Functionality Highlights:**
- Custom functions (`get_topics`, `get_keywords`, `get_builtins`, `get_site_packages`, `get_submodules`) dynamically query and format results from your system's Python install.
- `bat` provides syntax-highlighted previews of module source or documentation.
- `fzf` is extensively customized with keybinds (see Usage) for switching between "libraries, builtins, keywords, topics", entering submodules, and showing previews.
- When you choose a file, you get a preview, and can open source with `bat`, or enter directories with `ranger`.

**Custom Keybinds (fzf):**
- `Alt+l`: List all installed site-packages ("Libs")
- `Alt+b`: Python builtins list
- `Alt+k`: Python keywords
- `Alt+t`: Python help topics
- `Alt+m`: Drill into submodules (contextual to selection in "Libs")
- `Enter`: Show source file with `bat` or open directory in `ranger`
- `Alt+p`: Toggle preview pane

Python version is auto-detected; everything runs in your shell context (Qtile/Arch-friendly: *no X dependencies except notify-send*).

---

### Usage

To launch the browser:
```sh
~/.scripts/bin/pyman.sh
```
It will automatically display installed `site-packages` in an interactive fzf prompt:

- **Navigate** with arrow keys, fuzzy-search by typing
- **Preview docs/source** in the right pane (auto-wrap to terminal width)
- **Switch modes** (libs, builtins, topics, keywords) using Alt+key as described above
- **Enter** on an item to view source (or open directory in ranger if it's a package)
- **Submodules** can be browsed with Alt+m while on a package
- **Notifications** will indicate file/dir opened

> **tldr:** Launch in terminal and start exploring Python from all angles—docs, source, and more—using only your keyboard.

---

> [!NOTE]
> **Strengths:**  
> - Highly interactive and leverages your terminal environment.
> - Great use of shell/Python tools and colors for readability.
> 
> **Potential Issues & Improvements:**  
> - Assumes `python` points to the desired interpreter and uses nonstandard regex for `python -V`; might not work for Python 3.10+.  
> - Some tools (`bat`/`fd`/`ranger`) are optional, yet script will fail if missing—should ideally check for these and degrade gracefully.  
> - The recursive submodule exploration (Alt+m) could confuse users with large or nested modules; might benefit from limiting depth or adding indicators.  
> - Some functions produce lots of subshells. Could refactor heavy pipelines for efficiency and reproducibility.
> - `$XDG_CACHE_HOME` must be set or script will fail to create cache directories.
> 
> **Overall:**  
> Superb utility for Python power users! Robust and highly hackable; just needs a bit more polish and portability if you want to share it outside your own setup.