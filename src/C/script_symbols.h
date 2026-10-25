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

// Fixed-width aliases retain the previous 16-bit scalar and 8/16-bit array model.
// ID categories do not change arithmetic or infer narrower native storage widths.
inline constexpr ScriptSymbolInfo ScriptSymbols[] = {
    {0x80, "command", "CommandID", 0x6986, false, "Parsed command"},
    {0x81, "object1", "ObjectID", 0x6988, false, "First parsed object"},
    {0x82, "object2", "ObjectID", 0x698a, false, "Second parsed object"},
    {0x83, "currentRoom", "RoomID", 0x695d, false, "Current room"},
    {0x84, "gamePart", "GamePart", 0x6963, false, "Active side: B1=1, B2=2, C1=3, C2=4"},
    {0x90, "score", "ScriptWord", 0x698c, false, "Current score, including deductions"},
    {0x91, "steps", "ScriptWord", 0x698e, false, "Original step counter"},
    {0x92, "pendingTextID", "TextID", 0x6990, false, "Logical message ID awaiting display"},
    {0x93, "temp", "ScriptWord", 0x6992, false, "Shared temporary value"},
    {0x94, "imageID", "ImageID", 0x6994, false, "Selected image ID"},
    {0x95, "scratch1", "ScriptWord", 0x6996, false, "Shared scratch value; meaning depends on routine"},
    {0x96, "scratch2", "ScriptWord", 0x6998, false, "Shared scratch value; meaning depends on routine"},
    {0x97, "scratch3", "ScriptWord", 0x699a, false, "Shared scratch value; meaning depends on routine"},
    {0xa0, "north", "ScriptByte", 0, true, "North exit by room"},
    {0xa1, "east", "ScriptByte", 0, true, "East exit by room"},
    {0xa2, "south", "ScriptByte", 0, true, "South exit by room"},
    {0xa3, "west", "ScriptByte", 0, true, "West exit by room"},
    {0xa4, "up", "ScriptByte", 0, true, "Up exit by room"},
    {0xa5, "down", "ScriptByte", 0, true, "Down exit by room"},
    {0xa6, "objectLocation", "ScriptByte", 0, true, "Object location, including special locations"},
    {0xa7, "objectState", "ScriptByte", 0, true, "Object-specific state, not a boolean"},
    {0xa8, "visited", "ScriptByte", 0, true, "Room visit state"},
    {0xb0, "remainingPoints", "ScriptWord", 0, true, "Available point awards, often cleared after collection"},
    {0xb1, "objectDescriptionID", "ScriptWord", 0, true, "Object description reference"},
};

inline const ScriptSymbolInfo& ScriptSymbol(unsigned char token) {
    for (const auto& symbol : ScriptSymbols) {
        if (symbol.token == token) return symbol;
    }
    throw std::runtime_error("Unknown script variable token: " + std::to_string(token));
}
