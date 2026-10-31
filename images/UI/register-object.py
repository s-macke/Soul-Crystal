#!/usr/bin/env python3
"""Register an unchanged image_gen PNG and all object IDs sharing that asset."""
from pathlib import Path
import json, shutil, sys
from PIL import Image
root=Path(__file__).resolve().parent
pending=json.loads((root/'objects-plan.json').read_text())['scenes']
scene=next(s for s in pending if s['symbol']==sys.argv[1])
source=Path(sys.argv[2])
with Image.open(source) as image:
    assert image.mode=='RGBA' and image.width==image.height
    assert image.getchannel('A').getextrema()==(0,255)
target=root/scene['file']
if target.exists():
    assert target.read_bytes()==source.read_bytes(), f'Refusing to overwrite {target}'
else:
    shutil.copyfile(source,target)
plan=json.loads((root/'prompts.json').read_text())
registered={(s['kind'],s['id']) for s in plan['scenes']}
for s in pending:
    if s['file']==scene['file'] and (s['kind'],s['id']) not in registered:plan['scenes'].append(s)
(root/'prompts.json').write_text(json.dumps(plan,ensure_ascii=False,indent=2)+'\n')
print(scene['symbol'], 'registered',scene['file'])
