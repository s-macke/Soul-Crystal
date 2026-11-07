"""Build compact, alpha-preserving web icons; leave source artwork untouched."""
import hashlib
import json
from pathlib import Path
from PIL import Image

repo = Path(__file__).resolve().parents[2]
source = repo / 'images/UI'
target = repo / 'web/public/icons'
catalog = json.loads((source / 'manifest.json').read_text())
for icon in catalog['icons']:
    size = 384 if icon['file'] == 'objects/kristall.png' else 144
    source_file = icon['file']
    icon['file'] = str(Path(source_file).with_suffix('.webp'))
    output = target / icon['file']
    output.parent.mkdir(parents=True, exist_ok=True)
    with Image.open(source / source_file) as image:
        image = image.convert('RGBA')
        image.thumbnail((size, size), Image.Resampling.LANCZOS)
        image.save(output, format='WEBP', lossless=True, method=6)
        icon.update(width=image.width, height=image.height,
                    alpha_bbox=image.getchannel('A').getbbox(),
                    sha256=hashlib.sha256(output.read_bytes()).hexdigest())
(target / 'manifest.json').write_text(json.dumps(catalog, ensure_ascii=False, indent=2) + '\n')
