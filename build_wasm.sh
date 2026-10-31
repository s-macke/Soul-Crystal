#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"
wasm_output=${1:-build/wasm}
mkdir -p "$wasm_output"
wasm_objects=$(mktemp -d)
trap 'rm -rf -- "$wasm_objects"' EXIT
for source in out/part{a,b,c,d}.c out/game_{state,tables,texts,texts_en}.c; do
    emcc -std=c11 -O2 -Iout -c "$source" -o "$wasm_objects/$(basename "${source%.c}").o"
done
em++ -std=c++17 -O2 -Iout src/console/game.cpp src/web/bridge.cpp "$wasm_objects/"*.o \
    --no-entry -sMODULARIZE=1 -sEXPORT_ES6=1 -sENVIRONMENT=web,node \
    -sALLOW_MEMORY_GROWTH=1 -sFILESYSTEM=0 \
    '-sEXPORTED_RUNTIME_METHODS=["ccall"]' \
    -o "$wasm_output/soul-crystal.mjs"
