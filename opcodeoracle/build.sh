set -e

export EXEC="$HOME/projects/OpcodeOracle/opcodeoracle"

#${EXEC} new bin --skip 0x80 \
#    --entry 0x389c,0x9684,0x3b94,0xcb29,0xcf0b,0x9879,0x9861,0x977D,0x97C5,0x97D1,0x97DD,0x9803,0x9843,0x984E,0x9760,0x9642,0x9632,0x9635,0x1a72,0x1ac8,0x1ae0,0x4722,0x97a9,0x97af,0x9bf8,0x9C1C \
#    --description "C64 Text Adventure Game Soul Crystal" ../data/tests/nachcodeabfrage.vsf

#mv nachcodeabfrage.opcodeoracle.json soul_crystal.opcodeoracle.json
${EXEC} edit reanalyze soul_crystal.opcodeoracle.json
${EXEC} export soul_crystal.opcodeoracle.json
${EXEC} info soul_crystal.opcodeoracle.json

#${EXEC} mcp -transport http --listen 127.0.0.1:8080 soul_crystal.opcodeoracle.json

#  - 0 bytes: $0F77
#  - 2 bytes: $0E11, $0F5B, $0FAB
#  - 3 bytes: $0CDB, $0DF0, $0DED
#  - 4 bytes: $0C4D, $0D1E, $0D28, $0F91, $0D19, $0C80, $0D26, $0F84
#  - 6 bytes: $0C6D, $0CFF, $0D0C, $0F9E
#  - 7 bytes: $0D4F

#0x0d37 4 or 6 bytes
#0x0f17 6 or 8 bytes
#0x0f29 4 or 6 bytes
#0x0f3e 4 or 6 bytes
#0x0fd0 4 or 6 bytes
#0xc8d 6 or 8 parameters
#0xe7d 2 or 3 parameters
#0x0ff0 4 or 6 bytes
#0x1052 4 or 6 bytes

#0x0f5b 2 + A register ???, probably 2


#0x5db3 ???

