#include "../c_output.h"
#include "../script_symbols.h"
#include <cassert>
#include <fstream>
#include <iterator>
#include <set>

int main(int argc, char** argv) {
    assert(argc == 2); // Temporary output file supplied by the caller.
    std::set<unsigned> ids;
    std::set<std::string> names;
    for (const auto& symbol : ScriptSymbols) {
        assert(ids.insert(symbol.token).second);
        assert(names.insert(symbol.name).second);
        assert(&ScriptSymbol(symbol.token) == &symbol);
    }
    bool rejected = false;
    try { ScriptSymbol(0x85); } catch (const std::runtime_error&) { rejected = true; }
    assert(rejected);

    unsigned char tables[0x10000] = {};
    unsigned char functions[0x10000] = {};
    const FunctionSymbols symbols = {{0x7700, {"PartA_HandleExample", "fixture"}}, {0x7800, {"PartA_Sub_7800", "fixture"}}};
    std::vector<Token> tokens;
    auto append = [&](TokenType type, int addr, const char* str, int value = 0, bool literal = false) {
        tokens.push_back({addr, false, type, value, literal, str});
    };
    append(VARIABLE, 0x7600, ScriptSymbol(0x90).name);
    append(VARIABLE, 0x7601, "0x03e8", 1000, true);
    append(EQ, 0x7604, "=");
    append(VARIABLE, 0x7605, ScriptSymbol(0x92).name);
    append(VARIABLE, 0x7606, "0x2e", 46, true);
    append(EQ, 0x7608, "=");
    append(SELECT, 0x7609, "");
    append(VARIABLE, 0x760a, ScriptSymbol(0x80).name);
    append(CASE, 0x760b, "", 0x7700);
    append(CASE, 0x760e, "", 0x7800);
    append(FUNC, 0x7611, "SPECIAL(0x64) // engine annotation");
    append(RETURN, 0x7614, "");
    tables[0x7615] = 1;
    append(DATA, 0x7615, "", 0x34);
    append(DATA, 0x7616, "", 0x12);
    {
        CTableFiles tableFiles((std::string(argv[1]) + ".tables.c").c_str(), (std::string(argv[1]) + ".tables.h").c_str());
        WriteC(argv[1], {tokens, tables, functions, symbols}, {{46, "fixture text"}}, tableFiles);
    }

    std::ifstream stream(argv[1]);
    std::string output((std::istreambuf_iterator<char>(stream)), {});
    auto contains = [&](const std::string& expected) { assert(output.find(expected) != std::string::npos); };
    contains("#include \"game_script.h\"");
    WriteCHeader((std::string(argv[1]) + ".h").c_str());
    std::ifstream headerStream(std::string(argv[1]) + ".h");
    std::string header((std::istreambuf_iterator<char>(headerStream)), {});
    for (const auto& symbol : ScriptSymbols) {
        const std::string declaration = std::string("extern ") + symbol.cType + " " + symbol.name + (symbol.isArray ? ((symbol.token <= 0xa5 || symbol.token == 0xa8) ? "[RoomStateCount];" : "[ObjectStateCount];") : ";");
        assert(header.find(declaration) != std::string::npos);
    }
    contains("score = 0x03e8;");
    contains("pendingTextID = 0x2e; // text ID 46 (0x002e), script $7605: fixture text");
    contains("case 1: PartA_HandleExample(); break;");
    contains("case 2: PartA_Sub_7800(); break;");
    contains("SPECIAL(0x64); // engine annotation");
    std::ifstream tableStream(std::string(argv[1]) + ".tables.c");
    std::string tableSource((std::istreambuf_iterator<char>(tableStream)), {});
    assert(tableSource.find("const unsigned char PartA_Table_7615[] = { // Script $7615: Unclassified raw table\n    0x34, 0x12\n};") != std::string::npos);
    assert(output.find("PartA_Table_7615[]") == std::string::npos);
    assert(output.find("case 0:") == std::string::npos);
}
