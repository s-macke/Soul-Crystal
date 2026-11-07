import assert from 'node:assert/strict';
import { readFile } from 'node:fs/promises';
const base = process.argv[2] ?? 'http://127.0.0.1:5173/';
let count = 0;
const hd = JSON.parse(await readFile(new URL('../../images/Amiga_HD/manifest.json', import.meta.url), 'utf8'));
const icons = await (await fetch(new URL('icons/manifest.json', base))).json();
const scenePaths = await (await fetch(new URL('images/manifest.json', base))).json();
const paths = [
  ...hd.images.filter(image => /^Disk[A-D]-[0-9]{3}$/.test(image.id) || image.id === 'Victory-015').map(image => scenePaths[`images/hd/${image.id}.png`]),
  ...icons.icons.map(icon => `icons/${icon.file}`),
];
for (const lang of ['de', 'en']) {
  const directory = new URL(`../../cutscenes/${lang}/`, import.meta.url);
  const {readdir} = await import('node:fs/promises');
  for (const name of await readdir(directory)) {
    if (!name.endsWith('.json') || name === 'index.json') continue;
    const url = new URL(`cutscenes/${lang}/${name}`, base);
    const timeline = await (await fetch(url)).json();
    for (const path of timeline.images) {
      assert.ok(timeline.imageUrls[path], path);
      paths.push(new URL(timeline.imageUrls[path], url).href);
    }
  }
}
for (const path of new Set(paths.map(path => new URL(path, base).href))) {
    const url = new URL(path, base);
    const response = await fetch(url);
    assert.equal(response.status, 200, url.href);
    assert.match(response.headers.get('content-type') ?? '', /^image\/webp\b/, url.href);
    const bytes = Buffer.from(await response.arrayBuffer());
    assert.equal(bytes.toString('ascii', 0, 4), 'RIFF', url.href);
    assert.equal(bytes.toString('ascii', 8, 12), 'WEBP', url.href);
    count++;
}
console.log(`${count} image URLs serve actual WebPs at ${base}`);
