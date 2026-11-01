export type SaveKind = 'manual' | 'start' | 'room' | 'part' | 'death';
export interface SaveState {snapshot: string; language: number; part: number; room: number; roomName: string; score: number; steps: number}
export interface SaveRecord extends SaveState {id: string; created: string; kind: SaveKind}
export const SAVE_KEY = 'soul-crystal.saves.v1';
// SC1 byte layout: src/console/game.cpp snapshotBytes(), spec/C64/savegame_format.md.
// Keep all puzzle data; ignore only travel/presentation fields and the checksum.
export function progressKey(snapshot: string): string {
  if (!/^SC1:[0-9a-f]{3454}$/.test(snapshot)) throw new Error('Invalid snapshot');
  const bytes = snapshot.slice(4, 4 + 1723 * 2).match(/../g)!;
  let offset = 0;
  for (let object = 1; object <= 165; object++) {
    if (object <= 103) { bytes[offset + 6] = '00'; offset += 7; } // visited
    if (object === 163) bytes[offset + 4] = '00'; // Dave's location
    offset += 6; // description, remaining points, location, state
  }
  for (const index of [1711,1712,1713,1714,1719,1720,1721,1722]) bytes[index] = '00';
  return bytes.join('');
}
export class SaveStore {
  private baseline: string | undefined;
  // Starting/loading establishes a checkpoint without creating a save slot.
  checkpoint(state: SaveState) { this.baseline = progressKey(state.snapshot); }

  constructor(private storage: () => Pick<Storage, 'getItem' | 'setItem'>) {}
  list(): SaveRecord[] {
    const raw = this.storage().getItem(SAVE_KEY);
    if (raw === null) return [];
    const data = JSON.parse(raw);
    if (data.version !== 1 || !Array.isArray(data.saves) || data.saves.length > 28) throw new Error('Invalid save catalog');
    for (const s of data.saves) {
      if (!s || typeof s.id !== 'string' || typeof s.snapshot !== 'string' || !/^SC1:[0-9a-f]{3454}$/.test(s.snapshot) ||
          ![0,1].includes(s.language) || !Number.isInteger(s.part) || s.part < 1 || s.part > 4 ||
          !Number.isInteger(s.room) || s.room < 1 || s.room > 103 || typeof s.roomName !== 'string' || s.roomName.length > 500 ||
          !Number.isInteger(s.score) || !Number.isInteger(s.steps) || !Number.isFinite(Date.parse(s.created)) ||
          !['manual','start','room','part','death'].includes(s.kind)) throw new Error('Invalid save record');
    }
    return data.saves;
  }
  add(state: SaveState, kind: 'manual'): SaveRecord;
  add(state: SaveState, kind: SaveKind): SaveRecord | null;
  add(state: SaveState, kind: SaveKind): SaveRecord | null {
    const saves = this.list();
    // Compare the complete serialized state across manual and automatic slots.
    // A replayed attempt must not consume slots or refresh an existing timestamp.
    const progress = progressKey(state.snapshot);
    if (kind !== 'manual' && saves.some(s => s.snapshot === state.snapshot)) {
      this.baseline = progress;
      return null;
    }
    if (kind === 'room' && progress === this.baseline) return null;
    if (kind === 'manual' && saves.filter(s => s.kind === 'manual').length >= 20) throw new Error('Manual save limit');
    const record: SaveRecord = {...state, kind, id: crypto.randomUUID(), created: new Date().toISOString()};
    const manual = saves.filter(s => s.kind === 'manual');
    const auto = saves.filter(s => s.kind !== 'manual');
    (kind === 'manual' ? manual : auto).unshift(record);
    // One atomic storage write: quota errors leave previous slots untouched.
    this.write([...manual,...auto.slice(0,8)].sort((a,b)=>b.created.localeCompare(a.created)));
    this.baseline = progress;
    return record;
  }
  remove(id: string) { this.write(this.list().filter(s=>s.id!==id)); }
  private write(saves: SaveRecord[]) { this.storage().setItem(SAVE_KEY, JSON.stringify({version:1,saves})); }
}
