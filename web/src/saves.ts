export type SaveKind = 'manual' | 'start' | 'room' | 'part' | 'death';
export interface SaveState {snapshot: string; language: number; part: number; room: number; roomName: string; score: number; steps: number}
export interface SaveRecord extends SaveState {id: string; created: string; kind: SaveKind}
export const SAVE_KEY = 'soul-crystal.saves.v1';
export class SaveStore {
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
  add(state: SaveState, kind: SaveKind): SaveRecord {
    const saves = this.list();
    if (kind === 'manual' && saves.filter(s => s.kind === 'manual').length >= 20) throw new Error('Manual save limit');
    const record: SaveRecord = {...state, kind, id: crypto.randomUUID(), created: new Date().toISOString()};
    const manual = saves.filter(s => s.kind === 'manual');
    const auto = saves.filter(s => s.kind !== 'manual');
    (kind === 'manual' ? manual : auto).unshift(record);
    // One atomic storage write: quota errors leave previous slots untouched.
    this.write([...manual,...auto.slice(0,8)].sort((a,b)=>b.created.localeCompare(a.created)));
    return record;
  }
  remove(id: string) { this.write(this.list().filter(s=>s.id!==id)); }
  private write(saves: SaveRecord[]) { this.storage().setItem(SAVE_KEY, JSON.stringify({version:1,saves})); }
}
