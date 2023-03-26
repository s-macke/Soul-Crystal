set -e
clang++ -O2 src/transformbytecode.cpp -o transformbytecode
clang++ -O2 src/c64text.cpp -o c64text
clang++ -O2 src/soulstory.cpp -o soulstory
clang++ -O2 -std=c++17 src/souldos.cpp -o souldos
clang++ -O2 src/Unit1.cpp src/interpret.cpp -o analyze -g

