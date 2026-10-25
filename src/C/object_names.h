#pragma once
#include <string>
#include <vector>
#include <stdexcept>

// $4FB1: split offset tables, relative to $C294; bit 7 ends a name.
// Translate the game's three character groups to UTF-8 display text.
inline std::vector<std::string> DecodeObjectDisplayNames(const unsigned char (&ram)[0x10000]) {
    const char* specialLower[] = {"ä", "ö", "ü", "[", "]"};
    const char* specialUpper[] = {"Ä", "Ö", "Ü", "ß", "["};
    std::vector<std::string> names(166); // Index 0 is a port sentinel, not a native name.
    for (unsigned id = 1; id <= 165; ++id) {
        unsigned address = 0xc294 + ram[0xc149 + id] + 256u * ram[0xc0a4 + id];
        bool ended = false;
        for (unsigned length = 0; length < 256 && address < 0x10000; ++length, ++address) {
            const unsigned byte = ram[address], code = byte & 0x7f;
            const unsigned group = code >> 5, letter = code & 31;
            if (group == 1) names[id] += char(32 + letter);
            else if (group == 0 || group == 2) {
                if (!letter) names[id] += ' ';
                else if (letter <= 26) names[id] += char((group == 0 ? 'a' : 'A') + letter - 1);
                else names[id] += (group == 0 ? specialLower : specialUpper)[letter - 27];
            } else throw std::runtime_error("Unsupported object-name character group");
            if (byte & 0x80) { ended = true; break; }
        }
        if (!ended) throw std::runtime_error("Unterminated object name");
    }
    return names;
}
