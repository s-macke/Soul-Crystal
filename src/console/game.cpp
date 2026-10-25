#include "game.h"
extern "C" {
#include "game_script.h"
#include "game_tables.h"
#include "game_texts.h"
}
#include <algorithm>
#include <cctype>
#include <string>
#include <vector>

namespace {
GameOutput output = nullptr;
void *outputContext = nullptr;
GameMode mode = GameEnded;
GameInputResult inputResult = GameInputIgnored;
bool busy = false;
bool music = false;
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
const char *objectName(unsigned id) { return id < ObjectStateCount ? objectDisplayNames[id] : "?"; }

// Exact saved location, including carried clothing; hidden location 0 stays hidden.
// Original parser supports additional synonyms, but these availability rules must
// never allow taking an object merely because its name exists in the global table.
bool available(unsigned id) {
    return id > 0 && id < ObjectStateCount &&
        (objectLocation[id] == currentRoom || objectLocation[id] == 255);
}
void objects(bool inventory = false) {
    std::string line = inventory ? "Inventar: " : "Ansprechbar: ";
    bool found = false;
    for (unsigned i=1; i<ObjectStateCount; ++i) {
        if (i == DAVE && inventory) continue;
        if (inventory ? objectLocation[i] != 255 : !available(i)) continue;
        if (found) line += ", ";
        line += objectName(i);
        if (!inventory && objectLocation[i] == 255) line += " (bei dir)";
        found = true;
    }
    if (!found) line += "nichts";
    say(line);
}
void exits() {
    if (currentRoom >= RoomStateCount) { fail("Ungültiger Raumzustand."); return; }
    const struct { const char* name; ScriptByte* table; } dirs[] = {
        {"Nord",north},{"Ost",east},{"Süd",south},{"West",west},{"Hinauf",up},{"Hinunter",down}};
    std::string line="Ausgänge: "; bool found=false;
    for (const auto& d:dirs) if (d.table[currentRoom]) { if(found) line+=", ";line+=d.name;found=true; }
    if(!found) line+="keine";
    say(line);
}
void roomTitle() {
    if (currentRoom > 0 && currentRoom < RoomStateCount) {
        const char* title=GameTextRecord(gamePart,currentRoom-1);
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
void verbList() {
    std::string list="Verben:", line;
    for(const auto& v:verbs) {
        if(v.heading) {
            if(!line.empty())list+='\n'+line;
            line=std::string(v.heading)+v.name;
        } else if(line.size()+2+std::char_traits<char>::length(v.name)>72) {
            list+='\n'+line+',';
            line=std::string(12,' ')+v.name;
        } else line+=std::string(", ")+v.name;
    }
    list+='\n'+line;
    list+="\nBedienung:  objekte, verben";
    say(list);say("Beispiele: nimm dave | betrachte hinweisschild | wende schlüssel auf tür.\nAuch: n/s/o/w, lies <Objekt>, inventar, objekte. Umlaute oder ae/oe/ue sind möglich.\nSpeichern/Laden ist noch nicht verfügbar.");
}

std::string stripArticle(std::string s) {
    for(const char* a:{"der ","die ","das ","den ","dem ","einen ","eine ","ein "})
        if(s.rfind(a,0)==0) return s.substr(std::char_traits<char>::length(a));
    return s;
}
ObjectID resolve(std::string phrase) {
    phrase=stripArticle(phrase);
    if(phrase=="mich"||phrase=="mir"||phrase=="ich") phrase="dave";
    std::vector<ObjectID> exact,partial;
    for(unsigned i=1;i<ObjectStateCount;++i) if(available(i)) {
        std::string name=normalize(objectName(i));
        if(name==phrase) exact.push_back(ObjectID(i));
        // Convenience for e.g. 'schlüssel'; never choose an ambiguous match.
        else if(!phrase.empty() && name.find(phrase)!=std::string::npos) partial.push_back(ObjectID(i));
    }
    const auto& matches=exact.empty()?partial:exact;
    if(matches.size()==1) return matches[0];
    if(matches.empty()) say("Hier ist kein ansprechbares Objekt namens »"+phrase+"«.");
    else {std::string names;for(auto id:matches){if(!names.empty())names+=", ";names+=objectName(id);}say("Nicht eindeutig: "+names+". Bitte genauer angeben.");}
    return 0;
}
void dispatch() {
    switch(gamePart) {case PartA:PartA_Execute();break;case PartB:PartB_Execute();break;
        case PartC:PartC_Execute();break;case PartD:PartD_Execute();break;default:fail("Ungültiger Spielteil.");}
}
void reset(bool intro) {
    ResetGameState();mode=GameReady;inputResult=GameInputAccepted;music=false;lastImage=255;lastImagePart=0;
    descriptionRoom=0;descriptionText=0;titleOnly=false;
    if(intro) {say("SOUL CRYSTAL");message(25);verbList();say(GameIntroText);}
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
    if(currentRoom==0||currentRoom>=RoomStateCount) {fail("Ungültiger Raumzustand.");return;}
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
    const GameText text=GameTextLookup(gamePart,id);
    if(text.kind==TextLiteral) say(text.text);
    else if(text.kind==TextEngineFormatted) {
        if(id==1) say("Bis jetzt hast Du "+std::to_string(score)+" Punkte in "+std::to_string(steps)+" Schritten erreicht.");
        else if(id==8) say(std::string("Du legst ")+objectName(object1)+" ab.");
        else if(id==12) say(std::string("Du nimmst ")+objectName(object1)+" mit.");
        else say("Die Handbuchabfrage ist in dieser Konsolenbasis noch nicht umgesetzt.");
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
    case 1:say("Die Codeabfrage gehört zum Handbuch des Spiels.");break;
    case 2:case 3:say("Speichern/Laden ist noch nicht verfügbar.");break;
    case 4:message(29);say("Neustart? (ja/nein)");mode=GameConfirmRestart;break;
    case 5:message(30);say("Spiel beenden? (ja/nein)");mode=GameConfirmQuit;break;
    case 6:message(38);say("N = Neustart, E = Ende; abbrechen = weiterspielen.");mode=GameSolutionPrompt;break;
    case 7:music=!music;message(music?34:35);break;
    case 8:exits();break;
    case 9:say("Die Spieldaten sind bereits eingebunden; ein Diskettenwechsel ist nicht nötig.");break;
    case 10:objects(true);break;
    case 0x32:
        // Manual/diary copy protection disabled. $FF means failure, not success.
        // Leave all following finale conditions in the original script intact.
        temp=0;break;
    case 0x33:mode=GameWon;say("Du hast Soul Crystal gewonnen!");FlushOutput();break;
    default:
        if(op>=200) say("EXGOSUB -"+std::to_string(op));
        else fail("Unbekannter SPECIAL-Aufruf.");
    }
}

extern "C" GameView GameGetView(void) {return {mode,gamePart,currentRoom,score,steps,lastImagePart,lastImage,inputResult};}
extern "C" void GameStart(GameOutput sink, void *context) {
    if(busy)return;busy=true;output=sink;outputContext=context;reset(true);busy=false;
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
    if(line.size()>1024){say("Bitte eine kürzere Eingabe (höchstens 1024 Bytes).");return;}
    line=normalize(line);if(line.empty())return;
    if(mode==GameConfirmRestart||mode==GameConfirmQuit||mode==GameDead) {
        bool yes=line=="j"||line=="ja", no=line=="n"||line=="nein";
        if(mode==GameDead && line=="neustart")yes=true;
        if(!yes&&!no){say("Bitte ja oder nein eingeben.");return;}
        inputResult=GameInputAccepted;
        const GameMode before=mode;
        if(yes && before!=GameConfirmQuit) reset(false);
        else if((yes&&before==GameConfirmQuit)||(no&&before==GameDead)){mode=GameEnded;say("Auf Wiedersehen.");}
        else {mode=GameReady;say("Weiter geht's.");}
        return;
    }
    if(mode==GameSolutionPrompt){inputResult=GameInputAccepted;if(line=="n"||line=="neustart")reset(false);else if(line=="e"||line=="ende"){mode=GameEnded;say("Auf Wiedersehen.");}else if(line=="abbrechen"){mode=GameReady;}else {inputResult=GameInputRejected;say("N, E oder abbrechen?");}return;}
    if(line=="objekte"){inputResult=GameInputAccepted;objects();return;}
    if(line=="verben"){inputResult=GameInputAccepted;verbList();return;}
    auto split=line.find(' ');std::string verb=line.substr(0,split), args=split==std::string::npos?"":line.substr(split+1);
    if(verb=="laden"||verb=="speichern"){inputResult=GameInputBlocked;say("Speichern/Laden ist noch nicht verfügbar.");return;}
    if(verb=="n")verb="nord";if(verb=="s")verb="sued";if(verb=="o")verb="ost";if(verb=="w")verb="west";
    if(verb=="oben")verb="hinauf";if(verb=="unten")verb="hinunter";if(verb=="i")verb="inventar";
    if(verb=="lies"||verb=="lese"||verb=="untersuche")verb="betrachte";
    if(verb=="hilfe")verb="hilf";if(verb=="rede")verb="sprich";
    if(verb=="benutze")verb="wende";if(verb=="ende"||verb=="quit")verb="spielende";
    CommandID parsed=0;for(const auto& v:verbs)if(verb==v.name){parsed=v.id;break;}
    if(!parsed){say("Unbekanntes Verb. Mit »verben« kannst Du die Liste anzeigen.");return;}
    ObjectID first=0,second=0;
    if(parsed>=SCHLIESSE) {
        if((parsed==SPRICH||parsed==HILF) && args.rfind("mit ",0)==0)args=args.substr(4);
        if(args.empty()&&(parsed==HILF||parsed==VERLASSE))first=ABENTEURER;
        else if(args.empty()){say("Mit welchem Objekt?");return;}
        else {
            std::size_t delimiter=std::string::npos;std::size_t width=0;
            for(const char* sep:{" auf "," an "," mit "," zu "," in "}) {
                auto at=args.find(sep);if(at<delimiter){delimiter=at;width=std::char_traits<char>::length(sep);}
            }
            if(delimiter!=std::string::npos){first=resolve(args.substr(0,delimiter));if(!first)return;second=resolve(args.substr(delimiter+width));if(!second)return;}
            else {first=resolve(args);if(!first)return;}
        }
        if(parsed>=WENDE && !second){say("Bitte zwei Objekte angeben, z.B. »wende schlüssel auf tür«.");return;}
    } else if(!args.empty()){say("Dieses Verb benötigt kein Objekt.");return;}
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
        if(currentRoom!=2)objectState[DAVE]=100;
        if(currentRoom==7)visited[7]=0;
    }
    if(currentRoom!=beforeRoom&&!titleOnly)roomTitle();
    showtext();
    if(readDiary) say(GameDiaryText);
    if(objectLocation[DAVE]==255){mode=GameDead;say("Das Spiel ist zu Ende. Neu beginnen? (ja/nein)");}
    else if(currentRoom!=beforeRoom||parsed==SCHAU||parsed>=SCHLIESSE)objects();
    command=0;object2=0;
    FlushOutput();
}
