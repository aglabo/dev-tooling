#!/usr/bin/env bash
set -euo pipefail

# actionlint runner: 引数で指定したファイル/ディレクトリを検証
# 引数なしの場合は .github/workflows/ を対象にする

if ! command -v actionlint &>/dev/null; then
  echo "Error: actionlint is not installed" >&2
  echo "  Install: https://github.com/rhysd/actionlint#installation" >&2
  exit 1
fi

if [[ $# -eq 0 ]]; then
  actionlint .github/workflows/*
else
  actionlint "$@"
fi
