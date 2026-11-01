#include "game.h"
extern "C" {
#include "game_script.h"
#include "game_tables.h"
#include "game_texts.h"
#include "game_texts_en.h"
#include "game_vocabulary_en.h"
}
#include <algorithm>
#include <cctype>
#include <string>
#include <vector>
#include <utility>

namespace {
GameOutput output = nullptr;
void *outputContext = nullptr;
GameMode mode = GameEnded;
GameInputResult inputResult = GameInputIgnored;
bool busy = false;
bool music = false;
bool objectListTextEnabled = true;
GameLanguage language = GameGerman;
bool english() { return language == GameEnglish; }
const char* tr(const char* de, const char* en) { return english() ? en : de; }
const char* textRecord(GamePart part, unsigned record) { return english() ? GameEnglishTextRecord(part,record) : GameTextRecord(part,record); }
unsigned lastImage = 255, lastImagePart = 0;
RoomID descriptionRoom = 0;
TextID descriptionText = 0;
bool titleOnly = false;

void emit(GameEventKind kind, const char *text = nullptr, unsigned image = 255) {
    if (output) { const GameEvent e{kind, text, gamePart, image, currentRoom}; output(&e, outputContext); }
}
void say(const std::string& text) { if (!text.empty()) emit(GameTextEvent, text.c_str()); }
void message(TextID id) { pendingTextID = id; showtext(); }
void fail(const char *text) { say(text); mode = GameError; }
const char *objectName(unsigned id) {
    if(id>=ObjectStateCount)return "?";
    if(!english())return objectDisplayNames[id];
    if(const char* corrected=GameEnglishObjectNameOverride(id))return corrected;
    return englishObjectNames[id];
}

// Exact saved location, including carried clothing; hidden location 0 stays hidden.
// Original parser supports additional synonyms, but these availability rules must
// never allow taking an object merely because its name exists in the global table.
bool available(unsigned id) {
    return id > 0 && id < ObjectStateCount &&
        (objectLocation[id] == currentRoom || objectLocation[id] == 255);
}
void objects(bool inventory = false) {
    if (!inventory && !objectListTextEnabled) return;
    std::string line = inventory ? tr("Inventar: ", "Inventory: ") : tr("Objekte: ", "Available: ");
    bool found = false;
    for (unsigned i=1; i<ObjectStateCount; ++i) {
        if (i == DAVE && inventory) continue;
        if (inventory ? objectLocation[i] != 255 : !available(i)) continue;
        if (found) line += ", ";
        line += objectName(i);
        if (!inventory && objectLocation[i] == 255) line += tr(" (bei dir)", " (carried)");
        found = true;
    }
    if (!found) line += tr("nichts", "nothing");
    say(line);
}
void exits() {
    if (currentRoom >= RoomStateCount) { fail(tr("Ungültiger Raumzustand.", "Invalid room state.")); return; }
    const struct { const char* name; ScriptByte* table; } dirs[] = {
        {tr("Nord", "North"),north},{tr("Ost", "East"),east},{tr("Süd", "South"),south},{tr("West", "West"),west},{tr("Hinauf", "Up"),up},{tr("Hinunter", "Down"),down}};
    std::string line=tr("Ausgänge: ", "Exits: "); bool found=false;
    for (const auto& d:dirs) if (d.table[currentRoom]) { if(found) line+=", ";line+=d.name;found=true; }
    if(!found) line+=tr("keine", "none");
    say(line);
}
void roomTitle() {
    if (currentRoom > 0 && currentRoom < RoomStateCount) {
        const char* title=textRecord(gamePart,currentRoom-1);
        if(title) say(title);
    }
}
void describeRoom() {
    Code2E5B(); if (!titleOnly) roomTitle(); showtext(); objects();
}
std::string normalize(std::string value) {
    const struct { const char* from; const char* to; } replacements[] = {
        {"ä","ae"},{"Ä","ae"},{"ö","oe"},{"Ö","oe"},{"ü","ue"},{"Ü","ue"},{"ß","ss"}};
    for(const auto& r:replacements) {
        std::size_t at=0;while((at=value.find(r.from,at))!=std::string::npos) { value.replace(at,std::char_traits<char>::length(r.from),r.to);at+=std::char_traits<char>::length(r.to); }
    }
    std::string result;bool space=false;
    for(unsigned char c:value) {
        if(std::isspace(c)) { space=!result.empty();continue; }
        if(space) {result+=' ';space=false;}
        result+=char(c<128?std::tolower(c):c);
    }
    return result;
}
struct Verb {const char* name; CommandID id; const char* heading = nullptr;};
// A heading starts a display group; the parser uses the same names and IDs.
const Verb verbs[] = {
    {"schau",SCHAU,"Erkunden:   "},{"betrachte",BETRACHTE},{"inventar",INVENTAR},{"ausgaenge",AUSGAENGE},
    {"nord",NORD,"Bewegen:    "},{"sued",SUED},{"ost",OST},{"west",WEST},{"hinauf",HINAUF},{"hinunter",HINUNTER},
    {"betritt",BETRITT},{"verlasse",VERLASSE},
    {"nimm",NIMM,"Handeln:    "},{"verliere",VERLIERE},{"wende",WENDE},{"gib",GIB},{"befestige",BEFESTIGE},
    {"sprich",SPRICH,"Gespräch:   "},{"hilf",HILF},
    {"oeffne",OEFFNE,"Mechanik:   "},{"schliesse",SCHLIESSE},{"entriegele",ENTRIEGELE},{"verriegele",VERRIEGELE},
    {"bewege",BEWEGE},{"druecke",DRUECKE},{"ziehe",ZIEHE},{"grabe",GRABE},{"zerstoere",ZERSTOERE},
    {"warte",WARTE,"Zeit:       "},
    {"punkte",PUNKTE,"Spiel:      "},{"loesung",LOESUNG},{"neustart",NEUSTART},{"spielende",SPIELENDE},
    {"kurztext",KURZTEXT,"Anzeige:    "},{"ausfuehrlich",AUSFUEHRLICH},{"musikein",MUSIKEIN},
    {"uebersoulcrystal",UEBERSOULCRYSTAL,"Info:       "},{"credits",CREDITS}
};
const Verb englishVerbs[] = {
    {"look",SCHAU,"Explore:    "},{"examine",BETRACHTE},{"inventory",INVENTAR},{"exits",AUSGAENGE},
    {"north",NORD,"Move:       "},{"south",SUED},{"east",OST},{"west",WEST},{"up",HINAUF},{"down",HINUNTER},
    {"enter",BETRITT},{"leave",VERLASSE},
    {"take",NIMM,"Actions:    "},{"drop",VERLIERE},{"use",WENDE},{"give",GIB},{"attach",BEFESTIGE},
    {"talk",SPRICH,"Talk:       "},{"help",HILF},
    {"open",OEFFNE,"Mechanisms: "},{"close",SCHLIESSE},{"unlock",ENTRIEGELE},{"lock",VERRIEGELE},
    {"move",BEWEGE},{"push",DRUECKE},{"pull",ZIEHE},{"dig",GRABE},{"destroy",ZERSTOERE},
    {"wait",WARTE,"Time:       "},
    {"score",PUNKTE,"Game:       "},{"solution",LOESUNG},{"restart",NEUSTART},{"quit",SPIELENDE},
    {"compact",KURZTEXT,"Display:    "},{"verbose",AUSFUEHRLICH},{"music",MUSIKEIN},
    {"about",UEBERSOULCRYSTAL,"Info:       "},{"credits",CREDITS}
};
static_assert(sizeof(verbs)==sizeof(englishVerbs), "Language command lists must cover the same IDs");
const Verb* activeVerbs() {return english()?englishVerbs:verbs;}
void verbList() {
    std::string list=tr("Verben:", "Verbs:"), line;
    for(unsigned i=0;i<sizeof(verbs)/sizeof(*verbs);++i) {
        const auto& v=activeVerbs()[i];
        if(v.heading) {
            if(!line.empty())list+='\n'+line;
            line=std::string(v.heading)+v.name;
        } else if(line.size()+2+std::char_traits<char>::length(v.name)>72) {
            list+='\n'+line+',';
            line=std::string(12,' ')+v.name;
        } else line+=std::string(", ")+v.name;
    }
    list+='\n'+line;
    list+=tr("\nBedienung:  objekte, verben", "\nControls:   objects, verbs");
    say(list);say(tr("Beispiele: nimm dave | betrachte hinweisschild | wende schlüssel auf tür.\nAuch: n/s/o/w, lies <Objekt>, inventar, objekte. Umlaute oder ae/oe/ue sind möglich.", "Examples: take dave | examine sign | use key on door.\nAlso: n/s/e/w, read <object>, inventory, objects."));
}

std::string stripArticle(std::string s) {
    if(english()) {for(const char* a:{"the ","an ","a "})if(s.rfind(a,0)==0)return s.substr(std::char_traits<char>::length(a));return s;}
    for(const char* a:{"der ","die ","das ","den ","dem ","einen ","eine ","ein "})
        if(s.rfind(a,0)==0) return s.substr(std::char_traits<char>::length(a));
    return s;
}
ObjectID resolve(std::string phrase) {
    phrase=stripArticle(phrase);
    if(english() ? (phrase=="me"||phrase=="myself"||phrase=="i") : (phrase=="mich"||phrase=="mir"||phrase=="ich")) phrase="dave";
    std::vector<ObjectID> exact,partial;
    for(unsigned i=1;i<ObjectStateCount;++i) if(available(i)) {
        std::string name=normalize(objectName(i));
        // Old fan-translation spellings remain input aliases; display uses reviewed names.
        std::string legacy=english()?normalize(englishObjectNames[i]):name;
        if(name==phrase || legacy==phrase) exact.push_back(ObjectID(i));
        // Convenience for e.g. 'schlüssel'; never choose an ambiguous match.
        else if(!phrase.empty() && (name.find(phrase)!=std::string::npos || legacy.find(phrase)!=std::string::npos)) partial.push_back(ObjectID(i));
    }
    const auto& matches=exact.empty()?partial:exact;
    if(matches.size()==1) return matches[0];
    if(matches.empty()) say(tr("Hier ist kein ansprechbares Objekt namens »", "No available object named \"")+phrase+tr("«.", "\"."));
    else {std::string names;for(auto id:matches){if(!names.empty())names+=", ";names+=objectName(id);}say(tr("Nicht eindeutig: ", "Ambiguous: ")+names+tr(". Bitte genauer angeben.", ". Please be more specific."));}
    return 0;
}
void dispatch() {
    switch(gamePart) {case PartA:PartA_Execute();break;case PartB:PartB_Execute();break;
        case PartC:PartC_Execute();break;case PartD:PartD_Execute();break;default:fail(tr("Ungültiger Spielteil.", "Invalid game part."));}
}
void reset(bool intro) {
    ResetGameState();mode=GameReady;inputResult=GameInputAccepted;music=false;lastImage=255;lastImagePart=0;
    descriptionRoom=0;descriptionText=0;titleOnly=false;
    if(intro) {say("SOUL CRYSTAL");message(25);verbList();say(english()?GameEnglishIntroText:GameIntroText);}
    imageID=currentRoom;ShowImage();describeRoom();
}
// The original transitions are intercepted BEFORE the script ($38EB..$39D5).
// Handbook checks are deliberately disabled in this port at the user's request.
// Keep the original transition conditions and destinations ($5BE2..$5C8F).
bool transitionRequested() {
    return (gamePart==PartA && currentRoom==15 && command==WEST) ||
        (gamePart==PartB && currentRoom==25 && command==NORD && objectLocation[AMULETT]==255 && objectState[AMULETT]==1) ||
        (gamePart==PartC && currentRoom==65 && command==NORD && north[65]!=0);
}
}

extern "C" int ScriptInterrupted(void) {return mode!=GameReady;}
extern "C" void FlushOutput(void) {emit(GameFlushEvent);}
extern "C" void ShowImage(void) {
    FlushOutput();
    if(imageID==255) return; // Original $408D sentinel: no change of displayed image.
    lastImage=imageID;lastImagePart=gamePart;
    emit(GameImageEvent,nullptr,imageID);
    imageID=255; // $41B9 consumes the request; lastImage preserves displayed selection.
}
extern "C" void Code2E5B(void) {
    if(currentRoom==0||currentRoom>=RoomStateCount) {fail(tr("Ungültiger Raumzustand.", "Invalid room state."));return;}
    pendingTextID=currentRoom+(currentRoom<16?106:currentRoom<51?153:currentRoom<66?305:332);
    titleOnly=visited[0]==0 && visited[currentRoom]!=0;
    if(titleOnly) pendingTextID=900;
    else {descriptionText=pendingTextID;descriptionRoom=currentRoom;}
}
extern "C" void showtext(void) {
    TextID id=pendingTextID;
    pendingTextID=0; // Original $4002 consumes every message, including unavailable IDs.
    if(titleOnly) {titleOnly=false;roomTitle();if(id==900||!id)return;}
    if(id && id==descriptionText && descriptionRoom<RoomStateCount) visited[descriptionRoom]=1;
    // Suppress the finale copy-protection announcement along with its check.
    if(gamePart==PartD && id==577)return;
    const GameText text=(english()?GameEnglishTextLookup(gamePart,id):GameTextLookup(gamePart,id));
    if(text.kind==TextLiteral) say(text.text);
    else if(text.kind==TextEngineFormatted) {
        if(id==1) say(tr("Bis jetzt hast Du ", "So far you have ")+std::to_string(score)+tr(" Punkte in ", " points in ")+std::to_string(steps)+tr(" Schritten erreicht.", " moves."));
        else if(id==8) say(std::string(tr("Du legst ", "You drop "))+objectName(object1)+tr(" ab.", "."));
        else if(id==12) say(std::string(tr("Du nimmst ", "You take "))+objectName(object1)+tr(" mit.", "."));
        else say(tr("Die Handbuchabfrage ist in dieser Konsolenbasis noch nicht umgesetzt.", "The manual check is disabled in this console version."));
    }
}
extern "C" void SPECIAL(ScriptWord op) {
    auto s=[](unsigned id){return objectState[id];};
    const unsigned r=currentRoom;
    switch(op) {
    case 0x64:temp=(s(JEANS)==0||s(TSHIRT)==0||s(TURNSCHUHE)==0)&&(s(HOSE)==0||s(BAUMWOLLHEMD)==0||s(FELLSTIEFEL)==0)&&s(BADEHOSE)==0;break;
    case 0x65:temp=(s(JEANS)==1&&s(TSHIRT)==1&&s(TURNSCHUHE)==1)||(s(HOSE)==1&&s(BAUMWOLLHEMD)==1&&s(FELLSTIEFEL)==1);break;
    case 0x66:temp=1;break; // Native OR chain, exhaustively verified.
    case 0x67:temp=(s(JEANS)==0&&s(HOSE)==0)||(s(BAUMWOLLHEMD)==0&&s(TSHIRT)==0&&s(PURPURMANTEL)==0)||(s(FELLSTIEFEL)==0&&s(TURNSCHUHE)==0);break;
    case 0x68:temp=r==3||r==4||r==7||r==8||(r>=10&&r<=15);break;
    case 0x69:temp=r==20||r==21||(r>=23&&r<=26)||(r>=28&&r<=30)||r==32||r==34||r==35||r==38||(r>=40&&r<=43);break;
    case 0x6a:temp=(r>=66&&r<=68)||(r>=75&&r<=77);break;
    case 0x6b:temp=r==25;break;
    case 0x6c:temp=object2==DAVE||(object2==BIENENSTOCK&&s(BIENENSTOCK)==1);break;
    case 1:say(tr("Die Codeabfrage gehört zum Handbuch des Spiels.", "The code check refers to the game manual."));break;
    case 2:case 3:say(tr("Speichern/Laden ist noch nicht verfügbar.", "Saving/loading is not available yet."));break;
    case 4:message(29);say(tr("Neustart? (ja/nein)", "Restart? (yes/no)"));mode=GameConfirmRestart;break;
    case 5:message(30);say(tr("Spiel beenden? (ja/nein)", "Quit the game? (yes/no)"));mode=GameConfirmQuit;break;
    case 6:message(38);say(tr("N = Neustart, E = Ende; abbrechen = weiterspielen.", "R = restart, Q = quit; cancel = continue playing."));mode=GameSolutionPrompt;break;
    case 7:music=!music;message(music?34:35);break;
    case 8:exits();break;
    case 9:say(tr("Die Spieldaten sind bereits eingebunden; ein Diskettenwechsel ist nicht nötig.", "The game data is built in; no disk change is needed."));break;
    case 10:objects(true);break;
    case 0x32:
        // Manual/diary copy protection disabled. $FF means failure, not success.
        // Leave all following finale conditions in the original script intact.
        temp=0;break;
    case 0x33:mode=GameWon;say(tr("Du hast Soul Crystal gewonnen!", "You have won Soul Crystal!"));FlushOutput();break;
    default:
        if(op>=200) say("EXGOSUB -"+std::to_string(op));
        else fail(tr("Unbekannter SPECIAL-Aufruf.", "Unknown SPECIAL call."));
    }
}

extern "C" GameView GameGetView(void) {return {mode,gamePart,currentRoom,score,steps,lastImagePart,lastImage,inputResult};}
extern "C" void GameSetObjectListTextEnabled(int enabled) {if(!busy)objectListTextEnabled=enabled!=0;}
extern "C" const char *GameObjectName(unsigned id) {return available(id) ? objectName(id) : nullptr;}
extern "C" int GameObjectCarried(unsigned id) {return available(id) && objectLocation[id]==255 && id!=DAVE;}
extern "C" unsigned GameObjectLimit(void) {return ObjectStateCount;}
extern "C" void GameStart(GameOutput sink, void *context) {GameStartLanguage(sink,context,GameGerman);}
extern "C" void GameStartLanguage(GameOutput sink, void *context, GameLanguage selected) {
    if(busy)return;busy=true;language=selected==GameEnglish?GameEnglish:GameGerman;output=sink;outputContext=context;reset(true);busy=false;
}
extern "C" void GameSubmit(const char *input) {
    if(busy)return;
    inputResult=GameInputIgnored;
    if(!input||mode==GameEnded||mode==GameWon||mode==GameError)return;
    inputResult=GameInputRejected;
    busy=true;
    // RAII ensures every parser rejection releases the public call boundary.
    struct Guard {~Guard(){busy=false;}} guard;
    std::string line(input);
    if(line.size()>1024){say(tr("Bitte eine kürzere Eingabe (höchstens 1024 Bytes).", "Please enter a shorter command (at most 1024 bytes)."));return;}
    line=normalize(line);if(line.empty())return;
    if(mode==GameConfirmRestart||mode==GameConfirmQuit||mode==GameDead) {
        bool yes=english()?(line=="y"||line=="yes"):(line=="j"||line=="ja"), no=english()?(line=="n"||line=="no"):(line=="n"||line=="nein");
        if(mode==GameDead && line==tr("neustart","restart"))yes=true;
        if(!yes&&!no){say(tr("Bitte ja oder nein eingeben.", "Please enter yes or no."));return;}
        inputResult=GameInputAccepted;
        const GameMode before=mode;
        if(yes && before!=GameConfirmQuit) reset(false);
        else if((yes&&before==GameConfirmQuit)||(no&&before==GameDead)){mode=GameEnded;say(tr("Auf Wiedersehen.", "Goodbye."));}
        else {mode=GameReady;say(tr("Weiter geht's.", "On we go."));}
        return;
    }
    if(mode==GameSolutionPrompt){inputResult=GameInputAccepted;if(line==tr("n","r")||line==tr("neustart","restart"))reset(false);else if(line==tr("e","q")||line==tr("ende","quit")){mode=GameEnded;say(tr("Auf Wiedersehen.", "Goodbye."));}else if(line==tr("abbrechen","cancel")){mode=GameReady;}else {inputResult=GameInputRejected;say(tr("N, E oder abbrechen?", "R, Q or cancel?"));}return;}
    if(line==tr("objekte","objects")){inputResult=GameInputAccepted;objects();return;}
    if(line==tr("verben","verbs")){inputResult=GameInputAccepted;verbList();return;}
    auto split=line.find(' ');std::string verb=line.substr(0,split), args=split==std::string::npos?"":line.substr(split+1);
    if(verb==tr("laden","load")||verb==tr("speichern","save")){inputResult=GameInputBlocked;say(tr("Speichern/Laden ist noch nicht verfügbar.", "Saving/loading is not available yet."));return;}
    if(english()) {
        const std::pair<const char*,const char*> aliases[] = {
            {"n","north"},{"s","south"},{"e","east"},{"w","west"},{"upward","up"},{"downward","down"},
            {"i","inventory"},{"backpack","inventory"},{"view","look"},{"consider","examine"},{"inspect","examine"},
            {"read","examine"},{"lose","drop"},{"giv","give"},{"tug","pull"},{"speak","talk"},{"paths","exits"},
            {"points","score"},{"solve","solution"}};
        for(const auto& alias:aliases)if(verb==alias.first){verb=alias.second;break;}
    } else {
    if(verb=="n")verb="nord";if(verb=="s")verb="sued";if(verb=="o")verb="ost";if(verb=="w")verb="west";
    if(verb=="oben")verb="hinauf";if(verb=="unten")verb="hinunter";if(verb=="i")verb="inventar";
    if(verb=="lies"||verb=="lese"||verb=="untersuche")verb="betrachte";
    if(verb=="hilfe")verb="hilf";if(verb=="rede")verb="sprich";
    if(verb=="benutze")verb="wende";if(verb=="ende"||verb=="quit")verb="spielende";
    }
    CommandID parsed=0;for(unsigned i=0;i<sizeof(verbs)/sizeof(*verbs);++i) {const auto& v=activeVerbs()[i];if(verb==v.name){parsed=v.id;break;}}
    if(!parsed){say(tr("Unbekanntes Verb. Mit »verben« kannst Du die Liste anzeigen.", "Unknown verb. Enter \"verbs\" to see the list."));return;}
    ObjectID first=0,second=0;
    if(parsed>=SCHLIESSE) {
        if((parsed==SPRICH||parsed==HILF) && args.rfind(tr("mit ","to "),0)==0)args=args.substr(english()?3:4);
        if(args.empty()&&(parsed==HILF||parsed==VERLASSE))first=ABENTEURER;
        else if(args.empty()){say(tr("Mit welchem Objekt?", "Which object?"));return;}
        else {
            std::size_t delimiter=std::string::npos;std::size_t width=0;
            for(const char* sep:{tr(" auf "," on "),tr(" an "," to "),tr(" mit "," with "),tr(" zu "," at ")," in "}) {
                auto at=args.find(sep);if(at<delimiter){delimiter=at;width=std::char_traits<char>::length(sep);}
            }
            if(delimiter!=std::string::npos){first=resolve(args.substr(0,delimiter));if(!first)return;second=resolve(args.substr(delimiter+width));if(!second)return;}
            else {first=resolve(args);if(!first)return;}
        }
        if(parsed>=WENDE && !second){say(tr("Bitte zwei Objekte angeben, z.B. »wende schlüssel auf tür«.", "Please specify two objects, e.g. \"use key on door\"."));return;}
    } else if(!args.empty()){say(tr("Dieses Verb benötigt kein Objekt.", "This verb does not take an object."));return;}
    inputResult=GameInputAccepted;
    command=parsed;object1=first;object2=second;pendingTextID=0;
    if(transitionRequested()) {
        // Native $5BE2/$5C11/$5C4D: skip the manual challenge and disk I/O,
        // preserve the shared mutable state, then enter the next part directly.
        if(gamePart==PartB)message(222);
        currentRoom=gamePart==PartA?25:gamePart==PartB?51:67;
        gamePart=gamePart+1;
        objectLocation[DAVE]=currentRoom;
        imageID=currentRoom;ShowImage();describeRoom();
        if(gamePart==PartD)message(436);
        command=0;object1=0;object2=0;FlushOutput();return;
    }
    const RoomID beforeRoom=currentRoom;
    const bool readDiary=parsed==BETRACHTE && first==TAGEBUCH && gamePart==PartD && objectState[TAGEBUCH]>=1;
    // Native engine prechecks ($4D6A..$4E5F).
    if(parsed==WENDE && gamePart!=PartB && first==PFEIFE)pendingTextID=94;
    else if(parsed==WENDE && second==DAVE && first==KURZSCHWERT)pendingTextID=96;
    else if(parsed==NORD && currentRoom==32)pendingTextID=5;
    else dispatch();
    if(ScriptInterrupted())return;
    if(parsed==VERRIEGELE&&(pendingTextID==0||pendingTextID==6))pendingTextID=19;
    if(parsed==WENDE&&second==DAVE&&pendingTextID==94&&first!=PFEIFE)pendingTextID=103;
    if(gamePart==PartA) {
        if(currentRoom!=6){objectLocation[PORTIER]=0;objectState[KLINGEL]=0;}
        if(currentRoom==2)objectState[DAVE]=100; // Native $3B0B..$3B1D: warm up in the lobby only.
        if(currentRoom==7)visited[7]=0;
    }
    if(currentRoom!=beforeRoom&&!titleOnly)roomTitle();
    showtext();
    if(readDiary) say(english()?GameEnglishDiaryText:GameDiaryText);
    if(objectLocation[DAVE]==255){mode=GameDead;say(tr("Das Spiel ist zu Ende. Neu beginnen? (ja/nein)", "The game is over. Start again? (yes/no)"));}
    else if(currentRoom!=beforeRoom||parsed==SCHAU||parsed>=SCHLIESSE)objects();
    command=0;object2=0;
    FlushOutput();
}

namespace {
// Exactly the 1719-byte payload documented in spec/C64/savegame_format.md.
// The browser envelope adds language, displayed image/part and music preference.
constexpr unsigned SavePayloadSize=1719, SaveDataSize=SavePayloadSize+4;
std::vector<ScriptByte> snapshotBytes() {
    std::vector<ScriptByte> bytes;
    auto word=[&](ScriptWord n){bytes.push_back(n&255);bytes.push_back(n>>8);};
    for(unsigned i=1;i<ObjectStateCount;++i){
        if(i<RoomStateCount)for(auto p:{north,east,south,west,up,down,visited})bytes.push_back(p[i]);
        word(objectDescriptionID[i]);word(remainingPoints[i]);
        bytes.push_back(objectLocation[i]);bytes.push_back(objectState[i]);
    }
    bytes.push_back(visited[0]);bytes.push_back(currentRoom);word(steps);word(score);
    bytes.push_back(engineState69BF);bytes.push_back(gamePart);
    bytes.push_back(language);bytes.push_back(lastImage);bytes.push_back(lastImagePart);bytes.push_back(music);
    return bytes;
}
uint32_t saveChecksum(const std::string& text) {
    uint32_t h=2166136261u;for(unsigned char c:text){h^=c;h*=16777619u;}return h;
}
void appendHex(std::string& s,uint32_t n,unsigned digits) {
    const char* hex="0123456789abcdef";
    for(unsigned i=digits;i>0;--i)s+=hex[(n>>((i-1)*4))&15];
}
bool readHex(const std::string& s,unsigned pos,unsigned digits,uint32_t& n) {
    n=0;for(unsigned i=0;i<digits;++i){char c=s[pos+i];if(!((c>='0'&&c<='9')||(c>='a'&&c<='f')))return false;n=n*16+(c<='9'?c-'0':c-'a'+10);}return true;
}
}
extern "C" const char *GameSave(void) {
    static std::string result;
    if(busy||mode!=GameReady)return nullptr;
    result="SC1:";for(auto n:snapshotBytes())appendHex(result,n,2);
    appendHex(result,saveChecksum(result),8);return result.c_str();
}
extern "C" int GameLoad(const char *input) {
    if(busy||!input)return 0;
    constexpr unsigned length=4+SaveDataSize*2+8;
    unsigned size=0;while(size<=length&&input[size])++size;
    if(size!=length)return 0;
    std::string data(input,size);if(data.substr(0,4)!="SC1:")return 0;
    uint32_t checksum=0;if(!readHex(data,length-8,8,checksum)||checksum!=saveChecksum(data.substr(0,length-8)))return 0;
    std::vector<ScriptByte> bytes;for(unsigned i=0;i<SaveDataSize;++i){uint32_t n=0;if(!readHex(data,4+i*2,2,n))return 0;bytes.push_back(ScriptByte(n));}
    // All validation precedes mutation; reject corrupt or incompatible saves.
    if(bytes[1712]<1||bytes[1712]>=RoomStateCount||bytes[1718]<1||bytes[1718]>4||bytes[1719]>1||bytes[1721]<1||bytes[1721]>4||bytes[1722]>1)return 0;
    for(unsigned i=0;i<103;++i)for(unsigned d=0;d<6;++d)if(bytes[i*13+d]>=RoomStateCount)return 0;
    busy=true;ResetGameState();
    unsigned at=0;auto byte=[&](){return bytes[at++];};
    auto word=[&](){unsigned lo=byte();return ScriptWord(lo|(unsigned(byte())<<8));};
    for(unsigned i=1;i<ObjectStateCount;++i){
        if(i<RoomStateCount)for(auto p:{north,east,south,west,up,down,visited})p[i]=byte();
        objectDescriptionID[i]=word();remainingPoints[i]=word();
        objectLocation[i]=byte();objectState[i]=byte();
    }
    visited[0]=byte();currentRoom=byte();steps=word();score=word();engineState69BF=byte();gamePart=byte();
    language=GameLanguage(byte());lastImage=byte();lastImagePart=byte();music=byte()!=0;
    descriptionRoom=0;descriptionText=0;titleOnly=false;imageID=255;
    mode=GameReady;inputResult=GameInputIgnored;
    if(output){const GameEvent e{GameImageEvent,nullptr,lastImagePart,lastImage,currentRoom};output(&e,outputContext);}
    roomTitle();
    // Display without dispatch, step changes or marking the room visited again.
    const TextID id=currentRoom+(currentRoom<16?106:currentRoom<51?153:currentRoom<66?305:332);
    const auto text=english()?GameEnglishTextLookup(gamePart,id):GameTextLookup(gamePart,id);
    if(text.kind==TextLiteral)say(text.text);
    objects();FlushOutput();busy=false;return 1;
}
extern "C" const char *GameRoomName(void) {
    return currentRoom>0&&currentRoom<RoomStateCount?textRecord(gamePart,currentRoom-1):"";
}
extern "C" unsigned GameGetLanguage(void) {return unsigned(language);}

extern "C" const char *GameIntroNarrative(void) {return english()?GameEnglishIntroText:GameIntroText;}
