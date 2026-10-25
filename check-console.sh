#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"
console_test_dir=$(mktemp -d)
trap 'rm -rf -- "$console_test_dir"' EXIT
for source in out/part{a,b,c,d}.c out/game_{state,tables,texts}.c; do
    clang -std=c11 -g -O1 -fsanitize=address,undefined -fno-omit-frame-pointer -Iout -c "$source" -o "$console_test_dir/$(basename "${source%.c}").o"
done
clang++ -std=c++17 -g -O1 -fsanitize=address,undefined -fno-omit-frame-pointer -Iout \
    src/console/game.cpp src/console/game_test.cpp "$console_test_dir/"*.o -o "$console_test_dir/test"
# LeakSanitizer cannot inspect processes under the sandbox tracer. ASan/UBSan stay enabled.
ASAN_OPTIONS="${ASAN_OPTIONS:-detect_leaks=0}" "$console_test_dir/test"
