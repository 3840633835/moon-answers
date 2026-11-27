#!/bin/sh
# Determinism check: run main.py twice into two different output dirs
# and confirm the entry bytes are identical.
set -e
cd "$(dirname "$0")"
OUT1="$(mktemp -d)"
OUT2="$(mktemp -d)"
trap 'rm -rf "$OUT1" "$OUT2"' EXIT
MAKEFUN_OUTPUT_DIR="$OUT1" python3 main.py
MAKEFUN_OUTPUT_DIR="$OUT2" python3 main.py
cmp "$OUT1/entry.txt" "$OUT2/entry.txt"
cmp "$OUT1/entry.txt" entry.txt
echo "determinism: PASS"
