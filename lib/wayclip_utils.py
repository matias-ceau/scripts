#!/usr/bin/env python3
"""Shared helpers for the Wayland clipboard history tools."""

from __future__ import annotations

import math
import os
import re
import sqlite3
from pathlib import Path
from typing import Iterable, Optional, Sequence, Tuple

_DB_URI_TEMPLATE = "file:{path}?cipher=sqlcipher&legacy=4"

# Pre-compiled sensitive data detectors.
_PATTERN_MAP: Tuple[Tuple[re.Pattern[str], int], ...] = (
    (re.compile(r"AKIA[0-9A-Z]{16}"), 1),  # AWS access key ID
    (re.compile(r"ASIA[0-9A-Z]{16}"), 1),  # AWS temporary key ID
    (re.compile(r"(?i)aws(.{0,15})?(secret|key)"), 0),
    (re.compile(r"gh[pousr]_[A-Za-z0-9]{36}"), 1),  # GitHub tokens
    (re.compile(r"(?i)(api|access|client|secret)[-_ ]?key"), 0),
    (re.compile(r"-----BEGIN [A-Z0-9 ]+-----"), 1),
)

_BASE64_RE = re.compile(r"^[A-Za-z0-9+/=\s]+$")
_TEXTY_RE = re.compile(r"^[\x09\x0A\x0D\x20-\x7E\xA0-\xFF]*$")


class ClipboardError(Exception):
    """Custom exception for clipboard helper failures."""


def load_db_key(env_var: str = "CLIPBOARD_DB_KEY") -> str:
    """Return the encryption key from the environment.

    Raises:
        ClipboardError: if the key is unavailable or empty.
    """

    key = os.environ.get(env_var, "").strip()
    if not key:
        raise ClipboardError(
            f"Missing SQLCipher key in environment variable {env_var}."
        )
    return key


def open_encrypted_db(db_path: Path, key: str) -> sqlite3.Connection:
    """Open (and create if necessary) the SQLCipher database."""

    uri = _DB_URI_TEMPLATE.format(path=str(db_path))
    conn = sqlite3.connect(uri, uri=True, isolation_level=None)
    conn.execute("PRAGMA key = '{}';".format(key.replace("'", "''")))
    conn.execute("PRAGMA cipher_compatibility = 4;")
    conn.execute("PRAGMA journal_mode = WAL;")
    conn.execute("PRAGMA synchronous = NORMAL;")
    return conn


def ensure_schema(conn: sqlite3.Connection) -> None:
    """Create the clipboard history schema if it does not exist."""

    conn.execute(
        """
        CREATE TABLE IF NOT EXISTS history (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            mime TEXT,
            content BLOB,
            sensitive BOOLEAN DEFAULT 0
        );
        """
    )
    conn.execute("CREATE INDEX IF NOT EXISTS idx_history_ts ON history (ts DESC);")


def sanitize_text_candidate(data: bytes) -> Optional[str]:
    """Return a decoded UTF-8 string if data looks textual."""

    if not data:
        return ""
    if b"\x00" in data:
        return None
    try:
        text = data.decode("utf-8")
    except UnicodeDecodeError:
        return None
    if not _TEXTY_RE.fullmatch(text):
        # Contains unusual control chars: treat as binary.
        return None
    return text


def detect_mime(data: bytes, advertised_types: Optional[Sequence[str]] = None) -> str:
    """Guess the MIME type for clipboard data."""

    types = list(advertised_types or [])
    if types:
        # Prefer explicitly advertised textual/image types.
        for preferred in ("text/plain", "text/plain;charset=utf-8", "text/uri-list"):
            if preferred in types:
                return preferred
        for prefix in ("text/", "image/"):
            for item in types:
                if item.startswith(prefix):
                    return item
    if data.startswith(b"\x89PNG\r\n\x1a\n"):
        return "image/png"
    if data.startswith(b"\xff\xd8\xff"):
        return "image/jpeg"
    if data.startswith(b"GIF87a") or data.startswith(b"GIF89a"):
        return "image/gif"
    if data.startswith(b"PK\x03\x04"):
        return "application/zip"
    text = sanitize_text_candidate(data)
    if text is not None:
        return "text/plain"
    return "application/octet-stream"


def shannon_entropy(text: str) -> float:
    """Compute Shannon entropy (base-2) for a decoded string."""

    if not text:
        return 0.0
    freq = {}
    for char in text:
        freq[char] = freq.get(char, 0) + 1
    length = len(text)
    entropy = 0.0
    for count in freq.values():
        p = count / length
        entropy -= p * math.log(p, 2)
    return entropy


def looks_like_random_blob(text: str) -> bool:
    """Return True if text resembles a random secret."""

    trimmed = text.strip()
    if len(trimmed) < 20:
        return False
    if not _BASE64_RE.fullmatch(trimmed.replace("\n", "")):
        return False
    return shannon_entropy(trimmed) >= 4.3


def flag_sensitive(text: Optional[str]) -> bool:
    """Run heuristics to determine if text likely holds secrets."""

    if not text:
        return False
    for pattern, _ in _PATTERN_MAP:
        if pattern.search(text):
            return True
    if "-----END" in text:
        return True
    if looks_like_random_blob(text):
        return True
    return False


def fetch_types_from_wl_paste(env: Optional[dict] = None) -> Tuple[str, ...]:
    """Return clipboard MIME types via `wl-paste --list-types`."""

    from subprocess import run, PIPE, CalledProcessError

    try:
        proc = run(
            ["wl-paste", "--list-types"],
            check=True,
            stdout=PIPE,
            stderr=PIPE,
            env=env,
        )
    except (FileNotFoundError, CalledProcessError):
        return tuple()
    output = proc.stdout.decode("utf-8", "ignore").strip()
    if not output:
        return tuple()
    return tuple(line.strip() for line in output.splitlines() if line.strip())


__all__ = [
    "ClipboardError",
    "detect_mime",
    "ensure_schema",
    "flag_sensitive",
    "fetch_types_from_wl_paste",
    "load_db_key",
    "open_encrypted_db",
    "sanitize_text_candidate",
]
