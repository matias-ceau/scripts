# Generate Commit Message Script

---

**generate_commit_message.py**: Automates the creation of git commit messages based on staged changes using OpenAI's GPT model.

---

### Dependencies

- `python >= 3.12` : Required for script execution.
- `openai` : A Python client for interacting with OpenAI's API. Must be installed via pip (`pip install openai`).
- `git` : Used to fetch staged changes (`git diff --cached` must be available).
- Environment Variable:
  - `OPENAI_API_KEY` : This must be set with your OpenAI API key for authentication.

### Description

This script automates the creation of descriptive and concise git commit messages by leveraging OpenAI's GPT model. The script performs the following tasks:
1. Executes `git diff --cached` to fetch the current staged changes.
2. Constructs a prompt tailored for generating a meaningful commit message.
3. Sends the prompt to OpenAI's API (using a GPT model, in this case `gpt-4.1-mini`) and retrieves the suggested commit message.
4. Outputs the generated commit message to the terminal.

#### Key Functions:
- **`get_staged_diff()`**:
  - Runs `git diff --cached` to get the diff of staged changes.
  - Handles errors gracefully if `git` execution fails.
- **`generate_commit_message(diff)`**:
  - Constructs a prompt using the provided `diff`.
  - Sends the prompt to OpenAI's Chat API and extracts the resulting commit message.
- **`main()`**:
  - Coordinates fetching the diff, generating a commit message, and printing it.

### Usage

#### Prerequisites:
1. Ensure you have `python >= 3.12` installed.
2. Install required Python dependencies:
   ```bash
   pip install openai
   ```
3. Set the `OPENAI_API_KEY` environment variable:
   ```bash
   export OPENAI_API_KEY="your_openai_key_here"
   ```

#### Running the Script:
- The script must be executed from the terminal:
   ```bash
   python /home/matias/.scripts/bin/generate_commit_message.py
   ```
- Ensure you have staged changes in your git repository before running the script. If no changes are staged, the script will exit with a warning.

#### Example Output:
```bash
$ python /home/matias/.scripts/bin/generate_commit_message.py
Fix bug in user authentication flow
```

This output is the generated commit message based on your staged changes.

#### Additional Notes:
You can integrate this script with your qtile keybindings to trigger it via a shortcut, streamlining your development workflow.

---

> [!TIP]
> - **Error Handling**: There's a lack of fallback behavior if the OpenAI API fails or returns an unexpected result. Consider adding error checks and providing a user-friendly fallback.
> - **Hardcoded Model**: The GPT model (`gpt-4.1-mini`) is hardcoded. You could allow flexible model selection via a command-line argument or environment variable.
> - **Commit Automation**: The script only generates a commit message. Adding functionality to automatically commit the staged changes (with user confirmation) could enhance usability further.
> - **Verbose Output**: When an error occurs (e.g., missing OpenAI key or failed git diff), providing clear instructions to resolve the issue would improve the user experience.