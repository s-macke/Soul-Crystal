import assert from 'node:assert/strict';
import { readFile } from 'node:fs/promises';
const base = process.argv[2] ?? 'http://127.0.0.1:5173/';
const pngSignature = Buffer.from([137, 80, 78, 71, 13, 10, 26, 10]);
let count = 0;
const hd = JSON.parse(await readFile(new URL('../../images/Amiga_HD/manifest.json', import.meta.url), 'utf8'));
const icons = JSON.parse(await readFile(new URL('../../images/UI/manifest.json', import.meta.url), 'utf8'));
const paths = [
  ...hd.images.filter(image => /^Disk[A-D]-[0-9]{3}$/.test(image.id) || image.id === 'Victory-015').map(image => `images/hd/${image.id}.png`),
  ...icons.icons.map(icon => `icons/${icon.file}`),
];
for (const path of paths) {
    const url = new URL(path, base);
    const response = await fetch(url);
    assert.equal(response.status, 200, url.href);
    assert.match(response.headers.get('content-type') ?? '', /^image\/png\b/, url.href);
    const bytes = Buffer.from(await response.arrayBuffer());
    assert.ok(bytes.subarray(0, 8).equals(pngSignature), `Invalid PNG: ${url}`);
    count++;
}
console.log(`${count} image URLs serve actual PNGs at ${base}`);
