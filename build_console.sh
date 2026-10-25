#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"
# Checked-in C assets: no Go, JSON, disk images or external libraries needed.
console_build_dir=$(mktemp -d)
trap 'rm -rf -- "$console_build_dir"' EXIT
mkdir -p build
for source in out/part{a,b,c,d}.c out/game_{state,tables,texts,texts_en}.c; do
    "${CC:-clang}" -std=c11 -O2 -Iout -c "$source" -o "$console_build_dir/$(basename "${source%.c}").o"
done
"${CXX:-clang++}" -std=c++17 -O2 -Iout src/console/game.cpp src/console/main.cpp "$console_build_dir/"*.o -o build/soul-crystal
"${CXX:-clang++}" -std=c++17 -O2 -Iout src/console/game.cpp src/console/replay.cpp "$console_build_dir/"*.o -o build/soul-replay
printf 'Built build/soul-crystal and build/soul-replay\n'
