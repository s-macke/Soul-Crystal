#pragma once

#include "bytecode_tokens.h"
#include "function_symbols.h"
#include <set>
#include <vector>

struct TableSymbol {
    std::string name;
    std::string description;
    unsigned recordBytes = 1;
};
using TableSymbols = std::map<unsigned, TableSymbol>;

// Determine names from each part's verified command handlers, never from a
// globally reused address. Names describe usage; raw layouts remain unchanged.
inline TableSymbols BuildTableSymbols(const std::vector<Token>& tokens,
        const unsigned char* tables, const FunctionSymbols& functions) {
    std::string prefix = "Script";
    if (!functions.empty()) prefix = functions.begin()->second.name.substr(0, 5);
    TableSymbols result;
    for (unsigned address = 0; address < 0x10000; ++address) {
        if (!tables[address]) continue;
        char hex[8]; std::snprintf(hex, sizeof hex, "%04x", address);
        result[address] = {prefix + "_Table_" + hex, "Unclassified raw table"};
    }
    std::set<unsigned> classified;
    std::string handler;
    unsigned tableOrdinal = 0;
    for (std::size_t i = 0; i < tokens.size(); ++i) {
        auto function = functions.find(tokens[i].addr);
        if (function != functions.end()) {
            handler = function->second.name;
            tableOrdinal = 0;
        }
        if (tokens[i].type != TABLE) continue;
        const unsigned ordinal = tableOrdinal++;
        std::string suffix, description;
        unsigned fields = 0;
        TokenType read = READTABLE8;
        if (handler == prefix + "_HandleNimm" && ordinal == 0) {
            suffix = "TakeableObjects"; description = "Object IDs accepted by NIMM's initial lookup"; fields = 1;
        } else if ((handler == prefix + "_HandleSchliesse" || handler == prefix + "_HandleOeffne") && ordinal == 0) {
            suffix = "OpenCloseObjects"; description = "Object, direction code, destination room (byte triples)"; fields = 3;
        } else if ((handler == prefix + "_HandleVerriegele" || handler == prefix + "_HandleEntriegele") && ordinal <= 1) {
            suffix = ordinal == 0 ? "LockKeyPairs" : "LockingExceptions";
            description = ordinal == 0 ? "Lock object / matching key object (byte pairs)" : "Object list selecting special locking responses";
            fields = ordinal == 0 ? 2 : 1;
        } else if (ordinal == 0) {
            read = READTABLE16; fields = 2;
            if (handler == prefix + "_HandleHilf") suffix = "HelpResponses";
            else if (handler == prefix + "_HandleZerstoere") suffix = "DestroyResponses";
            else if (handler == prefix + "_HandleSprich") suffix = "TalkResponses";
            description = "Object ID / text ID (little-endian word pairs)";
        }
        if (suffix.empty()) continue;
        // Recognized readers initialize the 1-based scan index after TABLE.
        if (i + 4 + 2*fields > tokens.size() || tokens[i+1].str != "temp" ||
            !tokens[i+2].isConstant || tokens[i+2].data != 1 || tokens[i+3].type != EQ)
            throw std::runtime_error("Changed table reader in " + handler);
        for (unsigned field = 0; field < fields; ++field) {
            if (tokens[i+4+field*2].type != read || tokens[i+5+field*2].type != VARIABLE)
                throw std::runtime_error("Changed table record width in " + handler);
        }
        auto& symbol = result.at(tokens[i].data);
        const auto name = prefix + "_" + suffix;
        if (classified.count(tokens[i].data) && symbol.name != name)
            throw std::runtime_error("Conflicting table uses in " + prefix);
        symbol = {name, description, fields * (read == READTABLE16 ? 2u : 1u)};
        classified.insert(tokens[i].data);
    }
    return result;
}
