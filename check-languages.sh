#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"
language_test_dir=$(mktemp -d)
trap 'rm -rf -- "$language_test_dir"' EXIT
for source in out/part{a,b,c,d}.c out/game_{state,tables,texts,texts_en}.c; do
    "${CC:-clang}" -std=c11 -O1 -Iout -c "$source" -o "$language_test_dir/$(basename "${source%.c}").o"
done
"${CXX:-clang++}" -std=c++17 -O1 -Iout src/console/language_replay_test.cpp "$language_test_dir/"*.o -o "$language_test_dir/test"
"$language_test_dir/test" tests/replays/fast.replay
"$language_test_dir/test" tests/replays/walkthrough.replay
# Exercise both actual CLI adapters using English commands, without data files.
"${CXX:-clang++}" -std=c++17 -O1 -Iout src/console/game.cpp src/console/main.cpp "$language_test_dir/"*.o -o "$language_test_dir/cli"
"${CXX:-clang++}" -std=c++17 -O1 -Iout src/console/game.cpp src/console/replay.cpp "$language_test_dir/"*.o -o "$language_test_dir/replay"
"$language_test_dir/test" tests/replays/fast.replay "$language_test_dir/fast_en.replay"
"$language_test_dir/replay" "$language_test_dir/fast_en.replay" --language en > "$language_test_dir/replay.log"
grep -q 'won: 334 commands' "$language_test_dir/replay.log"
(cd /tmp && printf 'quit\nyes\n' | "$language_test_dir/cli" --language en) > "$language_test_dir/cli.log"
grep -q 'Goodbye.' "$language_test_dir/cli.log"
"$language_test_dir/cli" --help > "$language_test_dir/help.log"
if "$language_test_dir/cli" --language fr > "$language_test_dir/error.log" 2>&1; then
    printf 'CLI accepted an unsupported language\n' >&2; exit 1
fi
if "$language_test_dir/cli" --language > "$language_test_dir/error.log" 2>&1; then
    printf 'CLI accepted a missing language\n' >&2; exit 1
fi
printf 'English CLI and replay options verified.\n'
