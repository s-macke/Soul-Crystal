#include "game.h"
extern "C" {
#include "game_script.h"
#include "game_tables.h"
#include "game_texts.h"
}
#include <cassert>
#include <string>
#include <vector>
#include <iostream>

static std::string transcript;
static std::vector<unsigned> images;
static void record(const GameEvent *e, void*) {
    if(e->kind==GameTextEvent){transcript+=e->text;transcript+='\n';}
    if(e->kind==GameImageEvent)images.push_back(e->image);
}
static void submit(const char *line){transcript.clear();GameSubmit(line);}
static bool contains(const char* text){return transcript.find(text)!=std::string::npos;}
int main(){
    static_assert(IN_EINER_KLEINEN_DUNKLEN_KRYPTA==50);
    static_assert(IN_EINEM_VERWUNSCHENEN_WALD1==51);
    static_assert(UNTER_DEM_TORBOGEN==65);
    static_assert(IN_EINER_WOHNHOEHLE==103);
    GameStart(record,nullptr);
    assert(contains("Endlich da;")&&contains("rotgoldene Licht"));
    assert(contains("Verben:")&&contains("Ansprechbar:"));
    assert(!contains("Tagebuch des Turmwächters"));
    assert(GameGetView().room==3&&GameGetView().steps==1&&GameGetView().image==3);
    assert(imageID==255&&visited[3]==1&&images.back()==3);
    submit("nimm dave");assert(contains("nicht mitnehmen")&&GameGetView().inputResult==GameInputAccepted);assert(objectLocation[DAVE]==3);
    unsigned stepsBefore=steps;
    submit("nimm klingel");assert(contains("kein ansprechbares Objekt")&&GameGetView().inputResult==GameInputRejected);assert(steps==stepsBefore&&objectLocation[KLINGEL]==0);
    submit("west");assert(currentRoom==2&&GameGetView().image==2);
    submit("nord");assert(currentRoom==6&&!contains("Klingel"));
    submit("betrachte tresen");assert(objectLocation[KLINGEL]==6&&contains("Klingel"));
    submit("nimm prospekt");assert(objectLocation[PROSPEKT]==255&&contains("Prospekt"));
    submit("druecke klingel");submit("druecke klingel");submit("druecke klingel");
    assert(objectLocation[PORTIER]==6);
    submit("sprich mit portier");assert(!transcript.empty());
    submit("verliere t-shirt");assert(command==0&&objectState[TSHIRT]==0);
    submit("wende t-shirt auf dave");assert(objectState[TSHIRT]==1);
    submit("hilf");assert(!contains("Verben:")); // Do not steal the native help verb.
    stepsBefore=steps;submit("speichern");assert(contains("nicht verfügbar")&&steps==stepsBefore);
    submit("cheat");assert(contains("Unbekanntes Verb")&&steps==stepsBefore);
    submit("neustart");assert(GameGetView().mode==GameConfirmRestart);
    submit("unsinn");assert(GameGetView().mode==GameConfirmRestart);
    submit("nein");assert(GameGetView().mode==GameReady&&currentRoom==6);
    submit("neustart");submit("ja");assert(currentRoom==3&&steps==1&&score==0&&objectLocation[KLINGEL]==0);
    submit("spielende");assert(GameGetView().mode==GameConfirmQuit);
    submit("nein");assert(GameGetView().mode==GameReady);
    // Reset and direct state fixtures are test-only; there is no player cheat API.
    GameStart(record,nullptr);
    gamePart=PartD;currentRoom=IM_HAUS_DES_TURMWAECHTERS;objectLocation[DAVE]=currentRoom;
    objectLocation[TAGEBUCH]=currentRoom;objectState[TAGEBUCH]=1;remainingPoints[TAGEBUCH]=7;
    submit("lies tagebuch");assert(contains("Tagebuch des Turmwächters")&&contains("1. Tag des Jahres 713"));
    assert(objectState[TAGEBUCH]==2&&remainingPoints[TAGEBUCH]==0&&score==7);
    submit("lies tagebuch");assert(contains("1. Tag des Jahres 713")&&score==7);
    // Manual checks are disabled; transitions retain inventory, points and state.
    GameStart(record,nullptr);
    currentRoom=15;objectLocation[DAVE]=15;score=40;objectLocation[KRISTALLKUGEL]=255;
    const auto transitionSteps=steps;
    submit("west");assert(gamePart==PartB&&currentRoom==25&&objectLocation[DAVE]==25);
    assert(score==40&&steps==transitionSteps&&objectLocation[KRISTALLKUGEL]==255);
    assert(GameGetView().mode==GameReady&&GameGetView().imagePart==2&&GameGetView().image==25);
    // The amulet requirement still applies; bypassing protection is not a shortcut.
    submit("nord");assert(gamePart==PartB);
    currentRoom=25;objectLocation[DAVE]=25;objectLocation[AMULETT]=255;objectState[AMULETT]=1;
    submit("nord");assert(gamePart==PartC&&currentRoom==51&&objectLocation[DAVE]==51);
    currentRoom=65;objectLocation[DAVE]=65;north[65]=0;
    submit("nord");assert(gamePart==PartC);
    north[65]=67;
    submit("nord");assert(gamePart==PartD&&currentRoom==67&&objectLocation[DAVE]==67);
    temp=255;SPECIAL(0x32);assert(temp==0&&!ScriptInterrupted());
    // Display state remains available after consuming native image requests.
    imageID=137;ShowImage();assert(GameGetView().image==137&&GameGetView().imagePart==4&&imageID==255);
    imageID=255;const auto count=images.size();ShowImage();assert(images.size()==count&&GameGetView().image==137);
    // Explicit cooperative unwinding preserves native win's nonreturning behavior.
    SPECIAL(0x33);assert(ScriptInterrupted()&&GameGetView().mode==GameWon);
    GameStart(record,nullptr);submit("spielende");submit("ja");assert(GameGetView().mode==GameEnded);
    const auto endSteps=steps;submit("west");assert(steps==endSteps);
    // Native $3B0B warms Dave only in the lobby, not in every other room.
    GameStart(record,nullptr);objectState[TSHIRT]=0;objectState[DAVE]=5;
    submit("warte");assert(objectState[DAVE]==4&&GameGetView().mode==GameReady);
    currentRoom=IN_DER_LOBBY;objectLocation[DAVE]=currentRoom;
    submit("warte");assert(objectState[DAVE]==100&&GameGetView().mode==GameReady);
    // Original cooling logic and death are exercised through actual input.
    GameStart(record,nullptr);objectState[JEANS]=0;objectState[TSHIRT]=0;objectState[TURNSCHUHE]=0;
    currentRoom=IN_DER_LOBBY;objectLocation[DAVE]=currentRoom;objectState[DAVE]=1;
    // Room 2 is not in $68's cooling group, so use room 3 and check the script directly.
    currentRoom=3;objectLocation[DAVE]=3;command=WARTE;PartA_Execute();assert(objectLocation[DAVE]==255);
    GameStart(record,nullptr);
    assert(objectLocation[DAVE]==3&&objectState[JEANS]==1);
    std::cout<<"Console core: intro, parser, hidden objects, native handlers, restart, diary, images and ending verified.\n";
}
