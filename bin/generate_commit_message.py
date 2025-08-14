#!/usr/bin/env -S uv run --script --quiet

# /// script
# requires-python = ">=3.12"
# dependencies = [
#     "requests"
# ]
# ///

import os
import subprocess
import sys

import requests


def key_finder(word: str) -> str:
    for func in [
        lambda x: x,
        lambda x: x.upper() + "_API_KEY",
        lambda x: next(i for i in os.environ if (x.upper() in i)),
    ]:
        try:
            return os.environ[func(word)]
        except (KeyError, StopIteration):
            pass
    print("API key missing from environment")
    return None


def get_staged_diff():
    try:
        result = subprocess.run(
            ["git", "diff", "--cached"], capture_output=True, text=True, check=True
        )
        return result.stdout
    except subprocess.CalledProcessError as e:
        print("Error getting git diff:", e, file=sys.stderr)
        sys.exit(1)


def generate_commit_message(
    diff,
    api: str = "openrouter",
    url: str = "https://openrouter.ai/api/v1/chat/completions",
    model: str = "openai/gpt-oss-120b",
):
    api_key = key_finder(api)
    if not api_key:
        sys.exit(2)

    prompt = f"""Write a concise git commit message for these changes:
```txt
###
{diff}
###
```
Commit message :
1. first line is as you know under 60-70 characters.
2. Blank line
3. More detailed description, maximun 600 tokens total

Final rule:
YOU CAN ONLY OUTPUT THE COMMIT MESSAGE, NOTHING ELSE AT ALL
"""

    payload = {
        "model": model,
        "messages": [{"role": "user", "content": prompt}],
        # "temperature": 0.2,
        "max_tokens": 600,
        # "think
    }
    headers = {"Authorization": f"Bearer {api_key}", "Content-Type": "application/json"}

    try:
        response = requests.post(url, json=payload, headers=headers, timeout=60)
        response.raise_for_status()
    except requests.RequestException as e:
        print(f"API request failed: {e}", file=sys.stderr)
        sys.exit(3)

    try:
        data = response.json()
        # OpenAI-compatible schema
        content = (
            data["choices"][0]["message"]["content"]
            if "message" in data["choices"][0]
            else data["choices"][0]["content"]
        )
    except (ValueError, KeyError, IndexError, TypeError):
        print(f"Unexpected API response format: {response.text}", file=sys.stderr)
        sys.exit(4)

    return content.strip()


def main():
    diff = get_staged_diff()
    if not diff.strip():
        print("No staged changes to commit.", file=sys.stderr)
        sys.exit(1)
    print(generate_commit_message(diff))


if __name__ == "__main__":
    main()
