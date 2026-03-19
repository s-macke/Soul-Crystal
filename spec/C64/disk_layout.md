# C64 Disk Layout

## Side A1

Disk ID: `PA`

| Offset / range     | Indices | Likely content                                                              | Confidence |
|--------------------|---------|-----------------------------------------------------------------------------|------------|
| `0x000..0x1ff`     |         | Unknown data                                                                | Low        |
| `0x200..0x164ff`   |         | Unknown data                                                                | Low        |
| `0x16500..0x165ff` |         | Track 18 sector 0, directory/BAM area                                       | High       |
| `0x16600..0x166ff` |         | Track 18 sector 1, directory area                                           | High       |
| `0x16700..0x177ff` |         | Track 18 sectors 2..18, meaningful directory-related data and disk metadata | Medium     |
| `0x17800..0x2aaff` |         | Unknown data                                                                | Low        |
| `0x2ab00`          |         | End of file                                                                 | High       |

## Side A2

Disk ID: `PB`

| Offset / range     | Indices | Likely content                                                              | Confidence |
|--------------------|---------|-----------------------------------------------------------------------------|------------|
| `0x000..0x1ff`     |         | Unknown data                                                                | Low        |
| `0x200..0x164ff`   |         | Unknown data                                                                | Low        |
| `0x16500..0x165ff` |         | Track 18 sector 0, directory/BAM area                                       | High       |
| `0x16600..0x166ff` |         | Track 18 sector 1, directory area                                           | High       |
| `0x16700..0x177ff` |         | Track 18 sectors 2..18, meaningful directory-related data and disk metadata | Medium     |
| `0x17800..0x2aaff` |         | Unknown data                                                                | Low        |
| `0x2ab00`          |         | End of file                                                                 | High       |

## Side B1

Disk ID: `DA`

| Offset / range     | Indices    | Likely content                                                              | Confidence |
|--------------------|------------|-----------------------------------------------------------------------------|------------|
| `0x000..0x1ff`     |            | Unknown data                                                                | Low        |
| `0x200..0x2ff`     |            | Indexed-text decode tree                                                    | High       |
| `0x300..0x6e0`     |            | 3-byte indexed asset pointer table (`331` entries)                          | High       |
| `0x6e1..0x8ff`     |            | Unknown data                                                                | Low        |
| `0x900..0x99ff`    | `0..311`   | Compressed text and other non-image indexed records                         | Medium     |
| `0x9a00..0x2aaff`  | `312..330` | Image records and special screens                                           | Medium     |
| `0x16500..0x165ff` |            | Track 18 sector 0, directory/BAM area                                       | High       |
| `0x16600..0x166ff` |            | Track 18 sector 1, directory area                                           | High       |
| `0x16700..0x177ff` |            | Track 18 sectors 2..18, meaningful directory-related data and disk metadata | Medium     |
| `0x13d00..0x13dff` |            | Chained loader entry sector `(16, 2)`                                       | Low        |
| `0x2ab00`          |            | End of file                                                                 | High       |

## Side B2

Disk ID: `DB`

| Offset / range     | Indices    | Likely content                                                              | Confidence |
|--------------------|------------|-----------------------------------------------------------------------------|------------|
| `0x000..0x1ff`     |            | Unknown data                                                                | Low        |
| `0x200..0x2ff`     |            | Indexed-text decode tree                                                    | High       |
| `0x300..0x8c6`     |            | 3-byte indexed asset pointer table (`493` entries)                          | High       |
| `0x8c7..0x8ff`     |            | Unknown data                                                                | Low        |
| `0x900..0x12aff`   | `0..447`   | Compressed text and other non-image indexed records                         | Medium     |
| `0x12b00..0x1f16c` | `448..476` | Image records and special screens                                           | Medium     |
| `0x1f16d..0x2aaff` | `477..492` | Unknown or currently unclassified indexed records                           | Low        |
| `0x16500..0x165ff` |            | Track 18 sector 0, directory/BAM area                                       | High       |
| `0x16600..0x166ff` |            | Track 18 sector 1, directory area                                           | High       |
| `0x16700..0x177ff` |            | Track 18 sectors 2..18, meaningful directory-related data and disk metadata | Medium     |
| `0x26b00..0x26bff` |            | Chained loader entry sector `(32, 4)`                                       | Low        |
| `0x2ab00`          |            | End of file                                                                 | High       |

## Side C1

Disk ID: `DC`

| Offset / range     | Indices    | Likely content                                                              | Confidence |
|--------------------|------------|-----------------------------------------------------------------------------|------------|
| `0x000..0x1ff`     |            | Unknown data                                                                | Low        |
| `0x200..0x2ff`     |            | Indexed-text decode tree                                                    | High       |
| `0x300..0x6a7`     |            | 3-byte indexed asset pointer table (`312` entries)                          | High       |
| `0x6a8..0x8ff`     |            | Unknown data                                                                | Low        |
| `0x900..0x90ff`    | `0..290`   | Compressed text and other non-image indexed records                         | Medium     |
| `0x9100..0x2aaff`  | `291..311` | Image records and special screens                                           | Medium     |
| `0x16500..0x165ff` |            | Track 18 sector 0, directory/BAM area                                       | High       |
| `0x16600..0x166ff` |            | Track 18 sector 1, directory area                                           | High       |
| `0x16700..0x177ff` |            | Track 18 sectors 2..18, meaningful directory-related data and disk metadata | Medium     |
| `0x15700..0x157ff` |            | Chained loader entry sector `(17, 7)`                                       | Low        |
| `0x2ab00`          |            | End of file                                                                 | High       |

## Side C2

Disk ID: `DD`

| Offset / range     | Indices    | Likely content                                      | Confidence |
|--------------------|------------|-----------------------------------------------------|------------|
| `0x000..0x1ff`     |            | Unknown data                                        | Low        |
| `0x200..0x2ff`     |            | Indexed-text decode tree                            | High       |
| `0x300..0x8b4`     |            | 3-byte indexed asset pointer table (`487` entries)  | High       |
| `0x8b5..0x8ff`     |            | Unknown data                                        | Low        |
| `0x900..0x11dff`   | `0..434`   | Compressed text and other non-image indexed records | Medium     |
| `0x11e00..0x1ea89` | `435..465` | Image records and special screens                   | Medium     |
| `0x1ea8a..0x2aaff` | `466..486` | Unknown or currently unclassified indexed records   | Low        |
| `0x16500..0x165ff` |            | Track 18 sector 0, directory/BAM area              | High       |
| `0x16600..0x166ff` |            | Track 18 sector 1, directory area                  | High       |
| `0x16700..0x177ff` |            | Track 18 sectors 2..18, meaningful directory-related data and disk metadata | Medium |
| `0x27c00..0x27cff` |            | Chained loader entry sector `(33, 4)`               | Low        |
| `0x2ab00`          |            | End of file                                         | High       |
