#pragma once

#include <stdexcept>
#include <string>

struct ScriptSymbolInfo {
    unsigned char token;
    const char* name;
    const char* cType;
    unsigned short address; // Original scalar address; 0 for arrays not catalogued here.
    bool isArray;
    const char* description;
};

// C scalar types intentionally retain the previous unsigned-short representation.
// This first refactor does not change VM arithmetic or infer native storage widths.
inline constexpr ScriptSymbolInfo ScriptSymbols[] = {
    {0x80, "command", "unsigned short", 0x6986, false, "Parsed command"},
    {0x81, "object1", "unsigned short", 0x6988, false, "First parsed object"},
    {0x82, "object2", "unsigned short", 0x698a, false, "Second parsed object"},
    {0x83, "currentRoom", "unsigned short", 0x695d, false, "Current room"},
    {0x84, "diskSide", "unsigned short", 0x6963, false, "Active side: B1=1, B2=2, C1=3, C2=4"},
    {0x90, "score", "unsigned short", 0x698c, false, "Current score, including deductions"},
    {0x91, "steps", "unsigned short", 0x698e, false, "Original step counter"},
    {0x92, "pendingTextID", "unsigned short", 0x6990, false, "Logical message ID awaiting display"},
    {0x93, "temp", "unsigned short", 0x6992, false, "Shared temporary value"},
    {0x94, "imageID", "unsigned short", 0x6994, false, "Selected image ID"},
    {0x95, "scratch1", "unsigned short", 0x6996, false, "Shared scratch value; meaning depends on routine"},
    {0x96, "scratch2", "unsigned short", 0x6998, false, "Shared scratch value; meaning depends on routine"},
    {0x97, "scratch3", "unsigned short", 0x699a, false, "Shared scratch value; meaning depends on routine"},
    {0xa0, "north", "unsigned char", 0, true, "North exit by room"},
    {0xa1, "east", "unsigned char", 0, true, "East exit by room"},
    {0xa2, "south", "unsigned char", 0, true, "South exit by room"},
    {0xa3, "west", "unsigned char", 0, true, "West exit by room"},
    {0xa4, "up", "unsigned char", 0, true, "Up exit by room"},
    {0xa5, "down", "unsigned char", 0, true, "Down exit by room"},
    {0xa6, "objectLocation", "unsigned char", 0, true, "Object location, including special locations"},
    {0xa7, "objectState", "unsigned char", 0, true, "Object-specific state, not a boolean"},
    {0xa8, "visited", "unsigned char", 0, true, "Room visit state"},
    {0xb0, "remainingPoints", "unsigned short", 0, true, "Available point awards, often cleared after collection"},
    {0xb1, "objectDescriptionID", "unsigned short", 0, true, "Object description reference"},
};

inline const ScriptSymbolInfo& ScriptSymbol(unsigned char token) {
    for (const auto& symbol : ScriptSymbols) {
        if (symbol.token == token) return symbol;
    }
    throw std::runtime_error("Unknown script variable token: " + std::to_string(token));
}
