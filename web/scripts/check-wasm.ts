import assert from 'node:assert/strict';
import { readFile, access } from 'node:fs/promises';
import { imagePath, victoryPath } from '../src/images';
import type { GameEvent, GameView } from '../src/engine';
const repo = new URL('../../', import.meta.url);
const {default: createEngine} = await import(new URL('build/wasm/soul-crystal.mjs', repo).href);
let view: GameView | undefined;
const texts: string[] = [];
const pictures = new Set<string>();
const engine = await createEngine({
  onGameEvent(event: GameEvent) {
    if (event.kind === 0) texts.push(event.text);
    if (event.kind === 1) {
      const path = imagePath(event.part, event.image, event.room);
      if (path) pictures.add(path);
    }
  },
  onGameView(next: GameView) { view = next; },
});
engine.ccall('web_start', null, ['number'], [0]);
assert.equal(view?.room, 3);
assert.ok(Array.isArray(view?.exits) && view.exits.includes(24), 'Starting street exposes its west exit');
assert.ok(view?.exits.every(id=>[11,6,19,24,21,5].includes(id)), 'Only direction command IDs are exported');
assert.ok(texts.some(text => text.includes('SOUL CRYSTAL')));
assert.ok(!texts.some(text => text.startsWith('Objekte:')), 'Web omits the object text list');
assert.ok(view?.objects.some(o=>o.id===163 && !o.carried), 'Dave is in the room');
assert.ok(!view?.objects.some(o=>o.id===12), 'Hidden bell must not leak');
assert.ok(view?.objects.some(o=>o.id===77 && o.carried), 'Clothing is carried');
// Text-mode projection follows commands and restores from the actual save state.
engine.ccall('web_submit',null,['string'],['kurztext']);
assert.equal(view?.verbose,false);
const briefSave=engine.ccall('web_save','string',[],[]);
engine.ccall('web_submit',null,['string'],['ausfuehrlich']);
assert.equal(view?.verbose,true);
assert.equal(engine.ccall('web_load','number',['string'],[briefSave]),1);
assert.equal(view?.verbose,false);
engine.ccall('web_submit',null,['string'],['ausfuehrlich']);
assert.equal(view?.verbose,true);
for(const command of ['west','nord','betrachte tresen']) engine.ccall('web_submit',null,['string'],[command]);
assert.ok(view?.objects.some(o=>o.id===12 && o.name==='Klingel'), 'Inspection reveals bell');
engine.ccall('web_submit',null,['string'],['nimm prospekt']);
assert.ok(view?.objects.some(o=>o.id===23 && o.carried), 'Taking updates inventory');
engine.ccall('web_submit',null,['string'],['verliere prospekt']);
assert.ok(view?.objects.some(o=>o.id===23 && !o.carried), 'Dropping updates room');
engine.ccall('web_start',null,['number'],[0]);
const replay = await readFile(new URL('tests/replays/fast.replay', repo), 'utf8');
let commands = 0;
for (const line of replay.split('\n')) {
  if (!line.startsWith('> ')) continue;
  engine.ccall('web_submit', null, ['string'], [line.slice(2)]);
  commands++;
  if(view?.mode===0){
    const snapshot=engine.ccall('web_save','string',[],[]);
    const before=JSON.stringify(view);
    assert.equal(engine.ccall('web_load','number',['string'],[snapshot]),1,`Load after ${line}`);
    assert.equal(engine.ccall('web_save','string',[],[]),snapshot,'Load preserves saved state');
    assert.equal(JSON.stringify(view),before,'Load preserves view and does not advance a turn');
  }
}
assert.equal(view?.mode, 5, 'Fast replay must win');
assert.equal(view?.score, 4955);
const hd = JSON.parse(await readFile(new URL('images/Amiga_HD/manifest.json', repo), 'utf8'));
const outputs = new Map<string,string>(hd.images.map((entry: {id: string; output: {path: string}}) => [entry.id,entry.output.path]));
for (const path of [...pictures, victoryPath]) {
  const source = outputs.get(path.split('/').pop()!.replace(/\.png$/, ''));
  assert.ok(source, `Missing HD mapping: ${path}`);
  await access(new URL(source, repo));
}
texts.length = 0;
engine.ccall('web_start', null, ['number'], [1]);
engine.ccall('web_submit', null, ['string'], ['west']);
engine.ccall('web_submit', null, ['string'], ['north']);
assert.equal(view?.room, 6);
assert.ok(view?.objects.some(o=>o.id===41 && o.name!=='Tresen'), 'English object names');
assert.ok(!texts.some(text => text.startsWith('Available:')), 'English web omits the object text list');
console.log(`WASM: ${commands} commands, winning score 4955, ${pictures.size} valid pictures; save/load after each ready command and English start verified.`);
