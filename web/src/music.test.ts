import {test} from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync, existsSync} from 'node:fs';
import {roomMusic, gameMusic, musicFile} from './music-map';
import {MusicPlayer} from './music';

test('all 103 rooms reproduce the original Amiga DATA and have MP3s', () => {
  const main = readFileSync(new URL('../../data/Amiga/extracted/Disk 3/Code/Main', import.meta.url));
  const original = main.subarray(0x19dc4 + 0x1d2b, 0x19dc4 + 0x1e36).toString('ascii').split('\0').slice(0, -1).map(Number);
  assert.deepEqual(roomMusic.slice(1), original);
  assert.equal(original.length, 103);
  for (const track of original) assert.ok(existsSync(new URL(`../../music/Amiga/${musicFile(track)}`, import.meta.url)));
  for (const name of ['Cast', 'Credits', 'Hell', '16', '20']) assert.ok(existsSync(new URL(`../../music/Amiga/${name}.mp3`, import.meta.url)));
});
test('death, revival, victory and stopped game', () => {
  assert.equal(gameMusic(3, 0), '01.mp3');
  assert.equal(gameMusic(3, 4), '20.mp3');
  assert.equal(gameMusic(3, 0), '01.mp3');
  assert.equal(gameMusic(103, 5), '16.mp3');
  assert.equal(gameMusic(103, 6), null);
  assert.equal(musicFile(6), musicFile(17));
});
test('same theme preserves playback, mute and hidden tabs pause, changes resume', async () => {
  const audio = {src: '', paused: true, loop: false, volume: 1, preload: '', plays: 0, pauses: 0,
    play() { this.paused = false; this.plays++; return Promise.resolve(); },
    pause() { this.paused = true; this.pauses++; }, removeAttribute() { this.src = ''; }, load() {}};
  const music = new MusicPlayer(audio as unknown as HTMLAudioElement, '/music/');
  music.select('01.mp3');
  const pauses = audio.pauses;
  music.select('01.mp3');
  assert.equal(audio.plays, 1); assert.equal(audio.pauses, pauses);
  music.setEnabled(false); assert.equal(audio.paused, true);
  music.select('02.mp3'); assert.equal(audio.paused, true);
  music.setEnabled(true); assert.equal(audio.src, '/music/02.mp3'); assert.equal(audio.paused, false);
  music.setVisible(false); assert.equal(audio.paused, true);
  music.setVisible(true); assert.equal(audio.paused, false);
  music.select(null); assert.equal(audio.paused, true); assert.equal(audio.src, '');
  audio.play = () => Promise.reject(new Error('autoplay denied'));
  music.select('01.mp3');
  await new Promise(resolve => setTimeout(resolve, 0));
});
