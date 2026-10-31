#!/usr/bin/env python3
"""Copy a built-in Imagegen result into the project and record its provenance."""
import hashlib
import json
from pathlib import Path
import shutil
import sys
from PIL import Image

root = Path(__file__).resolve().parent
repo = root.parent.parent
ident, generated_path = sys.argv[1:3]
prompt_file = sys.argv[3] if len(sys.argv)>3 else 'prompts/remaining.json'
scene = next(s for s in json.loads((root / prompt_file).read_text())['scenes'] if s['id'] == ident)
manifest_path = root / 'manifest.json'
manifest = json.loads(manifest_path.read_text())
assert not any(e['id'] == ident for e in manifest['images']), ident
destination = root / f"Disk {scene['disk']}" / f'{ident}.png'
assert not destination.exists(), destination
with Image.open(generated_path) as img:
    width, height = img.size
    assert width >= 1500 and width * height >= 1_500_000 and abs(width / height - scene.get('input_width',352)/scene.get('input_height',128)) < .02, img.size
    img.verify()
destination.parent.mkdir(exist_ok=True)
shutil.copyfile(generated_path, destination)
def record(path):
    return {'path': str(path.relative_to(repo)), 'sha256': hashlib.sha256(path.read_bytes()).hexdigest()}
manifest['images'].append({
    'id': ident, 'title': scene['title'],
    'source': record(repo / scene.get("source", f"images/Amiga/Disk {scene['disk']}/{ident}.png")),
    'input': record(root / f'inputs/{ident}.png'), 'output': record(destination),
    'width': width, 'height': height, 'vertical_scale': scene.get('vertical_scale',2), 'crop': scene.get('crop'), 'status': 'generated_sample_visual_review',
    'note': 'KI-Neuinterpretation; kleine Details und Spielobjekte benötigen eine Einzelprüfung.',
    'prompt_file': prompt_file, 'prompt_id': ident,
})
manifest['images'].sort(key=lambda e: e['id'])
if prompt_file not in manifest['prompts']:
    manifest['prompts'].append(prompt_file)
temp = manifest_path.with_suffix('.json.tmp')
temp.write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + '\n')
temp.replace(manifest_path)
print(f"{ident}: saved and registered ({len(manifest['images'])} images)")
