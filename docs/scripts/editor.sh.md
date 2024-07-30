# editor.sh

# Edit Files with Fuzzy Finder

This script allows you to edit any file in the current folder or its subfolders recursively using `vim` and `fzf`.

## Description

This script provides a convenient way to search for and edit files within the current directory and its subdirectories. It utilizes the `find` command to list all files and directories, and pipes the list to `fzf`, an interactive fuzzy finder. This allows you to quickly search through your files and, upon selection, open your chosen file in `vim` for editing.

## Usage

Execute the script from the command line:

```sh
./edit-file.sh
```

Please ensure that the script has executable permissions. You can set them with:

```sh
chmod +x edit-file.sh
```

## Dependencies

The script relies on the following tools:

- **`vim`**: A highly configurable text editor.
- **`find`**: A command-line utility to search for files in a directory hierarchy.
- **`fzf`**: A command-line fuzzy finder. You can install `fzf` using your package manager.

## Example

When you run the script, it will present you with an interactive fuzzy finder interface powered by `fzf`. Start typing the name of the file you wish to edit, and `fzf` will filter the list in real-time. Press `Enter` to open the selected file in `vim`.

## Script Code

```sh
#! /bin/sh

#INFO:#@CLI@ "Edit any file in current folder or subfolders (recursively)"

vim "$( find 2>/dev/null | fzf )"
```

## Disclaimer

Make sure all dependencies are installed and properly configured before running the script. This script assumes that you have basic proficiency with command-line operations and the `vim` editor.



