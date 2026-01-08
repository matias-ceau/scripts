# Minimal OpenAI Chat Completion Call (Python)

---

**minimal_gpt_call.py**: Tiny Python script that calls OpenAI chat completions and prints the response

---

### Dependencies

- `python` (Arch package: `python`)
- `openai` (Python package: `openai`)
- `OPENAI_API_KEY` (environment variable containing your API key)

### Description

This script is a minimal, no-frills example of using the OpenAI Python SDK to run a single **chat completion** request and print the model’s output to stdout.

What it does:

- Reads your API key from `OPENAI_API_KEY`.
- Instantiates an `OpenAI` client.
- Sends a two-message conversation:
  - A **system** prompt setting behavior: “You create training data for cow jugglers”
  - A **user** prompt requesting: “a CSV of approximately 150 lines and 8 columns”
- Prints the first returned message: `response.choices[0].message.content`

This is handy as a quick connectivity check on Arch Linux, a minimal reproducible example for debugging SDK issues, or as a building block for a larger pipeline (e.g., generating datasets you later post-process).

### Usage

Install dependency:

```bash
pip install --user openai
```

Set your API key (e.g., in your shell rc):

```bash
export OPENAI_API_KEY="..."
```

Run:

```bash
python /home/matias/.scripts/dev/minimal_gpt_call.py
```

tldr:

```bash
OPENAI_API_KEY="..." python minimal_gpt_call.py > out.csv
```

If you want to bind it in qtile, you can map a key to spawn it (e.g., writing output to a file), since it’s non-interactive and prints to stdout.

---

> [!TIP]
> Consider adding error handling for missing `OPENAI_API_KEY` and API/network failures (try/except around the request). Also, for CSV generation, you may want to explicitly request a header row, enforce delimiter/quoting rules, and validate line/column counts after generation. If outputs are large, streaming or writing directly to a file can be more robust than printing to a terminal.