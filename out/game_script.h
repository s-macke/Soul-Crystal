#ifndef SOUL_GAME_SCRIPT_H
#define SOUL_GAME_SCRIPT_H

#include <stdint.h>
#include "game_ids.h"

/* Preserve the existing scalar widths; enums name values, not storage types. */
typedef uint8_t ScriptByte;
typedef uint16_t ScriptWord;
typedef uint16_t CommandID;
typedef uint16_t ObjectID;
typedef uint16_t RoomID;
typedef uint16_t GamePart;
typedef uint16_t TextID;
typedef uint16_t ImageID;
enum { RoomStateCount = 104, ObjectStateCount = 166 };

typedef struct ObjectTextEntry {
    ObjectID object;
    TextID text;
} ObjectTextEntry;

/* Mutable definitions and disk-derived initial values are in game_state.c. */
extern CommandID command; // Parsed command
extern ObjectID object1; // First parsed object
extern ObjectID object2; // Second parsed object
extern RoomID currentRoom; // Current room
extern GamePart gamePart; // Active side: B1=1, B2=2, C1=3, C2=4
extern ScriptWord score; // Current score, including deductions
extern ScriptWord steps; // Original step counter
extern TextID pendingTextID; // Logical message ID awaiting display
extern ScriptWord temp; // Shared temporary value
extern ImageID imageID; // Selected image ID
extern ScriptWord scratch1; // Shared scratch value; meaning depends on routine
extern ScriptWord scratch2; // Shared scratch value; meaning depends on routine
extern ScriptWord scratch3; // Shared scratch value; meaning depends on routine
extern ScriptByte north[RoomStateCount]; // North exit by room
extern ScriptByte east[RoomStateCount]; // East exit by room
extern ScriptByte south[RoomStateCount]; // South exit by room
extern ScriptByte west[RoomStateCount]; // West exit by room
extern ScriptByte up[RoomStateCount]; // Up exit by room
extern ScriptByte down[RoomStateCount]; // Down exit by room
extern ScriptByte objectLocation[ObjectStateCount]; // Object location, including special locations
extern ScriptByte objectState[ObjectStateCount]; // Object-specific state, not a boolean
extern ScriptByte visited[RoomStateCount]; // Room visit state
extern ScriptWord remainingPoints[ObjectStateCount]; // Available point awards, often cleared after collection
extern ScriptWord objectDescriptionID[ObjectStateCount]; // Object description reference

extern ScriptWord engineState69BF; // Saved engine field, meaning not yet fully named.
extern const ScriptByte *tableptr;
void SPECIAL(ScriptWord operation);
void showtext(void);
void FlushOutput(void);
int ScriptInterrupted(void);
void ResetGameState(void);
void PartA_Execute(void);
void PartB_Execute(void);
void PartC_Execute(void);
void PartD_Execute(void);
void ShowImage(void);
void Code2E5B(void);

/* Unaligned little-endian source words, independent of host byte order. */
static inline ScriptWord ReadTableWord(const ScriptByte **cursor) {
    const ScriptByte *p = *cursor;
    *cursor += 2;
    return (ScriptWord)((ScriptWord)p[0] | ((ScriptWord)p[1] << 8));
}

#endif
