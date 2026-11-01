// Original Amiga Main: DATA hunk +0x1d2b, indexed by room 1..103.
// See spec/Amiga/music.md. Zero is the port sentinel.
export const roomMusic = [
  0,
  1, 1, 1, 2, 1, 1, 20, 2, 1, 3, 3, 3, 3, 4, 4,
  5, 5, 10, 5, 10, 10, 5, 5, 10, 10, 7, 5, 5, 10, 7,
  5, 5, 6, 7, 7, 5, 5, 6, 6, 7, 20, 9, 9, 6, 9,
  8, 6, 6, 6, 8, 11, 11, 11, 11, 11, 20, 12, 12, 12, 12,
  13, 13, 12, 14, 14, 15, 15, 15, 16, 16, 16, 16, 16, 16, 16,
  15, 15, 15, 18, 18, 18, 18, 18, 17, 17, 18, 17, 18, 18, 18,
  18, 18, 18, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19,
] as const;
export function musicFile(track: number): string {
  const aliases: Record<number, string> = {6: "14", 15: "Cast", 17: "14", 18: "08", 19: "13"};
  return `${aliases[track] ?? String(track).padStart(2, "0")}.mp3`;
}
export function gameMusic(room: number, mode: number): string | null {
  if (mode === 4) return "20.mp3";
  if (mode === 5) return "16.mp3";
  if (mode >= 6) return null;
  const track = roomMusic[room];
  return track ? musicFile(track) : null;
}
