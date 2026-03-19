#include <stdio.h>
#include <vector>
#include <string>
#include <algorithm>

//---------------------------------------------------------------------------

#include "souldisk.h"
#include "disk.h"

static std::string IntToHex(int i, int length) {
    char x[16];

    if (length == 2) sprintf(x, "0x%02x", i);
    if (length == 4) sprintf(x, "0x%04x", i);
    else sprintf(x, "0x%x", i);

    return std::string(x);
}

std::string remove_extra_whitespaces(const std::string &input) {
    std::string output;
    output.clear();  // unless you want to add at the end of existing sring...
    unique_copy(input.begin(), input.end(), std::back_insert_iterator<std::string>(output),
                [](char a, char b) { return isspace(a) && isspace(b); });
    return output;
}

void ShowD64Text(const char *filename, int nmax) {
    char s1[512];
    char s2[512];
    char s3[512];
    std::string s;
    int bin;

/*
file = fopen("soulhuff18bit", "r");
for (int j=0; j<42; j++)
{
fscanf(file, "%s", s1);


// bin = 0;
// for(int i=0; i<11; i++)
//         if (s1[i] == '1') bin |= (1<<(7-i));


fscanf(file, "%s", s2);
for(int i = 0; i < 512; i++)
{
        if (s2[i] != 0)
        {
                s3[i] = soul2ascii[(unsigned char)s2[i]];
        }
        else s3[i] = 0;
}

s3[12] = 0;
s3[0] = ' ';
s3[1] = ' ';
s3[2] = ' ';
s3[3] = ' ';
printf(std::string(s1) + " "
		+ (unsigned char)s2[4] + " "
        + (unsigned char)s2[5] + " "
        + (unsigned char)s2[6] + " "
        + (unsigned char)s2[7] + " "
        + (unsigned char)s2[8] + " "
        + (unsigned char)s2[9] + " "
        + (unsigned char)s2[10] + " "
        + (unsigned char)s2[11] + " "
        + std::string(s3));
}
*/
    tree = new CBinTree();

    tree->BuildTree("11", ' ');
    tree->BuildTree("1011", 'r');
    tree->BuildTree("00001", 't');
    tree->BuildTree("00111", 'h');
    tree->BuildTree("01011", 'u');
    tree->BuildTree("001001", 'o');
    tree->BuildTree("101011", 'D');
    tree->BuildTree("0000011", ',');
    tree->BuildTree("0001101", 'w');
    tree->BuildTree("0010101", 'k');
    tree->BuildTree("0010111", '.');
    tree->BuildTree("00000101", 'S');
    tree->BuildTree("00101101", '|');
    tree->BuildTree("01010111", '|');
    tree->BuildTree("01111101", 'E');
    tree->BuildTree("000110001", '"');
    tree->BuildTree("000111111", 'W');
    tree->BuildTree("001010011", 'M');
    tree->BuildTree("010101001", 'H');
    tree->BuildTree("011110101", 'G');
    tree->BuildTree("011111101", '[');
    tree->BuildTree("011111111", 'F');

    tree->BuildTree("0000010011", 'N');
    tree->BuildTree("0001100111", 'j');
    tree->BuildTree("0001111011", '?');
    tree->BuildTree("0010100101", 'C');
    tree->BuildTree("0101010111", 'Z');

    tree->BuildTree("0111101111", 'O');
    tree->BuildTree("01010101101", '\'');
    tree->BuildTree("01111010011", '(');
    tree->BuildTree("000001000101", '0');
    tree->BuildTree("000001000111", 'J');
    tree->BuildTree("000111101001", '<');
    tree->BuildTree("000111101011", '9');
    tree->BuildTree("0000010001001", 'x');
    tree->BuildTree("0001111010001", '2');
    tree->BuildTree("0101010110011", '3');
    tree->BuildTree("00011110100001", '5');
    tree->BuildTree("01010101100001", '&');
    tree->BuildTree("01010101100011", '4');
    tree->BuildTree("01010101100101", 'Y');
    tree->BuildTree("000001000100011", '|');
    tree->BuildTree("0000010001000011", ';');
    tree->BuildTree("00000100010000101", 'X');

    tree->BuildTree("100", 'e');
    tree->BuildTree("0100", 'n');
    tree->BuildTree("0110", 'i');
    tree->BuildTree("00010", 's');
    tree->BuildTree("00110", 'a');
    tree->BuildTree("01110", 'd');
    tree->BuildTree("10100", 'l');
    tree->BuildTree("000000", 'c');
    tree->BuildTree("001000", 'm');
    tree->BuildTree("010100", 'g');
    tree->BuildTree("101010", 'b');
    tree->BuildTree("0001110", 'f');
    tree->BuildTree("0111100", 'z');
    tree->BuildTree("00101000", 'v');
    tree->BuildTree("00101100", 'p');
    tree->BuildTree("01010110", 'A');
    tree->BuildTree("01111100", '!');
    tree->BuildTree("000110000", '|');
    tree->BuildTree("000110010", 'I');
    tree->BuildTree("000111100", 'B');
    tree->BuildTree("000111110", '|');
    tree->BuildTree("010101000", '-');
    tree->BuildTree("010101010", 'T');
    tree->BuildTree("011110110", ':');
    tree->BuildTree("011111100", 'K');
    tree->BuildTree("011111110", ']');
    tree->BuildTree("0000010000", 'R');
    tree->BuildTree("0000010010", 'L');
    tree->BuildTree("0001100110", 'P');
    tree->BuildTree("0010100100", 'y');
    tree->BuildTree("0111101000", 'V');
    tree->BuildTree("0111101110", 'U');
    tree->BuildTree("01111010010", ')');
    tree->BuildTree("000001000110", '1');
    tree->BuildTree("000111101010", '>');
    tree->BuildTree("00011110100000", 'q');
    tree->BuildTree("01010101100000", '8');
    tree->BuildTree("01010101100010", '/');
    tree->BuildTree("01010101100100", '6');
    tree->BuildTree("000001000100000", '|');
    tree->BuildTree("000001000100010", 'Q');
    tree->BuildTree("00000100010000100", '|');

/*
tree->BuildTree("11", ' ');
tree->BuildTree("1011", 'r');
tree->BuildTree("00001", 't');
tree->BuildTree("00111", 'h');
tree->BuildTree("01011", 'u');
tree->BuildTree("001001", 'o');
tree->BuildTree("101011", 'D');
tree->BuildTree("0000011", ',');
tree->BuildTree("0001101", 'w');
tree->BuildTree("0010101", 'k');
tree->BuildTree("0010111", '.');
tree->BuildTree("00000101", 'S');
tree->BuildTree("00101101", '�');
tree->BuildTree("01010111", '�');
tree->BuildTree("01111101", 'E');
tree->BuildTree("000110001", '"');
tree->BuildTree("000111111", 'W');
tree->BuildTree("001010011", 'M');
tree->BuildTree("010101001", 'H');
tree->BuildTree("011110101", 'G');
tree->BuildTree("011111101", '[');
tree->BuildTree("011111111", 'F');

tree->BuildTree("0000010011", 'N');
tree->BuildTree("0001100111", 'j');
tree->BuildTree("0001111011", '?');
tree->BuildTree("0010100101", 'C');
tree->BuildTree("0101010111", 'Z');

tree->BuildTree("0111101111", 'O');
tree->BuildTree("01010101101", '\'');
tree->BuildTree("01111010011", '(');
tree->BuildTree("000001000101", '0');
tree->BuildTree("000001000111", 'J');
tree->BuildTree("000111101001", '<');
tree->BuildTree("000111101011", '9');
tree->BuildTree("0000010001001", 'x');
tree->BuildTree("0001111010001", '2');
tree->BuildTree("0101010110011", '3');
tree->BuildTree("00011110100001", '5');
tree->BuildTree("01010101100001", '&');
tree->BuildTree("01010101100011", '4');
tree->BuildTree("01010101100101", 'Y');
tree->BuildTree("000001000100011", '�');
tree->BuildTree("0000010001000011", ';');
tree->BuildTree("00000100010000101", 'X');

tree->BuildTree("100", 'e');
tree->BuildTree("0100", 'n');
tree->BuildTree("0110", 'i');
tree->BuildTree("00010", 's');
tree->BuildTree("00110", 'a');
tree->BuildTree("01110", 'd');
tree->BuildTree("10100", 'l');
tree->BuildTree("000000", 'c');
tree->BuildTree("001000", 'm');
tree->BuildTree("010100", 'g');
tree->BuildTree("101010", 'b');
tree->BuildTree("0001110", 'f');
tree->BuildTree("0111100", 'z');
tree->BuildTree("00101000", 'v');
tree->BuildTree("00101100", 'p');
tree->BuildTree("01010110", 'A');
tree->BuildTree("01111100", '!');
tree->BuildTree("000110000", '�');
tree->BuildTree("000110010", 'I');
tree->BuildTree("000111100", 'B');
tree->BuildTree("000111110", '�');
tree->BuildTree("010101000", '-');
tree->BuildTree("010101010", 'T');
tree->BuildTree("011110110", ':');
tree->BuildTree("011111100", 'K');
tree->BuildTree("011111110", ']');
tree->BuildTree("0000010000", 'R');
tree->BuildTree("0000010010", 'L');
tree->BuildTree("0001100110", 'P');
tree->BuildTree("0010100100", 'y');
tree->BuildTree("0111101000", 'V');
tree->BuildTree("0111101110", 'U');
tree->BuildTree("01111010010", ')');
tree->BuildTree("000001000110", '1');
tree->BuildTree("000111101010", '>');
tree->BuildTree("00011110100000", 'q');
tree->BuildTree("01010101100000", '8');
tree->BuildTree("01010101100010", '/');
tree->BuildTree("01010101100100", '6');
tree->BuildTree("000001000100000", '�');
tree->BuildTree("000001000100010", 'Q');
tree->BuildTree("00000100010000100", '�');
*/

    //SearchRecursive(1, tree, std::string(""));

    CBinTree *leaf;
    int bufpos = 0;

    uint8_t *buf = LoadD64(filename);

/*
    for(int idx=0; idx<512; idx++) {
        int offset = getd64pos(idx);
        int nextoffset = getd64pos(idx+1);

        printf("%i 0x%06x size: %i\n", idx, offset, nextoffset - offset);
    }
    exit(1);
*/

    int a, b;

//for(int i=0; i<291; i++)
//for(int i=0; i<103; i++)
/*
for(int i=0; i<103; i++)
{
	bufpos = getd64pos(buf[0x300+i*3+0], buf[0x300+i*3+1], buf[0x300+i*3+2])+4;
	s = GetString(bufpos, buf, buf);
	printf(std::string("\"")+s+"\",");
}
return;
*/

    for (int i = 0; i < nmax; i++) {
        //for (int i = 103; i < nmax; i++) {
        bufpos = getd64pos(i);

        printf("\n");
        //printf("%s\n", IntToHex(i - 103 + 1, 2).c_str());
        printf("%s\n", IntToHex(i, 2).c_str());
        int16_t a = (buf[bufpos + 1] << 8) + buf[bufpos + 0];
        int16_t b = (buf[bufpos + 3] << 8) + buf[bufpos + 2];
        printf("%i %i\n", int(-a), int(-b));

        s = GetString(bufpos + 4, buf, buf);
        s = remove_extra_whitespaces(s);


//	printf(s);
        //printf("%s\n", (std::string("\"") + s + "\",").c_str());
        printf("%s\n", s.c_str());
    } // i


/*
unsigned char *buf2 = new unsigned char[1000000];
file = fopen("Z:\\mnt\\sdb1\\vice\\soul\\move1.vsf", "rb");
	fread(buf2, 0x10000, 1, file);
fclose(file);


for(int i=0; i<0x10000; i++)
{
	s = GetString(i, buf2, buf);
	if (s.c_str()[0] == 'H')
	if (s.c_str()[1] == 'I')
	printf(s);

	if (s.c_str()[0] == 'h')
	if (s.c_str()[1] == 'i')
	if (s.c_str()[2] == 'n')
	printf(s);

}
*/

/*
int i=312;
bufpos = getd64pos(buf[0x300+i*3+0], buf[0x300+i*3+1], buf[0x300+i*3+2]) + 2;
DrawImage(bufpos, Image1);
*/
//return;

/*
for(int i=312; i<312+19; i++) //side B1
//for(int i=291; i<291+21; i++) //side C1
{
bufpos = getd64pos(buf[0x300+i*3+0], buf[0x300+i*3+1], buf[0x300+i*3+2]) + 2;
//printf(0x10000-(buf[bufpos-2] + (buf[bufpos-1]<< 8)));
//printf(bufpos);
printf(i);
DrawImage(bufpos);
Sleep(1000);
}
*/


// for(int i=152; i<1000; i++)
/*
 DrawImage(43264+15);
 Image1->Picture->SaveToFile("soul1.bmp");
*/
/*
 DrawImage(54000+153);
 DrawImage(43264+15);
 DrawImage(50300+470);
*/
//4*16 - 10*16;

//for(int i=0x200; i<0x200+256; i++)
/*
//for(int j=0; j<100; j++)
{
        s = "";
        //for(int i=0x10900+j*256; i<0x10900+256+j*256; i++)
        for(int i=0x200; i<0x300; i++)
        {
                //s = s + soul2ascii[(buf[i]-0x40)&0xFF];
                if ((buf[i]&128) != 0)
                        s = s + "  " + soul2ascii[buf[i]-0x40] + " ";
                else s = s + " "+IntToHex(buf[i], 2)+ " ";
                if (((i+1) & 15) == 0)
                {
                        printf(s);
                        s = "";
                }

        }
}
*/

/*
file = fopen("T:\\c64games\\sould64\\Soul Crystal SideA2.d64", "rb");
s="";
fread(buf, 174848, 1, file);
fclose(file);
for(int i=0; i<1000; i++)
{
s = s + soul2ascii[(buf[0x17800+i]-0x100)&255];
}
printf(s);
*/
/*
for(int i=0x13B00; i < 0x15000; i++)
{
        buf[i]--;
}
        file = fopen("T:\\c64games\\sould64\\my Soul Crystal SideB1.d64", "wb");
        fwrite(buf, 174848, 1, file);
        fclose(file);

      bufpos = getd64pos(17, 0, 0);
      printf(IntToHex(bufpos,6));
*/
}


int main() {
    ShowD64Text("data/C64/d64/Soul Crystal SideB1.d64", 312);
    //ShowD64Text("data/C64/d64/Soul Crystal SideB2.d64", 448);
    //ShowD64Text("data/C64/d64/Soul Crystal SideC1.d64", 291);
    //ShowD64Text("data/C64/d64/Soul Crystal SideC2.d64", 435);

    //ShowD64Text("data/c64_en/SoulCrystalB1.d64", 312);
    //ShowD64Text("data/c64_en/SoulCrystalB2.d64", 448);
    //ShowD64Text("data/c64_en/SoulCrystalC1.d64", 291);
    //ShowD64Text("data/c64_en/SoulCrystalC2.d64", 435);

    return 0;
}