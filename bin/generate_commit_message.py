#!/usr/bin/env -S uv run --script --quiet

# /// script
# requires-python = ">=3.12"
# dependencies = [
#     "openai",
# ]
# ///

import os
import subprocess
import sys

import openai


def get_staged_diff():
    try:
        result = subprocess.run(
            ["git", "diff", "--cached"], capture_output=True, text=True, check=True
        )
        return result.stdout
    except subprocess.CalledProcessError as e:
        print("Error getting git diff:", e, file=sys.stderr)
        sys.exit(1)


def generate_commit_message(diff):
    openai.api_key = os.getenv("OPENAI_API_KEY")
    if not openai.api_key:
        raise RuntimeError("OPENAI_API_KEY environment variable not set")

    prompt = (
        "Write a concise git commit message for these changes:\n"
        "###\n"
        f"{diff}\n"
        "###\n"
        "Commit message:"
    )
    response = openai.chat.completions.create(
        model="gpt-4.1-mini",
        messages=[{"role": "user", "content": prompt}],
        max_tokens=60,
        temperature=0.2,
    )
    # Extract the message (depends on OpenAI lib version)
    return response.choices[0].message.content.strip()


def main():
    diff = get_staged_diff()
    if not diff.strip():
        print("No staged changes to commit.", file=sys.stderr)
        sys.exit(1)
    message = generate_commit_message(diff)
    print(message)


if __name__ == "__main__":
    main()
