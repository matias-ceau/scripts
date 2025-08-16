#!/usr/bin/env -S uv run --script --quiet

# /// script
# requires-python = ">=3.12"
# dependencies = [
#     "requests"
# ]
# ///

import os
import re
import subprocess
import sys
from typing import List, Tuple

import requests


def key_finder(word: str) -> str | None:
    for func in [
        lambda x: x,
        lambda x: x.upper() + "_API_KEY",
        lambda x: next(i for i in os.environ if (x.upper() in i)),
    ]:
        try:
            return os.environ[func(word)]
        except (KeyError, StopIteration):
            pass
    print("API key missing from environment", file=sys.stderr)
    return None


EXCLUDE_PATTERNS = [
    "/node_modules/",
    "/dist/",
    "/build/",
    "/coverage/",
    "package-lock.json",
    "yarn.lock",
    "pnpm-lock.yaml",
    "poetry.lock",
    "Cargo.lock",
    "go.sum",
    ".min.js",
    ".min.css",
    ".map",
]


def path_is_excluded(path: str) -> bool:
    p = path.lower()
    return any(s in p for s in EXCLUDE_PATTERNS)


def _git_run(args: List[str]) -> str:
    """Run git with robust decoding that won't crash on non-UTF8/binary output."""
    # Allow overrides via env if needed
    enc = os.getenv("COMMIT_DIFF_ENCODING", "utf-8")
    err_mode = os.getenv("COMMIT_DIFF_ERRORS", "replace")  # replace|ignore|surrogateescape

    # Force predictable encoding/quoting from git
    git_cmd = [
        "git",
        "-c",
        "core.quotepath=false",
        "-c",
        "i18n.logOutputEncoding=UTF-8",
        *args,
    ]

    try:
        result = subprocess.run(
            git_cmd,
            capture_output=True,
            text=False,  # get raw bytes, decode manually below
            check=True,
        )
        return result.stdout.decode(enc, errors=err_mode)
    except subprocess.CalledProcessError as e:
        # Try to decode whatever we can from stderr for diagnostics
        try:
            msg = e.stderr.decode(enc, errors="replace") if e.stderr else str(e)
        except Exception:
            msg = str(e)
        print("Error running git", args, "-", msg, file=sys.stderr)
        raise


def get_staged_diff() -> str:
    try:
        # -U0: zero context to reduce size; --no-color: clean text; --no-ext-diff: avoid external tools
        return _git_run(["diff", "--cached", "--no-color", "--no-ext-diff", "-U0"])  # safe decode
    except subprocess.CalledProcessError:
        sys.exit(1)


def get_numstat() -> str:
    try:
        return _git_run(["diff", "--cached", "--numstat", "--no-color", "--no-ext-diff"]).strip()
    except subprocess.CalledProcessError:
        return ""


def condense_diff(
    diff: str, max_chars: int = 120_000, per_file_limit: int = 2_000
) -> str:
    if len(diff) <= max_chars:
        return diff

    # Split into file blocks by "diff --git" headers
    blocks: list[str] = []
    current: list[str] = []
    for line in diff.splitlines():
        if line.startswith("diff --git "):
            if current:
                blocks.append("\n".join(current))
                current = []
        current.append(line)
    if current:
        blocks.append("\n".join(current))

    condensed_blocks: list[str] = []
    for b in blocks:
        # Extract current file path from +++ b/...
        path_match = re.search(r"^\+\+\+\s+b/(.+)$", b, re.M)
        path = path_match.group(1) if path_match else ""

        if path and path_is_excluded(path):
            # Keep a tiny header summary instead of full patch
            header = []
            for l in b.splitlines():
                if l.startswith(
                    (
                        "diff --git",
                        "new file mode",
                        "deleted file mode",
                        "rename from",
                        "rename to",
                        "similarity index",
                        "index",
                        "--- ",
                        "+++ ",
                    )
                ):
                    header.append(l)
            condensed_blocks.append("\n".join(header))
            continue

        kept = []
        count = 0
        for l in b.splitlines():
            # Keep important headers and hunk markers
            if l.startswith(
                (
                    "diff --git",
                    "new file mode",
                    "deleted file mode",
                    "rename from",
                    "rename to",
                    "similarity index",
                    "index ",
                    "--- ",
                    "+++ ",
                    "@@",
                )
            ):
                kept.append(l)
                continue
            # Keep only +/- lines from hunks; drop context lines starting with space
            if (l.startswith("+") and not l.startswith("+++")) or (
                l.startswith("-") and not l.startswith("---")
            ):
                # Cap very long lines (minified/json blobs)
                if len(l) > 400:
                    l = l[:400] + " …(truncated)"
                kept.append(l)
                count += 1
                if count >= per_file_limit:
                    kept.append("# …(per-file change lines truncated)")
                    break
        condensed_blocks.append("\n".join(kept))

    condensed = "\n".join(condensed_blocks)
    if len(condensed) <= max_chars:
        return condensed

    # If still too big, fall back to a numstat summary + top of each file
    numstat = get_numstat()
    tiny_blocks = []
    for b in condensed_blocks:
        lines = b.splitlines()
        # Keep only headers + first ~60 change lines per file
        tiny = []
        change_count = 0
        for l in lines:
            if l.startswith(
                (
                    "diff --git",
                    "new file mode",
                    "deleted file mode",
                    "rename from",
                    "rename to",
                    "similarity index",
                    "--- ",
                    "+++ ",
                    "@@",
                )
            ):
                tiny.append(l)
            elif (l.startswith("+") and not l.startswith("+++")) or (
                l.startswith("-") and not l.startswith("---")
            ):
                if change_count < 60:
                    tiny.append(l)
                    change_count += 1
        if change_count >= 60:
            tiny.append("# …(file truncated)")
        tiny_blocks.append("\n".join(tiny))
    fallback = []
    if numstat:
        fallback.append("# numstat summary (added\tdeleted\tpath)\n" + numstat + "\n")
    fallback.append("\n".join(tiny_blocks))
    result = "\n".join(fallback)

    # Final hard cap
    if len(result) > max_chars:
        result = result[:max_chars] + "\n# …(diff truncated overall)"
    return result


def _parse_numstat(numstat: str) -> Tuple[int, int, list[Tuple[str, int, int]]]:
    total_add = 0
    total_del = 0
    files: list[Tuple[str, int, int]] = []
    for line in numstat.splitlines():
        try:
            a, d, path = line.split("\t", 2)
            a_i = int(a) if a.isdigit() else 0
            d_i = int(d) if d.isdigit() else 0
            total_add += a_i
            total_del += d_i
            files.append((path, a_i, d_i))
        except ValueError:
            continue
    return total_add, total_del, files


def _fallback_commit_message(diff: str) -> str:
    # Build a simple, always-valid commit message from numstat
    ns = get_numstat()
    adds, dels, files = _parse_numstat(ns)
    file_count = len(files)
    subject = f"Update {file_count} files (+{adds} -{dels})"

    details = []
    if files:
        details.append("")
        # Show up to 20 files, sorted by total changes desc
        files_sorted = sorted(files, key=lambda x: (x[1] + x[2]), reverse=True)[:20]
        for path, a, d in files_sorted:
            details.append(f"- {path}: +{a} -{d}")
        if file_count > 20:
            details.append(f"- …and {file_count - 20} more files")
    else:
        # As a last resort, try to craft a short message from diff headers
        maybe_files = re.findall(r"^\+\+\+\s+b/(.+)$", diff, re.M)
        if maybe_files:
            subject = f"Update {len(maybe_files)} files"
            details = ["", *(f"- {p}" for p in maybe_files[:20])]

    return "\n".join([subject, *details]).strip()


def _sanitize_commit_message(msg: str) -> str:
    s = (msg or "").strip()
    if not s:
        return s
    # Drop surrounding code fences and any lines that are just fences
    lines = [ln for ln in s.splitlines() if not ln.strip().startswith("```")]
    s = "\n".join(lines).strip()
    # Remove any leading label like "Commit message:" or similar chatter from LLMs
    s = re.sub(r"^commit message\s*:?\s*", "", s, flags=re.IGNORECASE).strip()
    # Ensure no BOM or control chars except newlines and tabs
    s = s.replace("\ufeff", "")
    s = re.sub(r"[\x00-\x08\x0b\x0c\x0e-\x1f]", " ", s)
    # Hard cap the message length to avoid editor/CI issues
    max_msg = int(os.getenv("COMMIT_MAX_MESSAGE_CHARS", "4000"))
    if len(s) > max_msg:
        s = s[:max_msg].rstrip() + "\n…(message truncated)"
    return s


def generate_commit_message(
    diff: str,
    api: str = "openrouter",
    url: str = "https://openrouter.ai/api/v1/chat/completions",
    model: str = "openai/gpt-oss-120b",
) -> str:
    api_key = key_finder(api)
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

    # If no API key, fall back to local generation instead of aborting the commit
    if not api_key:
        print("Warning: missing API key; using fallback commit message.", file=sys.stderr)
        return _fallback_commit_message(diff)

    payload = {
        "model": model,
        "messages": [{"role": "user", "content": prompt}],
        "temperature": 0.2,
        "max_tokens": 600,
    }
    headers = {"Authorization": f"Bearer {api_key}", "Content-Type": "application/json"}

    content = None
    try:
        response = requests.post(url, json=payload, headers=headers, timeout=90)
        response.raise_for_status()
        data = response.json()
        content = (
            data["choices"][0]["message"]["content"]
            if "message" in data["choices"][0]
            else data["choices"][0]["content"]
        )
    except Exception as e:
        print(f"Warning: API request failed, using fallback commit message. Error: {e}", file=sys.stderr)
        return _fallback_commit_message(diff)

    try:
        cleaned = _sanitize_commit_message(str(content))
    except Exception as e:
        print(f"Warning: sanitize failed, using fallback. Error: {e}", file=sys.stderr)
        return _fallback_commit_message(diff)

    if not cleaned.strip():
        # Don't allow empty messages; always provide something
        return _fallback_commit_message(diff)
    return cleaned


def _print_safely(s: str) -> None:
    try:
        print(s)
    except UnicodeEncodeError:
        # Fallback to UTF-8 bytes to avoid terminal encoding issues
        try:
            sys.stdout.buffer.write(s.encode("utf-8", errors="replace"))
            sys.stdout.buffer.write(b"\n")
            sys.stdout.buffer.flush()
        except Exception:
            # Last resort: ASCII with replacement
            sys.stdout.write(s.encode("ascii", errors="replace").decode("ascii") + "\n")
            sys.stdout.flush()


def main():
    try:
        diff = get_staged_diff()
        if not diff.strip():
            print("No staged changes to commit.", file=sys.stderr)
            sys.exit(1)

        max_chars = int(os.getenv("COMMIT_MAX_DIFF_CHARS", "120000"))
        per_file_limit = int(os.getenv("COMMIT_PER_FILE_CHANGE_LIMIT", "2000"))
        diff = condense_diff(diff, max_chars=max_chars, per_file_limit=per_file_limit)

        msg = generate_commit_message(diff)
        if not msg.strip():
            msg = _fallback_commit_message(diff)
        _print_safely(msg)
    except Exception as e:
        # Never crash the commit due to encoding or API issues; always emit something sane
        print(f"Warning: commit message generator failed; using fallback. Error: {e}", file=sys.stderr)
        try:
            # Best-effort fallback from whatever we managed to get
            ns = get_numstat()
            msg = _fallback_commit_message(diff if 'diff' in locals() else ns)
        except Exception:
            msg = "Update files"
        _print_safely(msg)


if __name__ == "__main__":
    main()
