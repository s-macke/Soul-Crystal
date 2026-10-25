#pragma once

#include <array>
#include <cctype>
#include <cstdio>
#include <map>
#include <stdexcept>
#include <string>

struct FunctionSymbol {
    std::string name;
    std::string provenance;
};
using FunctionSymbols = std::map<unsigned, FunctionSymbol>;

// These are four separately verified dispatchers, not one address map reused
// across disks. Validate the native bytes before assigning any semantic name.
inline FunctionSymbols BuildFunctionSymbols(unsigned part, const unsigned char* ram,
        const unsigned char* functions, const char* const* commands) {
    static constexpr unsigned selects[4][4] = {
        {0x76e0, 0x7718, 0x7750, 0x7782}, // A / B1
        {0x7702, 0x773a, 0x7772, 0x77a4}, // B / B2
        {0x76e7, 0x771f, 0x7757, 0x7789}, // C / C1
        {0x7715, 0x774d, 0x7785, 0x77b7}, // D / C2
    };
    static constexpr unsigned bases[] = {0, 13, 26, 37};
    static constexpr unsigned counts[] = {13, 13, 11, 7};
    if (part >= 4) throw std::runtime_error("Unknown game part");
    const std::string partName = std::string("Part") + char('A' + part);
    auto hex = [](unsigned address) {
        char value[8]; std::snprintf(value, sizeof(value), "%04x", address);
        return std::string(value);
    };
    FunctionSymbols result;
    for (unsigned address = 0; address < 0x10000; ++address) {
        if (functions[address]) result[address] = {
            partName + "_Sub_" + hex(address),
            std::string("Part ") + char('A' + part) + ", script $" + hex(address)};
    }
    std::map<unsigned, unsigned> assigned;
    for (unsigned group = 0; group < 4; ++group) {
        unsigned pc = selects[part][group];
        const unsigned select = pc;
        if (ram[pc] != 0xe2 || ram[pc+1] != (group == 0 ? 0x80 : 0x93))
            throw std::runtime_error("Unexpected SELECT in " + partName);
        if (group != 0) {
            const std::array<unsigned char, 5> subtract = {0x93, 0x80, 0xd6, 0xc0, static_cast<unsigned char>(bases[group])};
            for (unsigned n = 0; n < subtract.size(); ++n)
                if (ram[pc-5+n] != subtract[n])
                    throw std::runtime_error("Unexpected command offset in " + partName);
        }
        pc += 2;
        for (unsigned n = 1; n <= counts[group]; ++n, pc += 3) {
            if (ram[pc] != 0xea) throw std::runtime_error("Missing SELECT case in " + partName);
            unsigned address = ram[pc+1] | (unsigned(ram[pc+2]) << 8);
            unsigned command = bases[group] + n;
            if (!functions[address] || !assigned.emplace(address, command).second)
                throw std::runtime_error("Missing or ambiguous command target in " + partName);
            auto& symbol = result.at(address);
            std::string name = commands[command];
            // NIX1/NIX2 are placeholders; do not imply an understood action.
            if (name.rfind("NIX", 0) != 0) {
                for (auto& c : name) c = static_cast<char>(std::tolower(static_cast<unsigned char>(c)));
                name[0] = static_cast<char>(std::toupper(static_cast<unsigned char>(name[0])));
                symbol.name = partName + "_Handle" + name;
            }
            symbol.provenance += "; command " + std::to_string(command) + " (" + commands[command] +
                "), SELECT $" + hex(select) + " case " + std::to_string(n);
        }
        if (ram[pc] == 0xea) throw std::runtime_error("Extra SELECT case in " + partName);
    }
    return result;
}
