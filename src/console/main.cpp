#include "game.h"
#include <iostream>
#include <string>
static void console(const GameEvent *event, void *) {
    if(event->kind==GameTextEvent) std::cout << event->text << "\n\n";
    else if(event->kind==GameFlushEvent) std::cout.flush();
    // Image events are deliberately not drawn. The core preserves their IDs.
}
int main(int argc, char** argv) {
    GameLanguage language=GameGerman;
    for(int i=1;i<argc;++i) {
        std::string arg=argv[i];
        if(arg=="--help"||arg=="-h") {std::cout<<"Usage: soul-crystal [--language de|en]\n";return 0;}
        if(arg=="--language" && i+1<argc) {
            std::string value=argv[++i];
            if(value=="de")language=GameGerman;
            else if(value=="en")language=GameEnglish;
            else {std::cerr<<"Language must be de or en.\n";return 64;}
        } else {std::cerr<<"Usage: soul-crystal [--language de|en]\n";return 64;}
    }
    GameStartLanguage(console,nullptr,language);
    std::string line;
    while(GameGetView().mode!=GameEnded && GameGetView().mode!=GameWon && GameGetView().mode!=GameError) {
        std::cout << "\n> " << std::flush;
        if(!std::getline(std::cin,line))break;
        GameSubmit(line.c_str());
    }
    return GameGetView().mode==GameError?1:0;
}
