import {test} from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import {imagePath, victoryPath} from './images';
test('C64 selectors map to the Amiga HD room, death and special sequences', () => {
  assert.equal(imagePath(1,1,1),'images/hd/DiskA-000.png');
  assert.equal(imagePath(1,6,6),'images/hd/DiskA-005.png');
  assert.equal(imagePath(1,3,3),'images/hd/DiskA-002.png');
  assert.equal(imagePath(2,16,16),'images/hd/DiskB-000.png');
  assert.equal(imagePath(3,51,51),'images/hd/DiskC-000.png');
  assert.equal(imagePath(4,103,103),'images/hd/DiskD-037.png');
  assert.equal(imagePath(1,130,3),'images/hd/DiskA-016.png');
  assert.equal(imagePath(4,139,67),'images/hd/DiskD-048.png');
  assert.equal(imagePath(2,129,25),'images/hd/DiskB-035.png');
  assert.equal(imagePath(1,255,3),null);
  assert.equal(imagePath(1,254,3),null);
  assert.throws(()=>imagePath(1,150,3));
  assert.throws(()=>imagePath(1,16,16));
});
test('every mapped picture exists in the HD output catalog, including the finale',()=>{
  const catalog=JSON.parse(readFileSync(new URL('../../images/Amiga_HD/manifest.json',import.meta.url),'utf8'));
  const ids=new Set(catalog.images.map((entry:{id:string})=>entry.id));
  const paths=new Set<string>();
  for(const [part,offset,rooms,specials] of [[1,0,15,2],[2,15,35,8],[3,50,15,4],[4,65,38,12]]){
    for(let room=offset+1;room<=offset+rooms;room++)paths.add(imagePath(part,room,room)!);
    for(let selector=129;selector<=129+specials;selector++)paths.add(imagePath(part,selector,offset+1)!);
  }
  assert.equal(paths.size,133);
  for(const path of [...paths,victoryPath])assert.ok(ids.has(path.split('/').pop()!.replace(/\.png$/,'')),path);
});
