import assert from 'node:assert/strict';
import test from 'node:test';
import {SaveStore, SAVE_KEY, type SaveState} from './saves';
const state:SaveState={snapshot:'SC1:'+'0'.repeat(3454),language:0,room:3,part:1,roomName:'Auf der Straße',score:0,steps:1};
test('manual saves survive auto rotation and store reopening',()=>{
 const memory=new Map<string,string>();
 const storage={getItem:(key:string)=>memory.get(key)??null,setItem:(key:string,value:string)=>{memory.set(key,value);}};
 const store=new SaveStore(()=>storage);const manual=store.add(state,'manual');
 for(let i=0;i<12;i++)store.add({...state,steps:i+2},'room');
 const reopened=new SaveStore(()=>storage);assert.equal(reopened.list().length,9);
 assert.ok(reopened.list().some(s=>s.id===manual.id));
 reopened.remove(manual.id);assert.equal(reopened.list().length,8);
});
test('write failure and malformed catalogs preserve existing data',()=>{
 let raw:string|null=null;let blocked=false;
 const store=new SaveStore(()=>({getItem:()=>raw,setItem:(_k,v)=>{if(blocked)throw new Error('quota');raw=v;}}));
 store.add(state,'manual');const before=raw;blocked=true;
 assert.throws(()=>store.add(state,'room'));assert.equal(raw,before);
 raw='broken';blocked=false;assert.throws(()=>store.add(state,'manual'));assert.equal(raw,'broken');
});
test('manual slots are never silently evicted',()=>{
 const memory=new Map<string,string>();const store=new SaveStore(()=>({getItem:k=>memory.get(k)??null,setItem:(k,v)=>{memory.set(k,v);}}));
 for(let i=0;i<20;i++)store.add(state,'manual');
 const before=memory.get(SAVE_KEY);assert.throws(()=>store.add(state,'manual'));assert.equal(memory.get(SAVE_KEY),before);
});
