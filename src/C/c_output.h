#pragma once

#include "bytecode_tokens.h"
#include "function_symbols.h"
#include <map>
#include <string>
#include <vector>

// Read-only view: the emitter neither reads snapshots nor changes decoder state.
struct COutputInput {
    const std::vector<Token>& tokens;
    const unsigned char (&tables)[0x10000];
    const unsigned char (&functions)[0x10000];
    const FunctionSymbols& symbols;
};

void WriteC(const char* filename, const COutputInput& input,
            const std::map<unsigned, std::string>& comments);
