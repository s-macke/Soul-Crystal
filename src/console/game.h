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
void GameStart(GameOutput output, void *context);
void GameSubmit(const char *line);
GameView GameGetView(void);
#ifdef __cplusplus
}
#endif
#endif
