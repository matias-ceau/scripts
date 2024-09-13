# Pacman Fuzzy Search Script

---

**pacman-fuzzy-search.sh**: A script to perform fuzzy searches for Arch Linux packages using fzf

---

### Dependencies

- `pacman`: The package manager for Arch Linux, required for package management operations.
- `fzf`: A command-line fuzzy finder that allows for interactive searching and previewing.

### Description

This script provides an interactive fuzzy search interface for Arch Linux packages. It utilizes `fzf` for the graphical selection of packages combined with `pacman` commands to fetch and display package details. 

The script defines a custom print format for displaying package information such as repository, package name, build date, description, and other relevant metadata. This is achieved through the use of `pacman -Sp --print-format`, which formats the output based on the specified template. 

The user can type a search query to filter the list of packages, and upon selection, a preview pane displays detailed information for the chosen package which enhances the usability of package searching.

### Usage

Run the script by executing the following command in your terminal. You can optionally pass a query parameter to filter the results:

```bash
./pacman-fuzzy-search.sh [search_term]
```

When called without arguments, it lists all packages. To refine the search, provide a specific term:

```bash
./pacman-fuzzy-search.sh vim
```

The script outputs a listing of packages matching the search term. Upon highlighting a package in the list, you can view detailed information in the preview pane.

---

> [!TIP]  
> The script currently lacks error handling for cases where `fzf` or `pacman` may not be installed. Consider adding checks to ensure these dependencies are present before execution. Additionally, enhancing the preview window's information could improve user experience, as right now it shows basic package details only.