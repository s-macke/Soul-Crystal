import './style.css';
import { MusicPlayer } from './music';
import { gameMusic } from './music-map';
import { loadEngine, type Engine, type GameEvent, type GameView } from './engine';
import { imagePath, victoryPath } from './images';
import { loadControls } from './controls';
import { createSaveUI } from './save-ui';
import type { SaveState, SaveRecord } from './saves';
let controls: Awaited<ReturnType<typeof loadControls>> | undefined;
const get = <T extends HTMLElement>(id: string) => document.getElementById(id) as T;
const languageButtons = [get<HTMLButtonElement>('start-de'), get<HTMLButtonElement>('start-en')];
const transcript = get('transcript');
const scene = get<HTMLImageElement>('scene');
let engine: Engine;
let english = false;
let starting = false;
let beforeFirstImage = false;
let acceptsCommands = false;
let currentView: GameView | undefined;
const music = new MusicPlayer(new Audio(), `${import.meta.env.BASE_URL}music/`);
let musicEnabled = true;
try { musicEnabled = localStorage.getItem('soul-crystal-music') !== 'off'; } catch {}
music.setEnabled(musicEnabled);
function updateMusic() {
  music.select(currentView ? (get<HTMLDetailsElement>('intro').open && currentView.mode < 4 ? 'Cast.mp3' : gameMusic(currentView.room, currentView.mode)) : null);
}
function toggleMusic() {
  musicEnabled = !musicEnabled;
  music.setEnabled(musicEnabled);
  try { localStorage.setItem('soul-crystal-music', musicEnabled ? 'on' : 'off'); } catch {}
  updateMusic();
}
get('intro').addEventListener('toggle', updateMusic);
document.addEventListener('visibilitychange', () => music.setVisible(!document.hidden));
function capture(): SaveState | null {
  if (!engine || !currentView || currentView.mode !== 0) return null;
  const snapshot = engine.ccall('web_save', 'string', [], []);
  if (!snapshot) return null;
  const {language, part, room, roomName, score, steps} = currentView;
  return {snapshot, language, part, room, roomName, score, steps};
}
const saves = createSaveUI({capture, load: loadSave, english: ()=>english});
function loadSave(record: SaveRecord): boolean {
  if (!document.body.classList.contains('playing')) startGame(record.language === 1);
  const previous = Array.from(transcript.children);
  const previousEnglish = english;
  english = record.language === 1;
  transcript.replaceChildren();
  const ok = engine.ccall('web_load', 'number', ['string'], [record.snapshot]);
  if (!ok) { english = previousEnglish; transcript.replaceChildren(...previous); return false; }
  get('intro-text').replaceChildren();
  paragraph(get('intro-text'), engine.ccall('web_intro', 'string', [], []));
  toggleJournal(false);transcript.scrollTop = 0;
  return true;
}
function fail(error: unknown) {
  get('error').hidden = false;
  get('error').textContent = `${english ? 'Could not continue' : 'Das Spiel konnte nicht fortgesetzt werden'}: ${String(error)}`;
  controls?.disable();
  music.select(null);
  languageButtons.forEach(button => button.disabled = true);
  acceptsCommands = false;
}
function paragraph(parent: HTMLElement, text: string, className = '') {
  const p = document.createElement('p');
  p.textContent = text;
  p.className = className;
  parent.append(p);
}
function event(event: GameEvent) {
  if (event.kind === 0) {
    paragraph(starting && beforeFirstImage ? get('intro-text') : transcript, event.text);
  } else if (event.kind === 1) {
    beforeFirstImage = false;
    const path = imagePath(event.part, event.image, event.room);
    if (path !== null) {
      scene.src = `${import.meta.env.BASE_URL}${path}`;
      scene.alt = english ? `Scene in room ${event.room}` : `Schauplatz in Raum ${event.room}`;
    }
  }
}
function view(view: GameView) {
  currentView = view;
  english = view.language === 1;
  updateMusic();
  document.documentElement.lang = english ? 'en' : 'de';
  get('intro').querySelector('summary')!.textContent = english ? 'The story & how to play' : 'Vorgeschichte & Spielanleitung';
  get('new-game').textContent = english ? 'Start a new adventure' : 'Ein neues Abenteuer beginnen';
  get('ended-load').hidden = view.mode < 4;
  get('ended-load').textContent = english ? 'Load game' : 'Spielstand laden';
  controls?.update(view, english);
  if (view.mode === 5) {
    scene.src = `${import.meta.env.BASE_URL}${victoryPath}`;
    scene.alt = english ? 'The adventure is won' : 'Das Abenteuer ist gewonnen';
  }
  get('scene-label').textContent = `${english ? 'Part' : 'Teil'} ${'ABCD'[view.part - 1]}`;
  get('stats').textContent = `${view.score.toLocaleString(english ? 'en' : 'de')} ${english ? 'points' : 'Punkte'} · ${view.steps} ${english ? 'moves' : 'Züge'}`;
  // Death still accepts yes/no or restart. Won/ended/error are terminal.
  const ended = view.mode >= 5;
  acceptsCommands = !ended;
  get('new-game').hidden = !ended;
}
function showLatestTextStart() {
  transcript.scrollTop = 0;
  // The journal also shows older turns: align the start of the current reply.
  if (document.body.classList.contains('journal-open')) {
    const first = transcript.querySelector<HTMLElement>('p:not(.previous):not(.command)');
    if (first) transcript.scrollTop = first.getBoundingClientRect().top - transcript.getBoundingClientRect().top;
  }
}
function submitCommand(command: string) {
  if (!command || !acceptsCommands) return;
  const before = capture();
  for (const p of Array.from(transcript.children)) p.classList.add('previous');
  paragraph(transcript, `> ${command}`, 'command');
  try { engine.ccall('web_submit', null, ['string'], [command]); }
  catch (error) { fail(error); }
  showLatestTextStart();
  if (currentView?.mode === 4 && before) saves.auto(before, 'death');
  else if (currentView?.mode === 0) {
    if (before && currentView.part !== before.part) saves.auto(capture(), 'part');
    else if (before && currentView.room !== before.room) saves.auto(capture(), 'room');
  }
}
function startGame(inEnglish: boolean) {
  if (document.body.classList.contains('playing')) return;
  english = inEnglish;
  // Fullscreen requires a user gesture; the viewport layout also works when unavailable.
  if (!document.fullscreenElement && document.documentElement.requestFullscreen) {
    void document.documentElement.requestFullscreen().catch(() => {});
  }
  document.documentElement.lang = english ? 'en' : 'de';
  document.body.classList.add('playing');
  get('welcome').hidden = true;
  get('game').hidden = false;
  get('journal-toggle').hidden = false;
  get('journal-toggle').setAttribute('aria-label', english ? 'Open journal' : 'Tagebuch öffnen');
  if (english) {
    get('intro').querySelector('summary')!.textContent = 'The story & how to play';
    get('new-game').textContent = 'Start a new adventure';
  }
  starting = beforeFirstImage = true;
  try { engine.ccall('web_start', null, ['number'], [english ? 1 : 0]); }
  catch (error) { fail(error); }
  finally { starting = false; }
  get('icon-controls').querySelector<HTMLButtonElement>('button')?.focus({preventScroll: true});
}
languageButtons.forEach((button, index) => button.addEventListener('click', () => startGame(index === 1)));
function toggleJournal(open = !document.body.classList.contains('journal-open')) {
  document.body.classList.toggle('journal-open', open);
  get('icon-controls').inert = open;
  get('journal-toggle').setAttribute('aria-expanded', String(open));
  get('journal-toggle').setAttribute('aria-label', english ? (open ? 'Close journal' : 'Open journal') : (open ? 'Tagebuch schließen' : 'Tagebuch öffnen'));
  showLatestTextStart();
}
get('journal-toggle').addEventListener('click', () => toggleJournal());
document.addEventListener('keydown', e => { if (e.key === 'Escape') toggleJournal(false); });
get('welcome-load').addEventListener('click', () => saves.open());
get('ended-load').addEventListener('click', () => saves.open());
get('new-game').addEventListener('click', () => location.reload());
scene.addEventListener('error', () => fail(new Error(english ? 'Picture could not be loaded.' : 'Bild konnte nicht geladen werden.')));
Promise.all([loadEngine(event, view), loadControls(get('icon-controls'), submitCommand, () => saves.open(), {enabled: () => musicEnabled, toggle: toggleMusic})]).then(([loaded, loadedControls]) => {
  engine = loaded;
  controls = loadedControls;
  languageButtons.forEach(button => button.disabled = false);
  get<HTMLButtonElement>('welcome-load').disabled = false;
  get('load-status').textContent = '';
}).catch(fail);
