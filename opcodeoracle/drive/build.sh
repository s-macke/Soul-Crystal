set -e

export EXEC="$HOME/projects/OpcodeOracle/opcodeoracle"

${EXEC} new bin --entry "0x0300,0x323,0x435,0x6db,0x159,0x0068,0x01C3,0x1FA,0x202,0x234,0x271,0x176,0x17E,0x1AC" --description "1541 disk drive RAM dump from the game Soul Crystal" drive_ram.bin

#mv nachcodeabfrage.opcodeoracle.json soul_crystal.opcodeoracle.json
${EXEC} edit reanalyze drive_ram.opcodeoracle.json
${EXEC} export drive_ram.opcodeoracle.json
${EXEC} info drive_ram.opcodeoracle.json
