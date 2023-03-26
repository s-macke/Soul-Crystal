#include<stdio.h>
#include<stdlib.h>
#include<string>
#include"souldisk.h"

const unsigned int pal[16] = {
        0x191d19,
        0xfcf9fc,
        0x4c3a93,
        0xfafab6,
        0xed7dd2,
        0x6fcf6a,
        0xd8444f,
        0x8bfbfb,
        0x5b9cd8,
        0x07537f,
        0x9f83ef,
        0x535757,
        0xa7a7a3,
        0xbffbb7,
        0xff97a3,
        0xe7f9ef
};

struct TRGB {
    unsigned char r, g, b;
};

int DrawImage(const char *prefix, int n, int pos, unsigned char *buf) {
    unsigned char img[64000];

    char filename[512];
    sprintf(filename, "%s-%i.ppm", prefix, n);
    FILE *fp;
    fp = fopen(filename, "wb");


    TRGB image[22 * 8][64];
    int imgpos;
    imgpos = 0;
    int i = 0;

    do {
        if (buf[pos] != 205) {
            img[imgpos] = buf[pos];
            imgpos++;
        } else {
            //i++;
            pos++;
            int num = buf[pos];
            //i++;
            pos++;
            for (int j = 0; j < num; j++) {
                img[imgpos] = buf[pos];
                imgpos++;
            }

        }
        //i++;
        pos++;
    } while (imgpos <= 22 * 8 * 8 + 8 * 22 + 8 * 22);

    int colorram2 = 22 * 8 * 8;
    int colorram = 22 * 8 * 8 + 8 * 22;

    for (int scanline = 0; scanline < 64; scanline++) {
        unsigned int m = ((scanline >> 3) * 22 * 8) + (scanline % 8);
        unsigned int j = scanline >> 3;

        for (int i = 0; i < 22; i++) {
            for (int k = 0; k < 4; k++) {
                unsigned int col = (img[m] >> (6 - (k << 1))) & 3;
                unsigned int col2;

                if (col == 0) col2 = 0;
                else if (col == 3) col2 = img[colorram + j * 22 + i] & 15;
                else if (col == 2) col2 = img[colorram2 + j * 22 + i] & 15;
                else if (col == 1) col2 = (img[colorram2 + j * 22 + i] >> 4) & 15;
                {

                    image[((i << 3) + (k << 1))][scanline].r = (pal[col2] >> 0) & 0xFF;
                    image[((i << 3) + (k << 1))][scanline].g = (pal[col2] >> 8) & 0xFF;
                    image[((i << 3) + (k << 1))][scanline].b = (pal[col2] >> 16) & 0xFF;
                    image[((i << 3) + (k << 1)) + 1][scanline].r = (pal[col2] >> 0) & 0xFF;
                    image[((i << 3) + (k << 1)) + 1][scanline].g = (pal[col2] >> 8) & 0xFF;
                    image[((i << 3) + (k << 1)) + 1][scanline].b = (pal[col2] >> 16) & 0xFF;

                    /*
                    Form1->Canvas->Pixels[((i << 3)+(k << 1))*2][scanline*2] = pal[col2];
                    Form1->Canvas->Pixels[((i << 3)+(k << 1)+1)*2][scanline*2] = pal[col2];

                    Form1->Canvas->Pixels[((i << 3)+(k << 1))*2+1][scanline*2] = pal[col2];
                    Form1->Canvas->Pixels[((i << 3)+(k << 1)+1)*2+1][scanline*2] = pal[col2];

                    Form1->Canvas->Pixels[((i << 3)+(k << 1))*2][scanline*2+1] = pal[col2];
                    Form1->Canvas->Pixels[((i << 3)+(k << 1)+1)*2][scanline*2+1] = pal[col2];

                    Form1->Canvas->Pixels[((i << 3)+(k << 1))*2+1][scanline*2+1] = pal[col2];
                    Form1->Canvas->Pixels[((i << 3)+(k << 1)+1)*2+1][scanline*2+1] = pal[col2];
                    */
                }
            }
            m = m + 8;
        }
    }

    fprintf(fp, "P3\n174 62\n255\n");
    for (int j = 1; j < 63; j++) {
        for (int i = 1; i < 22 * 8 - 1; i++) {
            TRGB col = image[i][j];

            if ((i % 2) == 0)
                if (image[i][j].r == image[i + 1][j].r)
                    if (image[i][j].g == image[i + 1][j].g)
                        if (image[i][j].b == image[i + 1][j].b) {
                            col.r = (image[i][j].r + image[i - 1][j].r) / 2;
                            col.g = (image[i][j].g + image[i - 1][j].g) / 2;
                            col.b = (image[i][j].b + image[i - 1][j].b) / 2;
                            unsigned int col = image[i][j].r | (image[i][j].g << 8) | (image[i][j].b << 16);
                        }
            fprintf(fp, " %i %i %i ", col.r, col.g, col.b);
            //Form1->Image1->Canvas->Pixels[i][j] = col.r | (col.g << 8) | (col.b << 16);
/*
                        Form1->Image1->Canvas->Pixels[i*2][j*2] = col.r | (col.g << 8) | (col.b << 16);
                        Form1->Image1->Canvas->Pixels[i*2+1][j*2] = col.r | (col.g << 8) | (col.b << 16);
                        Form1->Image1->Canvas->Pixels[i*2][j*2+1] = col.r | (col.g << 8) | (col.b << 16);
                        Form1->Image1->Canvas->Pixels[i*2+1][j*2+1] = col.r | (col.g << 8) | (col.b << 16);
*/
        }
        fprintf(fp, "\n");

    }
//                        Form1->Image1->Update();

    fclose(fp);

    return pos;
}


void ShowRoom(const char *prefix, int n, const char *filename, int room) {
    unsigned char buf[174848];
    FILE *file;

    file = fopen(filename, "rb");
    //file = fopen("d64/Soul Crystal SideB1.d64", "rb");
    //file = fopen("d64/Soul Crystal SideB2.d64", "rb");
    //file = fopen("d64/Soul Crystal SideC1.d64", "rb");
    //file = fopen("d64/Soul Crystal SideC2.d64", "rb");
    //file = fopen("d64/Soul Crystal SideA2.d64", "rb");

    if (file == NULL) {
        fprintf(stderr, "Error: Cannot open file\n");
        exit(1);
    }
    fread(buf, 174848, 1, file);
    fclose(file);

    int i = 0;
/*
	switch (room) {
		case 2:
			i = 316;
			break;
		case 1:
			i = 315;
			break;
	}
 */
    i = room;
    //i = 311 + room;
    //i = 312 + room; // for B1
    //i = 448 + room; // for B2
    //i = 291 + room; // for C1
    //i = 435 + room; // for C2
/*
    for (int i = 0; i < 600; i++) {
        int bufpos = getd64pos(buf[0x300 + i * 3 + 0], buf[0x300 + i * 3 + 1], buf[0x300 + i * 3 + 2]) + 2;
        printf("%4i %i\n", i, bufpos);
    }
    exit(1);
*/
    int bufpos = getd64pos(buf[0x300 + i * 3 + 0], buf[0x300 + i * 3 + 1], buf[0x300 + i * 3 + 2]) + 2;
    DrawImage(prefix, n, bufpos, buf);
}

int main() {
    for (int i = 0; i < 19; i++) {
        ShowRoom("images/B1", i, "data/C64/d64/Soul Crystal SideB1.d64", 312 + i);
    }
    for (int i = 0; i < 29; i++) {
        ShowRoom("images/B2", i, "data/C64/d64/Soul Crystal SideB2.d64", 448 + i);
    }
    for (int i = 0; i < 21; i++) {
        ShowRoom("images/C1", i, "data/C64/d64/Soul Crystal SideC1.d64", 291 + i);
    }
    for (int i = 0; i < 31; i++) {
        ShowRoom("images/C2", i, "data/C64/d64/Soul Crystal SideC2.d64", 435 + i);
    }
}