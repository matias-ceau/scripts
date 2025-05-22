# generate_commit_message.py

---

**generate_commit_message.py**: Generate an AI-powered git commit message from staged changes.

---

### Dependencies

- `openai`  
  → Required for interacting with the OpenAI GPT API to generate the commit message.
- `git`  
  → Script expects to be run inside a git repository with staged changes.
- `uv`  
  → This script uses `uv run` as the shebang interpreter for Python dependency and environment management.
- `python >= 3.12`  
  → As specified in the script header for compatibility.

---

### Description

This script automates the process of generating concise and relevant git commit messages using OpenAI's GPT-4 model. It inspects the current staged changes in your git repository (via `git diff --cached`), formats them into a prompt, and sends them to the OpenAI API to obtain a summary commit message.

**Key Functions & Flow:**
- `get_staged_diff()`: Executes `git diff --cached` to retrieve the current staged changes. Exits with an error if git fails.
- `generate_commit_message(diff)`: Uses the OpenAI API, authenticating via the `OPENAI_API_KEY` environment variable. It sends the staged diff as context and requests a concise commit message.
- The output is printed directly to standard output, making it easy to copy, pipe, or use in pre-commit hooks.

**Notes:**
- The script must be run in an environment where the `OPENAI_API_KEY` environment variable is set.
- Communication with OpenAI is via their official Python library.

---

### Usage

#### Basic Usage

```sh
uv run --script --quiet /home/matias/.scripts/bin/generate_commit_message.py
```
Or, if you have it in your `$PATH`:
```sh
generate_commit_message.py
```

#### Step-by-Step

1. Stage your changes:
    ```sh
    git add <files>
    ```
2. Run the script:
    ```sh
    generate_commit_message.py
    ```
3. The generated commit message will be printed. You can pipe it into `git commit`:
    ```sh
    git commit -m "$(generate_commit_message.py)"
    ```

#### Tips for qtile
- Consider mapping this script to a keybinding in your terminal launcher for extra productivity on Arch with qtile.

---

> [!TIP]
>
> - **Dependency on OpenAI API**: While powerful, this script will fail if the API key is absent or invalid, or if there are network issues. Consider adding a more comprehensive error message, and possibly a local fallback (e.g., generate a basic summary using `git` itself) for offline usage.
>
> - **Handling Large Diffs**: If your staged diff is large, the OpenAI API may truncate input or increase latency. A warning or diff size check might be helpful.
>
> - **Model Hardcoding**: Model name `gpt-4.1-mini` is hardcoded; allowing this as a parameter or via envvar would increase flexibility.
>
> - **Custom Prompt**: For specialized commit message formats (e.g. Conventional Commits), consider making the prompt customizable.
>
> - **Testing**: There is no formal test or dry-run mode. Adding a test flag could be handy to check API connectivity, etc.
>
> Overall, for a daily workflow on Arch/qtile, this is both ergonomic and quite powerful!