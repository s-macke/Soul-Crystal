#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"
# Optional host-side measurement. GCC/gcov are not required by the game itself.
coverage_root=$PWD
coverage_dir=$(mktemp -d /tmp/soul-replay-coverage.XXXXXX)
for source in out/part{a,b,c,d}.c out/game_{state,tables,texts,texts_en}.c; do
    gcc -std=c11 -O0 --coverage -Iout -c "$coverage_root/$source" -o "$coverage_dir/$(basename "${source%.c}").o"
done
g++ -std=c++17 -O0 -Iout src/console/game.cpp src/console/replay.cpp "$coverage_dir/"*.o --coverage -o "$coverage_dir/replay"
for fixture in tests/replays/*.replay tests/replays/alternatives/*.replay tests/replays/deaths/*.replay; do
    if ! "$coverage_dir/replay" "$fixture" > "$coverage_dir/last-run.txt" 2>&1; then
        cat "$coverage_dir/last-run.txt"
        exit 1
    fi
done
for part in a b c d; do
    (cd "$coverage_dir" && gcov -b -c -j "part$part.gcno")
    (cd "$coverage_dir" && gcov -b -c "part$part.gcno") > "$coverage_dir/part$part-summary.txt"
done
printf 'Coverage files: %s\n' "$coverage_dir"
