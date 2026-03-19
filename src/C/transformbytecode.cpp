#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<string>
#include<vector>
#include<stdint.h>

#include"tables.h"
#include"disk.h"

#include"vsf.h"

// address at address 0x6976: 0x7600

unsigned char iscode[0x10000];
unsigned char isjump[0x10000];
unsigned char istable[0x10000];
unsigned char isfunc[0x10000];
unsigned short pc;
int casen;

int lasttoken = 0x0;

std::string InterpretVariable(unsigned char token) {
    switch (token) {
        case 0x80:
            return std::string("command");  // addr6986
        case 0x81:
            return std::string("object1");  // addr6988
        case 0x82:
            return std::string("object2"); // addr698A
        case 0x83:
            return std::string("roomnumber"); // addr695D
        case 0x84:
            return std::string("addr6963");  // addr6963
        case 0x90:
            return std::string("pointsum"); // addr698c
        case 0x91:
            return std::string("steps"); // addr698E
        case 0x92:
            return std::string("textoutput"); // addr6990
        case 0x93:
            return std::string("temp"); // addr6992
        case 0x94:
            return std::string("imageno"); // addr6994
        case 0x95:
            return std::string("addr6996");
        case 0x96:
            return std::string("addr6998");
        case 0x97:
            return std::string("addr699a");
        case 0xA0:
            return std::string("north");
        case 0xA1:
            return std::string("east");
        case 0xA2:
            return std::string("south");
        case 0xA3:
            return std::string("west");
        case 0xA4:
            return std::string("up");
        case 0xA5:
            return std::string("down");
        case 0xA6:
            return std::string("objectposition");
        case 0xA7:
            return std::string("objectstatus");
        case 0xA8:
            return std::string("visited");
        case 0xB0:
            return std::string("points"); // 16 Bit
        case 0xB1:
            return std::string("objectdescription"); // 16 Bit
            // case 0xB2: ???
    }
    return std::string("Not_found");
}

std::string ConstantToVariable(unsigned int token, bool isbyte) {

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
    if (isbyte) {
        sprintf(output, "0x%02x", token);
    } else {
        sprintf(output, "0x%04x", token);
    }
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
    sprintf(output, "0x%02x", token); // always used only with byte constants
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
            pc++;
            printf("Ignore Token 0x%02x\n", token);
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

std::string ReadNextVariable(unsigned char token) {
    unsigned int x;
    if (token >= 0x80)
        if (token < 0xC0) {
            return VariableReference(token);
        }

    if (token == 0xC0) {
        x = ram[pc++];
        //printf("const 0x%02x", x);
        return ConstantToVariable(x, true);
    }

    if (token == 0xC1) {
        x = (int)ram[pc] | ((int)ram[pc + 1] << 8);
        pc += 2;
        return ConstantToVariable(x, false);
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
            token = ram[pc++]; // Always called via a constant.
            if (token != 0xC0) {
                printf("Error: token not constant\n");
                exit(1);
            }
            str = ReadNextVariable(token);
            if (str.empty()) {
                printf("Error: string empty\n");
                exit(1);
            }
            printf("SPECIAL(%s)", str.c_str());
            t.type = TokenType::FUNC;
            t.str = "SPECIAL(" + str + ")";
            if (str == "0x01") t.str += " // Codeabfrage";
            if (str == "0x02") t.str += " // Laden";
            if (str == "0x03") t.str += " // Speichern";
            if (str == "0x04") t.str += " // Neustart";
            if (str == "0x05") t.str += " // Spielende";
            if (str == "0x06") t.str += " // Loesung";
            if (str == "0x07") t.str += " // Musik ein";
            if (str == "0x08") t.str += " // Ausgaenge listen";
            if (str == "0x09") t.str += " // Diskette installieren";
            if (str == "0x0a") t.str += " // Inventar anzeigen";
            if (str == "0x33") t.str += " // Gewonnen";
            if (str == "0x64") t.str += " // Habe ich keine Kleidung an, vielleicht?";
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
            t.str = "ShowImage()";
            printf("ShowImage()");
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

void TransformByteCode(int size)  { // Code at 0x1C12{
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
    fprintf(fp, "unsigned short imageno;\n"); // addr6994
    fprintf(fp, "unsigned short pointsum;\n");
    fprintf(fp, "unsigned short addr6996;\n");
    fprintf(fp, "unsigned short addr699a;\n");
    fprintf(fp, "unsigned short addr6998;\n");
    fprintf(fp, "unsigned char *tableptr;\n");

    fprintf(fp, "void SPECIAL(unsigned short x);\n");
    fprintf(fp, "void showtext();\n");
    fprintf(fp, "void Restart();\n");
    fprintf(fp, "void ShowImage();\n"); // Code4087()
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

/*
void LoadByteCode(const char* filename) {
    uint8_t *buf = LoadD64(filename);

    int track = buf[0x260];
    int sector = buf[0x261];
    int offset = getd64pos(track, sector, 0);
    //int track = buf[0x2f0];
    //int sector = buf[0x2f1];
    int ramoffset = buf[offset + 2] | (buf[offset + 3] << 8);
    //sector = buf[offset];
    //track = buf[offset+1];

    printf("0x%04x\n", ramoffset);
    printf("%i %i\n", track, sector);
    LoadIntoMemory(filename, ram, track, sector);
}
*/


int main() {
    int size;
    //LoadByteCode("data/C64/d64/Soul Crystal SideB1.d64");
    //LoadByteCode("data/C64/d64/Soul Crystal SideC2.d64");
    //LoadIntoMemory("data/C64/d64/Soul Crystal SideB1.d64", ram, 16, 2);
    //LoadIntoMemory("data/C64/d64/Soul Crystal SideB2.d64", ram, 32, 4);
    //LoadIntoMemory("data/C64/d64/Soul Crystal SideC1.d64", ram, 17, 7);
    //LoadIntoMemory("data/C64/d64/Soul Crystal SideC2.d64", ram, 33, 4);
    //exit(1);

    Init();
    LoadVSF("data/C64/snapshots/diskb1.vsf");
    //printf("%02x %02x %02x %02x %02x %02x %02x %02x\n", ram[0x7600], ram[0x7601], ram[0x7602], ram[0x7603], ram[0x7604], ram[0x7605], ram[0x7606], ram[0x7607]);
    //exit(1);
    size = 3490;
    WalkCode(0x7600, size);
    TransformByteCode(size);
    ToC("out/parta.c", texta);

    Init();
    LoadVSF("data/C64/snapshots/diskb2.vsf");
    size = 7864;
    WalkCode(0x7600, size);
    TransformByteCode(size);
    ToC("out/partb.c", textb);

    Init();
    LoadVSF("data/C64/snapshots/diskc1.vsf");
    size = 3721;
    WalkCode(0x7600, size);
    TransformByteCode(size);
    ToC("out/partc.c", textc);

    Init();
    LoadVSF("data/C64/snapshots/diskc2.vsf");
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



