#!/usr/bin/env python3
"""Wayland clipboard watcher that persists encrypted history entries."""

from __future__ import annotations

import argparse
import logging
import os
import sqlite3
import subprocess
import sys
import time
from pathlib import Path
from typing import Optional

REPO_ROOT = Path(__file__).resolve().parents[1]
if str(REPO_ROOT / "lib") not in sys.path:
    sys.path.insert(0, str(REPO_ROOT / "lib"))

from wayclip_utils import (  # pylint: disable=wrong-import-position
    ClipboardError,
    detect_mime,
    ensure_schema,
    fetch_types_from_wl_paste,
    flag_sensitive,
    load_db_key,
    open_encrypted_db,
    sanitize_text_candidate,
)

_LOG = logging.getLogger("wayclip.daemon")

DEFAULT_DB = Path.home() / ".local/share/clipboard_secure.db"


def _setup_logging(verbose: bool, log_file: Optional[Path]) -> None:
    level = logging.DEBUG if verbose else logging.INFO
    handlers = []
    if log_file:
        log_file.parent.mkdir(parents=True, exist_ok=True)
        handlers.append(logging.FileHandler(log_file))
    handlers.append(logging.StreamHandler(sys.stderr))
    logging.basicConfig(
        level=level,
        format="%(asctime)s [%(levelname)s] %(name)s: %(message)s",
        handlers=handlers,
    )


def _prepare_database(db_path: Path, key: str) -> None:
    db_path.parent.mkdir(parents=True, exist_ok=True)
    conn = open_encrypted_db(db_path, key)
    ensure_schema(conn)
    conn.close()
    os.chmod(db_path, 0o600)


def _ingest_entry(db_path: Path, key_env: str) -> int:
    state = os.environ.get("CLIPBOARD_STATE", "data")
    if state != "data":
        _LOG.debug("Skipping clipboard state %s", state)
        return 0

    raw = sys.stdin.buffer.read()
    if raw is None or len(raw) == 0:
        _LOG.debug("Skipping empty clipboard payload")
        return 0

    types = fetch_types_from_wl_paste(os.environ.copy())
    mime = detect_mime(raw, types)
    text = sanitize_text_candidate(raw)
    sensitive = 1 if flag_sensitive(text) else 0

    conn = open_encrypted_db(db_path, key_env)
    try:
        ensure_schema(conn)
        conn.execute(
            "INSERT INTO history (mime, content, sensitive) VALUES (?, ?, ?)",
            (mime, sqlite3.Binary(raw), sensitive),
        )
        _LOG.debug("Stored clipboard entry (%s, sensitive=%s)", mime, bool(sensitive))
    finally:
        conn.close()
    return 0


def _run_watch_loop(command: list[str], env: dict[str, str]) -> int:
    backoff = 1
    while True:
        _LOG.info("Spawning wl-paste watcher")
        proc = subprocess.Popen(command, env=env)
        try:
            returncode = proc.wait()
        except KeyboardInterrupt:
            _LOG.info("Interrupted; terminating watcher")
            proc.terminate()
            proc.wait(timeout=5)
            return 0
        if returncode == 0:
            _LOG.info("Watcher exited normally")
            return 0
        _LOG.warning("Watcher crashed with exit code %s; retrying in %ss", returncode, backoff)
        time.sleep(backoff)
        backoff = min(backoff * 2, 30)


def run_daemon(args: argparse.Namespace) -> int:
    try:
        key = load_db_key(args.key_env)
    except ClipboardError as exc:
        _LOG.error("%s", exc)
        return 1

    db_path = Path(args.database).expanduser()
    _prepare_database(db_path, key)

    env = os.environ.copy()
    env[args.key_env] = key
    env.setdefault("PYTHONUNBUFFERED", "1")

    script_path = Path(__file__).resolve()
    ingest_cmd = [
        sys.executable,
        str(script_path),
        "ingest",
        "--database",
        str(db_path),
        "--key-env",
        args.key_env,
    ]
    watch_cmd = ["wl-paste", "--watch", *ingest_cmd]

    if args.primary:
        watch_cmd.insert(1, "--primary")

    return _run_watch_loop(watch_cmd, env)


def main(argv: Optional[list[str]] = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    subparsers = parser.add_subparsers(dest="mode", required=True)

    common = argparse.ArgumentParser(add_help=False)
    common.add_argument(
        "--database",
        default=str(DEFAULT_DB),
        help="Path to the encrypted SQLCipher database",
    )
    common.add_argument(
        "--key-env",
        default="CLIPBOARD_DB_KEY",
        help="Environment variable that stores the SQLCipher key",
    )

    daemon_parser = subparsers.add_parser("daemon", parents=[common])
    daemon_parser.add_argument("--primary", action="store_true", help="Track the primary selection instead of the clipboard")
    daemon_parser.add_argument("--verbose", action="store_true", help="Enable verbose logging")
    daemon_parser.add_argument("--log-file", type=Path, help="Write logs to a file in addition to stderr")

    ingest_parser = subparsers.add_parser("ingest", parents=[common])

    args = parser.parse_args(argv)

    if args.mode == "daemon":
        _setup_logging(args.verbose, args.log_file)
        return run_daemon(args)

    # Ingest mode
    _setup_logging(False, None)
    try:
        key = load_db_key(args.key_env)
    except ClipboardError as exc:
        _LOG.error("%s", exc)
        return 1
    db_path = Path(args.database).expanduser()

    try:
        return _ingest_entry(db_path, key)
    except Exception as exc:  # noqa: BLE001
        _LOG.exception("Failed to ingest clipboard entry: %s", exc)
        return 1


if __name__ == "__main__":
    sys.exit(main())
