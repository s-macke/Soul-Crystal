#include "out/game_script.h"
#include <assert.h>
#include <stdio.h>

static unsigned char payload[1719];
static unsigned pos;
static unsigned readByte(void) { return payload[pos++]; }
static unsigned readWord(void) { unsigned lo=readByte(); return lo | (readByte()<<8); }
static void object(unsigned i) {
    assert(objectDescriptionID[i] == readWord());
    assert(remainingPoints[i] == readWord());
    assert(objectLocation[i] == readByte());
    assert(objectState[i] == readByte());
}
int main(int argc, char **argv) {
    assert(argc == 2);
    FILE *fp=fopen(argv[1], "rb"); assert(fp);
    assert(fread(payload,1,sizeof payload,fp)==sizeof payload); assert(fclose(fp)==0);
    for (unsigned i=1;i<RoomStateCount;++i) {
        assert(north[i]==readByte()); assert(east[i]==readByte());
        assert(south[i]==readByte()); assert(west[i]==readByte());
        assert(up[i]==readByte()); assert(down[i]==readByte());
        (void)readByte(); assert(visited[i]==0); /* Native initializer clears visited. */
        object(i);
    }
    for (unsigned i=RoomStateCount;i<ObjectStateCount;++i) object(i);
    (void)readByte(); assert(visited[0]==0);
    assert(currentRoom==readByte()); (void)readWord(); (void)readWord();
    assert(engineState69BF==readByte()); assert(gamePart==readByte());
    assert(pos==sizeof payload && score==0 && steps==1 && currentRoom==3 && gamePart==PartA);
    assert(command==0 && object1==0 && object2==0 && pendingTextID==0);
    assert(temp==0 && imageID==0 && scratch1==0 && scratch2==0 && scratch3==0 && tableptr==0);
    assert(north[0]==0 && objectDescriptionID[0]==0 && objectState[0]==0);
    objectState[DAVE]=7; assert(objectState[DAVE]==7); /* Writable state, not const configuration. */
    puts("Compiled game_state.c matches original disk seed and initialization overrides.");
    return 0;
}
