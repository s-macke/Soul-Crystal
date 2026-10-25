// Host-only content coverage. Compare actual output events with the compiled
// original catalog. Identical text on multiple disks counts once, not as proof
// that each of its script call sites ran. No changes to the game core.
#include "game.h"
#include "replay_file.h"
extern "C" {
#include "game_texts.h"
}
#include <fstream>
#include <iomanip>
#include <iostream>
#include <map>
#include <set>
#include <sstream>
#include <string>

namespace {
struct Entry {
    std::set<std::string> records, messages;
    bool title = false;
    std::string firstReplay;
};
std::map<std::string, Entry> catalog;
std::string replay;
bool introSeen = false, diarySeen = false;
const char* sides[] = {"", "B1", "B2", "C1", "C2"};
void receive(const GameEvent* e, void*) {
    if(e->kind != GameTextEvent || !e->text) return;
    const std::string text(e->text);
    if(text == GameIntroText) introSeen = true;
    if(text == GameDiaryText) diarySeen = true;
    auto it = catalog.find(text);
    if(it != catalog.end() && it->second.firstReplay.empty())
        it->second.firstReplay = replay;
}
std::string join(const std::set<std::string>& values) {
    std::string result;
    for(const auto& v:values) {if(!result.empty()) result += ", "; result += v;}
    return result;
}
std::string singleLine(std::string text) {
    for(char& c:text) if(c=='\n' || c=='\r' || c=='\t') c=' ';
    return text;
}
}

int main(int argc, char** argv) {
    if(argc < 3) {
        std::cerr << "Usage: soul-text-coverage REPORT_PREFIX REPLAY...\n";
        return 64;
    }
    for(unsigned part=1; part<=4; ++part) {
        auto p=static_cast<GamePart>(part);
        for(unsigned r=0; r<GameTextRecordCount(p); ++r) {
            const char* text=GameTextRecord(p,r);
            if(!text || !*text) continue;
            auto& entry=catalog[text];
            entry.records.insert(std::string(sides[part])+":"+std::to_string(r));
            entry.title |= r<103;
        }
        for(unsigned id=0; id<=65535; ++id) {
            const auto text=GameTextLookup(p,static_cast<TextID>(id));
            if(text.kind==TextLiteral && text.text && *text.text)
                catalog[text.text].messages.insert(std::string(sides[part])+":"+std::to_string(id));
        }
    }
    for(int arg=2; arg<argc; ++arg) {
        replay=argv[arg];
        std::vector<replay_file::Line> lines;
        try {lines=replay_file::read(replay);}
        catch(const std::exception& e) {std::cerr<<e.what()<<'\n';return 64;}
        GameStart(receive,nullptr);
        bool finished=false;
        for(const auto& source:lines) {
            const auto& line=source.text;
            if(finished) {std::cerr<<source.location()<<": Content after finish\n";return 1;}
            if(!line.empty() && line[0]=='>') {
                if(finished) {std::cerr<<"Command after finish: "<<replay<<'\n';return 1;}
                GameSubmit(line.substr(1).c_str());
                if(GameGetView().inputResult!=GameInputAccepted) {
                    std::cerr<<"Rejected input in "<<replay<<": "<<line<<'\n';return 1;
                }
            } else if(line.rfind("@finish ",0)==0) {
                const auto mode=GameGetView().mode;
                const auto kind=line.substr(8);
                finished=(kind=="won" && mode==GameWon) ||
                    (kind=="dead" && mode==GameDead) ||
                    (kind=="checkpoint" && mode==GameReady) ||
                    (kind=="ended" && mode==GameEnded);
                if(!finished) {std::cerr<<"Wrong finish: "<<replay<<'\n';return 1;}
            }
        }
        // All other replay assertions are checked by check-replay.sh before
        // this collector is run. This executable only measures emitted text.
        if(!finished) {std::cerr<<"Incomplete replay: "<<replay<<'\n';return 1;}
    }
    const std::string prefix=argv[1];
    std::ofstream tsv(prefix+".tsv"), md(prefix+".md");
    tsv<<"displayed\tkind\tdisk_records\tmessage_ids\tfirst_replay\ttext\n";
    unsigned count[3]={}, seen[3]={};
    const char* kinds[]={"ordinary-message", "room-title", "catalog-only"};
    for(const auto& item:catalog) {
        const auto& e=item.second;
        unsigned kind=!e.messages.empty()?0:e.title?1:2;
        ++count[kind]; if(!e.firstReplay.empty()) ++seen[kind];
        tsv<<(e.firstReplay.empty()?"no":"yes")<<'\t'<<kinds[kind]<<'\t'
           <<join(e.records)<<'\t'<<join(e.messages)<<'\t'<<e.firstReplay<<'\t'
           <<singleLine(item.first)<<'\n';
    }
    md<<"# Original text content coverage\n\n"
      <<"Measured from actual GameTextEvent output in "<<argc-2<<" replays. "
      <<"Identical text across records/disks counts once. A matching text does **not** "
      <<"prove that every listed ID or script branch was executed. No missing texts "
      <<"are silently excluded.\n\n"
      <<"| Catalog group | Displayed distinct texts | Total | Coverage |\n"
      <<"| --- | ---: | ---: | ---: |\n";
    for(unsigned i=0;i<3;++i)
        md<<"| "<<kinds[i]<<" | "<<seen[i]<<" | "<<count[i]<<" | "
          <<std::fixed<<std::setprecision(1)<<(count[i]?100.0*seen[i]/count[i]:0)<<"% |\n";
    md<<"\nIntro: "<<(introSeen?"displayed":"missing")<<". Full diary: "
      <<(diarySeen?"displayed":"missing")<<".\n\n"
      <<"`ordinary-message` means a literal text reachable through GameTextLookup, "
      <<"not necessarily through a reachable game state. `catalog-only` means no "
      <<"ordinary message mapping and no room title: these records need a separate "
      <<"native UI/engine audit. Dynamically formatted messages and new console UI "
      <<"are outside this literal catalog comparison.\n\n"
      <<"## Missing ordinary messages\n\n";
    for(const auto& item:catalog) {
        const auto& e=item.second;
        if(!e.firstReplay.empty() || e.messages.empty()) continue;
        md<<"- IDs "<<join(e.messages)<<"; records "<<join(e.records)<<": "
          <<singleLine(item.first).substr(0,220)<<"…\n";
    }
    tsv.close();md.close();
    if(!tsv || !md) {std::cerr<<"Cannot write reports\n";return 1;}
    std::cout<<"Original ordinary texts: "<<seen[0]<<'/'<<count[0]<<"; reports: "<<prefix<<".{md,tsv}\n";
}
