#include "../object_names.h"
#include <cassert>
#include <fstream>
#include <iterator>
#include <algorithm>

int main() {
    unsigned char ram[0x10000];
    auto read = [&](const std::string& path, unsigned offset) {
        std::ifstream file(path, std::ios::binary);
        file.seekg(offset);
        file.read(reinterpret_cast<char*>(ram), sizeof ram);
        assert(file.gcount() == sizeof ram);
    };
    read("opcodeoracle/soul_crystal/soul_crystal_origin_0x0000.bin", 0);
    const auto original = DecodeObjectDisplayNames(ram);
    assert(original.size() == 166 && original[0].empty());
    assert(original[1] == "Abenteurer" && original[5] == "Ledersäckchen");
    assert(original[6] == "Faß" && original[7] == "Gästebett");
    assert(original[8] == "Bett" && original[9] == "Bett");
    assert(original[163] == "Dave" && original[165] == "Zombie");
    for (const auto* side : {"b1", "b2", "c1", "c2"}) {
        read(std::string("data/C64/snapshots/disk") + side + ".vsf", 0x99);
        assert(DecodeObjectDisplayNames(ram) == original);
    }
    // A damaged offset must fail rather than silently emitting an empty name.
    ram[0xc0a5] = 0xff;
    bool rejected = false;
    try { DecodeObjectDisplayNames(ram); }
    catch (const std::runtime_error&) { rejected = true; }
    assert(rejected);
}
