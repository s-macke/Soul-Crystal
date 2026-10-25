#include "c_output.h"
#include "script_symbols.h"

#include <cstdio>
#include <cstdlib>

static void Indent(int indent, FILE *fp) {
    for (int j = 0; j < indent; j++) fprintf(fp, "    ");
}

static void WriteDataTables(FILE* fp, const COutputInput& input) {
    const auto& tokens = input.tokens;
    const auto& istable = input.tables;

    bool firstcomma = true;
    bool firstdata = true;
    for (std::size_t i = 0; i < tokens.size(); i++) {
        if (istable[tokens[i].addr]) {
            if (firstdata) {
                firstdata = false;
            } else {
                fprintf(fp, "};\n");
            }
            fprintf(fp, "\nunsigned char data0x%04x[] = {", tokens[i].addr);
            firstcomma = true;
        }
        if (tokens[i].type == TokenType::DATA) {
            if (firstcomma) {
                fprintf(fp, "0x%02x", tokens[i].data);
                firstcomma = false;
            } else {
                fprintf(fp, ", 0x%02x", tokens[i].data);
            }
        }
    }
    fprintf(fp, "};\n\n");
}

static void WriteDeclarations(FILE* fp, const COutputInput& input) {
    const auto& isfunc = input.functions;
    const auto& symbols = input.symbols;


    for (int i = 0; i < 0x10000; i++) {
        if (isfunc[i]) {
            fprintf(fp, "void %s(); // %s\n", symbols.at(i).name.c_str(), symbols.at(i).provenance.c_str());
        }
    }
    fprintf(fp, "\n");

    for (const auto& symbol : ScriptSymbols) {
        if (!symbol.isArray) {
            fprintf(fp, "%s %s; // $%04x: %s\n", symbol.cType,
                    symbol.name, symbol.address, symbol.description);
        }
    }
    fprintf(fp, "unsigned char *tableptr;\n");

    fprintf(fp, "void SPECIAL(unsigned short x);\n");
    fprintf(fp, "void showtext();\n");
    fprintf(fp, "void Restart();\n");
    fprintf(fp, "void ShowImage();\n"); // Code4087()
    fprintf(fp, "void Code2E5B();\n");

}

void WriteC(const char* filename, const COutputInput& input,
            const std::map<unsigned, std::string>& comments) {
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

    fprintf(fp, "#include\"src/tables.h\"\n");

    WriteDataTables(fp, input);
    WriteDeclarations(fp, input);

    int indent = 1;
    fprintf(fp, "\n\nvoid Execute() {\n");

    for (std::size_t i = 0; i < tokens.size();) {

        if (isfunc[tokens[i].addr]) {
            fprintf(fp, "}\n\n");
            fprintf(fp, "\nvoid %s() { // %s\n", symbols.at(tokens[i].addr).name.c_str(), symbols.at(tokens[i].addr).provenance.c_str());
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
                            fprintf(fp, " // dynamic text ID, script $%04x; resolve through texts/C64/text_ids.json", tokens[i].addr);
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
                fprintf(fp, "%s();", symbols.at(tokens[i].data).name.c_str());
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
                    fprintf(fp, " case %i: %s(); break;\n", k, symbols.at(tokens[i].data).name.c_str());
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
                i++;
                break;

            case TokenType::FUNC2:
                Indent(indent, fp);
                fprintf(fp, "%s = %s;", tokens[i + 1].str.c_str(), tokens[i].str.c_str());
                i += 2;
                break;

            case TokenType::TABLE:
                Indent(indent, fp);
                fprintf(fp, "tableptr = data0x%04x;", tokens[i].data);
                i++;
                break;

            case TokenType::READTABLE8:
                Indent(indent, fp);
                fprintf(fp, "%s = *tableptr++;", tokens[i + 1].str.c_str());
                i += 2;
                break;

            case TokenType::READTABLE16:
                Indent(indent, fp);
                fprintf(fp, "%s = *(unsigned short*)tableptr; tableptr += 2;", tokens[i + 1].str.c_str());
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

