#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"
./build_console.sh
replay_test_dir=$(mktemp -d)
trap 'rm -rf -- "$replay_test_dir"' EXIT
./build/soul-replay tests/replays/part_a.replay
expect_exit() {
    local expected=$1 fixture=$2 status=0
    ./build/soul-replay "$fixture" > "$replay_test_dir/log" 2>&1 || status=$?
    if [[ $status != "$expected" ]]; then
        cat "$replay_test_dir/log"
        printf 'Expected exit %s, got %s for %s\n' "$expected" "$status" "$fixture" >&2
        exit 1
    fi
}
# A complete route cannot pass simply because its first section works.
expect_exit 0 tests/replays/walkthrough.replay
rg -q 'won: 393 commands, 130 assertions; part=4 room=67 score=5010' "$replay_test_dir/log"
printf '@room 99\n@finish checkpoint\n' > "$replay_test_dir/wrong-room"
expect_exit 1 "$replay_test_dir/wrong-room"
printf '> unknown-command\n@finish checkpoint\n' > "$replay_test_dir/rejected"
expect_exit 1 "$replay_test_dir/rejected"
printf '@finish won\n' > "$replay_test_dir/false-win"
expect_exit 1 "$replay_test_dir/false-win"
printf '> warte\n' > "$replay_test_dir/no-finish"
expect_exit 1 "$replay_test_dir/no-finish"
printf '@finish checkpoint\n> west\n' > "$replay_test_dir/trailing-command"
expect_exit 1 "$replay_test_dir/trailing-command"
printf '> speichern\n@finish checkpoint\n' > "$replay_test_dir/blocked"
expect_exit 2 "$replay_test_dir/blocked"
printf '> zerstoere dave\n@mode dead\n@finish dead\n' > "$replay_test_dir/death"
expect_exit 0 "$replay_test_dir/death"
printf '> spielende\n@mode quit\n> ja\n@mode ended\n@finish ended\n' > "$replay_test_dir/quit"
expect_exit 0 "$replay_test_dir/quit"
printf '@location 999 0\n@finish checkpoint\n' > "$replay_test_dir/bad-index"
expect_exit 1 "$replay_test_dir/bad-index"
printf 'Replay: checkpoint, complete winning route, deliberate death/quit and failure reporting verified.\n'
