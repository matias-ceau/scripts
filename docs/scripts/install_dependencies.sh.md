# Install Core Utilities and Apps

---

**install_dependencies.sh**: Bash script to bulk-install essential terminal and desktop utilities.

---

### Dependencies

- `paru`: An AUR helper for Arch Linux, used for package management.
- The script also installs the following packages (listed for reference, as they are dependencies of the script use-case, not the script execution):

  - `git` (version control)
  - `fd` (faster `find`)
  - `bat` (cat clone with syntax highlighting)
  - `fzf` (fuzzy finder)
  - `ripgrep` (fast search)
  - `neovim` (text editor)
  - `chezmoi` (dotfiles manager)
  - `dmenu` (launcher menu)
  - `findutils` (modern find/xargs)
  - `rofi` (powermenu/launcher)
  - `dunst` (notification daemon)
  - `python-pandas` (data manipulation)
  - `python-colorama` (terminal coloring)
  - `light` (screen backlight control)
  - `xdotool` (simulate keyboard/mouse input)

### Description

This script is a straightforward tool for quickly provisioning a new or existing Arch Linux system (in your case optimized for a qtile-based setup) with a suite of essential desktop, editor, launcher, and utility tools.

It works by passing a list of key packages via a Bash here-document directly into `paru`, which will install only those not already present (`--needed`). Using process substitution, the list is assembled and piped persistently and efficiently into `paru`.

The approach lets you easily update the set of "must have" packages for your workflow by simply adding or removing lines from the here-document.

### Usage

Run the script with:

```bash
~/.scripts/bin/install_dependencies.sh
```

- **Interactive:** The script can be run in a terminal and will prompt for password if required by `paru`.
- **Automating dotfiles:** It pairs well with dotfiles bootstrapping (e.g., as part of a chezmoi setup or post-install routine).

#### Adding more packages

Simply add new lines in the `cat <<EOF` block before `EOF`.

#### Example tldr

```sh
# To ensure you've got all tools for your qtile+Arch setup:
bash ~/.scripts/bin/install_dependencies.sh
```

---

> [!TIP]  
> The script is effective but assumes `paru` is already installed—perhaps document or check for this explicitly. Error handling and reporting could also be improved (e.g., warn about missing `paru` or failed installs). Finally, for greater flexibility, consider accepting package names as arguments or allowing for grouped lists (e.g., "minimal"/"full").