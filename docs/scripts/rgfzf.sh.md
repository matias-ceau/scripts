# rgfzf.sh

---

**rgfzf.sh**: Search files with Ripgrep, filter with fzf, and open in Vim.

---

### Dependencies

- `rg`: This is the Ripgrep tool used for searching text in files. It is highly efficient and fast, making it suitable for large codebases.
- `fzf`: A command-line fuzzy finder that is used to interactively filter results from the Ripgrep output.
- `nvim`: Neovim, an extension of Vim, which is used to open the selected files. (You can adjust this to use Vim instead if preferred)
- `bat`: A cat clone with syntax highlighting, used for previewing files in fzf.

### Description

The `rgfzf.sh` script is a powerful command-line utility that enhances the text searching experience on Arch Linux systems, particularly for users running the Qtile window manager. By leveraging the speed of Ripgrep for searching and the interactive capabilities of fzf for narrowing down results, this script allows you to quickly find and open files directly in Vim (or Neovim).

1. **Search**: It uses `rg` to search through files for the specified text input.
2. **Filter**: The output from `rg` is passed to `fzf`, allowing the user to filter results interactively.
3. **Preview**: Users can see a live preview of the file content using `bat` integrated with fzf.
4. **Open**: Selected files and lines can be opened directly in Vim (or Neovim) by pressing `Enter`.

### Usage

To use this script, simply execute it from the terminal with the text you wish to search for. Here’s a basic usage example:

```bash
./rgfzf.sh "search_term"
```

This command will search for "search_term" in the current directory and allow you to interactively select and open the desired result in Neovim.

If no search term is provided, it will display all files for selection.

#### Key Bindings in fzf:
- Press `Enter` after selecting a line from fzf to open the selected file in Neovim at the respective line number.

---

> [!TIP]  
> Consider checking if tools like `bat` and `fzf` are installed before executing the search commands. Adding error handling can improve user experience, making it clear which dependencies are missing. Additionally, giving the user the option to choose between Vim and Neovim would increase flexibility.