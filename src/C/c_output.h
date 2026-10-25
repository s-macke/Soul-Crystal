#pragma once

#include "bytecode_tokens.h"
#include "function_symbols.h"
#include <cstdio>
#include <map>
#include <string>
#include <vector>

// Read-only view: the emitter neither reads snapshots nor changes decoder state.
struct COutputInput {
    const std::vector<Token>& tokens;
    const unsigned char (&tables)[0x10000];
    const unsigned char (&functions)[0x10000];
    const FunctionSymbols& symbols;
    const char* const* objectNames = nullptr;
    unsigned objectNameCount = 0;
};

// One pair of constant-table files shared by all emitted game parts.
class CTableFiles {
public:
    CTableFiles(const char* sourcePath, const char* headerPath);
    ~CTableFiles();
    CTableFiles(const CTableFiles&) = delete;
    CTableFiles& operator=(const CTableFiles&) = delete;
    void WriteObjectNames(const unsigned char (&ram)[0x10000]);
    void Write(const COutputInput& input, const std::map<unsigned, std::string>& comments);
private:
    std::vector<std::string> displayNames;
    FILE* source;
    FILE* header;
};

void WriteC(const char* filename, const COutputInput& input,
            const std::map<unsigned, std::string>& comments, CTableFiles& tables);

void WriteCHeader(const char* filename);
