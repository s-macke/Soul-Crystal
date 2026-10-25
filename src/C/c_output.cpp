#include "c_output.h"
#include "script_symbols.h"
#include "table_symbols.h"
#include "object_names.h"

#include <cstdio>
#include <cstdlib>

static void Indent(int indent, FILE *fp) {
    for (int j = 0; j < indent; j++) fprintf(fp, "    ");
}

// Part A's ZERSTOERE reader proves seven records of two little-endian words.
// Select by part-aware symbol as addresses are reused by the other scripts.
static bool HasDestroyResponses(const COutputInput& input) {
    const auto function = input.symbols.find(0x7b39);
    if (function == input.symbols.end() || function->second.name != "PartA_HandleZerstoere") return false;
    auto at = [&](int address) -> const Token& {
        for (const auto& token : input.tokens) if (token.addr == address) return token;
        throw std::runtime_error("Missing token in Part A destroy-response reader");
    };
    if (at(0x7b39).type != TABLE || at(0x7b39).data != 0x834a ||
        at(0x7b40).type != READTABLE16 || at(0x7b41).str != ScriptSymbol(0x95).name ||
        at(0x7b42).type != READTABLE16 || at(0x7b43).str != ScriptSymbol(0x92).name)
        throw std::runtime_error("Changed Part A destroy-response schema");
    // Preserve the 1-based scan and its seven-record bound. Do not apply this
    // specialization to a changed reader merely because its address matches.
    if (at(0x7b3c).str != "temp" || !at(0x7b3d).isConstant || at(0x7b3d).data != 1 ||
        at(0x7b4d).str != "temp" || at(0x7b4e).str != "temp" || at(0x7b4f).str != "+" ||
        !at(0x7b50).isConstant || at(0x7b50).data != 1 || at(0x7b53).str != "temp" ||
        at(0x7b54).str != "<=" || !at(0x7b55).isConstant || at(0x7b55).data != 7 ||
        at(0x7b58).type != GOTO || at(0x7b58).data != 0x7b40 ||
        at(0x7b5e).str != "<=" || !at(0x7b5f).isConstant || at(0x7b5f).data != 7)
        throw std::runtime_error("Changed Part A destroy-response loop bounds");
    return true;
}

static bool HasTalkResponses(const COutputInput& input) {
    const auto function = input.symbols.find(0x7f2d);
    if (function == input.symbols.end() || function->second.name != "PartA_HandleSprich") return false;
    auto at = [&](int address) -> const Token& {
        for (const auto& token : input.tokens) if (token.addr == address) return token;
        throw std::runtime_error("Missing token in Part A talk reader");
    };
    if (at(0x7f31).type != TABLE || at(0x7f31).data != 0x8366 ||
        at(0x7f38).type != READTABLE16 || at(0x7f39).str != "scratch1" ||
        at(0x7f3a).type != READTABLE16 || at(0x7f3b).str != "pendingTextID" ||
        at(0x7f34).str != "temp" || !at(0x7f35).isConstant || at(0x7f35).data != 1 ||
        at(0x7f45).str != "temp" || at(0x7f46).str != "temp" || at(0x7f47).str != "+" ||
        !at(0x7f48).isConstant || at(0x7f48).data != 1 || at(0x7f4c).str != "<=" ||
        !at(0x7f4d).isConstant || at(0x7f4d).data != 15 ||
        at(0x7f50).type != GOTO || at(0x7f50).data != 0x7f38 ||
        at(0x7f56).str != ">" || !at(0x7f57).isConstant || at(0x7f57).data != 15)
        throw std::runtime_error("Changed Part A talk table reader");
    return true;
}

static void WriteDataTables(FILE* fp, FILE* header, const COutputInput& input, bool destroyResponses, bool talkResponses, const TableSymbols& names,
                            const std::map<unsigned, std::string>& comments) {
    std::map<unsigned, std::vector<unsigned char>> tables;
    unsigned current = 0;
    for (const auto& token : input.tokens) {
        if (input.tables[token.addr]) current = token.addr;
        if (token.type == DATA) {
            if (!current) throw std::runtime_error("Data without a table");
            tables[current].push_back(static_cast<unsigned char>(token.data));
        }
    }
    for (const auto& entry : tables) {
        const auto address = entry.first;
        auto bytes = entry.second;
        const auto& tableName = names.at(address).name;
        bool overlappingScan = false;
        bool omittedEndMarker = false;
        if (tableName.find("_OpenCloseObjects") != std::string::npos) {
            const auto adjacent = tables.find(address + 81);
            if (bytes.size() != 81 || adjacent == tables.end() || adjacent->second.size() < 3)
                throw std::runtime_error("Changed OpenCloseObjects overlap");
            // Original code scans 28 triples across the next table boundary.
            // Materialize those exact bytes instead of invoking C out-of-bounds behavior.
            bytes.insert(bytes.end(), adjacent->second.begin(), adjacent->second.begin() + 3);
            overlappingScan = true;
        }
        if (!talkResponses && tableName.find("_TalkResponses") != std::string::npos) {
            if (bytes.size() != 61 || bytes.back() != 0xff)
                throw std::runtime_error("Changed talk-table end marker");
            bytes.pop_back();
            omittedEndMarker = true;
        }
        if (destroyResponses && address == 0x834a) {
            if (bytes.size() != 7 * 4) throw std::runtime_error("Wrong destroy-response table size");
            fputs("extern const ObjectTextEntry PartA_DestroyResponses[7];\n", header);
            fputs("\nconst ObjectTextEntry PartA_DestroyResponses[] = { // Script $834a: object/text pairs\n", fp);
            for (unsigned i = 0; i < bytes.size(); i += 4) {
                unsigned object = bytes[i] | (unsigned(bytes[i+1]) << 8);
                unsigned text = bytes[i+2] | (unsigned(bytes[i+3]) << 8);
                fprintf(fp, "    {0x%04x, 0x%04x}, // $%04x\n", object, text, address+i);
            }
            fputs("};\n", fp);
        } else if (talkResponses && address == 0x8366) {
            if (bytes.size() != 61 || bytes[60] != 0xff)
                throw std::runtime_error("Unexpected Part A talk table boundary");
            fputs("\n// 15 original object/text pairs ($8366-$83a1), followed by script-end byte $ff at $83a2.\n", fp);
            fputs("// Further snapshot bytes are not conversation entries. See spec/C64/c_compilation.md.\n", fp);
            fputs("extern const ObjectTextEntry PartA_TalkResponses[15];\n", header);
            fputs("const ObjectTextEntry PartA_TalkResponses[] = {\n", fp);
            for (unsigned i = 0; i < 60; i += 4) {
                unsigned object = bytes[i] | (unsigned(bytes[i+1]) << 8);
                unsigned text = bytes[i+2] | (unsigned(bytes[i+3]) << 8);
                auto found = comments.find(text);
                std::string comment = found == comments.end() ? "unmapped text ID" : found->second;
                if (comment.size() > 110) {
                    auto end = comment.rfind(' ', 107);
                    comment = comment.substr(0, end == std::string::npos ? 107 : end) + "...";
                }
                fprintf(fp, "    // $%04x; text ID %u: %s\n", address+i, text, comment.c_str());
                if (input.objectNames && object < input.objectNameCount)
                    fprintf(fp, "    {%s, %u},\n", input.objectNames[object], text);
                else
                    fprintf(fp, "    {0x%04x, %u}, // Original object ID has no named enum.\n", object, text);
            }
            fputs("};\n", fp);
        } else {
            fprintf(header, "extern const unsigned char %s[%zu];\n", names.at(address).name.c_str(), bytes.size());
            fprintf(fp, "\nconst unsigned char %s[] = { // Script $%04x: %s\n", names.at(address).name.c_str(), address, names.at(address).description.c_str());
            if (overlappingScan)
                fputs("    // 27 physical records; the original 28th scan reads the first 3 LockKeyPairs bytes.\n", fp);
            if (omittedEndMarker)
                fputs("    // 15 records. Following script-end marker $ff is not a table entry.\n", fp);
            const unsigned columns = names.at(address).recordBytes == 1 ? 16 : names.at(address).recordBytes;
            for (unsigned i = 0; i < bytes.size(); ++i) {
                if (overlappingScan && i == 81)
                    fputs("    // Compatibility record copied from adjacent LockKeyPairs; not a new game rule.\n", fp);
                if (i % columns == 0) fputs("    ", fp);
                fprintf(fp, "0x%02x%s", bytes[i], i + 1 < bytes.size() ? "," : "");
                fputs(i % columns == columns - 1 || i + 1 == bytes.size() ? "\n" : " ", fp);
            }
            fputs("};\n", fp);
        }
    }
    fputs("\n", fp);
}

static void WriteDeclarations(FILE* fp, const COutputInput& input) {
    const auto& isfunc = input.functions;
    const auto& symbols = input.symbols;

    for (int i = 0; i < 0x10000; i++) {
        if (isfunc[i]) {
            fprintf(fp, "void %s(void); // %s\n", symbols.at(i).name.c_str(), symbols.at(i).provenance.c_str());
        }
    }
    fprintf(fp, "\n");
}

void WriteC(const char* filename, const COutputInput& input,
            const std::map<unsigned, std::string>& comments, CTableFiles& tables) {
    const auto& tokens = input.tokens;
    const auto& isfunc = input.functions;
    const auto& symbols = input.symbols;
    int k = 0;
    int selectAddr = 0;
    FILE *fp = fopen(filename, "w");
    if (fp == NULL) {
        printf("Error: Cannot open file to write\n");
        exit(1);
    }

    fprintf(fp, "#include \"game_script.h\"\n#include \"game_tables.h\"\n");

    const bool destroyResponses = HasDestroyResponses(input);
    const bool talkResponses = HasTalkResponses(input);
    const auto tableNames = BuildTableSymbols(tokens, input.tables, symbols);
    tables.Write(input, comments);
    WriteDeclarations(fp, input);

    int indent = 1;
    fprintf(fp, "\n\nvoid %s(void) {\n", input.entryName);

    for (std::size_t i = 0; i < tokens.size();) {

        if (isfunc[tokens[i].addr]) {
            fprintf(fp, "}\n\n");
            fprintf(fp, "\nvoid %s(void) { // %s\n", symbols.at(tokens[i].addr).name.c_str(), symbols.at(tokens[i].addr).provenance.c_str());
            indent = 1;
        } else if (tokens[i].isjump) {
            fprintf(fp, "\nx%04x:\n", tokens[i].addr);
        }

        switch (tokens[i].type) {

            case TokenType::VARIABLE:
                Indent(indent, fp);
                if (tokens[i + 1].type == VARIABLE && tokens[i + 2].type == EQ) {
                    fprintf(fp, "%s = %s;", tokens[i].str.c_str(), tokens[i + 1].str.c_str());
                    if (tokens[i].str == ScriptSymbol(0x92).name) {
                        if (tokens[i + 1].isConstant) {
                            unsigned id = tokens[i + 1].data;
                            auto found = comments.find(id);
                            fprintf(fp, " // text ID %u (0x%04x), script $%04x: %s", id, id,
                                tokens[i].addr, found == comments.end() ? "outside mapped message range; engine special/error path" : found->second.c_str());
                        } else {
                            fprintf(fp, " // dynamic text ID, script $%04x; resolve through GameTextLookup(gamePart, id)", tokens[i].addr);
                        }
                    }
                    i += 3;
                } else if (tokens[i + 1].type == VARIABLE && tokens[i + 2].type == OP &&
                           tokens[i + 3].type == VARIABLE) {
                    fprintf(fp, "%s = %s %s %s;", tokens[i].str.c_str(), tokens[i + 1].str.c_str(),
                            tokens[i + 2].str.c_str(), tokens[i + 3].str.c_str());
                    i += 4;
                } else {
                    fprintf(fp, "%4zu 0x%04x: unknown variable type %i", i, tokens[i].addr, (int) tokens[i].type);
                    i++;
                }
                break;

            case TokenType::IF:
                if (indent == 0) fprintf(fp, "\n");

                Indent(indent, fp);
                fprintf(fp, "if (");
                while (tokens[i].type != TokenType::IFEND) {
                    fprintf(fp, "%s ", tokens[i].str.c_str());
                    i++;
                }
                fprintf(fp, ") {");
                i++;
                indent++;
                break;

            case TokenType::ENDIF:
                indent--;
                if (indent <= 0) {
                    indent = 1;
                    printf("Error; Endif ident equal zero at 0x%04x\n", tokens[i].addr);
                } else {
                    Indent(indent, fp);
                    fprintf(fp, "}");
                }

                i++;
                break;

            case TokenType::ELSE:
                Indent(indent - 1, fp);
                fprintf(fp, "} else {");
                i++;
                break;

            case TokenType::GOTO:
                Indent(indent, fp);
                fprintf(fp, "goto x%04x;", tokens[i].data);
                i++;
                break;

            case TokenType::GOSUB:
                Indent(indent, fp);
                //fprintf(fp, "gosub x%04x;", tokens[i].data);
                fprintf(fp, "%s(); if (ScriptInterrupted()) return;", symbols.at(tokens[i].data).name.c_str());
                i++;
                break;

            case TokenType::RETURN:
                Indent(indent, fp);
                fprintf(fp, "return;");
                i++;
                break;

            case TokenType::SELECT:
                Indent(indent, fp);
                selectAddr = tokens[i].addr;
                i++;
                fprintf(fp, "switch(%s) { // SELECT script $%04x; original cases are 1-based\n", tokens[i].str.c_str(), selectAddr);
                i++;
                // $2C65 initializes the original SELECT CASE counter to one.
                k = 1;
                while (tokens[i].type == TokenType::CASE) {
                    Indent(indent + 1, fp);
                    fprintf(fp, " case %i: %s(); if (ScriptInterrupted()) return; break;\n", k, symbols.at(tokens[i].data).name.c_str());
                    i++;
                    k++;
                }
                Indent(indent, fp);
                fprintf(fp, "}");
                break;

            case TokenType::FUNC:
                Indent(indent, fp);
                // A trailing // annotation must not swallow the statement semicolon.
                {
                    const auto comment = tokens[i].str.find(" // ");
                    if (comment == std::string::npos) fprintf(fp, "%s;", tokens[i].str.c_str());
                    else fprintf(fp, "%s;%s", tokens[i].str.substr(0, comment).c_str(), tokens[i].str.substr(comment).c_str());
                }
                fputs("\n", fp);
                Indent(indent, fp);
                fputs("if (ScriptInterrupted()) return;", fp);
                i++;
                break;

            case TokenType::FUNC2:
                Indent(indent, fp);
                fprintf(fp, "%s = %s;", tokens[i + 1].str.c_str(), tokens[i].str.c_str());
                i += 2;
                break;

            case TokenType::TABLE:
                Indent(indent, fp);
                if (destroyResponses && tokens[i].addr == 0x7b39) {
                    fputs("// $7b39: use structured PartA_DestroyResponses; temp remains the 1-based scan index.", fp);
                } else if (talkResponses && tokens[i].addr == 0x7f31) {
                    fputs("// $7f31: use structured PartA_TalkResponses; temp remains the 1-based scan index.", fp);
                } else {
                    fprintf(fp, "tableptr = %s;", tableNames.at(tokens[i].data).name.c_str());
                }
                i++;
                break;

            case TokenType::READTABLE8:
                Indent(indent, fp);
                fprintf(fp, "%s = *tableptr++;", tokens[i + 1].str.c_str());
                i += 2;
                break;

            case TokenType::READTABLE16:
                Indent(indent, fp);
                if (destroyResponses && (tokens[i].addr == 0x7b40 || tokens[i].addr == 0x7b42)) {
                    fprintf(fp, "%s = PartA_DestroyResponses[temp - 1].%s;",
                            tokens[i + 1].str.c_str(), tokens[i].addr == 0x7b40 ? "object" : "text");
                } else if (talkResponses && (tokens[i].addr == 0x7f38 || tokens[i].addr == 0x7f3a)) {
                    fprintf(fp, "%s = PartA_TalkResponses[temp - 1].%s;",
                            tokens[i + 1].str.c_str(), tokens[i].addr == 0x7f38 ? "object" : "text");
                } else {
                    fprintf(fp, "%s = ReadTableWord(&tableptr);", tokens[i + 1].str.c_str());
                }
                i += 2;
                break;

            case TokenType::DATA:
                i++;
                goto end;

            default:
                Indent(indent, fp);
                fprintf(fp, "%4zu 0x%04x: unknown type %i", i, tokens[i].addr, (int) tokens[i].type);
                i++;
                break;
        }
        fprintf(fp, "\n");
    }

    end:
    fprintf(fp, "}\n");

    fclose(fp);
}


void WriteCHeader(const char* filename) {
    FILE* fp = fopen(filename, "w");
    if (!fp) throw std::runtime_error("Cannot write C interface header");
    fputs(R"C(#ifndef SOUL_GAME_SCRIPT_H
#define SOUL_GAME_SCRIPT_H

#include <stdint.h>
#include "game_ids.h"

/* Preserve the existing scalar widths; enums name values, not storage types. */
typedef uint8_t ScriptByte;
typedef uint16_t ScriptWord;
typedef uint16_t CommandID;
typedef uint16_t ObjectID;
typedef uint16_t RoomID;
typedef uint16_t GamePart;
typedef uint16_t TextID;
typedef uint16_t ImageID;
enum { RoomStateCount = 104, ObjectStateCount = 166 };

typedef struct ObjectTextEntry {
    ObjectID object;
    TextID text;
} ObjectTextEntry;

/* Mutable definitions and disk-derived initial values are in game_state.c. */
)C", fp);
    for (const auto& symbol : ScriptSymbols) {
        fprintf(fp, "extern %s %s%s; // %s\n", symbol.cType, symbol.name,
                symbol.isArray ? ((symbol.token <= 0xa5 || symbol.token == 0xa8) ? "[RoomStateCount]" : "[ObjectStateCount]") : "", symbol.description);
    }
    fputs(R"C(
extern ScriptWord engineState69BF; // Saved engine field, meaning not yet fully named.
extern const ScriptByte *tableptr;
void SPECIAL(ScriptWord operation);
void showtext(void);
void FlushOutput(void);
int ScriptInterrupted(void);
void ResetGameState(void);
void PartA_Execute(void);
void PartB_Execute(void);
void PartC_Execute(void);
void PartD_Execute(void);
void ShowImage(void);
void Code2E5B(void);

/* Unaligned little-endian source words, independent of host byte order. */
static inline ScriptWord ReadTableWord(const ScriptByte **cursor) {
    const ScriptByte *p = *cursor;
    *cursor += 2;
    return (ScriptWord)((ScriptWord)p[0] | ((ScriptWord)p[1] << 8));
}

#endif
)C", fp);
    if (fclose(fp) != 0) throw std::runtime_error("Cannot close C interface header");
}

CTableFiles::CTableFiles(const char* sourcePath, const char* headerPath) {
    source = fopen(sourcePath, "w");
    header = fopen(headerPath, "w");
    if (!source || !header) {
        if (source) fclose(source);
        if (header) fclose(header);
        throw std::runtime_error("Cannot open constant-table files");
    }
    fputs("// Generated immutable script lookup data. Mutable state is declared separately.\n#include \"game_tables.h\"\n", source);
    fputs("#ifndef SOUL_GAME_TABLES_H\n#define SOUL_GAME_TABLES_H\n#include \"game_script.h\"\n\n", header);
}

CTableFiles::~CTableFiles() {
    fputs("\n#endif\n", header);
    fclose(source);
    fclose(header);
}

void CTableFiles::Write(const COutputInput& input, const std::map<unsigned, std::string>& comments) {
    const auto names = BuildTableSymbols(input.tokens, input.tables, input.symbols);
    WriteDataTables(source, header, input, HasDestroyResponses(input), HasTalkResponses(input), names, comments);
}

void CTableFiles::WriteObjectNames(const unsigned char (&ram)[0x10000]) {
    const auto decoded = DecodeObjectDisplayNames(ram);
    if (!displayNames.empty()) {
        if (decoded != displayNames) throw std::runtime_error("Object names differ between game parts");
        return;
    }
    displayNames = decoded;
    fputs("extern const char *const objectDisplayNames[ObjectStateCount]; // UTF-8; index 0 is empty.\n", header);
    fputs("\n// Original display names, decoded by $4FB1 from offsets $C0A5/$C14A.\n"
          "// Identical in all four part snapshots. Index 0 is a port sentinel.\n"
          "const char *const objectDisplayNames[ObjectStateCount] = {\n", source);
    for (unsigned id = 0; id < decoded.size(); ++id) {
        fputs("    \"", source);
        for (unsigned char c : decoded[id]) {
            if (c == '\\' || c == '\"') fputc('\\', source);
            fputc(c, source);
        }
        fprintf(source, "\", // object %u\n", id);
    }
    fputs("};\n", source);
}
