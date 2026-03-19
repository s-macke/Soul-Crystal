#include<stdint.h>
#include<stdlib.h>
#include<string.h>
#include<stdio.h>

unsigned char d64buffer[174848];

uint8_t *LoadD64(const char *filename) {
    FILE *file;

    file = fopen(filename, "rb");
    if (file == NULL) {
        fprintf(stderr, "Error: Cannot open file\n");
        exit(1);
    }
    fread(d64buffer, 174848, 1, file);
    fclose(file);
    return d64buffer;
}


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
    return pos;
}

unsigned int getd64pos(int idx) {
    int track = d64buffer[0x300 + idx * 3 + 0];
    int sector = d64buffer[0x300 + idx * 3 + 1];
    int offset = d64buffer[0x300 + idx * 3 + 2];
    return getd64pos(track, sector, offset);
}


// Load default sequential file from disk
void LoadIntoMemory(const char *filename, uint8_t* ram, int track, int sector) {
    uint8_t* buf = LoadD64(filename);
    int startaddress = 0x0;
    int address = 0x0;
    bool first = true;

    for (int i = 0; i < 60; i++) {
        int offset = getd64pos(track, sector, 0);
        printf("%i 0x%06x 0x%02x 0x%02x\n", i, offset, track, sector);
        if (buf[offset + 0] == 0) {
            memcpy(&ram[address], &buf[offset + 2], buf[offset + 1]);
            address += buf[offset + 1] - 2;
            break;
        } else {
            if (first) {
                // first two bytes are the memory address to put the data
                startaddress = buf[offset + 0] + (buf[offset + 1] << 8);
                address = startaddress;
                memcpy(&ram[address], &buf[offset + 4], 0x100 - 4);
                address += 0x100 - 4;
                first = false;
            } else {
                memcpy(&ram[address], &buf[offset + 2], 0x100 - 2);
                address += 0x100 - 2;
            }
        }
        track = buf[offset + 0];
        sector = buf[offset + 1];
    }
    printf("size: %i\n", address - startaddress);
}
