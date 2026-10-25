#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"
# Validate every assertion first; the collector measures actual output only.
text_report_dir=$(mktemp -d /tmp/soul-replay-texts.XXXXXX)
./check-replay.sh > "$text_report_dir/validation.log" 2>&1 || {
    cat "$text_report_dir/validation.log"
    exit 1
}
for source in out/part{a,b,c,d}.c out/game_{state,tables,texts}.c; do
    "${CC:-clang}" -std=c11 -O2 -Iout -c "$source" -o "$text_report_dir/$(basename "${source%.c}").o"
done
"${CXX:-clang++}" -std=c++17 -O2 -Iout src/console/game.cpp src/console/text_coverage.cpp \
    "$text_report_dir/"*.o -o "$text_report_dir/collect"
"$text_report_dir/collect" "$text_report_dir/report" \
    tests/replays/*.replay tests/replays/alternatives/*.replay tests/replays/deaths/*.replay
