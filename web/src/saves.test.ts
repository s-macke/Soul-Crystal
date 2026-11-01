import assert from 'node:assert/strict';
import test from 'node:test';
import {SaveStore, SAVE_KEY, type SaveState} from './saves';
const state:SaveState={snapshot:'SC1:'+'0'.repeat(3454),language:0,room:3,part:1,roomName:'Auf der Straße',score:0,steps:1};
test('manual saves survive auto rotation and store reopening',()=>{
 const memory=new Map<string,string>();
 const storage={getItem:(key:string)=>memory.get(key)??null,setItem:(key:string,value:string)=>{memory.set(key,value);}};
 const store=new SaveStore(()=>storage);const manual=store.add(state,'manual');
 for(let i=0;i<12;i++)store.add({...state,snapshot:'SC1:'+(i+1).toString(16).padStart(2,'0')+'0'.repeat(3452),steps:i+2},'room');
 const reopened=new SaveStore(()=>storage);assert.equal(reopened.list().length,9);
 assert.ok(reopened.list().some(s=>s.id===manual.id));
 reopened.remove(manual.id);assert.equal(reopened.list().length,8);
});
test('write failure and malformed catalogs preserve existing data',()=>{
 let raw:string|null=null;let blocked=false;
 const store=new SaveStore(()=>({getItem:()=>raw,setItem:(_k,v)=>{if(blocked)throw new Error('quota');raw=v;}}));
 store.add(state,'manual');const before=raw;blocked=true;
 assert.throws(()=>store.add({...state,snapshot:'SC1:'+'1'.repeat(3454)},'room'));assert.equal(raw,before);
 raw='broken';blocked=false;assert.throws(()=>store.add(state,'manual'));assert.equal(raw,'broken');
});
test('manual slots are never silently evicted',()=>{
 const memory=new Map<string,string>();const store=new SaveStore(()=>({getItem:k=>memory.get(k)??null,setItem:(k,v)=>{memory.set(k,v);}}));
 for(let i=0;i<20;i++)store.add(state,'manual');
 const before=memory.get(SAVE_KEY);assert.throws(()=>store.add(state,'manual'));assert.equal(memory.get(SAVE_KEY),before);
});

test('autosaves deduplicate against every retained save without writes or timestamp changes',()=>{
 const memory=new Map<string,string>();let writes=0;
 const store=new SaveStore(()=>({getItem:k=>memory.get(k)??null,setItem:(k,v)=>{writes++;memory.set(k,v);}}));
 const older=store.add(state,'room');assert.ok(older);
 const manualState={...state,snapshot:'SC1:'+'1'.repeat(3454)};
 store.add(manualState,'manual');
 store.add({...state,snapshot:'SC1:'+'2'.repeat(3454)},'part');
 const before=memory.get(SAVE_KEY);const beforeWrites=writes;
 // The old snapshot is not the most recent; the cause and display label do not matter.
 assert.equal(store.add({...state,roomName:'Updated display label'},'death'),null);
 assert.equal(store.add(manualState,'room'),null);
 assert.equal(memory.get(SAVE_KEY),before);assert.equal(writes,beforeWrites);
 // Reopening the store after reloading keeps deduplication effective.
 const reopened=new SaveStore(()=>({getItem:k=>memory.get(k)??null,setItem:(k,v)=>{writes++;memory.set(k,v);}}));
 assert.equal(reopened.add(state,'death'),null);
 // Same room/score/steps with different hidden state is still a distinct save.
 assert.ok(reopened.add({...state,snapshot:'SC1:'+'3'.repeat(3454)},'death'));
 assert.equal(reopened.list().length,4);
 // Explicit manual saves are allowed even if identical.
 assert.ok(reopened.add(state,'manual'));assert.equal(reopened.list().length,5);
});

test('room autosaves ignore travel but retain puzzle changes and explicit checkpoints',()=>{
 const memory=new Map<string,string>();const store=new SaveStore(()=>({getItem:k=>memory.get(k)??null,setItem:(k,v)=>{memory.set(k,v);}}));
 const change=(base:SaveState, index:number, value:number):SaveState=>({...base,
   snapshot:base.snapshot.slice(0,4+index*2)+value.toString(16).padStart(2,'0')+base.snapshot.slice(6+index*2)});
 store.checkpoint(state); // New game or loaded game: no save required.
 let walking=state;
 for(const index of [6,19,1711,1712,1713,1714,1697,1719,1720,1721,1722,1723]) walking=change(walking,index,1);
 assert.equal(store.add(walking,'room'),null);assert.equal(store.list().length,0);
 // Inventory, object state/description, exit, remaining points, score, hidden state, part.
 for(const index of [11,12,7,0,9,1715,1717,1718]) {
   store.checkpoint(walking);
   assert.ok(store.add(change(walking,index,7),'room'),`Meaningful byte ${index}`);
 }
 store.checkpoint(walking);
 assert.ok(store.add(walking,'death')); // Pre-death checkpoints bypass progress filtering.
 const next=change(walking,1712,2);
 assert.ok(store.add(next,'part')); // Part checkpoint also bypasses progress filtering.
 assert.equal(store.add(next,'death'),null); // Exact dedup still applies.
 const afterLoad=change(walking,1712,3);
 store.checkpoint(afterLoad);
 assert.equal(store.add(change(afterLoad,1712,4),'room'),null);
 assert.ok(store.add(afterLoad,'manual'));
});
