#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"
# Text comments are compiled from the checked-in header; no Go/JSON build dependency.
clang++ -std=c++17 -O2 src/C/transformbytecode.cpp -o transformbytecode
#clang++ -O2 src/C/c64text.cpp -o c64text
#clang++ -O2 src/C/soulstory.cpp -o soulstory
#clang++ -O2 -std=c++17 src/C/souldos.cpp -o souldos
#clang++ -O2 src/Unit1.cpp src/C/interpret.cpp -o analyze -g#clang++ -O2 src/tables.cpp -o tables
