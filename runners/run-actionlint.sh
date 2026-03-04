#!/usr/bin/env bash
set -euo pipefail

# === Path Initialization ===
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly SCRIPT_DIR

GIT_DIR="$(git -C "${SCRIPT_DIR}" rev-parse --show-toplevel)"
readonly GIT_DIR

CONFIG_FILE="${GIT_DIR}/configs/actionlint.yaml"
readonly CONFIG_FILE

# === Tool Check ===
if ! command -v actionlint &>/dev/null; then
  echo "Error: actionlint is not installed" >&2
  echo "  Install: https://github.com/rhysd/actionlint#installation" >&2
  exit 1
fi

# === Main Execution ===
if [[ $# -eq 0 ]]; then
  actionlint -config-file "${CONFIG_FILE}"
else
  actionlint -config-file "${CONFIG_FILE}" "$@"
fi
