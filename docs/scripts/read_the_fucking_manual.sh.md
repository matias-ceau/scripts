# RTMF: Read The Fucking Manual History Query Tool

---

**read_the_fucking_manual.sh**: Query and analyze your `man`/`batman` usage history for most searched entries.

---

### Dependencies

- `bat` — Enhanced `cat` clone, used here to pretty print help.
- `ripgrep` (`rg`) — Fast, recursive search tool for filtering and searching entries.
- `sed`, `awk`, `cut`, `sort`, `uniq` — Standard Unix command-line tools for parsing and analyzing your shell history.
- Your shell (`bash` and/or `zsh`) must store history files at `$XDG_STATE_HOME/bash/history` and `$XDG_STATE_HOME/zsh/history`.  
- Optional: `batman` (`bat` + `man`), if you also use that for reading manuals.

---

### Description

This script aggregates and analyzes your usage of `man` and `batman`, helping you identify which manuals you check the most. It parses your history files (both Bash and Zsh), extracts invocations of `man` and `batman`, and summarizes how often each manual page is looked up.

Key features:
- **Top searches**: Displays your most frequently referenced manual pages.
- **Threshold filtering**: Show only entries above a certain number of searches.
- **Flexible search**: Pass any arguments, and they are sent to `ripgrep` for powerful filtering.
- **Customizable count**: Show as many (or as few) results as you want.

#### How it works
- Combines history from Bash and Zsh.
- Pulls out all manual lookups (`man` or `batman` commands), ignoring options and only capturing the main entry/page.
- Counts and sorts entries, so you immediately see which tools you reference the most.

---

### Usage

```
$ read_the_fucking_manual.sh
# Show the 10 most searched manual entries

$ read_the_fucking_manual.sh -n 20
# Show the top 20 most searched

$ read_the_fucking_manual.sh --all
# Show all searched manual pages sorted by frequency

$ read_the_fucking_manual.sh --more-than 2
# Show all entries searched more than twice

$ read_the_fucking_manual.sh ls
# Search for entries matching "ls" pattern (uses ripgrep)

$ read_the_fucking_manual.sh -h
# Show help text in a pretty way (via bat)
```

You can run this script interactively in a terminal or bind it to a key in Qtile for quick access.

---

> [!TIP]
> 
> - The script assumes your Bash and Zsh history files are located at `$XDG_STATE_HOME/bash/history` and `$XDG_STATE_HOME/zsh/history`, which may not match your current setup (default is usually `$HOME/.bash_history`/`.zsh_history`). Consider making this configurable or more autodetecting.
> - Filtering out arguments after man/batman may sometimes drop intended multi-word lookups (like `man git log`), so the counting is on the first word after `man`.
> - No colored output except for the help section; you might want to add color to the frequency column for clarity.
> - Edge case: If `$2` isn't set for some options, the script might misbehave. Add input validation for safer argument parsing.
> - Consider supporting other shells or making the history path override via env variable or script argument.
