#include "game.h"
#include <iostream>
#include <string>
static void console(const GameEvent *event, void *) {
    if(event->kind==GameTextEvent) std::cout << event->text << "\n\n";
    else if(event->kind==GameFlushEvent) std::cout.flush();
    // Image events are deliberately not drawn. The core preserves their IDs.
}
int main() {
    GameStart(console,nullptr);
    std::string line;
    while(GameGetView().mode!=GameEnded && GameGetView().mode!=GameWon && GameGetView().mode!=GameError) {
        std::cout << "\n> " << std::flush;
        if(!std::getline(std::cin,line))break;
        GameSubmit(line.c_str());
    }
    return GameGetView().mode==GameError?1:0;
}
