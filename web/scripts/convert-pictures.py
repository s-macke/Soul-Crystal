"""Encode shared artwork as WebP, retaining dimensions used by cutscene crops."""
import hashlib
import json
import sys
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
from PIL import Image, features

assert features.check('webp'), 'Pillow must include WebP support'
repo = Path(__file__).resolve().parents[2]
public = repo / 'web/public'
report_path = repo / 'build/web-images.json'
previous = json.loads(report_path.read_text()) if report_path.exists() else {}
jobs = json.loads(Path(sys.argv[1]).read_text())

def convert(job):
    source, output = repo / job['source'], public / job['output']
    source_hash = hashlib.sha256(source.read_bytes()).hexdigest()
    with Image.open(source) as image:
        # Retain original low-resolution pixel art exactly.
        lossless = image.width <= 640 and image.height <= 480
        settings = dict(quality=80, method=6, lossless=lossless)
        old = previous.get(job['output'], {})
        if (old.get('sourceSha256') == source_hash and old.get('settings') == settings
                and output.exists() and old.get('sha256') == hashlib.sha256(output.read_bytes()).hexdigest()):
            return job['output'], old
        output.parent.mkdir(parents=True, exist_ok=True)
        temporary = output.with_suffix('.webp.tmp')
        image.save(temporary, format='WEBP', **settings)
        temporary.replace(output)
        return job['output'], dict(sourceSha256=source_hash,
            sha256=hashlib.sha256(output.read_bytes()).hexdigest(),
            width=image.width, height=image.height, settings=settings)

with ThreadPoolExecutor(max_workers=4) as pool:
    report = dict(pool.map(convert, jobs))
report_path.parent.mkdir(parents=True, exist_ok=True)
report_path.write_text(json.dumps(report, indent=2) + '\n')
print(f'{len(report)} shared WebP pictures ready (quality 80; original dimensions).')
