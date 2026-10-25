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
rg -q 'won: 597 commands, 410 assertions; part=4 room=67 score=5010' "$replay_test_dir/log"
expect_exit 0 tests/replays/fast.replay
rg -q 'won: 334 commands, 4 assertions; part=4 room=67 score=4955' "$replay_test_dir/log"
# Every alternative and death route starts normally and must meet its own finish.
for fixture in tests/replays/alternatives/*.replay tests/replays/deaths/*.replay; do
    expect_exit 0 "$fixture"
done
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
# Includes are relative to their own file, preserve state, and may be reused.
mkdir -p "$replay_test_dir/nested/sub dir"
printf '> warte\n' > "$replay_test_dir/nested/sub dir/wait.inc"
printf '@include sub dir/wait.inc\n' > "$replay_test_dir/nested/twice.inc"
printf '@steps 1\n@include nested/twice.inc\n@include nested/twice.inc\n@steps 3\n@finish checkpoint\n' > "$replay_test_dir/includes"
expect_exit 0 "$replay_test_dir/includes"
rg -q 'checkpoint: 2 commands, 2 assertions' "$replay_test_dir/log"
printf '@room 99\n' > "$replay_test_dir/nested/sub dir/wait.inc"
expect_exit 1 "$replay_test_dir/includes"
rg -q 'wait.inc:1: Assertion failed' "$replay_test_dir/log"
rg -q 'Included from .*twice.inc:1' "$replay_test_dir/log"
printf '@include missing.inc\n' > "$replay_test_dir/missing-include"
expect_exit 64 "$replay_test_dir/missing-include"
rg -q 'Cannot open .*missing.inc' "$replay_test_dir/log"
printf '@include\n' > "$replay_test_dir/empty-include"
expect_exit 64 "$replay_test_dir/empty-include"
printf '@include cycle-b.inc\n' > "$replay_test_dir/cycle-a.inc"
printf '@include cycle-a.inc\n' > "$replay_test_dir/cycle-b.inc"
expect_exit 64 "$replay_test_dir/cycle-a.inc"
rg -q 'Include cycle' "$replay_test_dir/log"
ln -s cycle-a.inc "$replay_test_dir/cycle-alias.inc"
printf '@include cycle-alias.inc\n' > "$replay_test_dir/cycle-a.inc"
expect_exit 64 "$replay_test_dir/cycle-a.inc"
rg -q 'Include cycle' "$replay_test_dir/log"
for ((i=0; i<33; ++i)); do
    printf '@include depth-%s.inc\n' "$((i+1))" > "$replay_test_dir/depth-$i.inc"
done
printf '@finish checkpoint\n' > "$replay_test_dir/depth-33.inc"
expect_exit 64 "$replay_test_dir/depth-0.inc"
rg -q 'Include depth exceeds 32' "$replay_test_dir/log"
printf '@finish checkpoint\n' > "$replay_test_dir/finish.inc"
printf '@include finish.inc\n> west\n' > "$replay_test_dir/after-include-finish"
expect_exit 1 "$replay_test_dir/after-include-finish"
rg -q 'Content after @finish' "$replay_test_dir/log"
printf 'Replay: checkpoint, exploration, fast win, winning/blocked alternatives, 46 death routes and include/error reporting verified.\n'
