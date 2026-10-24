#!/usr/bin/env bash
# Regenerate the C64 and DOS PNGs and their offline galleries.
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"
export GO111MODULE=off
case "${1:-all}" in
  c64) go run ./src/Go/images ;;
  dos) go run ./src/Go/dospic ;;
  all) go run ./src/Go/images; go run ./src/Go/dospic ;;
  *) echo "Usage: $0 [all|c64|dos]" >&2; exit 2 ;;
esac
