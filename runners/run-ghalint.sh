#!/usr/bin/env bash
set -euo pipefail

# === Path Initialization ===
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly SCRIPT_DIR

GIT_DIR="$(git -C "${SCRIPT_DIR}" rev-parse --show-toplevel)"
readonly GIT_DIR

CONFIG_FILE="${GIT_DIR}/configs/ghalint.yaml"
readonly CONFIG_FILE

# === Tool Check ===
if ! command -v ghalint &>/dev/null; then
  echo "Error: ghalint is not installed" >&2
  echo "  Install: https://github.com/suzuki-shunsuke/ghalint#install" >&2
  exit 1
fi

# === Main Execution ===
if [[ $# -eq 0 ]]; then
  ghalint --config "${CONFIG_FILE}" run
else
  ghalint --config "${CONFIG_FILE}" "$@"
fi
