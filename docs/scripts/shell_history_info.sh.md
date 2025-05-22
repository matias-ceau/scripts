# Shell History Analyzer

---

**shell_history_info.sh**: Analyze and summarize the most frequent lines, words, or characters in your shell command history files.

---

### Dependencies

- `rg` (ripgrep): For fast text filtering and searching.
- `bat`: Enhanced cat clone with syntax highlighting (only used for displaying usage/help).
- `sed`, `uniq`, `sort`, `tr`, `cat`: Core Unix utilities for text processing.
- Uses the environment variable `$XDG_STATE_HOME` to locate `zsh` and `bash` history files.

---

### Description

This script provides a quick way to inspect and quantify command history usage patterns across both `bash` and `zsh` on your Arch Linux system. By removing shell-specific metadata (especially from zsh history), it presents cleanly sorted frequency reports for:

- Full command lines (`-l`, `--lines`)
- Individual words in commands (`-w`, `--words`)
- Single character occurrences (`-c`, `--character`)
- Command-line options/flags (beginning with `-`) (`-o`, `--option`)

The script defines modular helper functions for fetching history, splitting words, cleaning up whitespace, and sorting/displaying by usage count.

Lines with occurrences fewer than 6 are filtered out, providing a focused look at your habitual command patterns.

---

### Usage

The script is primarily designed to be run from the terminal. Typical invocations:

```bash
# Most frequently used full command lines
shell_history_info.sh --lines

# Most common words in commands
shell_history_info.sh --words

# Most common single characters
shell_history_info.sh --character

# Frequently used command options (flags)
shell_history_info.sh --option
```

**tldr:**
```
shell_history_info.sh -l   # lines
shell_history_info.sh -w   # words
shell_history_info.sh -c   # characters
shell_history_info.sh -o   # options starting with '-'
```

If given an incorrect or missing argument, the script will print out inline usage information with syntax highlighting via `bat`.

To integrate with qtile keybindings, simply map the script invocation with the desired arguments to an appropriate `Key` definition.

---

> [!NOTE]
> **Critique:**  
> - The explicit use of `$XDG_STATE_HOME` assumes it is set, which may not always be the case. Consider providing a fallback (such as `~/.local/state`) or checking `~/.bash_history` and `~/.zsh_history` if the standard variables aren't found.
> - Grepping for command-line options by only looking for words starting with `-` may capture non-option strings if user commands contain such patterns.
> - The dependency on `bat` is only for pretty-printing the help section and could be optional or replaced by `less`/`cat` for broader compatibility.
> - Command filtering (occurrences `< 6` are removed) is hardcoded, which could be improved with a user argument to set the threshold.
> - The script ignores multi-line history entries and may produce duplicate matches if history files are large and messy; consider deduplication or smarter parsing if needed.