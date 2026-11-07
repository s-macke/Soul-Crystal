# Soul Crystal

## [▶ Play Soul Crystal in your browser](https://s-macke.github.io/Soul-Crystal/)

**German & English · No installation required**

[![Soul Crystal browser adaptation: five scenes with reimagined graphics, English adventure text, and icon controls](images/readme/soul-crystal.gif)](https://s-macke.github.io/Soul-Crystal/)

[*Soul Crystal*](https://www.c64-wiki.de/wiki/Soul_Crystal) is a German-language
text-and-graphics adventure that I played in the 1990s.
At the time, I was still learning English at school, and my English was not yet
good enough to comfortably play adventures in that language. Being able to play
in German made a real difference. I remember *Soul Crystal* as one of the best
German-language text-and-graphics adventures I had the chance to play back then, and it
stayed with me long after those first playthroughs.

Many years later, the C64 version also became accessible to English-speaking
players: [Onslaught released an English fan translation in 2023](https://www.lemon64.com/game/soul-crystal).
That translation forms the basis of the English text included in this project.

I started reverse-engineering *Soul Crystal* in 2006, twenty years ago, out of
curiosity. I began with the C64 version and worked my way into its code: first
to extract the texts, then the images, and eventually the gameplay logic.

One question kept me going: how do you activate the C64 cheat mode? I had found
the cheat-related texts in the game data, but could never find a way to enable
it. The answer, as it turns out, is that the cheat mode does not exist in the
C64 version. The texts are there; the functionality is not.

The DOS and Amiga versions added another mystery. Knowledge of how to activate
their cheats seemed to have been lost along the way. Revisiting the original
code brought some of those answers back to light; the recovered DOS mechanism
is documented in the [cheat mode notes](spec/DOS/cheat_mode.md).

For twenty years, I returned to the project now and then, taking another step
whenever time and curiosity brought me back. With AI helping, the remaining
work finally came together in two weeks—and went much further than I had
originally imagined: a playable browser adaptation with reimagined graphics
and a new interface, and even voiced interludes between parts of the adventure.

What began as a personal investigation has become a way to experience the game
again. This repository brings that adaptation together with a standalone
console version, extracted assets, and documentation of the original game.

## Build and run

Run the following commands from the repository root.

### Browser version

Requirements: Docker with BuildKit, Node.js 22.12 or later, npm, and Python 3
with Pillow and WebP support.

Build the WebAssembly engine, install the web dependencies, and start the local
server:

```sh
./build_wasm_docker.sh
npm ci --prefix web
npm run dev --prefix web
```

Open the address printed by Vite, usually <http://127.0.0.1:5173/>.

To create the static site for deployment:

```sh
npm run build --prefix web
```

The complete site is written to `build/web/`. To preview that production build
locally:

```sh
npm run preview --prefix web
```

### Console version

Requirements: Bash and Clang with C11 and C++17 support. You can select other
compatible compilers through the `CC` and `CXX` environment variables.

```sh
./build_console.sh
./build/soul-crystal --language en
```

Use `--language de` to play in German. The executable includes the game texts
and needs no additional runtime assets.
