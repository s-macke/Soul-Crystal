/** Replay-derived development fixtures. Never shipped in public/ or the production build. */
import assert from 'node:assert/strict';
import {readFile, mkdir, writeFile, rename} from 'node:fs/promises';
import {createHash} from 'node:crypto';
import type {GameView} from '../src/engine';
import type {SaveRecord} from '../src/saves';
const root=new URL('../../',import.meta.url);
const replayPath='tests/replays/fast.replay';
const replay=await readFile(new URL(replayPath,root),'utf8');
assert.ok(!/^@include/m.test(replay),'Expand includes before selecting checkpoints');
const commands=replay.split('\n').filter(line=>line.startsWith('> ')).map(line=>line.slice(2));
const checkpoints=new Map([
 ['1:3','Spielbeginn'],['1:6','Hotelrezeption'],['1:13','Hinter dem Wasserfall'],['1:15','Begegnung mit dem Einhorn'],
 ['2:25','Beginn von Teil B'],['2:18','Orkhöhle'],['2:40','Firon im Eispalast'],['2:50','Krypta'],['2:49','Mylgors Geheimlabor'],
 ['3:51','Beginn von Teil C'],['3:63','Vor Zargons Burg'],
 ['4:67','Beginn von Teil D'],['4:94','Hütte des Torwächters'],['4:89','Schwarze Bibliothek'],['4:91','Altarraum'],['4:93','Zargons Mysterium'],
]);
const {default:createEngine}=await import(new URL('build/wasm/soul-crystal.mjs',root).href);
let view:GameView;
const engine=await createEngine({onGameEvent(){},onGameView(next:GameView){view=next;}});
type Fixture=SaveRecord & {label:string; commandIndex:number; lastCommand:string};
const fixtures:Fixture[]=[];
const seen=new Set<string>();
function capture(index:number,label:string){
 assert.equal(view.mode,0);
 const {language,part,room,roomName,score,steps}=view;
 fixtures.push({id:`test-${fixtures.length+1}`,kind:'manual',created:'1970-01-01T00:00:00.000Z',label,commandIndex:index,
   lastCommand:commands[index-1]??'',language,part,room,roomName,score,steps,snapshot:engine.ccall('web_save','string',[],[])});
}
function consider(index:number){
 const key=`${view.part}:${view.room}`;
 if(view.mode===0&&checkpoints.has(key)&&!seen.has(key)){seen.add(key);capture(index,checkpoints.get(key)!);}
}
engine.ccall('web_start',null,['number'],[0]);consider(0);
for(let i=0;i<commands.length;i++){
 if(i===commands.length-1)capture(i,'Vor dem Spielende');
 engine.ccall('web_submit',null,['string'],[commands[i]]);consider(i+1);
}
assert.equal(seen.size,checkpoints.size,'All requested locations must be reached');
assert.equal(view!.mode,5);assert.equal(view!.score,4955);
for(const fixture of fixtures){
 assert.equal(engine.ccall('web_load','number',['string'],[fixture.snapshot]),1,fixture.label);
 assert.equal(engine.ccall('web_save','string',[],[]),fixture.snapshot);
 assert.equal(view!.room,fixture.room);assert.equal(view!.steps,fixture.steps);
 for(const command of commands.slice(fixture.commandIndex))engine.ccall('web_submit',null,['string'],[command]);
 assert.equal(view!.mode,5,fixture.label);assert.equal(view!.score,4955,fixture.label);
}
const sha=(value:Uint8Array|string)=>createHash('sha256').update(value).digest('hex');
const catalog={version:1,replay:replayPath,replaySha256:sha(replay),wasmSha256:sha(await readFile(new URL('build/wasm/soul-crystal.wasm',root))),commandCount:commands.length,fixtures};
await mkdir(new URL('build/',root),{recursive:true});
await writeFile(new URL('build/test-saves.json.tmp',root),JSON.stringify(catalog,null,2)+'\n');
await rename(new URL('build/test-saves.json.tmp',root),new URL('build/test-saves.json',root));
console.log(`${fixtures.length} development saves generated; every replay continuation wins with 4955 points.`);
for(const f of fixtures)console.log(`${'ABCD'[f.part-1]} · ${f.label} · ${f.roomName} · ${f.score} Punkte`);
