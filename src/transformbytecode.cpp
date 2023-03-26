#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<string>
#include<vector>

#include"tables.h"

// address at address 0x6976: 0x7600

unsigned char ram[0x10000];
unsigned char iscode[0x10000];
unsigned char isjump[0x10000];
unsigned char istable[0x10000];
unsigned char isfunc[0x10000];
unsigned short pc;
int casen;

unsigned int getd64pos(int track, int sector, int byte) {
    int pos = -1;

    if ((track >= 1) && (track <= 17)) {
        pos = (track - 1) * 21 * 256 + sector * 256 + byte;
        return pos;
    }

    if ((track >= 18) && (track <= 24)) {
        pos = 17 * 21 * 256 + (track - 18) * 19 * 256 + sector * 256 + byte;
        return pos;
    }

    if ((track >= 25) && (track <= 30)) {
        pos = 17 * 21 * 256 + 6 * 19 * 256 + (track - 25) * 18 * 256 + sector * 256 + byte;
        return pos;
    }

    if ((track >= 31) && (track <= 35)) {
        pos = 17 * 21 * 256 + 6 * 19 * 256 + 6 * 18 * 256 + (track - 31) * 17 * 256 + sector * 256 + byte;
        return pos;
    }
    printf("unknown track");
    return pos;
}

int LoadIntoMemory(const char *filename, int offset) {
    FILE *file;
    uint8_t buf[174848];
    file = fopen(filename, "rb");
    if (file == NULL) {
        fprintf(stderr, "Error: Cannot open file\n");
        exit(1);
    }
    fread(buf, 174848, 1, file);
    fclose(file);

    int address = 0x7600;

    memcpy(&ram[address], &buf[offset + 4], 0x100 - 4);
    address += 0x100 - 4;

    printf("%i 0x%06x 0x%02x 0x%02x\n", 0, offset, buf[offset + 0], buf[offset + 1]);
    for (int i = 0; i < 30; i++) {
        offset = getd64pos(buf[offset + 0], buf[offset + 1], 0);
        printf("%i 0x%06x 0x%02x 0x%02x\n", i + 1, offset, buf[offset + 0], buf[offset + 1]);

        if (buf[offset + 0] == 0) {
            memcpy(&ram[address], &buf[offset + 2], buf[offset + 1]);
            address += buf[offset + 1] - 2;
            break;
        } else {
            memcpy(&ram[address], &buf[offset + 2], 0x100 - 2);
            address += 0x100 - 2;
        }
    }

    printf("size: %i\n", address - 0x7600);
    return address - 0x7600;

/*
    FILE *file = fopen("data/nachcodeabfrage.vsf", "rb");
    if (file == NULL) {
        fprintf(stderr, "Error: Cannot open file\n");
        exit(1);
    }
    fread(ram, 0x80, 1, file);
    fread(ram, 0x10000, 1, file);
    fclose(file);
    return 3721;
    */
}

void LoadVSF(const char *filename) {
    FILE *file;
    file = fopen(filename, "rb");
    if (file == NULL) {
        printf("Error: Cannot open file\n");
        exit(1);
    }
    fseek(file, 0x99, SEEK_SET);
    int size = fread(ram, 0x10000, 1, file);
    fclose(file);
}

int lasttoken = 0x0;

std::string InterpretVariable(unsigned char token) {

    switch (token) {
        case 0x80:
            return std::string("command");  // addr6986
            break;
        case 0x81:
            return std::string("object1");  // addr6988
            break;
        case 0x82:
            return std::string("object2"); // addr698A
            break;
        case 0x83:
            return std::string("roomnumber"); // addr695D
            break;
        case 0x84:
            return std::string("addr6963");  // addr6963
            break;
        case 0x90:
            return std::string("pointsum"); // addr698c
            break;
        case 0x91:
            return std::string("steps"); // addr698E
            break;
        case 0x92:
            return std::string("textoutput"); // addr6990
            break;
        case 0x93:
            return std::string("temp"); // addr6992
            break;
        case 0x94:
            return std::string("addr6994");
            break;
        case 0x95:
            return std::string("addr6996");
            break;
        case 0x96:
            return std::string("addr6998");
            break;
        case 0x97:
            return std::string("addr699a");
            break;
        case 0xA0:
            return std::string("north");
            break;
        case 0xA1:
            return std::string("east");
            break;
        case 0xA2:
            return std::string("south");
            break;
        case 0xA3:
            return std::string("west");
            break;
        case 0xA4:
            return std::string("up");
            break;
        case 0xA5:
            return std::string("down");
            break;
        case 0xA6:
            return std::string("objectposition");
            break;
        case 0xA7:
            return std::string("objectstatus");
            break;
        case 0xA8:
            return std::string("visited");  //visited
            break;
        case 0xB0:
            return std::string("points"); // 16 Bit
            break;
        case 0xB1:
            return std::string("objectdescription"); // 16 Bit
            break;

            // case 0xB2: ???

        default:
            return std::string("Not_found");
            break;
    }
}

std::string ConstantToVariable(unsigned int token) {

    int temptoken = lasttoken;
    lasttoken = 0;
    if ((temptoken == 0x80) && (token < 45)) {
        return std::string(commandnames[token]);
    }
    if ((temptoken == 0x81) && (token < 165)) {
        return std::string(objectnames[token]);
    }
    if ((temptoken == 0x82) && (token < 165)) {
        return std::string(objectnames[token]);
    }
    if ((temptoken == 0x83) && (token < 103)) {
        return std::string(roomnames2[token]);
    }
    if ((temptoken == 0xA6) && (token < 103)) { // object position
        return std::string(roomnames2[token]);
    }

    char output[16];
    sprintf(output, "0x%04x", token);
    return std::string(output);
}


std::string ConstantToVariableInBracket(unsigned int token) {

    int temptoken = lasttoken;
    //lasttoken = 0;
    if ((temptoken == 0x80) && (token < 45)) {
        return std::string(commandnames[token]);
    }
    if ((temptoken == 0x81) && (token < 165)) {
        return std::string(objectnames[token]);
    }
    if ((temptoken == 0x82) && (token < 165)) {
        return std::string(objectnames[token]);
    }
    if ((temptoken == 0xA6) && (token < 165)) {
        return std::string(objectnames[token]);
    }
    if ((temptoken == 0xA7) && (token < 165)) {
        return std::string(objectnames[token]);
    }
    if ((temptoken == 0xB1) && (token < 165)) {
        return std::string(objectnames[token]);
    }
    if ((temptoken == 0x83) && (token < 103)) {
        return std::string(roomnames2[token]);
    }
    if ((temptoken == 0xA8) && (token < 103)) {
        return std::string(roomnames2[token]);
    }
    if ((temptoken >= 0xA0) && (temptoken <= 0xA6) && (token < 103)) {
        return std::string(roomnames2[token]);
    }

    char output[16];
    sprintf(output, "0x%04x", token);
    return std::string(output);
}


std::string VariableReference(unsigned char token) // Code at 0x1D8B
{
    std::string str;
    lasttoken = token;
    str = InterpretVariable(token);

    if (token >= 0xA0) {
        unsigned char nexttoken = ram[pc];

        if (nexttoken == 0xC0) { // is a constant
            token = ram[pc++];
            token = ram[pc++];

            str += "[" + ConstantToVariableInBracket(token) + "]";
            //str += "[" + std::to_string(token) + "]";
        } else if ((nexttoken >= 0x80) && (nexttoken < 0xC0)) { // is a variable
            str += "[" + InterpretVariable(nexttoken) + "]";
            pc++;
        } else {
            str += "[unknown]";
            printf("Error: Unknown index definition\n");
            exit(1);
        }
    }
    return str;
}

/*
bytecode offset in d64 images. Not sure if size is correct. Must search for 00 76 92 c0
B1: 0x13d00 size=0x0d10
B2: 0x25800 size=0x081f
C1: 0x15700 size=0x1211
C2: 0x26900 size=0x0d20

---
vice monitor commands
m 7600
m 6976
break 1c12
break 1d71
---

7600 92  read at 1c12
7601 c0  read at 1e8c, 1dbe
7602 00  read at 228a, 1dbe
7603 d7  read at 1dc1

7604 d0  read at 1c12
7605 80  read at 1e8c, 27af, 299b, 2ad7
7606 dc  read at 27be, 299b, 2ad7
7607 c0  read at 1e8c, 281f, 299b, 2ad7
7608     read at 228a, 281f, 299b, 2ad7
7609     read at 2ad7, 299e
760a     read at 2ad7, 29f0, 27af, 1e8c


-----
betrachte dave, nimm dave, ziehe dave

7600   7600
7604   7604
764d   764d
7650   7650
7656   7656
7659   7659
76df          76df
76e0          76e0    switch

7713          7713
7718          7718
774b
7750   7750
7c25   777d
7c29   7782
7c53
7c72
7c8e
7ca5
7ca6
7cbe
7cda
7773
7779
7799
77a1
77a8
77af
77b6
77b7
77d1
*/


std::string ReadNextVariable(unsigned char token) {
    unsigned int x;
    if (token >= 0x80)
        if (token < 0xC0) {
            return VariableReference(token);
        }

    if (token == 0xC0) {
        x = ram[pc];
        //printf("const 0x%02x", x);
        pc += 1;
        return ConstantToVariable(x);
    }

    if (token == 0xC1) {
        x = (int)ram[pc] | ((int)ram[pc + 1] << 8);
        pc += 2;
        return ConstantToVariable(x);
    }

    return std::string();
}

enum TokenType {
    UNDEF,
    DATA,
    VARIABLE,
    IF,
    IFEND,
    ELSE,
    ENDIF,
    OP,
    GOSUB,
    GOTO,
    RETURN,
    FUNC,
    TABLE,
    SELECT,
    CASE,
    READTABLE8,
    READTABLE16,
    EQ,
    FUNC2
};

struct Token {
    int addr;
    bool isjump;
    TokenType type;
    int data;
    std::string str;
};

std::vector <Token> tokens;

void Token() {
    uint16_t x;
    unsigned char token = ram[pc];
    struct Token t;
    t.addr = pc;
    t.type = UNDEF;
    t.isjump = false;

    if (istable[pc]) {
        printf("0x%04x: table\n", pc);
        printf("0x%04x: ", pc);
        //t.isjump = true;
    } else if (isjump[pc]) {
        printf("0x%04x: ", pc);
        t.isjump = true;
    } else {
        printf("        ");
    }

    printf("0x%04x: 0x%02x ", pc, token);
    printf(" ");
    pc++;

    if (iscode[pc - 1] == 0) {
        t.type = TokenType::DATA;
        t.data = token;
        tokens.push_back(t);
        printf("data db 0x%02x\n", token);
        return;
    }

    std::string str = ReadNextVariable(token);
    if (!str.empty()) {
        t.str = str;
        t.type = TokenType::VARIABLE;
        tokens.push_back(t);
        printf("%s\n", str.c_str());
        return;
    }

    switch (token) {
        case 0xD0:
            t.type = TokenType::IF;
            printf("IF");
            break;

        case 0xD1:
            t.type = TokenType::IFEND;
            printf("IF ENDSTATEMENT");
            break;

        case 0xD2:
            t.type = TokenType::ELSE;
            printf("ELSE");
            break;

        case 0xD3:
            t.type = TokenType::ENDIF;
            printf("ENDIF");
            break;

        case 0xD5:
            t.type = TokenType::OP;
            t.str = "+";
            printf("+");
            break;

        case 0xD6:
            t.type = TokenType::OP;
            t.str = "-";
            printf("-");
            break;

        case 0xD7:
            t.type = TokenType::EQ;
            t.str = "=";
            printf("=");
            break;

        case 0xD8:
            t.type = TokenType::OP;
            t.str = "&&";
            printf("AND");
            break;

        case 0xD9:
            t.type = TokenType::OP;
            t.str = "||";
            printf("OR");
            break;

        case 0xDA:
            t.type = TokenType::OP;
            t.str = ">";
            printf(">");
            break;

        case 0xDB:
            t.type = TokenType::OP;
            t.str = "<";
            printf("<");
            break;

        case 0xDC:
            t.type = TokenType::OP;
            t.str = "==";
            printf("==");
            break;

        case 0xDD:
            t.type = TokenType::OP;
            t.str = "!=";
            printf("!=");
            break;

        case 0xDE:
            t.type = TokenType::OP;
            t.str = ">=";
            printf(">=");
            break;

        case 0xDF:
            t.type = TokenType::OP;
            t.str = "<=";
            printf("<=");
            break;

        case 0xE0:
            x = ram[pc] | (ram[pc + 1] << 8);
            t.type = TokenType::GOSUB;
            t.data = x;
            printf("GOSUB 0x%04x", x);
            pc += 2;
            break;

        case 0xE1:
            x = ram[pc] | (ram[pc + 1] << 8);
            t.type = TokenType::GOTO;
            t.data = x;
            if (ram[x] == 0xE7) t.type = TokenType::RETURN; // jump to return
            printf("GOTO 0x%04x", x);
            pc += 2;
            break;

        case 0xE2:
            t.type = TokenType::SELECT;
            printf("SELECT CASE");
            break;

        case 0xE3:
            x = ram[pc] | (ram[pc + 1] << 8);
            printf("UNKNOWN2 0x%04x", x);
            t.type = TokenType::FUNC;
            t.str = "unknown2(" + std::to_string(x) + ")";
            pc += 2;
            break;

        case 0xE4:
            t.type = TokenType::READTABLE8;
            printf("Read table entry 8 bit");
            break;

        case 0xE5:
            t.type = TokenType::READTABLE16;
            printf("Read table entry 16 bit");
            break;

        case 0xEA:
            x = ram[pc] | (ram[pc + 1] << 8);
            t.type = TokenType::CASE;
            t.data = x;
            printf("CASE 0x%04x", x);
            pc += 2;
            break;

        case 0xEF:
            token = ram[pc];
            pc++;
            str = ReadNextVariable(token);
            if (str.empty()) {
                printf("Error: string empty\n");
                exit(1);
            }
            printf("SPECIAL(%s)", str.c_str());
            t.type = TokenType::FUNC;
            t.str = "SPECIAL(" + str + ")";
            break;

        case 0xE6:
            x = ram[pc] | (ram[pc + 1] << 8);
            t.type = TokenType::TABLE;
            t.data = x;
            printf("set table address 0x%04x", x); // addr69B3
            pc += 2;
            break;

        case 0xE8:
            t.type = TokenType::FUNC;
            t.str = "showtext()";
            printf("showtext()");
            break;

        case 0xEB: // Code4087()
            t.type = TokenType::FUNC;
            t.str = "Code4087()";
            printf("Code4087()");
            break;

        case 0xED: // Code2E5B()
            t.type = TokenType::FUNC;
            t.str = "Code2E5B()";
            printf("Code2E5B()");
            break;

        case 0xEE: // CodeCDB();
            t.type = TokenType::FUNC;
            t.str = "Restart()";
            printf("Restart()");
            break;

        case 0xE7:
            t.type = TokenType::RETURN;
            printf("RETURN");
            break;

        default:
            printf("db 0x%02x", token);
            printf("Error: undefined token\n");
            exit(1);
            break;
    }

    tokens.push_back(t);
    printf("\n");
}

void WalkCode(int pc, int size) {

    unsigned short x;
    if ((pc - 0x7600) >= size) return;
    if (iscode[pc]) return;
    if (isjump[pc]) return;
    isjump[pc] = 1;

    while ((pc - 0x7600) <= size) { // variables and other stuff
        //printf("at 0x%04x\n", pc);
        unsigned char token = ram[pc];
        iscode[pc] = 1;
        pc++;

        if (token == 0xC0) { // constant
            pc++;
            continue;
        }
        if (token == 0xC1) { // 2 byte constant
            pc += 2;
            continue;
        }

        if ((token >= 0x80) && (token < 0xE0)) {
            continue;
        }

        switch (token) {
            case 0xFF:
                return;

            case 0xE5: // unknown3
            case 0xEB: // Code4087()
            case 0xE8: // showtext
            case 0xED: // Code2E5B()
            case 0xEE: // Restart()
            case 0xEF: // special
                break;

            case 0xE4: // read table entry
            case 0xE2: // select case
                break;

            case 0xE6: // set table
                x = ram[pc] | (ram[pc + 1] << 8);
                istable[x] = 1;
                pc += 2;
                break;

            case 0xE0: // GOSUB
                x = ram[pc] | (ram[pc + 1] << 8);
                if (isfunc[x] == 0) isfunc[x] = 100;
                WalkCode(x, size);
                pc += 2;
                break;

            case 0xEA: // CASE
                x = ram[pc] | (ram[pc + 1] << 8);
                isfunc[x] = casen++;
                WalkCode(x, size);
                pc += 2;
                break;

            case 0xE1: // GOTO
                x = ram[pc] | (ram[pc + 1] << 8);
                if (ram[x] != 0xE7) isjump[x] = 1; // ignore jump to return
                WalkCode(x, size);
                pc += 2;
                break;

            case 0xE7: // return
                return;

            default:
                printf("unknown byte code 0x%02x at 0x%04x\n", token, pc - 1);
                exit(1);
        }
    }
}

void TransformByteCode(int size)  // Code at 0x1C12
{
    pc = 0x7600;
    while ((pc - 0x7600) <= size) {
        Token();
    }
}

void Indent(int indent, FILE *fp) {
    for (int j = 0; j < indent; j++) fprintf(fp, "    ");
}

void ToC(const char* filename, const char *texts[]) {
    int k = 0;
    FILE *fp = fopen(filename, "w");
    if (fp == NULL) {
        printf("Error: Cannot open file to write\n");
        exit(1);
    }

    fprintf(fp, "#include\"src/tables.h\"\n");

// --------------------------
    bool firstcomma = true;
    bool firstdata = true;
    for (int i = 0; i < tokens.size(); i++) {
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
// --------------------------

    for (int i = 0; i < 0x10000; i++) {
        if (isfunc[i]) {
            fprintf(fp, "void Func%04x(); // %s\n", i, isfunc[i]<45?commandnames[isfunc[i]]:"");
        }
    }
    fprintf(fp, "\n");

    fprintf(fp, "unsigned short textoutput;\n");
    fprintf(fp, "unsigned short command;\n");
    fprintf(fp, "unsigned short roomnumber;\n");
    fprintf(fp, "unsigned short temp;\n");
    fprintf(fp, "unsigned short object1, object2;\n");
    fprintf(fp, "unsigned short steps;\n");
    fprintf(fp, "unsigned short addr6963;\n");
    fprintf(fp, "unsigned short addr6994;\n");
    fprintf(fp, "unsigned short pointsum;\n");
    fprintf(fp, "unsigned short addr6996;\n");
    fprintf(fp, "unsigned short addr699a;\n");
    fprintf(fp, "unsigned short addr6998;\n");
    fprintf(fp, "unsigned char *tableptr;\n");

    fprintf(fp, "void SPECIAL(unsigned short x);\n");
    fprintf(fp, "void showtext();\n");
    fprintf(fp, "void Restart();\n");
    fprintf(fp, "void Code4087();\n");
    fprintf(fp, "void Code2E5B();\n");

    int indent = 1;
    fprintf(fp, "\n\nvoid Execute() {\n");

    for (int i = 0; i < tokens.size();) {

        if (isfunc[tokens[i].addr]) {
            fprintf(fp, "}\n\n");
            fprintf(fp, "\nvoid Func%04x() { // %s\n", tokens[i].addr, isfunc[tokens[i].addr]<45?commandnames[isfunc[tokens[i].addr]]:"");
            indent = 1;
        } else if (tokens[i].isjump) {
            fprintf(fp, "\nx%04x:\n", tokens[i].addr);
        }

        switch (tokens[i].type) {

            case TokenType::VARIABLE:
                Indent(indent, fp);
                if (tokens[i + 1].type == VARIABLE && tokens[i + 2].type == EQ) {
                    fprintf(fp, "%s = %s;", tokens[i].str.c_str(), tokens[i + 1].str.c_str());
                    if (tokens[i + 0].str == "textoutput") {
                        try {
                            unsigned int hex = std::stoul(tokens[i + 1].str, nullptr, 16);
                            if (hex < 0x100) fprintf(fp, " // %s", texts[hex]);
                        } catch (...) {
                        }
                    }
                    i += 3;
                } else if (tokens[i + 1].type == VARIABLE && tokens[i + 2].type == OP &&
                           tokens[i + 3].type == VARIABLE) {
                    fprintf(fp, "%s = %s %s %s;", tokens[i].str.c_str(), tokens[i + 1].str.c_str(),
                            tokens[i + 2].str.c_str(), tokens[i + 3].str.c_str());
                    i += 4;
                } else {
                    fprintf(fp, "%4i 0x%04x: unknown variable type %i", i, tokens[i].addr, (int) tokens[i].type);
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
                fprintf(fp, "Func%04x();", tokens[i].data);
                i++;
                break;

            case TokenType::RETURN:
                Indent(indent, fp);
                fprintf(fp, "return;");
                i++;
                break;

            case TokenType::SELECT:
                Indent(indent, fp);
                i++;
                fprintf(fp, "switch(%s) {\n", tokens[i].str.c_str());
                i++;
                k = 0;
                while (tokens[i].type == TokenType::CASE) {
                    Indent(indent + 1, fp);
                    fprintf(fp, " case %i: Func%04x(); break;\n", k, tokens[i].data);
                    i++;
                    k++;
                }
                Indent(indent, fp);
                fprintf(fp, "}");
                break;

            case TokenType::FUNC:
                Indent(indent, fp);
                fprintf(fp, "%s;", tokens[i].str.c_str());
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
                fprintf(fp, "%4i 0x%04x: unknown type %i", i, tokens[i].addr, (int) tokens[i].type);
                i++;
                break;
        }
        fprintf(fp, "\n");
    }

    end:
    fprintf(fp, "}\n");

    fclose(fp);
}

void Init() {
    casen = 1;
    tokens.clear();
    memset(ram, 0, 0x10000);
    memset(iscode, 0, 0x10000);
    memset(isjump, 0, 0x10000);
    memset(isfunc, 0, 0x10000);
    memset(istable, 0, 0x10000);
}

int main() {
    int size;

    //size = LoadIntoMemory("d64/Soul Crystal SideB1.d64", 0x13d00);
    //size = LoadIntoMemory("d64/Soul Crystal SideB2.d64", 0x25800);
    //size = LoadIntoMemory("d64/Soul Crystal SideC1.d64", 0x15700);
    //size = LoadIntoMemory("d64/Soul Crystal SideC2.d64", 0x26900);

    Init();
    LoadVSF("snapshots/diskb1.vsf");
    size = 3490;
    WalkCode(0x7600, size);
    TransformByteCode(size);
    ToC("out/parta.c", texta);

    Init();
    LoadVSF("snapshots/diskb2.vsf");
    size = 7864;
    WalkCode(0x7600, size);
    TransformByteCode(size);
    ToC("out/partb.c", textb);

    Init();
    LoadVSF("snapshots/diskc1.vsf");
    size = 3721;
    WalkCode(0x7600, size);
    TransformByteCode(size);
    ToC("out/partc.c", textc);

    Init();
    LoadVSF("snapshots/diskc2.vsf");
    size = 6914;
    WalkCode(0x7600, size);
    TransformByteCode(size);
    ToC("out/partd.c", textd);
    return 0;
}


//   1  Bis jetzt hast Du ... punkte
//   2  bitte gib den 0. buchstaben ...
//   3  Deine Eingabe war leider falsch
//   4  r04
//   5  aber dorthin kannst Du doch gar nicht
//   8  Ok, Jeans abgelegt
//  12  Jeans, genommen
//  20  Bitte lege die Diskette
//  30 Langsam fange ich an zu frieren
//  40 Vor dem Gebrauch Deine Fäuste
//  50 Eine primitive schartige Schaufel
//  60 Na gut, wie Du meinst. Hendenhaft stürzt
//  70 Du stehst an der Rezeption
//  80 Der Farbprospekt
//  90 Willst Du mir schon wieder auf die
//  A0 Nachdem es sich ein wenig erhohlt hat
//  B0 kein text


// 200  kein text
// 201  kein text
// 202  kein text
// 203  kein text
// 210  kein text
// 220  kein text
// 230  kein text
// 240  kein Text
// 250  Spielstand wird geladen
// 258  Du findest das wohl witzig
// 268  Tja, was sein muß
// 269 möchtest Du das Spiel beenden
// 26A bitte lege die diskette
// 270
// 270 kein Text
// 278 kein text
// 280 illegal mesnr 640
// 281 illegal mesnr 641
// 290 illegal mesnr 656
// 295 illegal mesnr 661
// 29c illegal mesnr 668



