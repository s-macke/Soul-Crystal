#include "../console/game.h"
#include <emscripten.h>
#include <initializer_list>

EM_JS(void, deliverEvent, (int kind, const char *text, unsigned part, unsigned image, unsigned room), {
    Module.onGameEvent({kind, text: text ? UTF8ToString(text) : "", part, image, room});
});
EM_JS(void, deliverView, (int mode, unsigned part, unsigned room, unsigned score, unsigned steps, const char *roomName, unsigned language, int verbose), {
    Module.onGameView({mode, part, room, score, steps, roomName: UTF8ToString(roomName), language, verbose: !!verbose, objects: Module.visibleObjects, exits: Module.availableDirections});
});
EM_JS(void, clearObjects, (), { Module.visibleObjects = []; Module.availableDirections = []; });
EM_JS(void, addObject, (unsigned id, const char *name, int carried), {
    Module.visibleObjects.push({id, name: UTF8ToString(name), carried: !!carried});
});
EM_JS(void, addExit, (unsigned commandID), { Module.availableDirections.push(commandID); });
static void output(const GameEvent *event, void *) {
    deliverEvent(event->kind, event->text, event->part, event->image, event->room);
}
static void updateView() {
    const GameView view = GameGetView();
    clearObjects();
    for(unsigned id : {11u, 6u, 19u, 24u, 21u, 5u})
        if(GameDirectionAvailable(id)) addExit(id);
    for (unsigned id=1; id<GameObjectLimit(); ++id)
        if (const char *name=GameObjectName(id)) addObject(id, name, GameObjectCarried(id));
    deliverView(view.mode, view.part, view.room, view.score, view.steps, GameRoomName(), GameGetLanguage(), GameVerboseDescriptions());
}
extern "C" {
EMSCRIPTEN_KEEPALIVE void web_start(int language) {
    GameSetObjectListTextEnabled(0);
    GameStartLanguage(output, nullptr, language == 1 ? GameEnglish : GameGerman);
    updateView();
}
EMSCRIPTEN_KEEPALIVE const char *web_intro() { return GameIntroNarrative(); }
EMSCRIPTEN_KEEPALIVE const char *web_save() { return GameSave(); }
EMSCRIPTEN_KEEPALIVE int web_load(const char *snapshot) {
    const int ok=GameLoad(snapshot);if(ok)updateView();return ok;
}
EMSCRIPTEN_KEEPALIVE void web_submit(const char *command) {
    GameSubmit(command);
    updateView();
}
}
