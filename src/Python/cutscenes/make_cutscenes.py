#!/usr/bin/env python3
"""Export the narrated story scenes (cutscenes) for the browser.

Each narration file is split into sections, one per picture. The whole
text is spoken in as few ElevenLabs takes as possible (eleven_v3, with
timestamps) and cached, so re-exporting costs no credits. The takes are cut
halfway between sections, located by the timestamps, and a pause is inserted
before every section. Writes cutscenes/<lang>/<story>.json (timeline, cameras,
subtitles) and <story>.mp3 (the voice alone); the web port plays them with the
story's original music, which it loads separately.

Needs ffmpeg/ffprobe and Pillow; reads ELEVENLABS_API_KEY from the environment
or the repository .env. See README.md in this directory.
"""
import argparse
import base64
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import urllib.error
import urllib.request

from PIL import Image

ROOT = Path(__file__).resolve().parents[3]
HERE = Path(__file__).resolve().parent
IMAGES = ROOT / 'images'
CACHE = ROOT / 'build/cutscenes/cache'

# Narration files in story order, with their music. Each file holds one or more
# scenes, one per game text ("### <id> <title>"); a scene shows one or more
# pictures ("## <picture>", or "##+ <picture>" within a paragraph). All scenes of a file share its recordings. Music
# is a placeholder per part (A 02, B 05, C 04, D 13 = Disk 4 "19") except for
# the intro and the ending (16, loaded by Endpart +0x268 before Victory.ANIM).
FILES = {'narration': 'Cast', 'sage': '02', 'wasserfall': '02', 'einhorn': '02',
         'mylgor': '05', 'firon': '05', 'jack': '05', 'richard': '05', 'werwolf': '05',
         'mylgorende': '05', 'burgtor': '04', 'tagebuch': '13', 'vollmond': '13',
         'ending': '16'}
# The intro starts with its first story picture (the title picture comes
# right before it in the credits; {'title': <picture>} would open with it).
# The game ends at the gate: the portcullis slides down like in Victory.ANIM,
# and "The End" stays with the music until a key is pressed.
OPTIONS = {'gate': {'finale': 'Disk 4/Victory-015', 'hold': True}}

# The game text that starts each scene in the web game ("<side> <record>" of
# texts/C64*/<side>.json). index.json carries the start of that text in each
# language; the game plays the scene when it shows a text beginning with it.
# "start" scenes play in index order after the language choice.
TRIGGERS = {
    'credits': 'start', 'cast': 'start', 'intro': 'start',
    'sage': 'B1 260', 'see': 'B1 218', 'wasserfall': 'B1 220', 'fremde_welt': 'B1 221',
    'ufer': 'B1 222', 'einhorn_kampf': 'B1 224', 'einhorn_gerettet': 'B1 255',
    'kristallkugel': 'B1 262', 'mylgor_tuer': 'B2 383', 'mylgor_vertrag': 'B2 362',
    'mylgor_kaminzimmer': 'B2 247', 'mylgor_nacht': 'B2 381', 'mylgor_auftrag': 'B2 367',
    'firon_thron': 'B2 353', 'firon_prophezeiung': 'B2 354', 'firon_schluessel': 'B2 355',
    'jack_geist': 'B2 377', 'jack_auftrag': 'B2 356', 'richard_erscheint': 'B2 384',
    'richard_geschichte': 'B2 357', 'richard_bestimmung': 'B2 358',
    'richard_zauberspruch': 'B2 359', 'richard_abschied': 'B2 360', 'werwolf': 'B2 252',
    'werwolf_kampf': 'B2 280', 'mylgor_labor': 'B2 242', 'mylgor_explosion': 'B2 277',
    'mylgor_ende': 'B2 391', 'burgtor': 'C1 223', 'tagebuch': 'C2 300',
    'vollmond': 'C2 315', 'zargon': 'C2 254', 'seelenkristall': 'C2 269',
    'zepter': 'C2 379', 'quelle': 'C2 369', 'gate': 'C2 258',
}
TRIGGER_CHARS = 60      # compared with whitespace collapsed
# Scenes that bring their own music into the game (the opening and the very
# end); all others play over the music that is already running.
OWN_MUSIC = {'credits', 'cast', 'intro', 'gate'}

MODEL = 'eleven_v3'
VOICES = {
    'de': 'lDqWFcxBxWhu05tao5Ls',  # Marcel - Friendly German Explainer
    'en': 'wSqOdjeNqDrHcoK0zorF',  # Lukas - Excited youthful young man
}
VOICE_SETTINGS = {'stability': 0.0}  # v3 "Creative": most expressive
VOICE_BITRATE = '48k'   # mono MP3; speech needs no more

SIZE = (1920, 1080)     # reference frame: the cameras have its aspect
TITLE_SECONDS = 5.0     # title picture with music only
LEAD_SECONDS = 2.5      # first picture before the narration without a title
WIPE_SECONDS = 4.0      # closing picture sliding down after the narration
END_SECONDS = 5.0       # last picture after the final sentence (hold: after the wipe)
HOLD_SECONDS = 1.0      # hold: from the end of the wipe until the picture stops
FADE_SECONDS = 1.6      # picture crossfade
ZOOM = 1.07             # slow zoom over one picture
BLACK_IN, BLACK_OUT = 1.5, 2.0  # fade from and to black at both ends
WIPE_FEATHER = 1 / 12   # soft lower edge of the closing picture, of the height
MUSIC_VOLUME = 0.55
MUSIC_FADE_IN, MUSIC_FADE_OUT = 1.5, 4.0
# Music level while the voice speaks, with attack and release times.
DUCK, DUCK_ATTACK, DUCK_RELEASE = 0.3, 0.15, 0.9
MAX_TAKE = 5000         # characters per request, the eleven_v3 limit
# Words eleven_v3 invented, cut out of a take: {cache key: [(start, end) seconds]},
# from the middle of the pause before to the middle of the pause after.
CUTS = {
    'ae0ea463b8327b9a1390': [(99.11, 100.80)],  # de einhorn: "Discrepancy" after "kein Zurück mehr"
}
SEPARATOR = '\n\n'      # between sections within one take
TAG = re.compile(r'\s*\[[^\]]*\]\s*')


def parse_narration(path, scenes=None):
    """Return [(image, focus box, pause before, text, scene, joined)]; None means default.

    "##+" starts a section that continues the previous one's paragraph: it is
    spoken without a pause, joined by a space, so the recording stays the same.
    `scenes`, if given, receives {scene id: title} in file order.
    """
    sections, scene = [], None
    for line in path.read_text(encoding='utf-8').splitlines():
        line = line.strip()
        if not line or line.startswith('# '):
            continue
        if line.startswith('### '):
            scene, _, title = line[4:].partition(' ')
            if scenes is not None:
                scenes[scene] = title
        elif line.startswith(('## ', '##+ ')):
            joined = line.startswith('##+')
            words = line[3 + joined:].split()
            opts = [w for w in words if '=' in w]
            name = ' '.join(w for w in words if '=' not in w)  # paths may hold spaces
            focus = pause = None
            for opt in opts:
                key, value = opt.split('=')
                if key == 'focus':
                    focus = tuple(int(v) for v in value.split(','))
                elif key == 'pause':
                    pause = float(value)
                else:
                    raise ValueError(f'{path}: unknown option {opt}')
            if scene is None:
                raise ValueError(f'{path}: picture before the first scene')
            if joined and (pause is not None or not sections or sections[-1][4] != scene):
                raise ValueError(f'{path}: "##+ {name}" needs a section before it, and no pause')
            sections.append([name, focus, pause, '', scene, joined])
        elif not sections:
            raise ValueError(f'{path}: text before first section')
        else:
            sections[-1][3] = (sections[-1][3] + ' ' + line).strip()
    return [tuple(s) for s in sections]


def scenes():
    """{scene id: (narration file, title per language)} in story order."""
    result = {}
    for prefix in FILES:
        titles = {}
        for lang in VOICES:
            found = {}
            parse_narration(HERE / f'{prefix}_{lang}.txt', found)
            for scene, title in found.items():
                titles.setdefault(scene, {})[lang] = title
        for scene, title in titles.items():
            result[scene] = (prefix, title)
    return result


def api_key():
    if os.environ.get('ELEVENLABS_API_KEY'):
        return os.environ['ELEVENLABS_API_KEY']
    env = ROOT / '.env'
    if env.exists():
        for line in env.read_text().splitlines():
            if line.startswith('ELEVENLABS_API_KEY='):
                return line.split('=', 1)[1].strip().strip('"\'')
    raise SystemExit('ELEVENLABS_API_KEY missing (environment or .env)')


def speak(text, lang, voice, cache):
    """Return (mp3 path, alignment) for one take, using the cache."""
    request = {'text': text, 'model_id': MODEL, 'language_code': lang,
               'voice_settings': VOICE_SETTINGS}
    key = hashlib.sha256(json.dumps([voice, request], sort_keys=True)
                         .encode()).hexdigest()[:20]
    mp3, meta = cache / f'{key}.mp3', cache / f'{key}.json'
    if not mp3.exists():
        print(f'  ElevenLabs: {len(text)} characters')
        url = (f'https://api.elevenlabs.io/v1/text-to-speech/{voice}'
               '/with-timestamps?output_format=mp3_44100_128')
        req = urllib.request.Request(
            url, json.dumps(request).encode(),
            {'xi-api-key': api_key(), 'Content-Type': 'application/json'})
        try:
            with urllib.request.urlopen(req, timeout=300) as response:
                result = json.load(response)
        except urllib.error.HTTPError as e:
            raise SystemExit(f'ElevenLabs {e.code}: {e.read().decode()[:500]}')
        cache.mkdir(parents=True, exist_ok=True)
        meta.write_text(json.dumps({'text': text, 'alignment': result['alignment']},
                                   ensure_ascii=False, indent=1))
        mp3.write_bytes(base64.b64decode(result['audio_base64']))
    alignment = json.loads(meta.read_text())['alignment']
    if key in CUTS:
        mp3, alignment = cut(mp3, alignment, CUTS[key])
    return mp3, alignment


def cut(mp3, alignment, cuts):
    """Remove the intervals from a take; later timestamps move up accordingly."""
    out = mp3.with_name(mp3.stem + '-cut.mp3')
    bounds = [0.0] + [t for c in cuts for t in c] + [None]
    parts = [f'[0]atrim={a}' + (f':{b}' if b else '') + f',asetpts=PTS-STARTPTS[p{i}]'
             for i, (a, b) in enumerate(zip(bounds[::2], bounds[1::2]))]
    graph = ';'.join(parts) + ';' + ''.join(f'[p{i}]' for i in range(len(parts))) \
        + f'concat=n={len(parts)}:v=0:a=1'
    if not out.exists():
        subprocess.run(['ffmpeg', '-v', 'error', '-y', '-i', str(mp3), '-filter_complex',
                        graph, '-b:a', '128k', str(out)], check=True)

    def shift(t):
        return t - sum(min(max(t - a, 0), b - a) for a, b in cuts)
    return out, {**alignment, **{k: [round(shift(t), 3) for t in alignment[k]]
                                 for k in ('character_start_times_seconds',
                                           'character_end_times_seconds')}}


def duration(path):
    return float(subprocess.check_output(
        ['ffprobe', '-v', 'error', '-show_entries', 'format=duration',
         '-of', 'csv=p=0', str(path)]))


def timing(text, alignment):
    """Start and end time of every character of text."""
    chars = alignment['characters']
    starts = alignment['character_start_times_seconds']
    ends = alignment['character_end_times_seconds']
    if ''.join(chars) != text:
        # Fall back to proportional positions if the model altered the text.
        scale = (len(chars) - 1) / max(len(text) - 1, 1)
        starts = [starts[round(i * scale)] for i in range(len(text))]
        ends = [ends[round(i * scale)] for i in range(len(text))]
    return starts, ends


def spoken_span(text, a, b):
    """First and last spoken character in [a, b), skipping tags and spaces."""
    first = a
    while first < b and (text[first].isspace() or text[first] == '['):
        first = text.index(']', first) + 1 if text[first] == '[' else first + 1
    last = b - 1
    while last > first and text[last].isspace():
        last -= 1
    return first, last


def request(group):
    """The text of one take: paragraphs apart, joined sections within a paragraph."""
    return ''.join((' ' if s[5] else SEPARATOR) * (i > 0) + s[3] for i, s in enumerate(group))


def takes(sections):
    """Group sections into as few requests as the limit allows, keeping paragraphs."""
    paragraphs = []
    for s in sections:
        if s[5]:
            paragraphs[-1].append(s)
        else:
            paragraphs.append([s])
    groups = [[]]
    for paragraph in paragraphs:
        if groups[-1] and len(request(groups[-1] + paragraph)) > MAX_TAKE:
            groups.append([])
        groups[-1] += paragraph
    return groups


def cues(text, alignment, offset):
    """Subtitle cues for one take: sentences, long ones split near the middle."""
    starts, ends = alignment
    pieces = re.findall(r'\S.*?(?:[.!?…]+["\'“”]?(?=\s|$)|$)', text, re.S)
    result, pos = [], 0
    for piece in pieces:
        start = text.index(piece, pos)
        pos = start + len(piece)
        for a, b in split_cue(text, start, pos):
            spoken = ' '.join(TAG.sub(' ', text[a:b]).split())
            if spoken:
                first, last = spoken_span(text, a, b)
                result.append((offset + starts[first], offset + ends[last], spoken))
    return result


def split_cue(text, a, b, limit=90):
    """Halve [a, b) until each part fits, preferring punctuation near the middle."""
    if len(TAG.sub(' ', text[a:b]).strip()) <= limit:
        return [(a, b)]
    middle = (a + b) // 2
    breaks = [m.end() + a for m in re.finditer(r'[,;:]\s|\s-\s', text[a:b])]
    breaks = [i for i in breaks if abs(i - middle) < (b - a) // 4]
    if not breaks:
        breaks = [m.end() + a for m in re.finditer(r'\s', text[a:b])]
    cut = min(breaks, key=lambda i: abs(i - middle))
    return split_cue(text, a, cut, limit) + split_cue(text, cut, b, limit)


def cameras(shot, picture_size):
    """Visible picture rectangles (left, top, width, height) at a shot's start and end.

    Even shots zoom in and pan right, odd ones the reverse; in between the
    player moves the rectangle linearly.
    """
    width, height = SIZE
    x0, y0, x1, y1 = shot['focus'] or (0, 0, *picture_size)
    fit = min if shot.get('fit') else max  # fit shows the whole picture
    rects = []
    for p in (0, 1):
        q = p if shot['index'] % 2 == 0 else 1 - p
        scale = fit(width / (x1 - x0), height / (y1 - y0)) * (1 + (ZOOM - 1) * q)
        spare_x = (x1 - x0) - width / scale
        spare_y = (y1 - y0) - height / scale
        rects.append((x0 + spare_x * (q if spare_x > 0 else 0.5), y0 + spare_y * 0.5,
                      width / scale, height / scale))
    return rects


def picture(name):
    """Path below images/ and pixel size.

    Bare names are intro pictures, "Stories/..." the painted story pictures,
    everything else lies below images/Amiga_HD.
    """
    rel = f'Amiga_HD/Disk 1/{name}' if '/' not in name else \
        name if name.startswith('Stories/') else f'Amiga_HD/{name}'
    with Image.open(IMAGES / f'{rel}.png') as im:
        return rel, im.size


def write_timeline(path, voice, music, spans, shots, all_cues, total, hold):
    """Everything the browser player needs.

    A shot is visible from start - fade/2 to end + fade/2 and fades in over
    `fade` seconds, except the first. Its camera moves linearly from `from` to
    `to` between start and end (rectangles in picture pixels, aspect of `size`)
    and holds still outside. `wipe` slides the closing picture down with the
    same camera, smoothstep-eased, with a soft edge of `wipeFeather` x height.
    The whole picture fades from black over `blackIn` and to black over
    `blackOut` seconds. Pictures are images/<path>.png: Amiga_HD/... (the web
    port serves these as images/hd/<image>.png) or Stories/...; `images` lists
    every path once. A player
    must load and decode all of them, and buffer voice and music, before it
    starts. The voice is the clock. The music is not synchronized: it loops,
    fades and drops to `duck` x volume while `speech` intervals play.

    With `hold`, the scene stops at `duration`: the picture stays, the music
    keeps looping at full volume, and only a key press or click starts the
    end, fading the picture over `blackOut` and the music over `fadeOut`
    seconds of real time. Without it, both fades end at `duration`.
    """
    timeline = {'version': 3, 'duration': round(total, 3), 'hold': hold, 'voice': voice,
                'music': {'path': music, 'volume': MUSIC_VOLUME,
                          'fadeIn': MUSIC_FADE_IN, 'fadeOut': MUSIC_FADE_OUT,
                          'duck': DUCK, 'attack': DUCK_ATTACK, 'release': DUCK_RELEASE},
                'speech': [[round(a, 3), round(b, 3)] for *_, a, b in spans],
                'size': list(SIZE), 'fade': FADE_SECONDS, 'blackIn': BLACK_IN,
                'blackOut': BLACK_OUT, 'wipeFeather': round(WIPE_FEATHER, 4), 'shots': []}
    for shot in shots:
        rel, picture_size = picture(shot['image'])
        first, last = cameras(shot, picture_size)
        entry = {'image': rel.split('/')[-1], 'path': rel,
                 'start': round(shot['start'], 3), 'end': round(shot['end'], 3),
                 'from': [round(v, 1) for v in first], 'to': [round(v, 1) for v in last]}
        if 'wipe' in shot:
            name, start, end = shot['wipe']
            rel = picture(name)[0]
            entry['wipe'] = {'image': rel.split('/')[-1], 'path': rel,
                             'start': round(start, 3), 'end': round(end, 3)}
        timeline['shots'].append(entry)
    timeline['images'] = sorted({s['path'] for s in timeline['shots']}
                                | {s['wipe']['path'] for s in timeline['shots'] if 'wipe' in s})
    timeline['cues'] = [{'start': round(a, 3), 'end': round(b, 3), 'text': text}
                        for a, b, text in all_cues]
    path.write_text(json.dumps(timeline, ensure_ascii=False, indent=1) + '\n',
                    encoding='utf-8')


def export(name, prefix, lang, args):
    print(f'[{name} {lang}]')
    story = OPTIONS.get(name, {})
    sections = parse_narration(HERE / f'{prefix}_{lang}.txt')

    # Timeline: takes in a row, each cut halfway between its sections (located by
    # the timestamps) so that a pause can be inserted before every section.
    t = TITLE_SECONDS if story.get('title') else LEAD_SECONDS
    clips, spans, all_cues = [], [], []
    used = [i for i, s in enumerate(sections) if s[4] == name]
    groups = takes(sections)
    number = 0
    for group in groups:
        if not any(number + k in used for k in range(len(group))):
            number += len(group)  # no section of this take is in the scene
            continue
        text = request(group)
        mp3, alignment = speak(text, lang, args.voice or VOICES[lang], CACHE / lang)
        starts, ends = timing(text, alignment)
        bounds, pos = [], 0
        for *_, part, _, _ in group:
            a = text.index(part, pos)
            pos = a + len(part)
            bounds.append(spoken_span(text, a, pos))
        cuts = [0.0] + [(ends[bounds[k][1]] + starts[bounds[k + 1][0]]) / 2
                        for k in range(len(group) - 1)] + [duration(mp3)]
        take_cues = cues(text, (starts, ends), 0)
        for k, (image, focus, pause, _, _, joined) in enumerate(group):
            number += 1
            if number - 1 not in used:
                continue
            if joined:  # same paragraph: the previous clip runs on, no pause
                clips[-1] = clips[-1][:3] + (cuts[k + 1],)
            else:
                if clips:
                    t += args.pause if pause is None else pause
                clips.append((mp3, t, cuts[k], cuts[k + 1]))
            shift = t - cuts[k]
            first, last = bounds[k]
            spans.append((image, focus, starts[first] + shift, ends[last] + shift))
            all_cues += [(a + shift, b + shift, cue) for a, b, cue in take_cues
                         if cuts[k] <= a < cuts[k + 1]]
            t += cuts[k + 1] - cuts[k]
    wipe = None
    if story.get('finale'):
        wipe = (story['finale'], t + 1.0, t + 1.0 + WIPE_SECONDS)
        t = wipe[2]
    total = t + (HOLD_SECONDS if story.get('hold') else END_SECONDS)
    print(f'  {len(groups)} take(s), length {total:.1f} s')

    # One shot per section; cuts lie halfway between two sections' speech.
    shots = []
    if story.get('title'):
        shots.append({'image': story['title'], 'focus': None, 'fit': True, 'start': 0.0})
    for i, (image, focus, start, end) in enumerate(spans):
        cut = (spans[i - 1][3] + start) / 2 if i else start if shots else 0.0
        if shots:
            shots[-1]['end'] = cut
        shots.append({'image': image, 'focus': focus, 'start': cut})
    shots[-1]['end'] = total
    if wipe:
        shots[-1]['wipe'] = wipe
    for i, shot in enumerate(shots):
        shot['index'] = i

    # The voice alone, silent before and between the sections.
    out = Path(args.out) / lang
    out.mkdir(parents=True, exist_ok=True)
    base = name + (f'_{args.suffix}' if args.suffix else '')
    cmd = ['ffmpeg', '-v', 'error', '-y']
    for mp3, *_ in clips:
        cmd += ['-i', str(mp3)]
    graph = [f'[{i}]atrim={a:.3f}:{b:.3f},asetpts=PTS-STARTPTS,'
             f'adelay={round(start * 1000)}:all=1[v{i}]'
             for i, (_, start, a, b) in enumerate(clips)]
    # Renumber the timestamps by samples first: otherwise atrim drops adelay's
    # silence when there is only one clip.
    graph.append(''.join(f'[v{i}]' for i in range(len(clips)))
                 + f'amix=inputs={len(clips)}:normalize=0,asetpts=N/SR/TB,apad,'
                 f'atrim=0:{total:.3f}')
    voice = out / f'{base}.mp3'
    subprocess.run(cmd + ['-filter_complex', ';'.join(graph), '-ac', '1', '-ar', '44100',
                          '-b:a', VOICE_BITRATE, str(voice)], check=True)
    write_timeline(out / f'{base}.json', voice.name, args.music or f'music/Amiga/{FILES[prefix]}.mp3',
                   spans, shots, all_cues, total, story.get('hold', False))
    print(f'  wrote {voice.relative_to(ROOT)} and .json')


def main():
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument('scenes', nargs='*', metavar='SCENE',
                        help='scene ids or narration files (default: all), see index.json')
    parser.add_argument('--lang', nargs='+', choices=sorted(VOICES), default=['de'])
    parser.add_argument('--voice', help='ElevenLabs voice ID instead of the default')
    parser.add_argument('--suffix', help='appended to the output names, e.g. a voice name')
    parser.add_argument('--music', help="path below the repository instead of the story's music")
    parser.add_argument('--out', default=ROOT / 'cutscenes', type=Path)
    parser.add_argument('--pause', type=float, default=0.7,
                        help='seconds of silence added before each section')
    args = parser.parse_args()
    known = scenes()
    chosen = []
    for name in args.scenes:
        if name in FILES:
            chosen += [s for s, (prefix, _) in known.items() if prefix == name]
        elif name in known:
            chosen.append(name)
        else:
            parser.error(f'unknown scene or narration file {name}')
    for lang in args.lang:
        for name in chosen or known:
            export(name, known[name][0], lang, args)
        if not args.suffix:
            write_index(Path(args.out) / lang, lang, known)


def trigger(name, lang):
    """'start', or the beginning of the scene's game text in this language."""
    if TRIGGERS[name] == 'start':
        return 'start'
    side, record = TRIGGERS[name].split()
    texts = json.loads((ROOT / 'texts' / ('C64' if lang == 'de' else 'C64_en') / f'{side}.json')
                       .read_text(encoding='utf-8'))
    return ' '.join(texts['records'][record]['text'].split())[:TRIGGER_CHARS]


def write_index(out, lang, known):
    """List the exported scenes of one language in story order, with titles.

    The opening credits and the cast of make_vorspann.py come first.
    """
    first = {'credits': {'de': 'Credits', 'en': 'Credits'},
             'cast': {'de': 'Besetzung', 'en': 'Cast'}}
    index = [{'id': name, 'title': titles.get(lang, name), 'timeline': f'{name}.json',
              **({'trigger': trigger(name, lang)} if name in TRIGGERS else {}),
              **({'music': True} if name in OWN_MUSIC else {})}
             for name, titles in [*first.items(), *((n, t) for n, (_, t) in known.items())]
             if (out / f'{name}.json').exists()]
    (out / 'index.json').write_text(json.dumps(index, ensure_ascii=False, indent=1) + '\n',
                                    encoding='utf-8')


if __name__ == '__main__':
    main()
