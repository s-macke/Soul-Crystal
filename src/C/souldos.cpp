#include<stdio.h>
#include<vector>
#include<string>
#include<stdint.h>
#include<regex>

#pragma pack(1)
struct TCHUNK {
    char name[4];
    uint32_t size;
};

//its a binary tree
struct THuffEntry {
    unsigned char bit;
    unsigned char value;
};

std::vector <THuffEntry> hufftable;
std::vector<int> textlength;

static std::string IntToHex(int i, int length) {
    char x[16];

    if (length == 2) sprintf(x, "0x%02x", i);
    if (length == 4) sprintf(x, "0x%04x", i);
    else sprintf(x, "0x%x", i);

    return std::string(x);
}

void ChangeEndian(unsigned int &x) {
    unsigned int a, b, c, d;

    a = (x >> 0) & 0xFF;
    b = (x >> 8) & 0xFF;
    c = (x >> 16) & 0xFF;
    d = (x >> 24) & 0xFF;

    x = (a << 24) | (b << 16) | (c << 8) | (d << 0);
}

std::string ToUtf8(unsigned char c)
{
    if (c == 0) return std::string("");
    if (c == 0x81) return std::string("ü");
    if (c == 0x84) return std::string("ä");
    if (c == 0xe1) return std::string("ß");
    if (c == 0x94) return std::string("ö");
    if (c == 0x99) return std::string("Ö");
    if (c == 0x9A) return std::string("Ü");
    //if (c == 0x75) return std::string("Ü");
    if (c > 127)
    {
        //printf("Error %i\n", c);
        //exit(1);
    }
    return std::string(1, c);
}


std::string NameToString(const TCHUNK &chunk) {
    std::string s;
    s = s + chunk.name[0];
    s = s + chunk.name[1];
    s = s + chunk.name[2];
    s = s + chunk.name[3];
    return s;
}

void ParseTXTL(unsigned char *buffer, unsigned int size) {
    int x;
    int p = 0;
    for (int i = 0; i < size; i += 2) {
        x = (buffer[i] << 8) | buffer[i + 1];
        textlength.push_back(x);
        //printf("length = %i\n", x);
    }
}

void ParseVERB(unsigned char *buffer, unsigned int size) {
    for (int i = 0; i < size; i += 16) {
        std::string s;
        for(int j=0; j<16; j++) {
            s = s + ToUtf8(buffer[i + j]);
        }
        printf("%s\n", s.c_str());
    }
}


void ParseHUFL(unsigned char *buffer, unsigned int size) {
    int x;
    int p = 0;
    for (int i = 0; i < size; i += 2) {
        x = (buffer[i] << 8) | buffer[i + 1];
        printf("position = %i\n", x);
    }
}

void ParseROOM(unsigned char *buffer, unsigned int size) {
    int x;
    int p = 0;
    for (int i = 0; i < size; i += 2) {
        x = (buffer[i] << 8) | buffer[i + 1];
        printf("room = %i\n", x);
    }
}


void ParseHUTB(unsigned char *buffer, unsigned int size) {

    for (int i = 0; i < size; i += 2) {
        THuffEntry h;
        h.bit = buffer[i];
        h.value = buffer[i + 1];
//	ShowMessage(IntToHex(h.value,2));
        hufftable.push_back(h);
    }
//m1->printf("size");
    //printf("size\n");

    //printf("hufftable size %i\n", (int) hufftable.size());

//	unsigned int tree
}

void ParseHUHD(unsigned char *buffer) {
    printf("0x%02x\n", buffer[0]);
    printf("0x%02x\n", buffer[1]);
    printf("0x%02x\n", buffer[2]);
    printf("0x%02x\n", buffer[3]);
    printf("0x%02x\n", buffer[4]);
    printf("0x%02x\n", buffer[5]);
}

char ParseChar(unsigned int &bufpos, unsigned int &bufbitpos, unsigned char *buffer, unsigned int size) {
    int poshalf = hufftable.size() / 2;
//	printf(poshalf);

    int pos = poshalf - 1;
//	   int pos = 71;
    while (true) {
        //ShowMessage(hufftable[pos].value);

        int bit = (buffer[bufpos] >> (bufbitpos)) & 1;
//		int bit = ( ((buffer[bufpos+1]<<8) | buffer[bufpos])  >> (bufbitpos)) & 1;
//		bit = 0;
//      ShowMessage(bit);

        int a = hufftable[pos].bit;
        int b = hufftable[poshalf + pos].bit;
//      ShowMessage(hufftable[pos].value);
//      ShowMessage(hufftable[poshalf+pos].value);

        if (bit == 0)
            if (a == 0) {
                return hufftable[pos].value;
            }
        if (bit == 1)
            if (b == 0) {
                return hufftable[poshalf + pos].value;
            }

        if (bit == 0) {
            pos = hufftable[pos].value - 1 + 1;
        } else {
            pos = hufftable[poshalf + pos].value - 1 + 1;
        }

        bufbitpos--;
        if ((bufbitpos) == -1) {
            bufpos += 1;
            bufbitpos = 7;
        }
    };
}


void ParseBODY(unsigned char *buffer, unsigned int size) {

    unsigned int bufpos = 0;
    unsigned int bufbitpos = 7;

//	   char x = ParseChar(bufpos, bufbitpos, buffer, size);
//	   printf(x);
//	   printf(IntToHex(x,2));

    std::string s;

    int i = 0;
    printf("\n\n0x%04x\n", i);
    while (bufpos < size) {
        char x = ParseChar(bufpos, bufbitpos, buffer, size);
        if (x == 0) {
            s = std::regex_replace(s, std::regex("\""), "\\\"");
            printf("\"%s\",", s.c_str());
            s = "";
            x = 0;
            i++;
            //printf("\n\n0x%04x\n", i);
            printf("\n");
            //bufpos++;
            bufbitpos = 0;
        }
        s = s + ToUtf8(x);

        (bufbitpos)--;
        if ((bufbitpos) == -1) {
            bufpos += 1;
            bufbitpos = 7;
        }
    }

}

void GetDosText() {
    TCHUNK chunk;

    unsigned char buffer[0x10000];

    FILE *file = fopen("Soul/PARTA.TXT", "rb");
    //FILE *file = fopen("Soul/PARTB.TXT", "rb");
    //FILE *file = fopen("Soul/PARTC.TXT", "rb");
    //FILE *file = fopen("Soul/PARTD.TXT", "rb");
    //FILE *file = fopen("Soul/COMMN.TXT", "rb");
    //FILE *file = fopen("Soul/RAM.TXT", "rb");
    //FILE *file = fopen("Soul/VERBS.TXT", "rb");

    fread(&chunk, sizeof(chunk), 1, file);
    ChangeEndian(chunk.size);
    printf("total size of %s: %i\n", NameToString(chunk).c_str(), chunk.size);

    // fixed string
    fread(&chunk.name, sizeof(chunk.name), 1, file);
    printf("%s\n", NameToString(chunk).c_str());
    printf("\n");

    for (int i = 0; i < 10; i++) {
        if (feof(file)) return;
        fread(&chunk, sizeof(chunk), 1, file);
        if (feof(file)) return;
        ChangeEndian(chunk.size);

        printf("\n==== block %s ====\n", NameToString(chunk).c_str());
        printf("%i\n", chunk.size);
        int realsize = chunk.size;
        if (chunk.size & 1) chunk.size++;
        fread(buffer, chunk.size, 1, file);

        if (NameToString(chunk) == "HUHD") {
            ParseHUHD(buffer);
        }

        if (NameToString(chunk) == "HUTB") {
            ParseHUTB(buffer, realsize);
        }

        if (NameToString(chunk) == "BODY") {
            ParseBODY(buffer, realsize);
        }

        if (NameToString(chunk) == "TXTL") { // Length of unpacked strings
            ParseTXTL(buffer, realsize);
        }
        if (NameToString(chunk) == "HUFL") { // position in packed string maybe
            ParseHUFL(buffer, realsize);
        }
        if (NameToString(chunk) == "ROOM") { // Room ID maybe
            ParseROOM(buffer, realsize);
        }
        if (NameToString(chunk) == "VERB") { // 16 byte list of verbs
            ParseVERB(buffer, realsize);
        }


    }

    fclose(file);
}
//---------------------------------------------------------------------------

void GetDosObjects() {

    FILE *file = fopen("Soul/OBJECTS.TXT", "rb");

    char x;

    for (int j = 0; j < 166; j++) {
        std::string s;
        for (int i = 0; i < 16; i++) {
            fread(&x, 1, 1, file);
//	x = x - 0xC8 + 'b';
            x = x ^ 0xAA;
            s = s + ToUtf8(x);
        }
        printf("%s : 0x%02x\n", s.c_str(), j);
    }
    fclose(file);
}

int main() {
    GetDosObjects();
    GetDosText();

    return 0;
}
