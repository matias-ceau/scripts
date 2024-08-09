# New Script Creator

---

**new_script_creator.sh**: A simple script to create new scripts with directory linking

---

### Dependencies

- `bat`: A command-line tool to view files with syntax highlighting.
- `nvim`: The Neovim text editor, used for editing the newly created scripts.
  
### Description

The **new_script_creator.sh** script is designed to streamline the process of creating new shell scripts within a specified directory. The script sets up a template using **Neovim** for editing and, upon creation, links the script to the user's local bin for easy execution.

Key features:
- **Usage Function**: Displays a help message showing how to use the script.
- **Script Creation**: Takes one argument (the name of the new script), opens a new file in a specified location, and checks if the file is created successfully.
- **Permissions and Linking**: If the newly created script is not empty, it sets the file as executable and creates a symbolic link in `~/.local/bin`, allowing for easy access.

### Usage

To use the script, run it from the command line followed by the desired script name you wish to create. 

```bash
./new_script_creator.sh my_new_script.sh
```

If the script is created successfully, it will be opened in Neovim for editing. If there's any content in the script file, it will also set executable permissions and create a link to the script in your local bin. If the file is empty, it will notify you that no script was created.

```bash
# Example Usage
./new_script_creator.sh my_script.sh
```

---

> [!TIP]  
> The script currently lacks error handling for file creation failures and validating that `$SCRIPTS` directory exists. These checks should be added to improve robustness. Additionally, consider implementing a templating feature to add boilerplate code customized to the type of scripts you frequently create, enhancing the initial setup process.