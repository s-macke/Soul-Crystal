#!/usr/bin/env python3
"""Validate icon provenance and generate an offline style preview; does not edit PNGs."""
from pathlib import Path
import hashlib, html, json, re
from PIL import Image
root=Path(__file__).resolve().parent
repo=root.parent.parent
plan=json.loads((root/'prompts.json').read_text())
ids=dict((name,int(value,16)) for name,value in re.findall(r'\b([A-Z0-9_]+)\s*=\s*(0x[0-9A-Fa-f]+)',(repo/'out/game_ids.h').read_text()))
entries=[]
seen=set()
for scene in plan['scenes']:
    if scene['symbol']=='OBJECT_165':
        assert scene['id']==165 and '"Zombie", // object 165' in (repo/'out/game_tables.c').read_text()
    else:
        assert ids[scene['symbol']]==scene['id'],scene['symbol']
    key=(scene['kind'],scene['id'])
    assert key not in seen, f'Duplicate icon ID: {key}'
    seen.add(key)
    path=root/scene['file']
    with Image.open(path) as im:
        assert im.mode=='RGBA' and im.width==im.height
        alpha=im.getchannel('A');assert alpha.getextrema()==(0,255)
        entry={k:scene[k] for k in ('kind','symbol','id','label','file')}
        entry.update(width=im.width,height=im.height,sha256=hashlib.sha256(path.read_bytes()).hexdigest(),alpha_bbox=alpha.getbbox())
        for key in ('shared_with','id_source','date'):
            if key in scene:entry[key]=scene[key]
        if scene['kind']=='verbs':entry['command']=scene['command']
        entry['style_references']=[{'file':ref,'sha256':hashlib.sha256((repo/ref).read_bytes()).hexdigest()} for ref in scene.get('style_references',[plan['style_reference']])]
        entries.append(entry)
object_ids={e['id'] for e in entries if e['kind']=='objects'}
assert object_ids <= set(range(1,166)), object_ids
manifest={'tool':plan['tool'],'date':plan['date'],'status':'complete' if object_ids==set(range(1,166)) else 'verbs-complete-objects-in-progress','style_reference':plan['style_reference'],'style_sha256':hashlib.sha256((repo/plan['style_reference']).read_bytes()).hexdigest(),'prompts':'prompts.json','icons':entries}
(root/'manifest.json').write_text(json.dumps(manifest,ensure_ascii=False,indent=2)+'\n')
def buttons(kind, symbols=None):
    result=[]
    for e in entries:
        if e['kind']!=kind:continue
        if symbols is not None and e['symbol'] not in symbols:continue
        label=html.escape(e['label']['de']);key=e['symbol'].lower()
        result.append(f'<button class="icon" type="button" data-kind="{kind}" data-label="{label}" aria-label="{label}" aria-pressed="false" aria-describedby="tip-{key}"><img src="{e["file"]}" alt="" width="64" height="64"><span role="tooltip" id="tip-{key}">{label}</span></button>')
    return '\n'.join(result)
page='''<!doctype html><html lang="de"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>Soul Crystal · Symbolprobe</title><link rel="stylesheet" href="preview.css"></head><body><main>
<header><p class="eyebrow">SOUL CRYSTAL</p><h1>Kleine Bilder. Gleiche Welt.</h1><p>Symbolkatalog · COUNTS</p></header>
<div class="scene"><img src="../Amiga_HD/style-references/reception-approved.png" alt="Gemalte Hotelrezeption als Stilreferenz" width="2079" height="756"></div>
<div class="panel"><section aria-labelledby="verbs-title"><h2 id="verbs-title">Aktionen</h2>VERBS</section>
<section aria-labelledby="objects-title"><h2 id="objects-title">Gegenstände und Personen</h2><div class="icons">OBJECTS</div></section>
<p id="selection" role="status" aria-live="polite">Ein Symbol auswählen oder mit der Maus darüberfahren.</p></div>
<footer><label>Symbolgröße <select id="size"><option value="48">48 px</option><option value="64" selected>64 px</option><option value="96">96 px</option></select></label><label>Fläche <select id="surface"><option value="dark">Dunkles Holz</option><option value="light">Pergament</option></select></label><label><input id="labels" type="checkbox"> Namen immer zeigen</label>
<p>Die Auswahl demonstriert nur die Bedienung und führt keine Spielaktion aus. Namen erscheinen auch beim Tastaturfokus; auf Touchgeräten durch Antippen.</p>
<p><a href="manifest.json">Dateien und IDs</a> · <a href="prompts.json">Bildprompts</a></p></footer></main><script src="preview.js"></script></body></html>'''
groups=[('Erkunden','SCHAU BETRACHTE INVENTAR AUSGAENGE'),('Bewegen','NORD SUED OST WEST HINAUF HINUNTER BETRITT VERLASSE'),('Handeln','NIMM VERLIERE WENDE GIB BEFESTIGE'),('Gespräch','SPRICH HILF'),('Mechanik','OEFFNE SCHLIESSE ENTRIEGELE VERRIEGELE BEWEGE DRUECKE ZIEHE GRABE ZERSTOERE'),('Zeit','WARTE'),('Spiel','PUNKTE LOESUNG NEUSTART SPIELENDE'),('Anzeige','KURZTEXT AUSFUEHRLICH MUSIKEIN'),('Information','UEBERSOULCRYSTAL CREDITS')]
verbs='\n'.join(f'<div class="verb-group"><h3>{name}</h3><div class="icons">{buttons("verbs",symbols.split())}</div></div>' for name,symbols in groups)
assert {e['symbol'] for e in entries if e['kind']=='verbs'}=={s for _,symbols in groups for s in symbols.split()}
counts=f"{sum(e['kind']=='verbs' for e in entries)} Verben und {sum(e['kind']=='objects' for e in entries)} Gegenstände"
(root/'index.html').write_text(page.replace('VERBS',verbs).replace('OBJECTS',buttons('objects')).replace('COUNTS',counts).replace('Symbolprobe','Symbolkatalog'))
print(f'Validated {len(entries)} transparent icons, enum IDs and hashes; preview generated.')
