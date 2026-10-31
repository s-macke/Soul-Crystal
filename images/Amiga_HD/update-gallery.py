#!/usr/bin/env python3
"""Validate existing HD assets and rebuild the offline comparison gallery."""
from pathlib import Path
from urllib.parse import quote
import hashlib
import html
import json
from PIL import Image

root = Path(__file__).resolve().parent
repo = root.parent.parent
manifest = json.loads((root / 'manifest.json').read_text())
entries = manifest['images']
assert len({entry['id'] for entry in entries}) == len(entries)
assert len(list(root.glob('Disk */*.png'))) == len(entries)
for entry in entries:
    for kind in ('source', 'input', 'output'):
        record = entry[kind]
        path = repo / record['path']
        assert hashlib.sha256(path.read_bytes()).hexdigest() == record['sha256'], path
    with Image.open(repo / entry['source']['path']) as original, Image.open(repo / entry['input']['path']) as corrected:
        if entry.get('crop'):
            x,y,w,h=entry['crop']
            original=original.crop((x,y,x+w,y+h))
        scale=entry.get('vertical_scale',2)
        assert corrected.size == (original.width,original.height*scale)
        rows = original.convert('RGB').tobytes()
        stride=original.width*3
        expected=b''.join(rows[y*stride:(y+1)*stride]*scale for y in range(original.height))
        assert corrected.convert('RGB').tobytes() == expected, entry['id']
        aspect=corrected.width/corrected.height
    with Image.open(repo / entry['output']['path']) as generated:
        assert generated.size == (entry['width'], entry['height'])
        assert generated.width >= 1500 and generated.width * generated.height >= 1_500_000 and abs(generated.width / generated.height - aspect) < .02
        generated.verify()
    prompts = json.loads((root / entry['prompt_file']).read_text())
    assert any(scene['id'] == entry['prompt_id'] for scene in prompts['scenes'])

def local(path):
    return quote((repo / path).relative_to(root).as_posix())

cards = []
for entry in entries:
    ident, title = entry['id'], html.escape(entry['title'])
    hd, inp = local(entry['output']['path']), local(entry['input']['path'])
    original = quote('../Amiga/' + (repo / entry['source']['path']).relative_to(repo / 'images/Amiga').as_posix())
    width, height = entry['width'], entry['height']
    cards.append(f'''<article id="{ident}"><h2>{ident} · {title}</h2>
<p class="meta">{width} × {height} Pixel · <a href="{hd}">PNG öffnen</a> · <a href="{original}">Originaldatei</a></p>
<div class="picture"><img loading="lazy" width="{width}" height="{height}" src="{hd}" data-hd="{hd}" data-original="{inp}" alt="{title}"></div>
<button type="button" aria-pressed="false">Originalvorlage anzeigen</button><p class="note">{html.escape(entry['note'])}</p></article>''')
nav = ''.join(f'<a href="#{e["id"]}">{html.escape(e["title"])}</a>' for e in entries)
style = '''body{margin:0;background:#16201c;color:#eee9db;font:16px/1.55 system-ui,sans-serif}main{max-width:1200px;margin:auto;padding:30px 20px}h1{font:42px Georgia,serif;color:#d0dfa9}h2{font-size:21px}a{color:#c6dca9}article{margin:45px 0 60px;border-top:1px solid #ffffff30;padding-top:16px}.meta,.note{color:#b6c0af;font-size:14px}.picture{background:#090f0c}img{display:block;width:100%;height:auto}.original{image-rendering:pixelated}button{font:inherit;background:#c6dca9;color:#17201b;border:0;border-radius:4px;padding:9px 15px;margin-top:12px;cursor:pointer}button:focus-visible{outline:3px solid white;outline-offset:3px}nav{display:flex;flex-wrap:wrap;gap:8px 20px}'''
script = '''for(const button of document.querySelectorAll('button'))button.addEventListener('click',()=>{const img=button.parentElement.querySelector('img');const original=button.getAttribute('aria-pressed')!=='true';img.src=original?img.dataset.original:img.dataset.hd;img.classList.toggle('original',original);button.setAttribute('aria-pressed',String(original));button.textContent=original?'HD-Fassung anzeigen':'Originalvorlage anzeigen';});'''
page = f'''<!doctype html>
<html lang="de"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>Soul Crystal – Amiga HD-Proben</title><style>{style}</style></head><body><main>
<h1>Soul Crystal · Amiga HD</h1><p>{len(entries)} handgemalte KI-Neuinterpretationen. Hochauflösende Amiga-Vorlagen wurden <strong>vor der Generierung</strong> in der Höhe verdoppelt, ohne Glättung. Lowres-Bilder behalten ihre Proportionen.</p>
<p>Die Umschaltung zeigt die tatsächlich verwendete Vorlage. Die Bilder sind erste Fassungen; kleine Schriftzüge und spielrelevante Details benötigen noch eine Einzelprüfung.</p>
<nav>{nav}</nav>{''.join(cards)}
<p><a href="manifest.json">Dateizuordnung und Prüfsummen</a> · <a href="prompts/batch.json">Prompts Serie 1</a> · <a href="prompts/batch-02.json">Prompts Serie 2</a> · <a href="prompts/remaining.json">Weitere Spielbilder</a> · <a href="prompts/extras.json">Intro, Titel und Ende</a></p>
</main><script>{script}</script></body></html>'''
(root / 'index.html').write_text(page)
print(f'Verified {len(entries)} HD images, hashes, prompts, and exact vertical doubling; gallery rebuilt.')
print('Output dimensions:', sorted({(e['width'], e['height']) for e in entries}))
