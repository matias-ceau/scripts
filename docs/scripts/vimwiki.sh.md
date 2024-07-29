# vimwiki.sh

# Open a Note in Vim with fzf

This script allows you to easily open a note in Vim using `fzf` to quickly search and select a note from your `~/notes` directory.

## Usage

Simply run the script from your terminal. It will use `fzf` to provide an interactive fuzzy search interface to select a file from your `~/notes` directory, and then open the selected file in Vim.

```sh
./script.sh
```

### Detailed Steps

1. **List Notes**: The script lists all files in the `~/notes` directory.
2. **Select Note**: It uses `fzf` (a command-line fuzzy finder) to provide an interactive search interface, allowing you to quickly find and select a note.
3. **Open in Vim**: Once a note is selected, the script opens it in Vim for editing.

## Prerequisites

- **fzf**: You need to have `fzf` installed. You can install it using a package manager like `brew`, `apt`, or `yum`.
  
  ```sh
  # For macOS using Homebrew
  brew install fzf

  # For Debian/Ubuntu
  sudo apt-get install fzf

  # For CentOS/Fedora
  sudo yum install fzf
  ```

- **Vim**: Ensure that Vim is installed on your system.

## Installation

1. **Clone Repository** (If the script is part of a repository):

    ```sh
    git clone https://github.com/yourusername/yourrepository.git
    cd yourrepository
    ```

2. **Make the Script Executable**:

    ```sh
    chmod +x script.sh
    ```

## Example

If you have notes like `meeting-notes.txt`, `project-idea.md`, and `todo.txt` in your `~/notes` directory, running the script will allow you to search and select from these notes:

```sh
./script.sh
```

You will see an interactive `fzf` interface listing your notes. Start typing to filter and select the note you want to open, and Vim will launch with the selected note.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

Please feel free to create a pull request or an issue if you have any suggestions for improvements or if you find any bugs.

## Acknowledgements

- [fzf](https://github.com/junegunn/fzf): A command-line fuzzy finder
- [Vim](https://www.vim.org/): A highly configurable text editor

---

Happy Note Taking!

