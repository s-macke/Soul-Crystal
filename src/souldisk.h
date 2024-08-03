#include<stdint.h>
#include<stdlib.h>

class CBinTree {
public:
    CBinTree *left, *right;
    char symbol;

    CBinTree(void);

    void BuildTree(const char *s, char msymbol);
};

CBinTree::CBinTree(void) {
    left = NULL;
    right = NULL;
    symbol = 0;
}

void CBinTree::BuildTree(const char *s, char msymbol) {
    if (*s == 0) {
        symbol = msymbol;
        //return;
    } else if (*s == '1') {
        if (right == NULL) right = new CBinTree();
        right->BuildTree(s + 1, msymbol);
    } else {
        if (left == NULL) left = new CBinTree();
        left->BuildTree(s + 1, msymbol);
    }

    if (symbol != 0) {
        if (right != NULL) printf("NULL1");/*ShowMessage(std::string(symbol) + " " + std::string(msymbol));*/
        if (left != NULL) printf("NULL2");/*ShowMessage(std::string(symbol) + " " + std::string(msymbol));*/
    }
}


static char pet2ascii[] =
        {
                '@', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
                'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '[', ' ', ']', ' ', ' ',
                ' ', '!', '"', '#', '$', '%', '&', '\'', '(', ')', '*', '+', ',', '-', '.', '/',
                '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', ':', ';', '<', '=', '>', '?',
                ' ', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O',
                'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', ' ', ' ', ' ', ' ', ' ',
                ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ',
                ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ',

                '@', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
                'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '[', ' ', ']', ' ', ' ',
                ' ', '!', '"', '#', '$', '%', '&', '\'', '(', ')', '*', '+', ',', '-', '.', '/',
                '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', ':', ';', '<', '=', '>', '?',
                ' ', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O',
                'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', ' ', ' ', ' ', ' ', ' ',
                ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ',
                ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '
        };

static const char *soul2ascii[] =
        {
                " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
                " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
                " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
                " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
                " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o",
                "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "ä", "ö", "ü", "[", "]",
                " ", "!", "\"", "#", "$", " ", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/",
                "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ":", ";", "<", "=", ">", "?",
                " ", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O",
                "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "Ä", "Ö", "Ü", "ß", "[",
                " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
                " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
                " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
                " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
                " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
                " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "
        };

CBinTree *tree;
//unsigned char buf[1000000];

void SearchRecursive(int iter, CBinTree *node, std::string pos) {
/*
if (iter >= 30) return;
if (node->symbol != 0) return;

if (node->left == NULL) ShowMessage("Left: " + std::string(pos));
if (node->right == NULL) ShowMessage("Right: " + std::string(pos));
*/

    if (node->left != NULL) SearchRecursive(iter + 1, node->left, pos + "0");
    if (node->right != NULL) SearchRecursive(iter + 1, node->right, pos + "1");
}

unsigned char GetChar(int *bufpos, int *bufbitpos, unsigned char *buf, unsigned char *bintree) {
    int pos = 0;

    while (true) {
        int bit = (buf[*bufpos] >> (*bufbitpos)) & 1;

        int a = bintree[0x200 + pos];
        int b = bintree[0x200 + 0x80 + pos];
        if (bit == 1)
            if (a >= 128) return a;
        if (bit == 0)
            if (b >= 128) return b;
        if (bit == 1) {
            pos = a;
        } else {
            pos = b;
        }

        (*bufbitpos)--;
        if ((*bufbitpos) == -1) {
            (*bufpos)++;
            *bufbitpos = 7;
        }


    };
    return -1;
}

std::string GetString(int bufpos, unsigned char *buf, unsigned char *bintree) {
    std::string s = "";
    int nletters = 0;
    int bitpos = 7;

    int a = (buf[bufpos - 3] << 8) + buf[bufpos - 4];
    int b = (buf[bufpos - 1] << 8) + buf[bufpos - 2];
//        b = 0x10000-13;
    do {
        std::string x = std::string(soul2ascii[(unsigned char) GetChar(&bufpos, &bitpos, buf, bintree) - 0x40]);
        /*
		if (x == "\"") {
			s += "\\";
		}
        */
        s += x;
        (bitpos)--;
        if (bitpos == -1) {
            bufpos++;
            bitpos = 7;
        }

        nletters++;
        if (nletters % 40 == 0) { // new line on C64
            //s = s + "\\r\\n";
            //s = s + "\\n";
            s = s + " ";
            //s = s + "<br>";

        }
    } while (nletters != (0x10000 - b));
    if (bitpos != 7) bufpos++;
    return s;
}

