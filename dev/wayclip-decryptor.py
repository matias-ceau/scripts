#!/usr/bin/env python3
"""Create an in-RAM decrypted mirror of the clipboard history."""

from __future__ import annotations

import argparse
import json
import logging
import os
import sqlite3
import sys
import threading
import time
from http import HTTPStatus
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
from typing import Optional
from urllib.parse import parse_qs, urlparse

REPO_ROOT = Path(__file__).resolve().parents[1]
if str(REPO_ROOT / "lib") not in sys.path:
    sys.path.insert(0, str(REPO_ROOT / "lib"))

from wayclip_utils import (  # pylint: disable=wrong-import-position
    ClipboardError,
    ensure_schema,
    load_db_key,
    open_encrypted_db,
    sanitize_text_candidate,
)

_LOG = logging.getLogger("wayclip.decryptor")

DEFAULT_DB = Path.home() / ".local/share/clipboard_secure.db"
DEFAULT_SHM_DB = Path("/dev/shm/clipboard.db")


def _setup_logging(verbose: bool) -> None:
    level = logging.DEBUG if verbose else logging.INFO
    logging.basicConfig(
        level=level,
        format="%(asctime)s [%(levelname)s] %(name)s: %(message)s",
    )


def _mlock_all(enabled: bool) -> None:
    if not enabled:
        return
    try:
        import ctypes

        libc = ctypes.CDLL("libc.so.6")
        MCL_CURRENT = 1
        MCL_FUTURE = 2
        result = libc.mlockall(MCL_CURRENT | MCL_FUTURE)
        if result != 0:
            _LOG.warning("mlockall failed (check memlock ulimit)")
        else:
            _LOG.info("Locked process memory with mlockall")
    except Exception as exc:  # noqa: BLE001
        _LOG.warning("Unable to apply mlockall: %s", exc)


class MirrorSynchronizer:
    def __init__(self, src_db: Path, dst_db: Path, key_env: str) -> None:
        self.src_db = src_db
        self.dst_db = dst_db
        self.key_env = key_env
        self._stop_event = threading.Event()

    def stop(self) -> None:
        self._stop_event.set()

    def sync_once(self) -> None:
        key = load_db_key(self.key_env)
        tmp_path = self.dst_db.with_suffix(".tmp")
        src = open_encrypted_db(self.src_db, key)
        try:
            ensure_schema(src)
            dst = sqlite3.connect(tmp_path)
            try:
                src.backup(dst)
                dst.execute("PRAGMA journal_mode = OFF;")
                dst.commit()
            finally:
                dst.close()
        finally:
            src.close()
        os.chmod(tmp_path, 0o600)
        tmp_path.replace(self.dst_db)
        _LOG.debug("Mirror refreshed at %s", self.dst_db)

    def loop(self, interval: float) -> None:
        while not self._stop_event.is_set():
            try:
                self.sync_once()
            except ClipboardError as exc:
                _LOG.error("Missing key while syncing: %s", exc)
                return
            except Exception as exc:  # noqa: BLE001
                _LOG.exception("Failed to sync mirror: %s", exc)
            if interval <= 0:
                break
            self._stop_event.wait(interval)

    def cleanup(self) -> None:
        try:
            if self.dst_db.exists():
                self.dst_db.unlink()
        except OSError as exc:
            _LOG.warning("Failed to remove %s: %s", self.dst_db, exc)


class _MirrorRequestHandler(BaseHTTPRequestHandler):
    # Set at server creation time.
    database: Path = DEFAULT_SHM_DB
    hide_sensitive: bool = True

    def log_message(self, fmt: str, *args) -> None:  # noqa: D401, ANN001
        _LOG.debug("HTTP: " + fmt, *args)

    def do_GET(self) -> None:  # noqa: N802
        parsed = urlparse(self.path)
        if parsed.path not in {"/", "", "/entries"}:
            self.send_error(HTTPStatus.NOT_FOUND)
            return
        params = parse_qs(parsed.query or "")
        limit = self._safe_int(params.get("limit", ["100"])[0], default=100)
        limit = max(1, min(limit, 500))
        include_sensitive = params.get("include_sensitive", ["0"])[0] in {"1", "true", "yes"}
        query = params.get("q", [""])[0].strip()
        try:
            rows = self._fetch_entries(limit, include_sensitive, query)
        except sqlite3.Error as exc:
            _LOG.exception("SQLite failure in HTTP handler: %s", exc)
            self.send_error(HTTPStatus.INTERNAL_SERVER_ERROR)
            return
        payload = json.dumps({"entries": rows}).encode("utf-8")
        self.send_response(HTTPStatus.OK)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(payload)))
        self.end_headers()
        self.wfile.write(payload)

    def _fetch_entries(self, limit: int, include_sensitive: bool, query: str) -> list[dict[str, object]]:
        if not self.database.exists():
            return []
        conn = sqlite3.connect(self.database)
        conn.row_factory = sqlite3.Row
        try:
            sql = "SELECT id, ts, mime, sensitive, content FROM history"
            clauses = []
            params: list[object] = []
            if self.hide_sensitive and not include_sensitive:
                clauses.append("sensitive = 0")
            if clauses:
                sql += " WHERE " + " AND ".join(clauses)
            sql += " ORDER BY id DESC LIMIT ?"
            params.append(limit)
            rows = conn.execute(sql, params).fetchall()
        finally:
            conn.close()
        results = []
        for row in rows:
            content: bytes = row["content"]
            preview = sanitize_text_candidate(content)
            if preview is None:
                preview_text = "<binary>"
            else:
                preview_text = preview.replace("\n", "\\n")
            if query:
                if preview is None or query.lower() not in preview.lower():
                    continue
            results.append(
                {
                    "id": row["id"],
                    "ts": row["ts"],
                    "mime": row["mime"],
                    "sensitive": bool(row["sensitive"]),
                    "preview": preview_text[:200],
                }
            )
        return results

    @staticmethod
    def _safe_int(value: str, default: int) -> int:
        try:
            return int(value)
        except ValueError:
            return default


class MirrorHTTPServer:
    def __init__(self, database: Path, host: str, port: int, hide_sensitive: bool) -> None:
        handler = type("WayclipHandler", (_MirrorRequestHandler,), {})
        handler.database = database
        handler.hide_sensitive = hide_sensitive
        self._server = ThreadingHTTPServer((host, port), handler)
        self._thread: Optional[threading.Thread] = None

    def start(self) -> None:
        self._thread = threading.Thread(target=self._server.serve_forever, daemon=True)
        self._thread.start()
        _LOG.info("HTTP mirror serving on %s:%s", *self._server.server_address)

    def stop(self) -> None:
        self._server.shutdown()
        self._server.server_close()
        if self._thread:
            self._thread.join(timeout=2)


def main(argv: Optional[list[str]] = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--database", default=str(DEFAULT_DB), help="Encrypted SQLCipher database path")
    parser.add_argument("--output", default=str(DEFAULT_SHM_DB), help="Destination path under /dev/shm")
    parser.add_argument("--key-env", default="CLIPBOARD_DB_KEY", help="Environment variable containing the key")
    parser.add_argument("--interval", type=float, default=5.0, help="Seconds between refreshes (0 to run once)")
    parser.add_argument("--serve", action="store_true", help="Expose a read-only JSON API for the mirror")
    parser.add_argument("--host", default="127.0.0.1", help="Host for the JSON API")
    parser.add_argument("--port", type=int, default=8765, help="Port for the JSON API")
    parser.add_argument("--show-sensitive", action="store_true", help="Do not hide sensitive entries in the JSON API")
    parser.add_argument("--mlock-all", action="store_true", help="Attempt to mlockall() to avoid swapping the mirror")
    parser.add_argument("--verbose", action="store_true", help="Verbose logging")
    args = parser.parse_args(argv)

    _setup_logging(args.verbose)
    _mlock_all(args.mlock_all)

    src = Path(args.database).expanduser()
    dst = Path(args.output)
    dst.parent.mkdir(parents=True, exist_ok=True)

    syncer = MirrorSynchronizer(src, dst, args.key_env)

    http_server: Optional[MirrorHTTPServer] = None
    try:
        syncer.sync_once()
        if args.serve:
            http_server = MirrorHTTPServer(dst, args.host, args.port, hide_sensitive=not args.show_sensitive)
            http_server.start()
        if args.interval > 0:
            sync_thread = threading.Thread(target=syncer.loop, args=(args.interval,), daemon=True)
            sync_thread.start()
            try:
                while sync_thread.is_alive():
                    time.sleep(1)
            except KeyboardInterrupt:
                _LOG.info("Received interrupt; stopping")
                syncer.stop()
                sync_thread.join()
        else:
            if args.serve:
                _LOG.info("Mirror prepared; press Ctrl+C to exit")
                try:
                    while True:
                        time.sleep(1)
                except KeyboardInterrupt:
                    _LOG.info("Stopping server")
            else:
                _LOG.info("Mirror refreshed once at %s", dst)
    finally:
        if http_server:
            http_server.stop()
        syncer.cleanup()
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
