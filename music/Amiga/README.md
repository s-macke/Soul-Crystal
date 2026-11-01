# Amiga – Originalmusik

18 Musikstücke der Amiga-Fassung als MP3 (Stereo, 192 kbit/s). Komponisten laut
[ExoticA](https://www.exotica.org.uk/wiki/Soul_Crystal): Chris Link und Oliver Kläwer
(Avantgardistic Arts).

Die Dateien unter `data/Amiga/extracted/Disk */Data/Music/` sind in 12000-Byte-Blöcken
mit dem PowerPacker-Verfahren der Bilder gepackt (siehe
[Bildformat](../../spec/Amiga/image_format.md#compression)). Blöcke mit gleicher
gepackter und entpackter Größe sind ungepackt gespeichert. Entpackt ergibt jede
Datei ein OctaMED-Modul (`MMD0`), das ffmpeg über libopenmpt abspielt:

```sh
ffmpeg -i Cast.med -ac 2 -b:a 192k Cast.mp3
```

| Datei | Quelle | Dauer |
|---|---|---|
| `Cast.mp3` | Disk 1 `Cast.mus`, Disk 4 `15` | 3:18 |
| `Credits.mp3` | Disk 1 `Credits.MUS` | 0:49 |
| `Hell.mp3` | Disk 4 `Hell.MUS` | 0:55 |
| `01.mp3` | Disk 2 `1` | 2:49 |
| `02.mp3` | Disk 2 `2` | 1:25 |
| `03.mp3` | Disk 2 `3` | 3:04 |
| `04.mp3` | Disk 2 `4` | 2:05 |
| `05.mp3` | Disk 3 `5` | 2:08 |
| `07.mp3` | Disk 3 `7` | 1:19 |
| `08.mp3` | Disk 3 `8`, Disk 4 `18` | 2:25 |
| `09.mp3` | Disk 3 `9` | 1:30 |
| `10.mp3` | Disk 3 `10` | 1:04 |
| `11.mp3` | Disk 2 `11` | 0:59 |
| `12.mp3` | Disk 2 `12` | 1:26 |
| `13.mp3` | Disk 2 `13`, Disk 4 `19` | 1:40 |
| `14.mp3` | Disk 2 `14`, Disk 3 `6`, Disk 4 `17` | 0:16 |
| `16.mp3` | Disk 4 `16` | 1:36 |
| `20.mp3` | Disk 2, 3 und 4 `20` | 0:33 |

Gleichnamige oder in der Tabelle zusammengefasste Quellen sind byteidentisch.
`Code/Intro` lädt `Cast.MUS` und `Credits.MUS`; in der DOS-Fassung läuft unter der
Vorgeschichte dieselbe Melodie wie in `Cast.mp3`. `Install.SMP` und `Crystal.SMP`
sind Samples und keine Module. Die Dauer ist die von libopenmpt erkannte Länge
eines Durchlaufs.
