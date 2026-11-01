import { copyFile, mkdir, readdir, access } from 'node:fs/promises';
const repo = new URL('../../', import.meta.url);
const publicDir = new URL('../public/', import.meta.url);
const wasmDir = new URL('build/wasm/', repo);
try { await access(new URL('soul-crystal.wasm', wasmDir)); }
catch { throw new Error('Build WebAssembly first: ./build_wasm_docker.sh (from repository root).'); }
await mkdir(publicDir, {recursive:true});
for (const name of ['soul-crystal.mjs', 'soul-crystal.wasm'])
  await copyFile(new URL(name, wasmDir), new URL(name, publicDir));
// Keep directories in place: removing public/images while Vite is running
// invalidates its public-file cache and makes image requests fall back to HTML.
// Copy the catalog's exact assets; stable IDs connect them to the live core state.
const {readFile} = await import('node:fs/promises');
const catalog = JSON.parse(await readFile(new URL('images/UI/manifest.json', repo), 'utf8'));
for (const icon of catalog.icons) {
  await mkdir(new URL(`icons/${icon.kind}/`, publicDir), {recursive:true});
  await copyFile(new URL(`images/UI/${icon.file}`, repo), new URL(`icons/${icon.file}`, publicDir));
}
await copyFile(new URL('images/UI/manifest.json', repo), new URL('icons/manifest.json', publicDir));

// The HD manifest is the source of truth for output locations (not inputs).
const hd = JSON.parse(await readFile(new URL('images/Amiga_HD/manifest.json', repo), 'utf8'));
await mkdir(new URL('images/hd/', publicDir), {recursive:true});
const scenes = hd.images.filter(image => /^Disk[A-D]-[0-9]{3}$/.test(image.id) || image.id === 'Victory-015');
if (scenes.length !== 134) throw new Error('Incomplete HD scene catalog');
for (const image of scenes)
  await copyFile(new URL(image.output.path, repo), new URL(`images/hd/${image.id}.png`, publicDir));

// Original Amiga music, including intro and ending tracks.
await mkdir(new URL('music/', publicDir), {recursive:true});
for (const name of await readdir(new URL('music/Amiga/', repo))) {
  if (name.endsWith('.mp3')) await copyFile(new URL(`music/Amiga/${name}`, repo), new URL(`music/${name}`, publicDir));
}
