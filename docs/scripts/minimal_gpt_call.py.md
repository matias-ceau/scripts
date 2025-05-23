# Minimal GPT-4o Mini CSV Generation

---

**minimal_gpt_call.py**: Simple script to interact with OpenAI GPT-4o-mini for CSV sample generation.

---

### Dependencies

- `openai`  
  Python package to interact with the OpenAI API.
- Environment variable: `OPENAI_API_KEY`  
  Must be set in your shell or user environment for authentication.

### Description

This script is a minimal example of making a chat completion request to OpenAI's GPT-4o-mini model using the official `openai` Python library. It sends a predefined prompt to the chatbot to generate a CSV dataset for 'cow jugglers' containing about 150 rows and 8 columns.

Key points:
- API key management is handled via the `OPENAI_API_KEY` environment variable.
- The prompt is hardcoded, configured for data generation training purposes.
- The script prints the raw completion content, which should be a CSV generated by the model.

### Usage

**Step 1: Install dependencies**
```bash
pip install openai
```

**Step 2: Set your API key**  
Make sure you have your `OPENAI_API_KEY` set, for example:
```bash
export OPENAI_API_KEY="sk-..."
```
Consider adding this to your `.profile` or shell configuration for persistent use.

**Step 3: Run the script**
```bash
python /home/matias/.scripts/dev/minimal_gpt_call.py
```

**Step 4: Pipe or redirect output if desired**
```bash
python ~/.scripts/dev/minimal_gpt_call.py > cow_jugglers.csv
```

You can map this script to a custom keybinding in Qtile or integrate it with other automation tools as needed.

---

> [!TIP]
>
> - The prompt, model, and system/user roles are hardcoded, making the script inflexible for general use. Consider adding argument parsing (e.g., with argparse) for adjustable model, prompt, and output.
> - Handle API errors (e.g., missing KEY, network issues) with try/except for friendlier diagnostics.
> - Output may contain markdown code blocks or formatting. Post-process the output if you need pure CSV.
> - For large generation jobs (150 lines × 8 cols), API cost and rate limits should be considered.
> - Consider separating the API key acquisition logic for better security and clarity.