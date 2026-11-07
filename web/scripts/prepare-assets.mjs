import { copyFile, mkdir, readdir, access, readFile, writeFile, unlink } from 'node:fs/promises';
import { createHash } from 'node:crypto';
import { execFileSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';
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
const catalog = JSON.parse(await readFile(new URL('images/UI/manifest.json', repo), 'utf8'));
execFileSync('python3', [fileURLToPath(new URL('./resize-icons.py', import.meta.url))], {stdio: 'inherit'});
const expected = new Set(catalog.icons.map(icon => `icons/${icon.file.replace(/\.png$/, '.webp')}`));
const jobs = [];
const hashes = new Map();
// A single deployed WebP per byte-identical image, regardless of source path.
async function picture(source, preferred) {
  const bytes = await readFile(new URL(source, repo));
  const hash = createHash('sha256').update(bytes).digest('hex');
  if (hashes.has(hash)) return hashes.get(hash);
  preferred = preferred.replace(/\.png$/, '.webp');
  jobs.push({source, output: preferred});
  hashes.set(hash, preferred); expected.add(preferred);
  return preferred;
}

// The HD manifest is the source of truth for output locations (not inputs).
const hd = JSON.parse(await readFile(new URL('images/Amiga_HD/manifest.json', repo), 'utf8'));
await mkdir(new URL('images/hd/', publicDir), {recursive:true});
const scenes = hd.images.filter(image => /^Disk[A-D]-[0-9]{3}$/.test(image.id) || image.id === 'Victory-015');
if (scenes.length !== 134) throw new Error('Incomplete HD scene catalog');
const scenePaths = {};
for (const image of scenes) {
  const logical = `images/hd/${image.id}.png`;
  scenePaths[logical] = await picture(image.output.path, logical);
}


// Original Amiga music, including intro and ending tracks.
await mkdir(new URL('music/', publicDir), {recursive:true});
for (const name of await readdir(new URL('music/Amiga/', repo))) {
  if (name.endsWith('.mp3')) await copyFile(new URL(`music/Amiga/${name}`, repo), new URL(`music/${name}`, publicDir));
}

// Keep timeline image IDs and crop coordinates intact. Only their deployed
// URLs change; backgrounds already used by gameplay share the same file.
const timelines = [];
for (const lang of ['de', 'en']) {
  const source = new URL(`cutscenes/${lang}/`, repo), target = new URL(`cutscenes/${lang}/`, publicDir);
  await mkdir(target, {recursive:true});
  for (const name of await readdir(source)) {
    if (!/\.(json|mp3)$/.test(name)) continue;
    if (name.endsWith('.json') && name !== 'index.json') {
      const timeline = JSON.parse(await readFile(new URL(name, source), 'utf8'));
      timeline.imageUrls = {};
      for (const path of timeline.images) {
        const deployed = await picture(`images/${path}.png`, `cutscenes/images/${path}.png`);
        timeline.imageUrls[path] = `../../${deployed}`;
      }
      timelines.push({target: new URL(name, target), timeline});
    } else await copyFile(new URL(name, source), new URL(name, target));
  }
}
const jobFile = new URL('build/web-image-jobs.json', repo);
await writeFile(jobFile, JSON.stringify(jobs));
execFileSync('python3', [fileURLToPath(new URL('./convert-pictures.py', import.meta.url)), fileURLToPath(jobFile)],
  {stdio: 'inherit'});
// Publish routing only once every referenced image is ready.
await writeFile(new URL('images/manifest.json', publicDir), JSON.stringify(scenePaths));
for (const {target, timeline} of timelines) await writeFile(target, JSON.stringify(timeline));

// Remove obsolete generated images, including assets left by older build layouts.
// Preserve directories so an already-running Vite server keeps its file cache.
async function prune(path) {
  for (const entry of await readdir(new URL(path, publicDir), {withFileTypes:true})) {
    const child = `${path}/${entry.name}`;
    if (entry.isDirectory()) await prune(child);
    else if (/\.(png|webp)$/.test(entry.name) && !expected.has(child)) await unlink(new URL(child, publicDir));
  }
}
for (const path of ['icons', 'images', 'cutscenes/images']) await prune(path);
