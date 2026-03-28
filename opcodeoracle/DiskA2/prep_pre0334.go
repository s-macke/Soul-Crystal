package main

import (
	"errors"
	"flag"
	"fmt"
	"os"
	"path/filepath"
	"strings"
)

const (
	ramSize     = 65536
	defaultLoad = 0x0800
)

type loaderSpec struct {
	memConfigValue byte
	copy1Count     int
	copy1Src       int
	copy1Mask      int
	copy1Dst       int
	copy2Outer     int
	copy2YInit     int
	copy2SrcLo     int
	copy2SrcHiAddr int
	copy2XorImm    byte
	copy2DstLo     int
	copy2DstHiAddr int
	ptrLo          byte
	ptrHi          byte
}

func main() {
	loadAddr := flag.Uint("load", defaultLoad, "load address for the input binaries")
	outDir := flag.String("outdir", "", "optional output directory; defaults to each input file's directory")
	flag.Parse()

	inputs, err := collectInputs(flag.Args())
	if err != nil {
		fatalf("%v", err)
	}

	for _, inputPath := range inputs {
		if err := processFile(inputPath, int(*loadAddr), *outDir); err != nil {
			fatalf("%s: %v", inputPath, err)
		}
	}
}

func collectInputs(args []string) ([]string, error) {
	if len(args) > 0 {
		return args, nil
	}

	matches, err := filepath.Glob("A2_seq[0-9][0-9].bin")
	if err != nil {
		return nil, err
	}
	if len(matches) == 0 {
		return nil, errors.New("no input files given and no A2_seqNN.bin files found in the current directory")
	}
	return matches, nil
}

func processFile(inputPath string, loadAddr int, outDir string) error {
	input, err := os.ReadFile(inputPath)
	if err != nil {
		return fmt.Errorf("read input: %w", err)
	}

	mem, spec, err := loadAndParse(input, loadAddr)
	if err != nil {
		return err
	}
	applyLoader(mem, spec)

	outputPath := outputName(inputPath, outDir)
	if err := os.WriteFile(outputPath, mem, 0o644); err != nil {
		return fmt.Errorf("write output: %w", err)
	}

	fmt.Printf("%s -> %s\n", inputPath, outputPath)
	fmt.Printf("  $0001=$%02X $002D/$002E=$%02X%02X $0334..$033B=% X\n",
		mem[0x0001], mem[0x002E], mem[0x002D], mem[0x0334:0x033C])
	return nil
}

func loadAndParse(input []byte, loadAddr int) ([]byte, loaderSpec, error) {
	rawMem, rawErr := loadAt(input, loadAddr)
	if rawErr == nil {
		spec, err := parseLoader(rawMem)
		if err == nil {
			return rawMem, spec, nil
		}
		rawErr = err
	}

	if len(input) >= 2 {
		headerLoad := int(input[0]) | int(input[1])<<8
		prgMem, prgErr := loadAt(input[2:], headerLoad)
		if prgErr == nil {
			spec, err := parseLoader(prgMem)
			if err == nil {
				return prgMem, spec, nil
			}
			prgErr = err
		}
		if rawErr != nil {
			return nil, loaderSpec{}, fmt.Errorf("raw parse failed: %v; PRG parse failed: %v", rawErr, prgErr)
		}
		return nil, loaderSpec{}, prgErr
	}

	return nil, loaderSpec{}, rawErr
}

func loadAt(payload []byte, loadAddr int) ([]byte, error) {
	if loadAddr < 0 || loadAddr >= ramSize {
		return nil, fmt.Errorf("load address 0x%04X is outside 64 KB RAM", loadAddr)
	}
	if loadAddr+len(payload) > ramSize {
		return nil, fmt.Errorf("input size %d at load address 0x%04X exceeds 64 KB RAM", len(payload), loadAddr)
	}

	mem := make([]byte, ramSize)
	copy(mem[loadAddr:], payload)
	return mem, nil
}

func outputName(inputPath, outDir string) string {
	ext := filepath.Ext(inputPath)
	base := strings.TrimSuffix(filepath.Base(inputPath), ext)
	name := base + "_pre0334_64k.bin"
	if outDir == "" {
		return filepath.Join(filepath.Dir(inputPath), name)
	}
	return filepath.Join(outDir, name)
}

func parseLoader(mem []byte) (loaderSpec, error) {
	expect := map[int]byte{
		0x0817: 0xD8, // CLD
		0x0818: 0x78, // SEI
		0x0819: 0xA9, // LDA #imm
		0x081B: 0x85, // STA zp
		0x081C: 0x01,
		0x081D: 0xA2, // LDX #imm
		0x081F: 0xBD, // LDA abs,X
		0x0822: 0x5D, // EOR abs,X
		0x0825: 0x9D, // STA abs,X
		0x0828: 0xCA, // DEX
		0x0829: 0x10, // BPL
		0x082B: 0xA2, // LDX #imm
		0x082D: 0xF0, // BEQ
		0x082F: 0xA0, // LDY #imm
		0x0831: 0xB9, // LDA abs,Y
		0x0834: 0x49, // EOR #imm
		0x0836: 0x99, // STA abs,Y
		0x0839: 0x88, // DEY
		0x083A: 0xC0, // CPY #$FF
		0x083B: 0xFF,
		0x083C: 0xD0, // BNE
		0x083E: 0xCE, // DEC abs
		0x0841: 0xCE, // DEC abs
		0x0844: 0xCA, // DEX
		0x0845: 0xD0, // BNE
		0x0847: 0xA2, // LDX #imm
		0x0849: 0xA0, // LDY #imm
		0x084B: 0x86, // STX zp
		0x084C: 0x2D,
		0x084D: 0x84, // STY zp
		0x084E: 0x2E,
		0x084F: 0x4C, // JMP abs
		0x0850: 0x34,
		0x0851: 0x03,
	}

	for addr, want := range expect {
		if mem[addr] != want {
			return loaderSpec{}, fmt.Errorf("unsupported loader stub: $%04X expected $%02X, found $%02X", addr, want, mem[addr])
		}
	}

	return loaderSpec{
		memConfigValue: mem[0x081A],
		copy1Count:     int(mem[0x081E]),
		copy1Src:       int(mem[0x0820]) | int(mem[0x0821])<<8,
		copy1Mask:      int(mem[0x0823]) | int(mem[0x0824])<<8,
		copy1Dst:       int(mem[0x0826]) | int(mem[0x0827])<<8,
		copy2Outer:     int(mem[0x082C]),
		copy2YInit:     int(mem[0x0830]),
		copy2SrcLo:     int(mem[0x0832]),
		copy2SrcHiAddr: 0x0833,
		copy2XorImm:    mem[0x0835],
		copy2DstLo:     int(mem[0x0837]),
		copy2DstHiAddr: 0x0838,
		ptrLo:          mem[0x0848],
		ptrHi:          mem[0x084A],
	}, nil
}

func applyLoader(mem []byte, spec loaderSpec) {
	mem[0x0001] = spec.memConfigValue

	for x := spec.copy1Count; x >= 0; x-- {
		mem[spec.copy1Dst+x] = mem[spec.copy1Src+x] ^ mem[spec.copy1Mask+x]
	}

	srcHi := mem[spec.copy2SrcHiAddr]
	dstHi := mem[spec.copy2DstHiAddr]
	for outer := 0; outer < spec.copy2Outer; outer++ {
		for y := spec.copy2YInit; y >= 0; y-- {
			src := (int(srcHi) << 8) + spec.copy2SrcLo + y
			dst := (int(dstHi) << 8) + spec.copy2DstLo + y
			mem[dst] = mem[src] ^ spec.copy2XorImm
		}

		srcHi--
		dstHi--
	}

	// The loader decrements the operand bytes in-place before it jumps.
	mem[spec.copy2SrcHiAddr] = srcHi
	mem[spec.copy2DstHiAddr] = dstHi
	mem[0x002D] = spec.ptrLo
	mem[0x002E] = spec.ptrHi
}

func fatalf(format string, args ...any) {
	fmt.Fprintf(os.Stderr, format+"\n", args...)
	os.Exit(1)
}
