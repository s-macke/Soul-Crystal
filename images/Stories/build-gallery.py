#!/usr/bin/env python3
"""Validate selected story illustrations and rebuild the standalone review gallery."""
import hashlib
import html
import json
from collections import defaultdict
from pathlib import Path

from PIL import Image

ROOT = Path(__file__).resolve().parent
REPO = ROOT.parent.parent
manifest_path = ROOT / 'manifest.json'
manifest = json.loads(manifest_path.read_text())
groups = defaultdict(list)
seen = set()
for item in manifest['images']:
    assert item['id'] not in seen, item['id']
    seen.add(item['id'])
    path = ROOT / item['file']
    with Image.open(path) as image:
        image.load()
        item['width'], item['height'] = image.size
    item['bytes'] = path.stat().st_size
    item['sha256'] = hashlib.sha256(path.read_bytes()).hexdigest()
    for reference in item['references']:
        assert (REPO / reference).is_file(), reference
    groups[path.parts[-2]].append(item)
manifest_path.write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + '\n')

unicorn = json.loads((ROOT / 'einhorn/manifest.json').read_text())
for item in unicorn['images']:
    path = ROOT / 'einhorn' / item['file']
    assert path.is_file(), path
    groups['einhorn'].append({**item, 'file': 'einhorn/' + item['file'],
                              'id': path.stem, 'brief': path.stem})

esc = html.escape
sections = []
for group, items in groups.items():
    cards = []
    for item in items:
        file = esc(item['file'], quote=True)
        title = esc(item['id'])
        details = ''
        if 'prompt' in item:
            refs = ' '.join('<a href="../../' + esc(ref, quote=True) + '">' + esc(Path(ref).name) + '</a>' for ref in item['references'])
            details = '<details><summary>References &amp; prompt</summary><p>' + refs + '</p><p>' + esc(item['prompt']) + '</p></details>'
        if item.get('cue'):
            details = '<p><strong>Wechsel:</strong> ' + esc(item['cue']) + '</p>' + details
        cards.append(f'<article><a href="{file}"><img src="{file}" loading="lazy" width="{item["width"]}" height="{item["height"]}" alt="{esc(item["brief"], quote=True)}"></a><div><h3>{title}</h3><p>{esc(item["brief"])}</p><small>{item["width"]} × {item["height"]}</small>{details}</div></article>')
    sections.append(f'<section id="{esc(group)}"><h2>{esc(group.replace("_", " ").title())} <small>({len(items)})</small></h2><div class="grid">' + ''.join(cards) + '</div></section>')
nav = ' '.join(f'<a href="#{esc(group)}">{esc(group.replace("_", " ").title())}</a>' for group in groups)
count = sum(map(len, groups.values()))
document = '''<!doctype html><html lang="en"><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>Soul Crystal · Story illustrations</title>
<style>
:root{color-scheme:dark;font-family:system-ui,sans-serif;background:#11141b;color:#eee9df}body{margin:0 auto;padding:24px;max-width:1800px}h1{font-family:Georgia,serif;font-weight:normal;font-size:clamp(2rem,4vw,3.5rem);margin-bottom:12px}a{color:#e6c386}p{line-height:1.5;color:#c6c6ca}nav{display:flex;gap:10px;flex-wrap:wrap;margin:24px 0}nav a{padding:8px 14px;border:1px solid #4e4434;border-radius:20px;text-decoration:none}section{margin:40px 0;scroll-margin-top:16px}h2{font-weight:500;text-transform:capitalize}small{color:#aba49a}.grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(min(100%,460px),1fr));gap:20px}article{background:#1c202b;border:1px solid #333846;border-radius:10px;overflow:hidden}img{width:100%;height:auto;display:block}article>div{padding:16px}h3{margin:0}details{margin-top:12px;font-size:.85rem}summary{cursor:pointer;color:#e6c386}details p{overflow-wrap:anywhere}
</style><header><h1>Soul Crystal · Story illustrations</h1>'''
document += f'<p>{count} selected illustrations: {len(seen)} story scenes and the {len(unicorn["images"])} unicorn images. Click an image to inspect the full-size PNG.</p>'
document += '<p>Review gallery; inclusion here does not indicate video timeline integration. Mylgor retains the confirmed dark-haired design. The corrected Richard skull scene is selected; its first draft is excluded from this gallery.</p><p><a href="cutscene-audit.html">Narrative coverage audit</a> · <a href="manifest.json">Manifest</a> · <a href="einhorn/index.html">Unicorn sequence</a></p></header>'
document += '<nav aria-label="Story groups">' + nav + '</nav><main>' + ''.join(sections) + '</main></html>\n'
(ROOT / 'index.html').write_text(document)
print(f'Validated {len(seen)} new illustrations; gallery contains {count} selected images.')
