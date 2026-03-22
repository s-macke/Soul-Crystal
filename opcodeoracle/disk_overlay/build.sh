set -e

#dd if=../../data/C64/d64/Soul\ Crystal\ SideA2.d64 bs=1 count=256 skip=92672 of=A2.bin
#dd if=../../data/C64/d64/Soul\ Crystal\ SideB1.d64 bs=1 count=256 skip=92672 of=B1.bin
#dd if=../../data/C64/d64/Soul\ Crystal\ SideB2.d64 bs=1 count=256 skip=92672 of=B2.bin
#dd if=../../data/C64/d64/Soul\ Crystal\ SideC1.d64 bs=1 count=256 skip=92672 of=C1.bin
#dd if=../../data/C64/d64/Soul\ Crystal\ SideC2.d64 bs=1 count=256 skip=92672 of=C2.bin

export EXEC="$HOME/projects/OpcodeOracle/opcodeoracle"

${EXEC} new bin  --entry 0xC900,0xC903,0xC906 --origin 0xC900 B1.bin
${EXEC} new bin  --entry 0xC900,0xC903,0xC906 --origin 0xC900 B2.bin
${EXEC} new bin  --entry 0xC900,0xC903,0xC906 --origin 0xC900 C1.bin
${EXEC} new bin  --entry 0xC900,0xC903,0xC906 --origin 0xC900 C2.bin

${EXEC} export B1.opcodeoracle.json
${EXEC} export B2.opcodeoracle.json
${EXEC} export C1.opcodeoracle.json
${EXEC} export C2.opcodeoracle.json


