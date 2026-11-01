import { defineConfig, type Plugin } from 'vite';
import {readFile} from 'node:fs/promises';
import {createHash} from 'node:crypto';
function localTestSaves():Plugin {
  return {name:'local-test-saves',apply:'serve',configureServer(server){
    server.middlewares.use('/__test-saves',async (_request,response)=>{
      response.setHeader('Cache-Control','no-store');
      response.setHeader('Content-Type','application/json; charset=utf-8');
      try{
        const raw=await readFile(new URL('../build/test-saves.json',import.meta.url),'utf8');
        const catalog=JSON.parse(raw);
        const wasm=await readFile(new URL('public/soul-crystal.wasm',import.meta.url));
        if(catalog.wasmSha256!==createHash('sha256').update(wasm).digest('hex'))throw new Error('Stale fixtures');
        const replay=await readFile(new URL('../tests/replays/fast.replay',import.meta.url));
        if(catalog.replaySha256!==createHash('sha256').update(replay).digest('hex'))throw new Error('Stale replay');
        response.end(raw);
      }catch{
        response.statusCode=503;
        response.end(JSON.stringify({error:'Testspielstände fehlen oder sind veraltet. npm run test-saves --prefix web ausführen.'}));
      }
    });
  }};
}
export default defineConfig({ base: './', plugins:[localTestSaves()], build: { outDir: '../build/web', emptyOutDir: true } });
