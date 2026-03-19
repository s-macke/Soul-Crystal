#include<stdio.h>
#include<stdlib.h>
#include<stdint.h>

uint8_t ram[0x10000];

void LoadVSF(const char *filename) {
    FILE *file;
    file = fopen(filename, "rb");
    if (file == NULL) {
        printf("Error: Cannot open file\n");
        exit(1);
    }
    fseek(file, 0x99, SEEK_SET);
    fread(ram, 0x10000, 1, file);
    fclose(file);
}
