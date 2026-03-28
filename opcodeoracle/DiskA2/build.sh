set -e

export EXEC="$HOME/projects/OpcodeOracle/opcodeoracle"

#####

#${EXEC} new prg  --entry 0x817 A2_seq11.bin
#${EXEC} new prg  --entry 0x817 A2_seq12.bin
#${EXEC} new prg  --entry 0x817 A2_seq13.bin
#${EXEC} new prg  --entry 0x817 A2_seq14.bin
#${EXEC} new prg  --entry 0x817 A2_seq15.bin

#${EXEC} export A2_seq11.opcodeoracle.json
#${EXEC} export A2_seq12.opcodeoracle.json
#${EXEC} export A2_seq13.opcodeoracle.json
#${EXEC} export A2_seq14.opcodeoracle.json
#${EXEC} export A2_seq15.opcodeoracle.json

#####

#${EXEC} new bin  --entry 0x334 --origin 0x0000 A2_seq11_pre0334_64k.bin
#${EXEC} new bin  --entry 0x334 --origin 0x0000 A2_seq12_pre0334_64k.bin
#${EXEC} new bin  --entry 0x334 --origin 0x0000 A2_seq13_pre0334_64k.bin
#${EXEC} new bin  --entry 0x334 --origin 0x0000 A2_seq14_pre0334_64k.bin
#${EXEC} new bin  --entry 0x334 --origin 0x0000 A2_seq15_pre0334_64k.bin

#${EXEC} export A2_seq11_pre0334_64k.opcodeoracle.json
#${EXEC} export A2_seq12_pre0334_64k.opcodeoracle.json
#${EXEC} export A2_seq13_pre0334_64k.opcodeoracle.json
#${EXEC} export A2_seq14_pre0334_64k.opcodeoracle.json
#${EXEC} export A2_seq15_pre0334_64k.opcodeoracle.json

#####

go run prep_pre2080.go A2_seq11_pre0334_64k.bin
go run prep_pre2080.go A2_seq12_pre0334_64k.bin
go run prep_pre2080.go A2_seq13_pre0334_64k.bin
go run prep_pre2080.go A2_seq14_pre0334_64k.bin
go run prep_pre2080.go A2_seq15_pre0334_64k.bin

