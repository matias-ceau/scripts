#!/usr/bin/env bash
# Fuzzy Wayland clipboard history viewer using fzf and the /dev/shm mirror.

set -euo pipefail

SCRIPT_PATH="$(readlink -f "$0")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
REPO_ROOT="$(readlink -f "$SCRIPT_DIR/..")"
LIB_PATH="$REPO_ROOT/lib"

usage() {
  cat <<'USAGE'
Usage: wayclip-viewer.sh [--db PATH] [--show-sensitive]

Actions (internal):
  --action refresh|type|copy|delete ... (for internal use only)
USAGE
}

build_cmd() {
  local out=""
  for arg in "$@"; do
    if [[ -n "$out" ]]; then
      out+=" "
    fi
    out+="$(printf '%q' "$arg")"
  done
  printf '%s' "$out"
}

run_refresh() {
  local db_path="$1"
  local show_sensitive="$2"
  if [[ ! -f "$db_path" ]]; then
    return 0
  fi
  local where_clause=""
  if [[ "$show_sensitive" == "0" ]]; then
    where_clause="WHERE sensitive = 0"
  fi
  sqlite3 -readonly "$db_path" 2>/dev/null <<SQL || return 0
.mode tabs
.headers off
SELECT
  id,
  IFNULL(ts, ''),
  IFNULL(mime, ''),
  sensitive,
  CASE
    WHEN sensitive = 1 THEN '[sensitive]'
    WHEN mime LIKE 'text/%' THEN replace(replace(replace(substr(CAST(content AS TEXT), 1, 160), char(10), ' ↵ '), char(13), ''), char(9), ' ')
    ELSE '[' || IFNULL(mime, 'binary') || '] ' || length(content) || ' bytes'
  END
FROM history
${where_clause}
ORDER BY id DESC;
SQL
}

python_action() {
  local mode="$1"
  local lib_path="$2"
  local db_path="$3"
  local entry_id="$4"
  python <<'PY'
import os
import sqlite3
import subprocess
import sys

mode = sys.argv[1]
lib_path = sys.argv[2]
db_path = sys.argv[3]
entry_id = int(sys.argv[4])

sys.path.insert(0, lib_path)
from wayclip_utils import sanitize_text_candidate  # type: ignore

conn = sqlite3.connect(db_path)
try:
    row = conn.execute(
        "SELECT mime, sensitive, content FROM history WHERE id = ?",
        (entry_id,),
    ).fetchone()
finally:
    conn.close()

if row is None:
    sys.exit(1)

mime, sensitive, content = row
text = sanitize_text_candidate(content)

if mode == "delete":
    # Should not reach here
    sys.exit(0)

if mode == "copy":
    cmd = ["wl-copy"]
    if mime:
        cmd.extend(["--type", mime])
    proc = subprocess.Popen(cmd, stdin=subprocess.PIPE)
    proc.communicate(content)
    sys.exit(proc.returncode)

if mode == "type":
    if text is None:
        sys.exit(1)
    subprocess.run(["wlrctl", "keyboard", "type", text], check=False)
    sys.exit(0)
PY
}

run_delete() {
  local db_path="$1"
  local entry_id="$2"
  sqlite3 "$db_path" "DELETE FROM history WHERE id = $entry_id;"
}

if [[ "${1:-}" == "--action" ]]; then
  shift
  action="$1"
  shift
  case "$action" in
  refresh)
    local_db=""
    local_show="0"
    while [[ $# -gt 0 ]]; do
      case "$1" in
      --db)
        local_db="$2"
        shift 2
        ;;
      --show-sensitive)
        local_show="1"
        shift
        ;;
      *)
        usage >&2
        exit 1
        ;;
      esac
    done
    run_refresh "$local_db" "$local_show"
    ;;
  type | copy)
    local_db=""
    local_id=""
    while [[ $# -gt 0 ]]; do
      case "$1" in
      --db)
        local_db="$2"
        shift 2
        ;;
      --id)
        local_id="$2"
        shift 2
        ;;
      *)
        usage >&2
        exit 1
        ;;
      esac
    done
    [[ -n "$local_db" && -n "$local_id" ]] || exit 1
    python_action "$action" "$LIB_PATH" "$local_db" "$local_id"
    ;;
  delete)
    local_db=""
    local_id=""
    while [[ $# -gt 0 ]]; do
      case "$1" in
      --db)
        local_db="$2"
        shift 2
        ;;
      --id)
        local_id="$2"
        shift 2
        ;;
      *)
        usage >&2
        exit 1
        ;;
      esac
    done
    [[ -n "$local_db" && -n "$local_id" ]] || exit 1
    run_delete "$local_db" "$local_id"
    ;;
  *)
    usage >&2
    exit 1
    ;;
  esac
  exit 0
fi

DB_PATH="/dev/shm/clipboard.db"
SHOW_SENSITIVE=0
HEIGHT="70%"

while [[ $# -gt 0 ]]; do
  case "$1" in
  --db)
    DB_PATH="$2"
    shift 2
    ;;
  --show-sensitive)
    SHOW_SENSITIVE=1
    shift
    ;;
  --height)
    HEIGHT="$2"
    shift 2
    ;;
  -h | --help)
    usage
    exit 0
    ;;
  *)
    usage >&2
    exit 1
    ;;
  esac
done

if [[ ! -f "$DB_PATH" ]]; then
  echo "No decrypted mirror found at $DB_PATH" >&2
  echo "Start wayclip-decryptor.py first." >&2
  exit 1
fi

port_file="$(mktemp)"

refresh_cmd="$(build_cmd "$SCRIPT_PATH" --action refresh --db "$DB_PATH")"
if [[ "$SHOW_SENSITIVE" -eq 1 ]]; then
  refresh_cmd+=" --show-sensitive"
fi

type_cmd="$(build_cmd "$SCRIPT_PATH" --action type --db "$DB_PATH" --id '{1}')"
copy_cmd="$(build_cmd "$SCRIPT_PATH" --action copy --db "$DB_PATH" --id '{1}')"
delete_cmd="$(build_cmd "$SCRIPT_PATH" --action delete --db "$DB_PATH" --id '{1}')"

monitor_changes() {
  local db="$1"
  local port_file="$2"
  local reload_payload="$3"
  local last_mtime=""
  while sleep 1; do
    [[ -f "$db" ]] || break
    current_mtime="$(stat -c %Y "$db" 2>/dev/null || echo 0)"
    local current_mtime
    if [[ "$current_mtime" != "$last_mtime" ]]; then
      last_mtime="$current_mtime"
      if [[ -s "$port_file" ]]; then
        local port
        port="$(cat "$port_file")"
        if [[ -n "$port" ]]; then
          curl -fsS -X POST --data-binary "$reload_payload" "http://127.0.0.1:${port}/" >/dev/null 2>&1 || true
        fi
      fi
    fi
  done
}

reload_payload="reload(eval:$refresh_cmd)"

monitor_changes "$DB_PATH" "$port_file" "$reload_payload" &
WATCH_PID=$!
trap 'rm -f "$port_file"; kill "$WATCH_PID" 2>/dev/null || true' EXIT

run_refresh "$DB_PATH" "$SHOW_SENSITIVE" | fzf \
  --ansi \
  --height="$HEIGHT" \
  --layout=reverse \
  --border \
  --delimiter=$'\t' \
  --with-nth=2,5 \
  --preview-window='down,40%,wrap' \
  --preview="printf 'ID: %s\nTime: %s\nMIME: %s\nSensitive: %s\nPreview: %s\n' {1} {2} {3} {4} {5}" \
  --header='Enter: type via wlrctl | Ctrl-Y: copy | Ctrl-D: delete (scratch only)' \
  --bind "start:execute-silent(echo \$FZF_PORT > $port_file)" \
  --bind "enter:execute-silent($type_cmd)" \
  --bind "ctrl-y:execute-silent($copy_cmd)" \
  --bind "ctrl-d:execute-silent($delete_cmd)+reload(eval:$refresh_cmd)" \
  --listen

kill "$WATCH_PID" 2>/dev/null || true
