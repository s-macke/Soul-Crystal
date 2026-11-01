// One player keeps adjacent rooms with the same theme seamless.
export class MusicPlayer {
  private current: string | null = null;
  private enabled = true;
  private visible = true;
  private suspended = false;
  constructor(private audio: HTMLAudioElement, private base: string) {
    audio.loop = true;
    audio.volume = 0.35;
    audio.preload = 'none';
  }
  select(file: string | null) {
    if (file !== this.current) {
      this.audio.pause();
      this.current = file;
      if (file) this.audio.src = `${this.base}${file}`;
      else { this.audio.removeAttribute('src'); this.audio.load(); }
    }
    this.sync();
  }
  setEnabled(enabled: boolean) { this.enabled = enabled; this.sync(); }
  setVisible(visible: boolean) { this.visible = visible; this.sync(); }
  // A cutscene with its own music pauses the game music meanwhile.
  setSuspended(suspended: boolean) { this.suspended = suspended; this.sync(); }
  private sync() {
    if (!this.enabled || !this.visible || this.suspended || !this.current) { this.audio.pause(); return; }
    if (this.audio.paused) {
      // Autoplay policies or unavailable audio must never interrupt the game.
      void this.audio.play().catch(() => {});
    }
  }
}
