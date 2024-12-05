# OpenAI Models Listing Script

---

**list-openai-models.sh**: List available OpenAI models, caching results for efficiency

---

### Dependencies

- `openai`: OpenAI CLI tool for interacting with OpenAI's API.
- `jq`: A lightweight and flexible command-line JSON processor.
- `bat`: A `cat` clone with syntax highlighting and Git integration.
- `sed` and `tr`: Standard Unix utilities for text processing.

### Description

This script fetches and lists available models from the OpenAI API, storing the results in a cache to avoid fetching data unnecessarily. It uses `openai api models.list` to retrieve a list of models, with their creation date and ID. The results are processed by `jq` to extract the necessary fields, converted into a TSV format, and then sorted and cached.

The cache file, `openai-model-list.tsv`, is stored in the directory specified by the `XDG_CACHE_HOME` environment variable. If the cache file is less than 24 hours old, the script displays the cached list using `bat`, otherwise, it updates the cache by calling `gen-model-list`.

### Usage

To use this script, make sure the `openai`, `jq`, and `bat` utilities are installed and the OpenAI API key is correctly configured through the OpenAI CLI.

Run the script from the terminal:

```bash
bash /home/matias/.scripts/bin/list-openai-models.sh
```

The script can be used interactively and outputs the list of models in a formatted TSV, highlighting through `bat`.

For integration with qtile or keybindings, consider assigning a hotkey to execute this script directly, adapting your configuration setup to suit frequent queries.

---

> [!NOTE]
> - The script assumes the presence of a valid API key and proper configuration of the OpenAI CLI.
> - Using `jq -c '.["created", "id"]'` is incorrect syntax. Instead, it should properly map to the JSON data structure. Similarly, be aware of potential errors in generation processing. Double-check the JSON keys and adapt any transformations.
> - The cache creation logic should consider using `mktemp` or ensuring the directory exists.
> - The use of `tr` and `sed` is a bit complex, simplifying this processing segment can improve maintenance. Consider testing with edge cases or adding verbose output for troubleshooting.