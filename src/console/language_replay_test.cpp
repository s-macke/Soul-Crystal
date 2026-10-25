// Test-only access to the existing parser helpers lets us translate the German
// fixture by resolved object IDs, rather than guessing names or editing state.
#include "game.cpp"
#include "replay_file.h"
#include <cassert>
#include <iostream>
#include <fstream>

static std::string response;
static void capture(const GameEvent* e,void*) {if(e->kind==GameTextEvent)response+=std::string(e->text)+"\n";}
static std::string translated(const std::string& input) {
    auto line=normalize(input);
    if(mode==GameConfirmRestart||mode==GameConfirmQuit||mode==GameDead) {
        if(line=="ja"||line=="j")return "yes";
        if(line=="nein"||line=="n")return "no";
    }
    if(line=="objekte")return "objects";
    if(line=="verben")return "verbs";
    auto split=line.find(' ');auto v=line.substr(0,split);
    const std::pair<const char*,const char*> aliases[]={{"lies","betrachte"},{"lese","betrachte"},{"untersuche","betrachte"},{"hilfe","hilf"},{"rede","sprich"},{"benutze","wende"},{"n","nord"},{"s","sued"},{"o","ost"},{"w","west"},{"i","inventar"}};
    for(const auto& a:aliases)if(v==a.first)v=a.second;
    unsigned idx=0;for(;idx<sizeof(verbs)/sizeof(*verbs);++idx)if(v==verbs[idx].name)break;
    if(idx==sizeof(verbs)/sizeof(*verbs))throw std::runtime_error("Unknown German verb: "+v);
    std::string result=englishVerbs[idx].name;
    if(split==std::string::npos)return result;
    auto args=line.substr(split+1);
    if((v=="sprich"||v=="hilf")&&args.rfind("mit ",0)==0)args=args.substr(4);
    auto delimiter=std::string::npos;unsigned width=0;
    for(const char* sep:{" auf "," an "," mit "," zu "," in "}) {
        auto at=args.find(sep);if(at<delimiter){delimiter=at;width=std::char_traits<char>::length(sep);}
    }
    auto name=[&](const std::string& phrase) {
        auto id=resolve(phrase);if(!id)throw std::runtime_error("Cannot resolve German object: "+phrase);
        const char* corrected=GameEnglishObjectNameOverride(id);
        return normalize(corrected?corrected:englishObjectNames[id]);
    };
    result+=" "+name(args.substr(0,delimiter));
    if(delimiter!=std::string::npos)result+=" with "+name(args.substr(delimiter+width));
    return result;
}
int main(int argc,char** argv) {
    assert(argc==2||argc==3);
    struct Step {std::string command;GameView view;};std::vector<Step> trace;
    GameStart(capture,nullptr);
    for(const auto& line:replay_file::read(argv[1]))if(line.text[0]=='>') {
        auto input=line.text.substr(1);auto en=translated(input);
        GameSubmit(input.c_str());auto view=GameGetView();
        if(view.inputResult!=GameInputAccepted) {std::cerr<<"German fixture rejected: "<<input<<"\n";return 1;}
        trace.push_back({en,view});
    }
    assert(GameGetView().mode==GameWon);
    response.clear();GameStartLanguage(capture,nullptr,GameEnglish);
    assert(response.find("Here at last!")!=std::string::npos);
    assert(response.find("Verbs:")!=std::string::npos);
    std::ofstream replay;if(argc==3)replay.open(argv[2]);
    for(const auto& step:trace) {
        response.clear();GameSubmit(step.command.c_str());auto v=GameGetView();const auto& w=step.view;
        if(v.inputResult!=w.inputResult||v.mode!=w.mode||v.part!=w.part||v.room!=w.room||v.score!=w.score||v.steps!=w.steps||v.image!=w.image||v.imagePart!=w.imagePart) {
            std::cerr<<"English state differs: "<<step.command<<"\n"<<response;return 1;
        }
        if(replay)replay<<"> "<<step.command<<"\n";
    }
    assert(GameGetView().mode==GameWon);
    if(replay)replay<<"@score "<<GameGetView().score<<"\n@finish won\n";
    std::cout<<trace.size()<<" commands: both languages won with identical observable state at every step.\n";
}
