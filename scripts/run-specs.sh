#!/usr/bin/env bash
set -euo pipefail

# ShellSpec runner
# CLAUDE.md の指示: shellspec は直接呼ばず bash ./scripts/run-specs.sh を使う

if ! command -v shellspec &>/dev/null; then
  echo "Error: shellspec is not installed" >&2
  echo "  Install: https://shellspec.info/installation" >&2
  exit 1
fi

shellspec "$@"
