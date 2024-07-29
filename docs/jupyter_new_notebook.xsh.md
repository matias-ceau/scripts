# jupyter_new_notebook.xsh

**Script Description**

This is a Xonsh script, which is a Unix-like shell written in Python. The script is designed to create a new Jupyter Notebook file and open it in Chromium.

**Functionality**

Here's what the script does:

1. **Get project directory**: It sets `PROJECT_PATH` to the user's home directory plus "/projects".
2. **Prompt for notebook name**: Using `dmenu`, it prompts the user to enter a name for the new notebook file.
3. **Create notebook file if not exists**: If a name is provided, it checks if a file with that name already exists in the project directory. If not, it creates a new empty Jupyter Notebook file using the `empty_nb` JSON string and saves it to the specified path.
4. **Open notebook in Chromium**: Finally, it opens the newly created notebook file in Chromium using the `jupyter-notebook` command.

**Error Handling**

If no name is provided through `dmenu`, or if a notebook with that name already exists, the script will display an error notification using `notify-send`.