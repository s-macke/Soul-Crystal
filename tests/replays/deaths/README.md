# Todesfall-Replays

Jede Datei startet neu, verwendet ausschließlich normale Eingaben und endet
mit `@finish dead`. Spielteil, Raum, Daves Todesmarkierung und ein spezifischer
Textausschnitt werden zusätzlich geprüft. Ein Parserfehler oder ein anderer
Ausgang gilt nicht als Erfolg. Keine State-Fixtures, Savegames oder Cheats.

Die 46 Fälle decken 46 der 48 direkten Todeszuweisungen in den generierten
Skripten ab. Gleiche Todesarten mit verschiedenen Auslösewegen werden separat
getestet (z.B. Erfrieren in vier Teilen, drei Wege ins Sumpfwasser).
Die Grundanläufe wurden durch Entfernen entbehrlicher Eingaben verkürzt.
Einzelne Fälle enthalten inzwischen zusätzliche, bisher fehlende Spielreaktionen
(z.B. Zombie-Hilfe, unvergiftetes Brot und frühe Heilung vor Zargon). Eine global
kürzestmögliche Route wird nicht behauptet. Wartefolgen beim Erfrieren gehören
zur originalen Zeitbedingung und können deshalb nicht beliebig verkürzt werden.

| Datei | Todesfall | Befehle | Auslösestelle (Teil:Zeile) |
| --- | --- | ---: | --- |
| [a_kaelte.replay](a_kaelte.replay) | Erfrieren in Teil A | 101 | `A:105` |
| [a_see_nord.replay](a_see_nord.replay) | Mit Gepäck in den See (Nordweg) | 3 | `A:353` |
| [a_strudel.replay](a_strudel.replay) | In den Strudel geraten | 28 | `A:443` |
| [a_wasserfall_west.replay](a_wasserfall_west.replay) | Mit Gepäck hinter den Wasserfall (Westweg) | 36 | `A:541` |
| [a_selbstmord.replay](a_selbstmord.replay) | Dave zerstören | 1 | `A:660` |
| [a_wolf_helfen.replay](a_wolf_helfen.replay) | Dem Wolf helfen | 32 | `A:808` |
| [b_werwolf_flucht.replay](b_werwolf_flucht.replay) | Vor dem Werwolf fliehen | 119 | `B:72` |
| [b_kaelte.replay](b_kaelte.replay) | Erfrieren in Teil B | 122 | `B:117` |
| [b_werwolf_zoegern.replay](b_werwolf_zoegern.replay) | Werwolf betrachten statt sofort handeln | 121 | `B:248` |
| [b_mylgor_spritze.replay](b_mylgor_spritze.replay) | Mylgor zu lange mit der Spritze warten lassen | 168 | `B:293` |
| [b_mylgor_brand_zoegern.replay](b_mylgor_brand_zoegern.replay) | Nach dem Gegenangriff im Labor zögern | 169 | `B:311` |
| [b_labor_explosion.replay](b_labor_explosion.replay) | Labortür nicht rechtzeitig verriegeln | 170 | `B:340` |
| [b_baumstamm_nord.replay](b_baumstamm_nord.replay) | Baumstamm ohne Honig überqueren | 35 | `B:603` |
| [b_gletscher.replay](b_gletscher.replay) | In die Gletscherspalte stürzen | 90 | `B:631` |
| [b_labor_rueckkehr.replay](b_labor_rueckkehr.replay) | Ins brennende Labor zurückkehren | 168 | `B:647` |
| [b_labor_flucht_brand.replay](b_labor_flucht_brand.replay) | Vor dem Brand fliehen ohne die Labortür zu sichern | 169 | `B:836` |
| [b_labor_flucht_spritze.replay](b_labor_flucht_spritze.replay) | Vor Mylgor fliehen ohne Gegenangriff | 166 | `B:848` |
| [b_selbstmord.replay](b_selbstmord.replay) | Dave zerstören | 40 | `B:1064` |
| [b_mylgor_angreifen.replay](b_mylgor_angreifen.replay) | Mylgor an der Haustür angreifen | 39 | `B:1073` |
| [b_werwolf_helfen.replay](b_werwolf_helfen.replay) | Dem Werwolf helfen | 117 | `B:1313` |
| [b_pfeife_stehlen.replay](b_pfeife_stehlen.replay) | Die Pfeife im falschen Moment stehlen | 41 | `B:1538` |
| [c_kaelte.replay](c_kaelte.replay) | Erfrieren in Teil C | 275 | `C:103` |
| [c_treibsand.replay](c_treibsand.replay) | In den Treibsand gehen | 180 | `C:194` |
| [c_zombie_zoegern.replay](c_zombie_zoegern.replay) | Beim Zombie zu lange warten | 189 | `C:204` |
| [c_zombies_rueckweg.replay](c_zombies_rueckweg.replay) | Aus dem westlichen Moor nach Osten zurückkehren | 186 | `C:283` |
| [c_sumpfsee_nord.replay](c_sumpfsee_nord.replay) | Ohne Boot ins Wasser (Südufer) | 176 | `C:365` |
| [c_fallgitter.replay](c_fallgitter.replay) | Ungesichertes Fallgitter passieren | 184 | `C:391` |
| [c_amulett_rueckweg.replay](c_amulett_rueckweg.replay) | Mit Amulett durch die Barriere zurückgehen | 175 | `C:519` |
| [c_sumpfsee_sued.replay](c_sumpfsee_sued.replay) | Ohne Boot ins Wasser (Nordufer) | 182 | `C:537` |
| [c_selbstmord.replay](c_selbstmord.replay) | Dave zerstören | 175 | `C:743` |
| [c_boot_verlassen.replay](c_boot_verlassen.replay) | Mitten auf dem See aus dem Boot steigen | 178 | `C:868` |
| [d_kaelte.replay](d_kaelte.replay) | Erfrieren in Teil D | 297 | `D:114` |
| [d_ratten_zoegern.replay](d_ratten_zoegern.replay) | In der Küche zu lange warten | 260 | `D:215` |
| [d_pentagramm_feuer.replay](d_pentagramm_feuer.replay) | Teleportieren solange das Purpurfeuer aktiv ist | 264 | `D:275` |
| [d_mumien_offene_saerge.replay](d_mumien_offene_saerge.replay) | Zargon erreichen ohne die Särge zu schließen | 268 | `D:293` |
| [d_zargon_zoegern.replay](d_zargon_zoegern.replay) | Zargon zu lange Zeit lassen | 314 | `D:325` |
| [d_ende_werwolf.replay](d_ende_werwolf.replay) | Die Burg ungeheilt verlassen | 304 | `D:573` |
| [d_ratten_durchqueren.replay](d_ratten_durchqueren.replay) | Das Rattenrevier unvorbereitet durchqueren | 249 | `D:692` |
| [d_cu_sath.replay](d_cu_sath.replay) | Cu-Sath ohne Parfüm passieren | 198 | `D:704` |
| [d_selbstmord.replay](d_selbstmord.replay) | Dave zerstören | 197 | `D:917` |
| [d_truhe_zerstoeren.replay](d_truhe_zerstoeren.replay) | Die verzauberte Truhe zerstören | 203 | `D:921` |
| [d_vertrag_zerreissen.replay](d_vertrag_zerreissen.replay) | Den Vertrag zerreißen | 256 | `D:978` |
| [d_tuerklinke_druecken.replay](d_tuerklinke_druecken.replay) | Die Türklinke drücken statt ziehen | 243 | `D:1559` |
| [d_giftbrot_essen.replay](d_giftbrot_essen.replay) | Das vergiftete Brot selbst essen | 258 | `D:1750` |
| [d_krone.replay](d_krone.replay) | Zargons Krone aufsetzen | 276 | `D:1764` |
| [d_truhe_schwert.replay](d_truhe_schwert.replay) | Die Truhe mit dem Schwert angreifen | 199 | `D:1808` |

## Zwei nicht separat erreichte Zweige

- `B:790`: Baumstamm-Rückweg ohne Honig bzw. ohne Fellstiefel. Der Hinweg
  verlangt bereits Honig und Fellstiefel; ohne Stiefel blockiert anschließend
  die vorgelagerte Kleidungsprüfung die Bewegung. Der gleichartige Sturz beim
  Hinweg ist durch `b_baumstamm_nord.replay` abgedeckt. Ein regulärer Anlauf
  zu genau dieser zweiten Zuweisung wurde nicht gefunden.
- `D:237`: Rückkehr per Pentagramm zu offenen Särgen. Schon der Zugang zu
  Zargon bei offenen Särgen löst den anderen Mumientod (`D:293`) aus. Mit
  geschlossenen Särgen wird bei der Rückkehr stattdessen das Teleportflag
  zurückgesetzt. Ein regulärer Anlauf zu genau dieser Zuweisung wurde nicht
  gefunden. Kein künstlicher Zustand wird eingesetzt, um Abdeckung vorzutäuschen.

Diese beiden Zweige bleiben ausdrücklich offen; nicht als erreichte
Replay-Abdeckung zählen. Der Codebestand allein beweist nicht, dass es einen
regulär spielbaren Weg zu jeder Todeszuweisung gibt.
