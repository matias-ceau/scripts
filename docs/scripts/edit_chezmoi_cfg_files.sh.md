
---

Launches fzf to edit Chezmoi managed configuration files.

---

### Table of contents

- [Dependencies](#dependencies)
- [Description](#description)
    - [Overview](#overview)
    - [Usage](#usage)
    - [Examples](#examples)
- [Notes](#notes)

---

<a name="dependencies" />

### Dependencies

- `chezmoi` - to manage dotfiles.
- `fzf` - fuzzy finder for command-line.
- `bat` - enhanced cat command for syntax highlighting.
- `eza` - modern replacement for `ls`.
- `neovim` - text editor for file editing.

<a name="description" />

### Description

<a name="overview" />

#### Overview

This script facilitates the editing of configuration files managed by Chezmoi. It utilizes `fzf` to provide a fuzzy finding capability for selecting files. The script enhances user experience by showing a preview of the selected file's contents if it is a regular file, or a listing of its contents if it is a directory.

The line that launches `fzf` is particularly useful as it includes a preview window that adapts based on the type of file selected:

- **File Preview:** Uses `bat`, a powerful replacements for `cat`, to display file content with syntax highlighting and line numbers.
- **Directory Listing:** Uses `eza` to list the contents of directories in a visually appealing manner with icons.

The search begins in the Chezmoi-managed files located in the user's home directory, enabling quick navigation through configuration items.

---

<a name="usage" />

#### Usage

To use the script, simply execute it from the terminal:

```bash
/home/matias/.scripts/edit_chezmoi_cfg_files.sh
```

Depending on the output of `chezmoi managed`, it will display a list of files and directories. Upon selecting a file or directory with `fzf`, Neovim (`nvim`) will be launched to edit the chosen configuration file.

Additionally, you can bind this script to a key in your Qtile configuration for quicker access.

<a name="examples" />

#### Examples

1. **Run the Script:**
   ```bash
   /home/matias/.scripts/edit_chezmoi_cfg_files.sh
   ```

2. **Select a File:**
   - Navigate to the desired file in the `fzf` list and press **Enter** to open it in Neovim.

3. **Select a Directory:**
   - Navigate into a directory to view its contents, then select a file within it to edit.

---

<a name="notes" />

### Notes

- Ensure that all dependencies are installed and properly configured to prevent errors during execution.
- The `EDITOR` variable is set to `nvim`, which may be changed if you prefer a different editor.

> **Critique:**  
> The script could benefit from additional error handling, particularly in the context where `chezmoi` is not found or returns an empty list. A simple check before invoking `fzf` would improve robustness. Additionally, considering the possibility of enhancements like a configurable preview command would allow for more customization based on user preferences.
</template>