# Gemeinsame Replay-Befehle

Diese `.inc`-Dateien werden durch `@include` eingebunden und nicht separat
ausgeführt. Sie ändern keinen Zustand direkt und laden keinen Spielstand.
Ein Include setzt das gerade laufende Spiel fort; es startet kein neues Spiel.

Die Dateien `a_im_see.inc` bis `d_finale.inc` bilden gemeinsame Anläufe ab
(einschließlich Zwischenstopps bei Firon, am Labor und am Höhlenzugang):
Jede enthält entweder alle nötigen Befehle ab Spielstart oder bindet zuerst
einen kürzeren Anlauf ein. Ihre ersten Kommentare nennen den erreichten Teil
und Raum. Die verschiedenen Wege bewahren die zuvor geprüften, unterschiedlich
verkürzten Anläufe der Todesfälle; sie sind nicht beliebig austauschbar.

`d_sieg.inc` ist dagegen ein gemeinsamer **Abschluss**: Es beginnt mit der
Zerstörung von Kessel und Kristall und spielt danach den restlichen Gewinnweg.
Die jeweils erwartete Punktzahl wird weiterhin im aufrufenden Replay geprüft.

`controls.inc` prüft die allgemeinen Bedienbefehle und bricht alle modalen
Abfragen ab. Es setzt einen laufenden, sicheren Spielabschnitt und zunächst
ausgeschaltete Musik voraus. `equipment_failures.inc` prüft allgemeine
Fehlversuche und Kleidung: warme Kleidung muss getragen werden, die Pfeife
muss im Inventar sein; der Aufrufort darf keinen Ausgang nach oben und keinen
aktiven zeitkritischen Gegner haben. Die aufrufenden Replays prüfen anschließend
Teil und Raum. Diese Bausteine werden derzeit in B und D verwendet.

Erkundungs- und Schnelllauf bleiben absichtlich ohne Includes lesbar.
`./check-replay.sh` prüft alle vollständigen Replays, einschließlich der
eingebundenen Befehle und Assertions. `./check-replay-texts.sh` verwendet
denselben Include-Leser.
