#!/bin/bash
set -e

if [[ -z "$SCRIPTS" ]]; then
  echo "SCRIPTS environment variable is not set!"
  exit 1
fi

BIN="$SCRIPTS/bin"
SRC="$SCRIPTS/src"
src_file="$1"
repo_dir="$(pwd)"

if [[ ! -f "$src_file" ]]; then
  echo "Source file not found: $src_file"
  exit 1
fi

filename=$(basename "$src_file")
base="${filename%.*}"

mkdir -p "$BIN"

case "$src_file" in
  *.c)
    gcc "$src_file" -o "$BIN/$base"
    ;;
  *.cpp)
    g++ "$src_file" -o "$BIN/$base"
    ;;
  *.py)
    if [[ -f "pyproject.toml" ]]; then
      uv pip install --app . --target "$BIN/$base"
      # Or, for packages:
      # uv pip install --compile . --target "$BIN/$base"
    else
      echo "For Python, provide a pyproject.toml or adjust to your workflow."
      exit 2
    fi
    ;;
  *)
    echo "Unsupported file type: $src_file"
    exit 2
    ;;
esac

ln -sf "$BIN/$base" "$repo_dir/$base"
echo "Built and linked $BIN/$base -> $repo_dir/$base"
