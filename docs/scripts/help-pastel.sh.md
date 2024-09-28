# Pastel Help Script with Fuzzy Finder

---

**help-pastel.sh**: Enhances `pastel` command help with syntax highlighting and interactive selection.

---

### Dependencies

- `pastel`: A color tool for shell that generates, analyzes, and transforms colors.
- `ripgrep` (`rg`): A fast search tool that respects your `.gitignore`.
- `bat`: A cat(1) clone with syntax highlighting and Git integration.
- `fzf`: A command-line fuzzy finder.
- `display_markdown`: A hypothetical utility to render markdown files to the console.
- `curl`: A command-line tool for transferring data with URLs.

### Description

This script elevates the standard `pastel` help by integrating syntax highlighting and an interactive selection interface via `fzf`. It dynamically selects the help section starting from the 'SUBCOMMANDS' line and presents it with `bat` for enhanced readability. Further, it excludes certain lines with `rg` and prepares them for `fzf`.

Upon selection in `fzf`, it differentiates between command and README display based on whether "README" is in the selection. Commands invoke `pastel {subcommand} --help` with enriched presentation, while selecting "README" fetches and displays the remote README of `pastel` using `display_markdown`.

### Usage

To run this script, execute it directly from the terminal:

```sh
~/.scripts/help-pastel.sh
```

Usage involves selecting a command or "README" from the displayed list. Navigation and selection are managed via `fzf`:

- Use `↑` and `↓` to navigate.
- Press `Enter` to select a line and see the relevant information.
  
> _tldr_: Execute `help-pastel.sh` for an interactive `pastel` documentation experience.

---

> [!TIP]
> - **Optimization**: Consider replacing `${line_number}:` with a direct pipeline to only focus on necessary lines.
> - **Error Handling**: Add error checks for the availability of internet when accessing remote resources.
> - **Portability**: The use of `bash` specific features limits portability to other systems using different shells. Consider using POSIX-compliant features where possible to increase compatibility.