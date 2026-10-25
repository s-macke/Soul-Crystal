#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"
# Compile only: engine definitions are deliberately not supplied or linked.
c_check_dir=$(mktemp -d)
trap 'rm -rf -- "$c_check_dir"' EXIT
for part in a b c d; do
    clang -std=c11 -pedantic-errors -Werror=implicit-function-declaration \
        -Werror=incompatible-pointer-types -Wstrict-prototypes -Werror=strict-prototypes \
        -I. -c "out/part${part}.c" -o "$c_check_dir/part${part}.o"
done
clang -std=c11 -pedantic-errors -I. -c out/game_tables.c -o "$c_check_dir/game_tables.o"
clang -std=c11 -pedantic-errors -I. -c out/game_state.c -o "$c_check_dir/game_state.o"
clang -std=c11 -pedantic-errors -I. -c out/game_texts.c -o "$c_check_dir/game_texts.o"
printf 'All four generated game parts compile as C11 (without linking).\n'
