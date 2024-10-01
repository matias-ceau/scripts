# Generate Commit Message Script

---

**generate_commit_message.sh**: Script to generate git commit messages using OpenAI's API.

---

### Dependencies

- `git`: A version control system to manage repositories and track changes.
- `curl`: A tool to transfer data from or to a server, used here for API requests.
- OpenAI API Key: Required to authenticate requests to the OpenAI API.

### Description

This script automates the generation of git commit messages by leveraging the OpenAI API. It accepts a directory of a git repository as an argument and performs the following steps:

1. **Directory Navigation**: Changes into the specified repository directory.
2. **Environment Check**: Validates that the `OPENAI_API_KEY` is set. If it's not set, the script exits with an error message.
3. **File Modification Detection**: Uses `git diff --name-only` to list modified files since the last commit.
4. **File Information Compilation**: Iterates through each modified file and gathers changes. If the file is a markdown file (`*.md`), it notes it as a documentation change. For all other file types, it appends the changes made to that file.
5. **API Call**: Makes a POST request to the OpenAI API with a prompt designed to generate a proper commit message based on the collected file changes.

The script is primarily useful for developers who want to maintain high commit message quality while saving time.

### Usage

To use this script, follow these steps:

1. **Set your OpenAI API Key**:
   ```bash
   export OPENAI_API_KEY="your_api_key_here"
   ```

2. **Run the script with your repository directory as an argument**:
   ```bash
   /home/matias/.scripts/generate_commit_message.sh /path/to/your/repo
   ```

This command will generate a commit message considering the modifications in the specified repository.

---

> [!TIP]  
> Consider adding a feature to save the generated commit message to a new file or directly commit the changes using `git commit -m`. Additionally, the error handling could be enhanced to provide more descriptive messages for various failure situations (e.g., no modified files found).