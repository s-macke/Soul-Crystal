// Narrated cutscenes from src/Python/cutscenes (see its README for the
// timeline format), shown as an overlay over the game. Scenes marked `music`
// (opening and the very end) pause the game music and play their own; all
// others run over the music that is already playing. The time bar seeks
// picture, voice and subtitles, never the music; Escape or "Überspringen" ends
// a scene.
export interface CutsceneEntry {id: string; title: string; timeline: string; trigger?: string; music?: boolean}
type Rect = number[];
interface Shot {
  start: number; end: number; path?: string; from?: Rect; to?: Rect;
  fadeIn?: number; fadeOut?: number; pixelated?: boolean;
  frames?: {paths: string[]; step: number; delay: number};
  wipe?: {path: string; start: number; end: number};
  text?: {lines: string[]; x: number; y: number; size: number; lineHeight: number; color: string; font: string};
}
interface Track {path: string; start?: number; end?: number; volume: number; fadeIn: number; fadeOut: number;
  duck?: number; attack?: number; release?: number}
interface Timeline {
  duration: number; hold?: boolean; loop?: {start: number; end: number}; voice: string | null; size: [number, number];
  fade: number; blackIn: number; blackOut: number; wipeFeather: number;
  shots: Shot[]; images: string[]; cues: {start: number; end: number; text: string}[];
  music: Track | Track[]; speech: [number, number][];
}
interface Options {music: string; enabled(): boolean; ownMusic(on: boolean): void}
// Music passed from one scene to the next (cast → story): a following scene
// with its own music takes over a playing track of the same file, which runs
// on without fading out, restarting or fading in.
interface Handover {base: string; carried: Map<string, HTMLAudioElement>; next(): boolean}
const fileName = (path: string) => path.split('/').pop()!;
function stop(track: HTMLAudioElement) { track.pause(); track.removeAttribute('src'); track.load(); }

const clamp = (v: number, a: number, b: number) => Math.min(Math.max(v, a), b);
const fmt = (t: number) => `${Math.floor(t / 60)}:${String(Math.floor(t % 60)).padStart(2, '0')}`;
const collapse = (text: string) => text.split(/\s+/).filter(Boolean).join(' ');

export class Cutscenes {
  private index = new Map<string, CutsceneEntry[]>();
  private played = new Set<string>();
  private queue: {lang: string; entry: CutsceneEntry}[] = [];
  private playing = false;
  private carried = new Map<string, HTMLAudioElement>();
  constructor(private base: string, private options: Options) {}

  private async entries(lang: string) {
    if (!this.index.has(lang)) {
      try {
        const response = await fetch(`${this.base}${lang}/index.json`);
        this.index.set(lang, response.ok ? await response.json() : []);
      } catch { this.index.set(lang, []); }
    }
    return this.index.get(lang)!;
  }
  // Starts loading the scene list early, so that a text can be matched at once.
  prepare(lang: string) { void this.entries(lang); }
  // Credits, cast and story after the language choice.
  async start(lang: string) {
    for (const entry of await this.entries(lang)) if (entry.trigger === 'start') this.enqueue(lang, entry);
  }
  // A game text that begins like a scene's text plays that scene, once per game.
  text(lang: string, text: string) {
    const entries = this.index.get(lang);
    if (!entries) return;
    const shown = collapse(text);
    for (const entry of entries)
      if (entry.trigger && entry.trigger !== 'start' && shown.startsWith(entry.trigger)) this.enqueue(lang, entry);
  }
  // A loaded save continues somewhere else: every scene may play again.
  reset() { this.played.clear(); this.queue.length = 0; }

  private enqueue(lang: string, entry: CutsceneEntry) {
    if (this.played.has(entry.id)) return;
    this.played.add(entry.id);
    this.queue.push({lang, entry});
    if (!this.playing) void this.run();
  }
  private async run() {
    this.playing = true;
    while (this.queue.length) {
      const {lang, entry} = this.queue.shift()!;
      if (entry.music) this.options.ownMusic(true);
      const handover = entry.music && this.options.enabled() ? {base: this.options.music, carried: this.carried,
        next: () => !!this.queue[0]?.entry.music && this.options.enabled()} : null;
      try { await play(`${this.base}${lang}/`, entry, lang === 'en', handover); }
      catch (error) { console.error(`Cutscene ${entry.id}`, error); }
      finally {
        if (!(this.queue[0]?.entry.music && this.options.enabled())) { this.carried.forEach(stop); this.carried.clear(); }
        if (entry.music) this.options.ownMusic(false);
      }
    }
    this.playing = false;
  }
}

function element<K extends keyof HTMLElementTagNameMap>(tag: K, className: string, parent: HTMLElement, text = '') {
  const node = document.createElement(tag);
  node.className = className;
  node.textContent = text;
  parent.append(node);
  return node;
}

async function play(base: string, entry: CutsceneEntry, english: boolean, handover: Handover | null): Promise<void> {
  const overlay = element('div', 'cutscene', document.body);
  overlay.setAttribute('role', 'dialog');
  overlay.setAttribute('aria-label', entry.title);
  const stage = element('div', 'cutscene-stage', overlay);
  const canvas = element('canvas', '', stage), ctx = canvas.getContext('2d')!;
  const cueBox = element('div', 'cutscene-cue', stage);
  const skip = element('button', 'cutscene-skip', stage, english ? 'Skip ✕' : 'Überspringen ✕');
  const bar = element('div', 'cutscene-bar idle', stage);
  const pauseButton = element('button', '', bar, '❚❚');
  const seekBar = element('input', '', bar);
  const timeLabel = element('span', '', bar);
  seekBar.type = 'range'; seekBar.min = '0'; seekBar.step = '0.01';
  pauseButton.type = skip.type = 'button';
  pauseButton.setAttribute('aria-label', english ? 'Pause' : 'Pause');
  seekBar.setAttribute('aria-label', english ? 'Position' : 'Position');

  let done!: () => void;
  const finished = new Promise<void>(resolve => done = resolve);
  let closed = false, audio: HTMLAudioElement | null = null, voiceUrl = '';
  let music: HTMLAudioElement[] = [], tracks: Track[] = [];
  const listeners: [string, EventListener][] = [];
  const listen = (type: string, handler: EventListener) => {
    window.addEventListener(type, handler, true);
    listeners.push([type, handler]);
  };
  function close() {
    if (closed) return;
    closed = true;
    audio?.pause();
    const passOn = handover?.next() ?? false;
    music.forEach((track, i) => {
      if (passOn && !track.paused) handover!.carried.set(fileName(tracks[i].path), track);
      else stop(track);
    });
    if (voiceUrl) URL.revokeObjectURL(voiceUrl);
    listeners.forEach(([type, handler]) => window.removeEventListener(type, handler, true));
    overlay.remove();
    done();
  }
  skip.onclick = close;
  // The game must not see keys while a scene runs; Escape ends the scene.
  let keys = (e: KeyboardEvent) => { e.stopImmediatePropagation(); if (e.key === 'Escape') { e.preventDefault(); close(); } };
  listen('keydown', e => keys(e as KeyboardEvent));

  const tl: Timeline = await (await fetch(`${base}${entry.timeline}`)).json();
  // One music object plays from 0 to the end; a list holds tracks with their
  // own start and end. The game serves the tracks under music/ by file name.
  tracks = handover ? (Array.isArray(tl.music) ? tl.music : [{...tl.music, start: 0}]) : [];
  const taken = new Map<number, number>();  // track index → volume when taken over
  music = tracks.map((track, i) => {
    const playing = handover!.carried.get(fileName(track.path));
    if (playing) {
      handover!.carried.delete(fileName(track.path));
      taken.set(i, playing.volume);
      return playing;
    }
    const sound = new Audio(`${handover!.base}${fileName(track.path)}`);
    sound.loop = true; sound.preload = 'auto'; sound.volume = 0;
    return sound;
  });
  handover?.carried.forEach(stop);
  handover?.carried.clear();
  [canvas.width, canvas.height] = tl.size;
  const [W, H] = tl.size, feather = H * tl.wipeFeather;
  // Everything is loaded and decoded before playback: decoding a large PNG on
  // its first draw would stutter. The voice is loaded whole, so it can be
  // seeked without HTTP range requests. Meanwhile the screen stays black.
  const pictures = Promise.all(tl.images.map(async path => {
    const image = new Image();
    image.src = `${base}../images/${path.split('/').map(encodeURIComponent).join('/')}.png`;
    await image.decode();
    return [path, image] as const;
  }));
  const voice = tl.voice ? fetch(`${base}${tl.voice}`).then(r => r.blob()).then(blob => {
    voiceUrl = URL.createObjectURL(blob);
    const sound = new Audio();
    sound.preload = 'auto';
    const ready = new Promise<HTMLAudioElement>((ok, fail) => {
      sound.addEventListener('canplaythrough', () => ok(sound), {once: true});
      sound.addEventListener('error', () => fail(new Error('voice')), {once: true});
    });
    sound.src = voiceUrl;
    return ready;
  }) : Promise.resolve(null);
  const fonts = [...new Set(tl.shots.filter(s => s.text).map(s => s.text!.font))]
    .map(font => document.fonts.load(`48px "${font}"`).catch(() => []));
  const [list, sound] = await Promise.all([pictures, voice, ...fonts]);
  if (closed) return finished;
  const pics = Object.fromEntries(list) as Record<string, HTMLImageElement>;
  audio = sound;

  // Rectangles may have another aspect than the canvas (non-square pixels).
  function draw(pic: HTMLImageElement, rect: Rect, target: CanvasRenderingContext2D | OffscreenCanvasRenderingContext2D = ctx) {
    const [x, y, w, h] = rect, kx = W / w, ky = H / h;
    target.drawImage(pic, -x * kx, -y * ky, pic.width * kx, pic.height * ky);
  }
  // Without a voice the clock is real time, stopped while paused. A held scene
  // (the gate) stays on its last picture until a key or click, then fades out;
  // a looping one (the cast) jumps back from its loop end until then, while its
  // music runs on.
  let t0 = performance.now(), paused = false, pausedAt: number | null = null, outro: number | null = null;
  const clock = () => {
    if (audio) return audio.currentTime;
    let t = ((pausedAt ?? performance.now()) - t0) / 1000;
    if (tl.loop && t >= tl.loop.end) {
      t0 += (tl.loop.end - tl.loop.start) * 1000;
      t -= tl.loop.end - tl.loop.start;
    }
    return t;
  };
  const fadeOut = (t: number) => outro !== null ? 1 - (performance.now() - outro) / 1000 / tl.blackOut
    : tl.hold || tl.loop ? 1 : (tl.duration - t) / tl.blackOut;
  // The music only follows the clock in its level: fades, and ducking while
  // the voice speaks. It is never seeked.
  let duck = 1, lastT = 0;
  function mix(t: number) {
    if (!tracks.length) return;
    const speaking = tl.speech.some(([a, b]) => a <= t && t < b), first = tracks[0];
    if (tl.speech.length && first.duck !== undefined) {
      const target = speaking ? first.duck : 1, tau = speaking ? first.attack! : first.release!;
      duck += (target - duck) * (1 - Math.exp(-Math.max(t - lastT, 0) / tau));
    }
    lastT = t;
    tracks.forEach((m, i) => {
      const start = m.start ?? 0, end = m.end ?? tl.duration;
      const on = !paused && t >= start && (t < end || m.end === undefined);
      if (on && music[i].paused) void music[i].play().catch(() => {});
      if (!on && !music[i].paused) music[i].pause();
      // Released towards a scene that takes the music over: no fade-out.
      const out = outro !== null ? (handover!.next() ? 1 : 1 - (performance.now() - outro) / 1000 / tl.blackOut)
        : tl.hold || tl.loop ? 1 : (tl.duration - t) / m.fadeOut;
      const from = taken.get(i);
      const fade = Math.min(from === undefined ? (t - start) / m.fadeIn : 1,
                            m.end === undefined ? out : Math.min((end - t) / m.fadeOut, out));
      let volume = m.volume * clamp(fade, 0, 1) * duck;
      // A taken-over track glides from its previous level to this scene's.
      if (from !== undefined) volume = from + (volume - from) * clamp(t / m.fadeIn, 0, 1);
      music[i].volume = clamp(volume, 0, 1);
    });
  }
  function frame() {
    if (closed) return;
    const t = Math.min(clock(), tl.duration);
    mix(t);
    if (!dragging) seekBar.value = String(t);
    timeLabel.textContent = `${fmt(t)} / ${fmt(tl.duration)}`;
    ctx.globalAlpha = 1; ctx.fillStyle = '#000'; ctx.fillRect(0, 0, W, H);
    tl.shots.forEach((s, i) => {
      // Shots with their own fades appear from and vanish to what lies below;
      // the others crossfade with the previous shot.
      const own = s.fadeIn !== undefined;
      const a = own ? s.start : s.start - tl.fade / 2, b = own ? s.end : s.end + tl.fade / 2;
      if (t < a || t >= b) return;
      ctx.globalAlpha = own ? clamp(Math.min((t - a) / s.fadeIn!, (b - t) / s.fadeOut!), 0, 1)
        : i ? clamp((t - a) / tl.fade, 0, 1) : 1;
      if (s.text) {
        const {lines, x, y, size, lineHeight, color, font} = s.text;
        ctx.font = `${size}px "${font}"`; ctx.textAlign = 'center'; ctx.textBaseline = 'middle';
        ctx.fillStyle = color; ctx.shadowColor = '#000'; ctx.shadowBlur = size / 6;
        lines.forEach((line, k) => ctx.fillText(line, x, y + (k - (lines.length - 1) / 2) * lineHeight));
        ctx.shadowBlur = 0;
        return;
      }
      const p = clamp((t - s.start) / (s.end - s.start), 0, 1);
      const rect = s.from!.map((v, j) => v + (s.to![j] - v) * p);
      ctx.imageSmoothingEnabled = !s.pixelated;
      // A frame sequence shows one picture every `step` seconds, then holds the last.
      const path = s.frames ? s.frames.paths[clamp(Math.floor((t - s.start - s.frames.delay) / s.frames.step),
                                                   0, s.frames.paths.length - 1)] : s.path!;
      draw(pics[path], rect);
      if (s.wipe && t > s.wipe.start) {
        let q = clamp((t - s.wipe.start) / (s.wipe.end - s.wipe.start), 0, 1);
        q = q * q * (3 - 2 * q);
        const edge = (H + feather) * q - feather;
        const mask = new OffscreenCanvas(W, H), m = mask.getContext('2d')!;
        const grad = m.createLinearGradient(0, edge, 0, edge + feather);
        grad.addColorStop(0, '#000'); grad.addColorStop(1, 'rgba(0,0,0,0)');
        m.fillStyle = '#000'; m.fillRect(0, 0, W, Math.max(edge, 0));
        m.fillStyle = grad; m.fillRect(0, edge, W, feather);
        m.globalCompositeOperation = 'source-in';
        draw(pics[s.wipe.path], rect, m);
        ctx.drawImage(mask, 0, 0);
      }
    });
    const black = clamp(Math.min(t / tl.blackIn, fadeOut(t)), 0, 1);
    ctx.globalAlpha = 1 - black; ctx.fillStyle = '#000'; ctx.fillRect(0, 0, W, H);
    ctx.globalAlpha = 1;
    const cue = tl.cues.find(c => c.start <= t && t < c.end);
    cueBox.textContent = cue ? cue.text : '';
    if (outro !== null ? fadeOut(t) <= 0 : !tl.hold && !tl.loop && t >= tl.duration) setTimeout(close, 300);
    else requestAnimationFrame(frame);
  }

  // Time bar: shown on mouse movement; Space pauses, the arrows move 5 s.
  let dragging = false, idleTimer = 0;
  seekBar.max = String(tl.duration);
  function setPaused(on: boolean) {
    if (on === paused || outro !== null) return;
    paused = on;
    pauseButton.textContent = on ? '▶' : '❚❚';
    if (on) music.forEach(track => track.pause());  // mix() resumes them
    if (audio) { if (on) audio.pause(); else if (audio.currentTime < tl.duration) void audio.play(); }
    else if (on) pausedAt = performance.now();
    else { t0 += performance.now() - pausedAt!; pausedAt = null; }
  }
  function seek(t: number) {
    if (outro !== null) return;
    t = clamp(t, 0, tl.duration - 0.01);
    if (audio) { audio.currentTime = t; if (!paused && audio.paused) void audio.play(); }
    else t0 = (pausedAt ?? performance.now()) - t * 1000;
  }
  const wake = () => {
    bar.classList.remove('idle');
    clearTimeout(idleTimer);
    idleTimer = window.setTimeout(() => bar.classList.add('idle'), 2500);
  };
  seekBar.addEventListener('pointerdown', () => dragging = true);
  seekBar.addEventListener('pointerup', () => { dragging = false; seekBar.blur(); });
  seekBar.addEventListener('input', () => seek(+seekBar.value));
  pauseButton.onclick = () => { setPaused(!paused); pauseButton.blur(); };
  overlay.addEventListener('pointermove', wake);
  const release = () => {
    const t = clock();
    if (outro === null && (tl.hold ? t >= tl.duration - 0.05 : tl.loop && t >= tl.loop.start)) outro = performance.now();
  };
  keys = e => {
    e.stopImmediatePropagation();
    if (e.key === 'Escape') { e.preventDefault(); close(); }
    else if (e.key === ' ') { e.preventDefault(); setPaused(!paused); wake(); }
    else if (e.key === 'ArrowLeft' || e.key === 'ArrowRight') {
      e.preventDefault(); seek(clock() + (e.key === 'ArrowLeft' ? -5 : 5)); wake();
    } else release();
  };
  overlay.addEventListener('pointerdown', e => { if (!(e.target as HTMLElement).closest('.cutscene-bar, .cutscene-skip')) release(); });

  if (audio) {
    try { await audio.play(); }
    catch (error) {
      // Without a click on the page the browser blocks sound: ask for one.
      if ((error as Error).name !== 'NotAllowedError') throw error;
      const start = element('button', 'cutscene-start', stage, '▶ Start');
      start.type = 'button';
      await new Promise<void>(resolve => start.onclick = () => { start.remove(); resolve(); });
      await audio.play();
    }
  }
  t0 = performance.now();
  wake();
  requestAnimationFrame(frame);
  return finished;
}
