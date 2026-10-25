/* Test-only engine doubles. The production engine is linked separately. */
#include "out/parta.c"
#include <assert.h>
#include <stdio.h>

ObjectID object1;
ScriptWord temp, scratch1;
TextID pendingTextID;
ScriptByte objectLocation[166];
static unsigned shown, flushed;
void showtext(void) { ++shown; }
int ScriptInterrupted(void) { return 0; }
void FlushOutput(void) { ++flushed; }

static ScriptWord word(const unsigned char *p) {
    return (ScriptWord)(p[0] | ((unsigned)p[1] << 8));
}

int main(int argc, char **argv) {
    assert(argc == 2);
    FILE *source = fopen(argv[1], "rb");
    assert(source != NULL);
    unsigned char original[7 * 4];
    assert(fseek(source, 0x99 + 0x834a, SEEK_SET) == 0);
    assert(fread(original, 1, sizeof original, source) == sizeof original);
    assert(fclose(source) == 0);
    assert(sizeof PartA_DestroyResponses / sizeof PartA_DestroyResponses[0] == 7);
    for (unsigned i = 0; i < 7; ++i) {
        assert(PartA_DestroyResponses[i].object == word(original + 4*i));
        assert(PartA_DestroyResponses[i].text == word(original + 4*i + 2));
    }

    for (unsigned id = 0; id <= UINT16_MAX; ++id) {
        ScriptWord expectedIndex = 1, expectedObject = 0;
        TextID expectedText = 0;
        /* Original 1-based loop: even a miss leaves the last record in scratch1. */
        for (; expectedIndex <= 7; ++expectedIndex) {
            const unsigned char *record = original + 4*(expectedIndex - 1);
            expectedObject = word(record);
            expectedText = word(record+2);
            if (expectedObject == id) break;
        }
        unsigned expectedCalls = 0;
        ScriptByte expectedLocation = 17;
        if (expectedIndex > 7) {
            expectedText = id == DAVE ? 60 : 61;
            if (id == DAVE) { expectedCalls = 1; expectedLocation = 255; }
        }
        object1 = (ObjectID)id;
        temp = scratch1 = pendingTextID = 0xffff;
        objectLocation[DAVE] = 17;
        shown = flushed = 0;
        PartA_HandleZerstoere();
        assert(temp == expectedIndex);
        assert(scratch1 == expectedObject);
        assert(pendingTextID == expectedText);
        assert(shown == expectedCalls && flushed == expectedCalls);
        assert(objectLocation[DAVE] == expectedLocation);
    }

    const ScriptByte bytes[] = {0xff, 0x34, 0x12, 0x78, 0x56};
    const ScriptByte *cursor = bytes + 1; /* Deliberately unaligned. */
    assert(ReadTableWord(&cursor) == 0x1234 && cursor == bytes + 3);
    assert(ReadTableWord(&cursor) == 0x5678 && cursor == bytes + 5);
    puts("Structured destroy table: 7 native records and all 65536 object IDs verified.");
    return 0;
}
