# Try the Bat Suit

---

**try_the_bat_suit.sh**: Fuzzy-finds and previews files with syntax highlighting in terminal using `bat` and `fzf`.

---

### Dependencies

- `bat`: A `cat` clone with syntax highlighting and Git integration.
- `fzf`: A general-purpose command-line fuzzy finder.
- `fd`: Simple, fast and user-friendly alternative to `find`.
- `ripgrep` (`rg`): Line-oriented search tool that recursively searches your directory.
- `sed`, `cut`: Standard Unix text processing tools (part of coreutils).
- _Optional_: Must be run under Bash; exported preview functions may require Bash-specific features.

---

### Description

This script provides an enhanced and interactive command-line tool for browsing and syntax-highlighting files, especially useful within the terminal workflow on Arch Linux and the Qtile window manager.

1. **File Selection**:
    - If a file is provided as the first argument, it’s used directly.
    - Otherwise, it invokes `fd` to produce a list of files in the current directory tree and passes this list into `fzf` for fuzzy searching. Files are displayed in color.

2. **Language Highlighting**:
    - Uses `bat --list-languages` to obtain all available syntax highlighting options.
    - Allows selection of a language in `fzf` (with blue highlighting).

3. **Preview**:
    - For each available language, it previews the chosen file with `bat` using plain output (`-pp`), applying the selected language for syntax highlighting.  
    - The preview is dynamically updated in the `fzf` pane via the Bash-exported function `preview_cmd`.

---

### Usage

Run from any terminal window. If you want to select a file using fuzzy search:
```
try_the_bat_suit.sh
```

Or specify a file directly as a parameter:
```
try_the_bat_suit.sh ~/projects/notes.md
```

_Navigating the UI:_
- When prompted, search for or select a syntax highlighting language.
- See the live syntax-highlighted preview of your file as you navigate.
- Can be assigned to a keybinding in Qtile for fast access.

#### TL;DR
```sh
# Fuzzy-pick and preview any file:
try_the_bat_suit.sh

# Preview a specific file:
try_the_bat_suit.sh myfile.py
```

---

> [!TIP]
>
> - If you cancel out of one of the two `fzf` prompts, the script exits without action—there’s no error handling for null selections.
> - The `fd` file search is rooted in the current directory; if called from home, it might produce a very long list. Consider limiting it with arguments or cd’ing to an appropriate folder before running.
> - The preview function relies on Bash and exported shell functions, which won't work in shells like Zsh unless adapted.
> - Error handling for missing dependencies (notably `bat`, `fzf`, `fd`, `rg`) could be enhanced to provide user-friendly messages.  
> - The preview logic for language parsing is somewhat brittle (`lang="-l$(...)"`); if the output format of `bat --list-languages` changes, this may break. Parsing could be made more robust.