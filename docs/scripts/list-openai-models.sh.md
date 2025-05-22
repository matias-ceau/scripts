# OpenAI Model Lister

---

**list-openai-models.sh**: Lists and caches available OpenAI API models with creation dates

---

### Dependencies

- `openai`: OpenAI command-line interface; used to fetch the list of available models for your account.
- `jq`: Command-line JSON processor; used to extract model IDs and creation times from OpenAI's API output.
- `bat`: Syntax-highlighting `cat` clone; used to display the cached output with TSV highlighting.
- `stat`, `sed`, `tr`, and standard GNU utilities.

### Description

This script fetches the list of available models from your OpenAI account using the `openai` CLI, extracting each model's creation date and ID. To improve efficiency and avoid frequent API calls, it caches the resulting model list as a TSV file in `$XDG_CACHE_HOME/openai-model-list.tsv`, refreshing it only if the cache is older than 24 hours.

**Core functionality:**

- Checks if a recent cache exists (less than 24 hours old).  
- If cache is valid, pretty-prints its content using `bat` as TSV.
- Otherwise, fetches a fresh model list:
    - Calls `openai api models.list`, pipes through `jq` to get date/id info.
    - Parses the creation dates with `date`, formats to `%Y-%m-%d`, or echoes raw values on failure.
    - Reformats to TSV (`\t` separated), sorts, and saves to the cache.
    - Displays the cache using `bat`.

The script is well-suited for your Arch + qtile workflow, supporting both direct terminal usage and integration into custom keybindings or scripts.

### Usage

To list available OpenAI models with their creation dates:

```sh
~/.scripts/bin/list-openai-models.sh
```

**Example keybinding in qtile (Python):**
```python
Key([mod], "o", lazy.spawn("~/.scripts/bin/list-openai-models.sh"))
```
> Output will use `bat` (with TSV highlighting). If you don't have a recent cache, the OpenAI API will be queried.

**Typical output:**
```
2022-05-14	ada
2022-05-14	babbage
2023-03-01	gpt-4
...
```

---

> [!NOTE]
> - The `jq` command `.["created", "id"]` is not valid syntax for extracting both fields as a tuple or object. This could lead to no output or the wrong fields being fetched. Consider revising it to e.g. `.data[] | [.created, .id] | @tsv` to properly extract and format the fields you want.
> - The script assumes `$XDG_CACHE_HOME` is set. If it isn't, the cache path will be unset, causing failure or unexpected behavior.
> - Reliance on external commands (`bat`, `openai`, `jq`, etc.) means the script will fail silently if any are missing. You may want to add checks or error messages for missing dependencies.
> - The caching logic uses `stat --format="%Y"`, which gives the modification time in seconds since the epoch, but the cache freshness check should be tested to make sure time arithmetic is correct.  
> - As written, the parsing pipeline is brittle and may not correctly process the OpenAI API’s current output structure. Re-examine and test with current API responses.  
> - For machine use or further automation, consider outputting clean TSV/CSV and allowing a `--no-color` flag for scripting.