/* Execute the generated handler against the original snapshot table. */
#include "out/parta.c"
#include <assert.h>
#include <stdio.h>
#include <string.h>

ObjectID object1;
RoomID currentRoom;
ScriptWord temp, scratch1, score;
TextID pendingTextID;
ScriptByte objectLocation[166], objectState[166], west[RoomStateCount];
ScriptWord remainingPoints[166];

static unsigned word(const unsigned char *p) { return p[0] | ((unsigned)p[1] << 8); }

int main(int argc, char **argv) {
    assert(argc == 2);
    FILE *source = fopen(argv[1], "rb");
    assert(source);
    unsigned char raw[61];
    assert(fseek(source, 0x99 + 0x8366, SEEK_SET) == 0);
    assert(fread(raw, 1, sizeof raw, source) == sizeof raw);
    assert(fclose(source) == 0);
    assert(raw[60] == 0xff);
    assert(sizeof PartA_TalkResponses / sizeof PartA_TalkResponses[0] == 15);
    for (unsigned i = 0; i < 15; ++i) {
        assert(PartA_TalkResponses[i].object == word(raw + 4*i));
        assert(PartA_TalkResponses[i].text == word(raw + 4*i + 2));
    }
    for (unsigned scenario = 0; scenario < 6; ++scenario) {
        for (unsigned id = 0; id <= UINT16_MAX; ++id) {
            unsigned expectedIndex = 1, expectedObject = 0, expectedText = 91;
            for (; expectedIndex <= 15; ++expectedIndex) {
                expectedObject = word(raw + 4*(expectedIndex-1));
                expectedText = word(raw + 4*(expectedIndex-1) + 2);
                if (expectedObject == id) break;
            }
            if (expectedIndex > 15) expectedText = 91;
            memset(objectLocation, 0, sizeof objectLocation);
            memset(objectState, 0, sizeof objectState);
            memset(remainingPoints, 0, sizeof remainingPoints);
            memset(west, 0, sizeof west);
            currentRoom = 17;
            score = 100;
            object1 = (ObjectID)id;
            objectState[DORFBEWOHNER] = (ScriptByte)(scenario % 3);
            objectState[WOLF] = (ScriptByte)(scenario / 3);
            remainingPoints[DORFBEWOHNER] = 10;
            if (id == PORTIER) expectedText = 157;
            if (id == DORFBEWOHNER && scenario % 3 == 0) expectedText = 158;
            if (id == DORFBEWOHNER && scenario % 3 == 1) expectedText = 159;
            if (id == EINHORN && scenario / 3 == 1) expectedText = 160;
            PartA_HandleSprich();
            assert(temp == expectedIndex && scratch1 == expectedObject);
            assert(pendingTextID == expectedText);
            const int rewarded = id == DORFBEWOHNER && scenario % 3 == 0;
            assert(score == (rewarded ? 110 : 100));
            assert(remainingPoints[DORFBEWOHNER] == (rewarded ? 0 : 10));
            assert(objectState[DORFBEWOHNER] == (rewarded ? 1 : scenario % 3));
            assert(objectLocation[ZIMMERSCHLUESSEL] == (id == PORTIER ? 17 : 0));
            const int unicorn = id == EINHORN && scenario / 3 == 1;
            assert(objectLocation[KRISTALLKUGEL] == (unicorn ? 17 : 0));
            assert(west[AUF_EINER_LICHTUNG1] == (unicorn ? 25 : 0));
        }
    }
    puts("Talk table: 15 native records and 393216 handler cases verified.");
    return 0;
}
