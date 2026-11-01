#!/usr/bin/env python3
"""Export the opening credits and the cast of the Amiga intro for the browser.

Follows Code/Intro on Disk 1 (offsets are into its code hunk): the Starbyte and
ACA logos and the title (+0xa8), the 15 credits pages from Credits.GFX (+0x264),
then the cast (+0x3b6): twelve animated portraits over Cast.PIC, looping until
a key or click. No voice. Waits are PAL frames (+0x9c6 waits d0 + 1 vertical
blanks); a palette fade (+0xa9a) moves every RGB nibble one step per 3 frames,
at most 0.9 s. Writes two scenes, cutscenes/<lang>/credits.json (logos, title,
credits pages) and cast.json (the endless cast), for both languages (they have
no text), and updates their index.json. Run make_cutscenes.py first
or afterwards; both keep the scene in the index.

Logos and credits pages are the painted ones from images/Amiga_HD/Intro/logos
and /credits when present, else the decoded originals, drawn without
smoothing. The cast uses the painted HD backdrop and portraits from images/Amiga_HD/Intro when
present: each still portrait lies under the backdrop's transparent frame
opening, the camera zooms in slowly, and the caption is set as text where the
original draws it. Without them, the original animations play. Needs Pillow.
"""
import json
from pathlib import Path

from PIL import Image, ImageChops

from make_cutscenes import IMAGES, ROOT, SIZE, VOICES, scenes, write_index

FRAME = 1 / 50          # PAL vertical blank
FADE = 45 * FRAME       # palette fade, 15 steps of 3 frames
DISK = 'Amiga/Disk 1'
# Cast portraits in the order of the table at +0x168e.
CAST = ['Dave', 'BrotherJack', 'Firon', 'KingRichard', 'Mylgor', 'Zargon',
        'Inn-keeper', 'Native', 'Seller', 'OldEremit', 'OrcFamily', 'Yeti']
CAST_STEP = 7 * FRAME   # one delta per wait of 6 (+0x68e)
CREDITS_AT = (112, 16)  # blit offset 0x500 + 0xe bytes on the 640 x 200 screen (+0x2a4)
MUSIC_VOLUME = 0.8
HD = 'Amiga_HD/Intro'
# The captions of the cast animations (192 x 105 at (128,72) on the 320 x 200
# screen), in English as in the original; the German roles follow the game texts.
CAPTIONS = {
    'en': {
        'Dave': ['Oliver Brühl', 'as', 'Dave Parker'],
        'BrotherJack': ['Kai Schulze', 'as', 'Brother Jack'],
        'Firon': ['Michael Niemeyer', 'as', 'The Elven King', 'Firon'],
        'KingRichard': ['Klaus-Jürgen Kraft', 'as', 'King Richard'],
        'Mylgor': ['Kjersten Waldheim', 'as', 'The Alchemist', 'Mylgor'],
        'Zargon': ['Chris Link', 'as', 'The Magician', 'Zargon'],
        'Inn-keeper': ['Sascha Teuber', 'as', 'The Inn-Keeper'],
        'Native': ['Carsten Jendro', 'as', 'The Native'],
        'Seller': ['Oliver Schmenk', 'as', 'The Seller'],
        'OldEremit': ['Klaus Adamovsky', 'as', 'The Old Eremit'],
        'OrcFamily': ['The Starbyte Crew', 'as', 'The Orc-Family'],
        'Yeti': ['Henrik Fisch', 'as', 'The Yeti'],
    },
    'de': {
        'Dave': ['Oliver Brühl', 'als', 'Dave Parker'],
        'BrotherJack': ['Kai Schulze', 'als', 'Bruder Jack'],
        'Firon': ['Michael Niemeyer', 'als', 'Der Elfenkönig', 'Firon'],
        'KingRichard': ['Klaus-Jürgen Kraft', 'als', 'König Richard'],
        'Mylgor': ['Kjersten Waldheim', 'als', 'Der Alchemist', 'Mylgor'],
        'Zargon': ['Chris Link', 'als', 'Der Magier', 'Zargon'],
        'Inn-keeper': ['Sascha Teuber', 'als', 'Der Portier'],
        'Native': ['Carsten Jendro', 'als', 'Der Dorfbewohner'],
        'Seller': ['Oliver Schmenk', 'als', 'Der Verkäufer'],
        'OldEremit': ['Klaus Adamovsky', 'als', 'Der alte Eremit'],
        'OrcFamily': ['Die Starbyte-Crew', 'als', 'Die Orkfamilie'],
        'Yeti': ['Henrik Fisch', 'als', 'Der Yeti'],
    },
}
CAPTION_FONT, CAPTION_COLOR = 'MedievalSharp', '#a8e4ee'
CAPTION_CENTER = (224 / 320, 122 / 200)  # of the screen
CAPTION_SIZE, CAPTION_LINE = 1 / 17, 1 / 8.5  # of the canvas height
PORTRAIT_ZOOM = 1.06    # slow zoom over one portrait
PORTRAIT_ANCHOR = 0.35  # zoom centre, of the portrait height (the face)


def screen(width, height, aspect, offset=(0, 0)):
    """Camera rectangle (picture pixels) fitting a width x height screen with the
    given pixel aspect into the frame, for a picture placed at offset."""
    scale = min(SIZE[0] / width, SIZE[1] / (height * aspect))
    w, h = SIZE[0] / scale, SIZE[1] / scale / aspect
    rect = [(width - w) / 2 - offset[0], (height - h) / 2 - offset[1], w, h]
    return [round(v, 2) for v in rect]


def shot(path, start, end, rect, fade_in=FADE, fade_out=FADE, **extra):
    return {'image': path.split('/')[-1], 'path': path, 'start': round(start, 3),
            'end': round(end, 3), 'from': rect, 'to': rect, 'fadeIn': round(fade_in, 3),
            'fadeOut': round(fade_out, 3), 'pixelated': True, **extra}


def hd_cast(name, start, end, backdrop, lang):
    """Shots for one painted portrait under the backdrop's opening, and its caption."""
    rect, size, (x0, y0, x1, y1) = backdrop
    with Image.open(IMAGES / HD / 'characters' / f'{name}.png') as im:
        pw, ph = im.size
    cover = max((x1 - x0) / pw, (y1 - y0) / ph)
    anchor = ((x0 + x1) / 2, y0 + (y1 - y0) * PORTRAIT_ANCHOR)
    rects = []
    for zoom in (1, PORTRAIT_ZOOM):
        s = cover * zoom  # portrait pixel -> backdrop pixel
        ox, oy = anchor[0] - pw / 2 * s, anchor[1] - ph * PORTRAIT_ANCHOR * s
        rects.append([round(v, 2) for v in ((rect[0] - ox) / s, (rect[1] - oy) / s,
                                             rect[2] / s, rect[3] / s)])
    portrait = shot(f'{HD}/characters/{name}', start, end, rects[0], pixelated=False)
    portrait['to'] = rects[1]
    cx = (CAPTION_CENTER[0] * size[0] - rect[0]) / rect[2] * SIZE[0]
    cy = (CAPTION_CENTER[1] * size[1] - rect[1]) / rect[3] * SIZE[1]
    caption = {'start': round(start, 3), 'end': round(end, 3), 'fadeIn': round(FADE, 3),
               'fadeOut': round(FADE, 3),
               'text': {'lines': CAPTIONS[lang][name], 'x': round(cx, 1), 'y': round(cy, 1),
                        'size': round(SIZE[1] * CAPTION_SIZE), 'lineHeight': round(SIZE[1] * CAPTION_LINE),
                        'color': CAPTION_COLOR, 'font': CAPTION_FONT}}
    return [portrait, caption]


def headings(page):
    """Credits page with only its headings (colours 4-6); the names (1-3) black.

    Intro +0x2fc fades COLOR04-07 in first, +0x336 COLOR00-03 a second later.
    """
    if (IMAGES / HD / 'credits' / f'{page}.png').exists():
        return hd_headings(page)
    out = IMAGES / DISK / 'credits' / f'{page}-headings.png'
    if not out.exists():
        out.parent.mkdir(exist_ok=True)
        with Image.open(IMAGES / DISK / f'{page}.png') as im:
            palette = im.getpalette()
            palette[3:12] = [0] * 9
            im.putpalette(palette)
            im.save(out)
    return f'{DISK}/credits/{page}-headings'


def hd_headings(page):
    """Painted credits page with only its blue headings: the silver names, which
    have little colour saturation, are masked to black."""
    out = IMAGES / HD / 'credits-headings' / f'{page}.png'
    if not out.exists():
        out.parent.mkdir(exist_ok=True)
        with Image.open(IMAGES / HD / 'credits' / f'{page}.png') as im:
            im = im.convert('RGB')
            mask = im.convert('HSV').getchannel('S').point(lambda v: max(0, min(255, (v - 80) * 255 // 45)))
            ImageChops.multiply(im, Image.merge('RGB', [mask] * 3)).save(out)
    return f'{HD}/credits-headings/{page}'


def build(lang):
    shots, t = [], 0.0
    hires = screen(640, 200, 2)
    # Logos and title, each faded in, held and faded out (+0xa8..+0x24c).
    for path, hold, rect in ((f'{DISK}/Starbyte', 301, hires), (f'{DISK}/ACA', 401, hires),
                             ('Amiga_HD/Disk 1/Title', 201, None)):
        logo = f'{HD}/logos/{path.rsplit("/", 1)[1]}'
        if rect is hires and (IMAGES / f'{logo}.png').exists():
            path, rect = logo, None
        if rect is None:
            with Image.open(IMAGES / f'{path}.png') as im:
                rect = screen(*im.size, 1)
        end = t + FADE + hold * FRAME + FADE
        shots.append(shot(path, t, end, rect, pixelated=rect is hires))
        if path.endswith('Starbyte'):
            credits_music = end  # Credits.MUS is loaded after the Starbyte logo (+0x12e)
        t = end
    # Credits pages: headings, 51 frames later the names, 201 frames, fade out.
    page_rect = screen(640, 200, 2, CREDITS_AT)
    for n in range(15):
        page = f'Credits-{n:02d}'
        names = t + FADE + 51 * FRAME
        end = names + FADE + 201 * FRAME + FADE
        full = f'{HD}/credits/{page}'
        if (IMAGES / f'{full}.png').exists():
            with Image.open(IMAGES / f'{full}.png') as im:
                rect, pixelated = screen(*im.size, 1), False
        else:
            full, rect, pixelated = f'{DISK}/{page}', page_rect, True
        shots.append(shot(headings(page), t, end, rect, pixelated=pixelated))
        shots.append(shot(full, names, end, rect, pixelated=pixelated))
        t = end
    # The music dims (DimOffPlayer) and stops 101 frames later (+0x390).
    credits_end = t + 101 * FRAME
    credits = timeline(shots, credits_end, [
        {'path': 'music/Amiga/Credits.mp3', 'start': round(credits_music, 3), 'end': round(credits_end, 3),
         'volume': MUSIC_VOLUME, 'fadeIn': 0.1, 'fadeOut': 2.0}])

    # Cast: Cast.PIC fades in, then each portrait fades in, plays its deltas,
    # holds 51 frames and fades out (+0x546); the list repeats (+0x516).
    # The timing stays that of the original animations, also for still portraits.
    hd = (IMAGES / HD / 'Cast.png').exists()
    if hd:
        with Image.open(IMAGES / HD / 'Cast.png') as im:
            size = im.size
            opening = im.getchannel('A').point(lambda a: 255 * (a == 0)).getbbox()
        cast_rect = screen(*size, 1)
        backdrop = (cast_rect, size, opening)
    else:
        cast_rect = screen(320, 200, 1)
    shots, captions = [], []
    loop_start = t = FADE
    for name in CAST:
        frames = sorted((IMAGES / DISK / 'animations' / name).glob(f'{name}-*.png'))
        paths = [f'{DISK}/animations/{name}/{f.stem}' for f in frames]
        end = t + FADE + (len(paths) - 1) * CAST_STEP + 51 * FRAME + FADE
        if hd:
            portrait, caption = hd_cast(name, t, end, backdrop, lang)
            shots.append(portrait)
            captions.append(caption)
        else:
            shots.append(shot(paths[0], t, end, cast_rect,
                              frames={'paths': paths, 'step': round(CAST_STEP, 3), 'delay': round(FADE, 3)}))
        t = end
    # The backdrop lies over the HD portraits (they show through its opening)
    # and under the captions; the original animations contain it.
    background = shot(f'{HD}/Cast' if hd else f'{DISK}/Cast', 0, t + FADE,
                      cast_rect, fade_out=0.001, pixelated=not hd)
    shots = [*shots, background, *captions] if hd else [background, *shots]
    cast = timeline(shots, t, [{'path': 'music/Amiga/Cast.mp3', 'start': 0,
                                'volume': MUSIC_VOLUME, 'fadeIn': 0.1, 'fadeOut': 4.0}],
                    {'start': round(loop_start, 3), 'end': round(t, 3)})
    return {'credits': credits, 'cast': cast}


def timeline(shots, duration, music, loop=None):
    """A voiceless timeline; with a loop it repeats until a key or click."""
    images = sorted({s['path'] for s in shots if 'path' in s}
                    | {p for s in shots for p in s.get('frames', {}).get('paths', [])})
    return {'version': 3, 'duration': round(duration, 3), 'hold': False, 'loop': loop,
            'voice': None, 'music': music, 'speech': [], 'size': list(SIZE), 'fade': FADE,
            'blackIn': 0.01, 'blackOut': 2.0, 'wipeFeather': 0, 'shots': shots,
            'images': images, 'cues': []}


def main():
    known = scenes()
    for lang in VOICES:
        timelines = build(lang)
        out = ROOT / 'cutscenes' / lang
        out.mkdir(parents=True, exist_ok=True)
        (out / 'vorspann.json').unlink(missing_ok=True)  # the former single scene
        for name, tl in timelines.items():
            (out / f'{name}.json').write_text(json.dumps(tl, ensure_ascii=False, indent=1) + '\n',
                                              encoding='utf-8')
        write_index(out, lang, known)
    print(f"credits {timelines['credits']['duration']:.1f} s, cast loop "
          f"{timelines['cast']['loop']['end'] - timelines['cast']['loop']['start']:.1f} s")


if __name__ == '__main__':
    main()
