# Generate Commit Message

---

**generate_commit_message.sh**: Script to generate commit messages using OpenAI's GPT-4o-mini

---

### Dependencies

- `git`: Used to determine modified files and changes.
- `curl`: Required to make API calls to OpenAI services.
- `jq` (commented out but mentioned): Typically used for parsing JSON outputs which may be intended for future use.
  
### Description

This script is designed to automate the generation of commit messages in a git repository using OpenAI's model. It navigates to the specified repository directory, checks for an environment variable named `OPENAI_API_KEY`, and proceeds if set. The script lists modified files and retrieves detailed changes except for files with `.md` extensions, which are labeled as documentation changes.

The change information is then formatted and sent to OpenAI's API to receive a commit message that adheres to standard conventions: a succinct summary, followed by a blank line, and a detailed description focusing on the "what" and "why" of changes.

### Usage

To use this script, execute it from the terminal providing the repository directory path as an argument:

```bash
~/.scripts/bin/generate_commit_message.sh /path/to/your/repo
```

Ensure that:

1. The `OPENAI_API_KEY` is exported in your shell environment.
2. Git working directory is clean and contains modified files ready for commit.
3. You have `curl` installed on your system.

The script can be integrated with qtile as a keybinding or used interactively in a terminal. 

Example on Arch Linux with a bash shell:

```bash
export OPENAI_API_KEY="your_openai_api_key"
~/.scripts/bin/generate_commit_message.sh ~/projects/my-repo
```

---

> [!TIP]
> The script currently doesn't handle API response parsing as the `jq` parts are commented out. For full automation, enable these sections to parse and display commit messages. Additionally, consolidate multiple `--json` options into a single structured JSON object for clarity and reliability. Consider implementing error handling for network issues during the API call.