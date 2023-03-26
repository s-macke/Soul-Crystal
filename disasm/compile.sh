set -e
clang -O2 src/main.c src/disasm.c src/output.c src/c64.c src/analyze.c src/tables.c -o disasm
./disasm > out.c
