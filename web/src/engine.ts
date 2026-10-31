export interface GameEvent {kind: number; text: string; part: number; image: number; room: number}
export interface GameObject {id: number; name: string; carried: boolean}
export interface GameView {mode: number; part: number; room: number; score: number; steps: number; roomName: string; language: number; objects: GameObject[]}
export interface Engine {
  ccall(name: string, returnType: 'string', argTypes: string[], args: (string | number)[]): string;
  ccall(name: string, returnType: 'number', argTypes: string[], args: (string | number)[]): number;
  ccall(name: string, returnType: null, argTypes: string[], args: (string | number)[]): void;
}
export async function loadEngine(onGameEvent: (event: GameEvent) => void, onGameView: (view: GameView) => void): Promise<Engine> {
  const url = new URL(`${import.meta.env.BASE_URL}soul-crystal.mjs`, document.baseURI).href;
  const {default: createEngine} = await import(/* @vite-ignore */ url);
  return createEngine({onGameEvent, onGameView});
}
