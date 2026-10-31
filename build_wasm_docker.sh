#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"
docker build --file Dockerfile.wasm --output type=local,dest=build/wasm .
