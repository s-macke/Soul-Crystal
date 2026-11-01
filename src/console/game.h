#ifndef SOUL_CONSOLE_GAME_H
#define SOUL_CONSOLE_GAME_H
#ifdef __cplusplus
extern "C" {
#endif
/* The core never reads stdin, opens files, or exits the host process.
   Text pointers are valid only during the callback. Do not re-enter the core. */
typedef enum { GameTextEvent, GameImageEvent, GameFlushEvent } GameEventKind;
typedef struct { GameEventKind kind; const char *text; unsigned part, image, room; } GameEvent;
typedef void (*GameOutput)(const GameEvent *, void *context);
typedef enum { GameReady, GameConfirmRestart, GameConfirmQuit, GameSolutionPrompt,
               GameDead, GameWon, GameEnded, GameError } GameMode;
typedef enum { GameInputIgnored, GameInputAccepted, GameInputRejected, GameInputBlocked } GameInputResult;
typedef struct { GameMode mode; unsigned part, room, score, steps, imagePart, image; GameInputResult inputResult; } GameView;
typedef enum { GameGerman, GameEnglish } GameLanguage;
void GameStart(GameOutput output, void *context);
/* Select at start; restart preserves language. GameStart defaults to German. */
void GameStartLanguage(GameOutput output, void *context, GameLanguage language);
/* Enabled by default for CLI hosts. Set before starting; persists across restarts.
   Controls the available-object text list only, not explicit inventory output
   or the read-only object API. */
void GameSetObjectListTextEnabled(int enabled);
void GameSubmit(const char *line);
GameView GameGetView(void);
/* Versioned portable snapshot. Save only at a ready command boundary.
   GameSave returns internal storage valid until the next save. Invalid loads
   return zero without changing state. Hosts own persistence, not the core. */
const char *GameSave(void);
int GameLoad(const char *snapshot);
const char *GameRoomName(void);
unsigned GameGetLanguage(void);
int GameVerboseDescriptions(void);
const char *GameIntroNarrative(void);
/* Read-only UI projection: hidden objects return NULL. Names follow the active language. */
const char *GameObjectName(unsigned id);
int GameObjectCarried(unsigned id);
unsigned GameObjectLimit(void);
/* Same current exit tables as the exits command; does not predict scripted obstacles. */
int GameDirectionAvailable(unsigned commandID);
#ifdef __cplusplus
}
#endif
#endif
