// Host-only replay adapter: command submission is identical to the interactive
// console. Global arrays are inspected for assertions, never modified here.
#include "game.h"
#include "replay_file.h"
extern "C" {
#include "game_script.h"
}
#include <fstream>
#include <iostream>
#include <sstream>
#include <string>

namespace {
std::string response;
bool verbose=false;
void receive(const GameEvent *e, void*) {
    if(e->kind==GameTextEvent) {response+=e->text;response+='\n';if(verbose)std::cout<<e->text<<"\n\n";}
}
std::string trim(const std::string& s){const auto a=s.find_first_not_of(" \t\r\n");return a==std::string::npos?"":s.substr(a,s.find_last_not_of(" \t\r\n")-a+1);}
const char* modeName(GameMode m){switch(m){case GameReady:return "ready";case GameConfirmRestart:return "restart";case GameConfirmQuit:return "quit";case GameSolutionPrompt:return "solution";case GameDead:return "dead";case GameWon:return "won";case GameEnded:return "ended";case GameError:return "error";}return "invalid";}
bool number(const std::string& s,unsigned& n){std::istringstream in(s);in>>n;return !s.empty()&&s[0]!='-'&&!in.fail()&&(in>>std::ws).eof();}
}
int main(int argc,char** argv){
    GameLanguage language=GameGerman;
    if(argc<2){std::cerr<<"Usage: soul-replay FILE [--verbose] [--language de|en]\n";return 64;}
    for(int i=2;i<argc;++i) {
        std::string arg=argv[i];
        if(arg=="--verbose")verbose=true;
        else if(arg=="--language"&&i+1<argc) {
            std::string value=argv[++i];
            if(value=="de")language=GameGerman;
            else if(value=="en")language=GameEnglish;
            else {std::cerr<<"Language must be de or en.\n";return 64;}
        } else {std::cerr<<"Usage: soul-replay FILE [--verbose] [--language de|en]\n";return 64;}
    }
    std::vector<replay_file::Line> lines;
    try {lines=replay_file::read(argv[1]);}
    catch(const std::exception& e) {std::cerr<<e.what()<<'\n';return 64;}
    GameStartLanguage(receive,nullptr,language);
    std::string lastCommand="<start>";unsigned commands=0,checks=0;bool finished=false;std::string finishKind;
    replay_file::Line source{"",argv[1],0,""};
    auto failure=[&](const std::string& reason,int code=1){
        auto v=GameGetView();
        std::cerr<<source.location()<<": "<<reason<<source.includedFrom<<"\nLast command: "<<lastCommand
            <<"\nState: part="<<v.part<<" room="<<v.room<<" score="<<v.score<<" steps="<<v.steps
            <<" mode="<<modeName(v.mode)<<"\nOutput:\n"<<response;return code;
    };
    for(const auto& entry:lines){
        source=entry;const auto& line=entry.text;
        if(finished)return failure("Content after @finish");
        if(line[0]=='>'){
            lastCommand=trim(line.substr(1));if(lastCommand.empty())return failure("Empty command");
            response.clear();++commands;
            std::cout<<"\n> "<<lastCommand<<'\n';
            GameSubmit(lastCommand.c_str());auto v=GameGetView();
            if(v.inputResult==GameInputBlocked)return failure("BLOCKED: engine feature not implemented",2);
            if(v.inputResult!=GameInputAccepted)return failure("Command rejected or ignored");
            if(v.mode==GameError)return failure("Engine error");
            continue;
        }
        if(line[0]!='@')return failure("Expected > command or @assertion");
        const auto space=line.find(' ');const auto op=line.substr(1,space==std::string::npos?space:space-1);
        const auto arg=space==std::string::npos?"":trim(line.substr(space+1));auto v=GameGetView();
        bool okay=false;unsigned expected=0;
        if(op=="finish"){
            if(arg=="won"){okay=v.mode==GameWon;}
            else if(arg=="dead"){okay=v.mode==GameDead;}
            else if(arg=="ended"){okay=v.mode==GameEnded;}
            else if(arg=="checkpoint"){okay=v.mode==GameReady;}
            else return failure("@finish requires won, checkpoint, dead or ended");
            if(!okay)return failure("Finish condition not met: "+arg);
            finished=true;finishKind=arg;continue;
        }
        if(op=="text"||op=="not-text"){
            if(arg.empty())return failure("Empty text assertion");okay=(response.find(arg)!=std::string::npos)==(op=="text");
        }else if(op=="mode"){okay=arg==modeName(v.mode);}
        else if(op=="room"||op=="part"||op=="score"||op=="steps"||op=="image"){
            if(!number(arg,expected))return failure("Expected unsigned integer");
            unsigned actual=op=="room"?v.room:op=="part"?v.part:op=="score"?v.score:op=="steps"?v.steps:v.image;
            okay=expected==actual;
        }else if(op=="location"||op=="state"||op=="points"){
            std::istringstream in(arg);std::string a,b,extra;in>>a>>b;
            unsigned id;if((in>>extra)||!number(a,id)||!number(b,expected)||id>=ObjectStateCount)return failure("Expected object ID (0..165) and value");
            unsigned actual=op=="location"?objectLocation[id]:op=="state"?objectState[id]:remainingPoints[id];okay=actual==expected;
        }else return failure("Unknown assertion: "+op);
        ++checks;if(!okay)return failure("Assertion failed: "+line);
    }
    if(!finished)return failure("Missing @finish; end of file is not proof of victory");
    const auto final=GameGetView();
    std::cout<<finishKind<<": "<<commands<<" commands, "<<checks<<" assertions; part="<<final.part<<" room="<<final.room<<" score="<<final.score<<'\n';
    return 0;
}
