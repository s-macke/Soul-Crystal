// The engine emits C64 selectors. Amiga GFX stores room images first,
// then death, then the same special-image sequence (no disk-change picture).
// All 133 source pairs were visually compared across the four parts.
const parts = [
  {name: 'A', offset: 0, rooms: 15, count: 18},
  {name: 'B', offset: 15, rooms: 35, count: 44},
  {name: 'C', offset: 50, rooms: 15, count: 20},
  {name: 'D', offset: 65, rooms: 38, count: 51},
];
export const victoryPath = 'images/hd/Victory-015.png';
export function imagePath(part: number, image: number, room: number): string | null {
  const info = parts[part - 1];
  if (!info) throw new Error(`Unknown game part ${part}`);
  // Preserve the scene during the original disk-change prompt; no disks on web.
  if (image === 255 || image === 254) return null;
  const index = image === 129 ? info.rooms
    : image > 129 ? info.rooms + image - 129 : room - info.offset - 1;
  const limit = image < 129 ? info.rooms : info.count;
  if (index < 0 || index >= limit) throw new Error(`Unknown image ${part}:${image} (room ${room})`);
  return `images/hd/Disk${info.name}-${String(index).padStart(3, '0')}.png`;
}
