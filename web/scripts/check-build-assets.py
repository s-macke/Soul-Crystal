"""Verify deployed image routing, source identity, dimensions and timeline integrity."""
import hashlib
import json
from pathlib import Path
from PIL import Image

repo = Path(__file__).resolve().parents[2]
root = repo / 'build/web'
load = lambda path: json.loads(path.read_text())
hash_file = lambda path: hashlib.sha256(path.read_bytes()).hexdigest()
report = load(repo / 'build/web-images.json')
seen = {}
files = [p for p in root.rglob('*') if p.is_file()]
assert not list(root.rglob('*.png')), 'Stale PNGs remain in the deployed build'
for path in root.rglob('*.webp'):
    digest = hash_file(path)
    assert digest not in seen, f'Duplicate image: {path} and {seen.get(digest)}'
    seen[digest] = path
    with Image.open(path) as image:
        assert image.format == 'WEBP', path
        image.load()

checked = set()
def picture(source, deployed):
    assert deployed.is_relative_to(root), deployed
    key = str(deployed.relative_to(root))
    metadata = report[key]
    assert metadata['sourceSha256'] == hash_file(source), source
    assert metadata['sha256'] == hash_file(deployed), deployed
    if key not in checked:
        with Image.open(source) as original, Image.open(deployed) as image:
            assert image.size == original.size, source
            if metadata['settings']['lossless']:
                assert image.convert('RGBA').tobytes() == original.convert('RGBA').tobytes(), source
        checked.add(key)

hd = load(repo / 'images/Amiga_HD/manifest.json')
scene_paths = load(root / 'images/manifest.json')
assert len(scene_paths) == 134
for logical, deployed in scene_paths.items():
    image_id = Path(logical).stem
    image = next(i for i in hd['images'] if i['id'] == image_id)
    picture(repo / image['output']['path'], root / deployed)

icons = load(root / 'icons/manifest.json')['icons']
original_icons = load(repo / 'images/UI/manifest.json')['icons']
assert len(icons) == len(original_icons)
for icon, original in zip(icons, original_icons):
    assert (icon['kind'], icon.get('id'), icon['symbol']) == (original['kind'], original.get('id'), original['symbol'])
    path = root / 'icons' / icon['file']
    size = 384 if icon['file'] == 'objects/kristall.webp' else 144
    assert hash_file(path) == icon['sha256'], path
    with Image.open(path) as image, Image.open(repo / 'images/UI' / original['file']) as source:
        assert image.size == (size, size), path
        assert (icon['width'], icon['height']) == image.size, path
        resized = source.convert('RGBA')
        resized.thumbnail((size, size), Image.Resampling.LANCZOS)
        # WebP may discard invisible RGB under fully transparent pixels.
        assert image.convert('RGBA').getchannel('A').tobytes() == resized.getchannel('A').tobytes(), path
        for background in ['black', 'white']:
            a = Image.new('RGBA', image.size, background); a.alpha_composite(image.convert('RGBA'))
            b = Image.new('RGBA', image.size, background); b.alpha_composite(resized)
            assert a.tobytes() == b.tobytes(), path

timelines = 0
for lang in ['de', 'en']:
    for source in (repo / 'cutscenes' / lang).glob('*.json'):
        if source.name == 'index.json':
            continue
        path = root / 'cutscenes' / lang / source.name
        timeline = load(path)
        image_urls = timeline.pop('imageUrls')
        assert timeline == load(source), f'Timeline changed: {source}'
        for name in timeline['images']:
            picture(repo / 'images' / (name + '.png'), (path.parent / image_urls[name]).resolve())
        for shot in timeline['shots']:
            references = [shot.get('path'), shot.get('wipe', {}).get('path')]
            references += shot.get('frames', {}).get('paths', [])
            for reference in filter(None, references):
                assert reference in image_urls, f'Unresolved shot: {reference}'
        timelines += 1
# The three images directly embedded in HTML must also resolve.
import re
for src in re.findall(r'<img[^>]+src="([^"]+)"', (root / 'index.html').read_text()):
    assert (root / src).is_file(), src
print(f'{len(seen)} unique WebPs, {timelines} unchanged timelines; all image references verified. '
      f'Build: {sum(p.stat().st_size for p in files) / 1024**2:.1f} MiB.')
