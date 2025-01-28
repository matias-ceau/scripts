# list-openai-models.sh

---

**list-openai-models.sh**: Caches and displays a list of OpenAI models, sorted by creation date.

---

### Dependencies

This script requires the following dependencies to function correctly:

- `openai`: OpenAI CLI tool, used to fetch model details from OpenAI's API.  
- `jq`: Command-line JSON processor, for parsing API responses.   
- `date`: A GNU core utility to handle timestamps effectively.  
- `tr`, `sed`, `sort`: Standard Unix tools for text processing.  
- `bat`: A utility for syntax highlighting and displaying files.  
- Environment variable `XDG_CACHE_HOME`: For specifying cache file location.  
  
Ensure all of these are installed and configured correctly on your Arch Linux system.

### Description

This script fetches and displays the list of OpenAI models using the OpenAI API. To reduce repeated API calls, it implements a caching mechanism where the list is stored in `$XDG_CACHE_HOME/openai-model-list.tsv`. If the cache file exists and is less than 24 hours old, it retrieves the list directly from the cache. Otherwise, it fetches the information from the API, processes it, and updates the cache.

Key steps within the script:

- Using `openai api models.list` to fetch model data.
- Parsing JSON results with `jq` and formatting timestamps using `date`.
- Caching processed data into a tab-separated value file.
- Displaying the generated list with syntax highlighting via `bat`.

### Usage

To use this script, simply execute it in the terminal:

```bash
~/.scripts/bin/list-openai-models.sh
```

This will:

1. Check if a cache file exists and is valid (less than 24 hours old).
2. If valid, display the cached data.
3. Otherwise, refresh the list by calling the OpenAI API, process the data, update the cache, and display the results.

The output will be formatted neatly due to `bat`.

#### Example Output:

```
2023-10-12	model-davinci
2023-09-30	model-curie
...
```

You can also bind this script to a shortcut in qtile or include it in an automated task.

---

> [!NOTE]  
> - The script lacks error handling for cases when the `openai` CLI command or `bat` are unavailable, leading to probable failures. Adding checks for dependency availability before execution could be a valuable enhancement.
> - The cache refresh logic is overly reliant on correct timestamps. Ensure time configurations on your system are accurate.  
> - There is no handling for API rate limits—consider adding a fallback in case the OpenAI API blocks requests.
