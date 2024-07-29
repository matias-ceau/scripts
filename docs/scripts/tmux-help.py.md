# tmux-help.py

# tmux-help

A script to assist with tmux commands by providing easy access, searching, and organizing tmux manpage content.

## Description

`tmux-help` is a Python script designed to improve your tmux experience by organizing and facilitating the search for tmux commands and keybindings. This script can list tmux commands, search for specific commands using either exact or fuzzy search, and categorize commands based on their functionalities. It also allows for updating and displaying distinct sections of the tmux manpage.

## Features

- **List tmux commands**: Display tmux commands in their original order or sorted by functionality.
- **Search commands**: Perform fuzzy or exact searches for specific tmux commands or keywords.
- **Section display**: List all sections of the tmux manpage or display a specific section.
- **Update manpage**: Automatically update the tmux manpage and its sections.
- **Logging**: Errors and actions are logged for future reference.

## Installation

Ensure you have the required dependencies:

```bash
pip install fuzzywuzzy
pip install python-levenshtein
```

Clone the repository to your local machine:

```bash
git clone https://github.com/yourusername/tmux-help.git
cd tmux-help
```

## Usage

Run the `tmux-help` script with appropriate arguments:

```bash
./tmux-help.py [options]
```

### Options

- `-L, --list-tmux`: List tmux commands in the original order.
- `-f ARG, --find ARG`: Fuzzy search the keyword descriptions.
- `-F ARG, --find-exact ARG`: Search for exact match (case insensitive).
- `-s KEY, --search KEY`: Search for the key and return the result.
- `-u, --update`: Update tmux manpage and sections.
- `-S [SECTION], --section [SECTION]`: List all sections or display a specific section by number or name.

### Examples

1. **List all tmux commands in original order**:

    ```bash
    ./tmux-help.py -L
    ```

2. **Fuzzy search for a keyword**:

    ```bash
    ./tmux-help.py -f "split"
    ```

3. **Exact search for a keyword**:

    ```bash
    ./tmux-help.py -F "new-window"
    ```

4. **Search for a specific key**:

    ```bash
    ./tmux-help.py -s "C-b"
    ```

5. **Update the tmux manpage and sections**:

    ```bash
    ./tmux-help.py -u
    ```

6. **List all sections**:

    ```bash
    ./tmux-help.py -S
    ```

7. **Display a specific section**:

    ```bash
    ./tmux-help.py -S 1
    ```

## Configuration

The script uses a data directory located at `~/.scripts/config/tmux-help/data` to store the full tmux manpage, sections, and logs. Ensure the necessary directories and files are created and populated correctly by running the script once.

## Logging

Logs are stored in `~/.scripts/config/tmux-help/data/tmux-help.log` and can be used to track errors and important actions taken by the script.

## Contributing

Feel free to submit issues or pull requests to contribute to this project. All contributions are welcome!

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

*Made with ❤️ by [yourname](https://github.com/yourusername)*