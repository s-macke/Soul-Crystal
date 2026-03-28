package main

import (
	"errors"
	"flag"
	"fmt"
	"os"
	"path/filepath"
	"strings"
)

const memSize = 65536

type decoderState struct {
	src    uint16
	dst    uint16
	marker byte
}

type decoderResult struct {
	jumpTarget uint16
}

type watchRange struct {
	start uint16
	end   uint16
}

func main() {
	outDir := flag.String("outdir", "", "optional output directory; defaults to each input file's directory")
	trace := flag.Bool("trace", false, "print decoder control records while processing")
	watchDst := flag.Uint("watchdst", 0, "log writes that touch this destination address")
	watchLen := flag.Uint("watchlen", 1, "number of destination bytes to watch")
	flag.Parse()

	var watch *watchRange
	if *watchLen == 0 {
		fatalf("-watchlen must be at least 1")
	}
	if *watchDst != 0 || flag.Lookup("watchdst").Value.String() != "0" {
		start := uint16(*watchDst & 0xFFFF)
		end := start + uint16(*watchLen) - 1
		if end < start {
			fatalf("watch range wraps around 16-bit address space")
		}
		watch = &watchRange{start: start, end: end}
	}

	inputs, err := collectInputs(flag.Args())
	if err != nil {
		fatalf("%v", err)
	}

	for _, inputPath := range inputs {
		if err := processFile(inputPath, *outDir, *trace, watch); err != nil {
			fatalf("%s: %v", inputPath, err)
		}
	}
}

func collectInputs(args []string) ([]string, error) {
	if len(args) > 0 {
		return args, nil
	}

	matches, err := filepath.Glob("A2_seq*_pre0334_64k.bin")
	if err != nil {
		return nil, err
	}
	if len(matches) == 0 {
		return nil, errors.New("no input files given and no A2_seq*_pre0334_64k.bin files found in the current directory")
	}
	return matches, nil
}

func processFile(inputPath, outDir string, trace bool, watch *watchRange) error {
	mem, err := os.ReadFile(inputPath)
	if err != nil {
		return fmt.Errorf("read input: %w", err)
	}
	if len(mem) != memSize {
		return fmt.Errorf("expected a flat 64 KB memory image, got %d bytes", len(mem))
	}

	result, err := runDecoder(mem, trace, watch)
	if err != nil {
		return err
	}

	outputPath := outputName(inputPath, outDir)
	if err := os.WriteFile(outputPath, mem, 0o644); err != nil {
		return fmt.Errorf("write output: %w", err)
	}

	fmt.Printf("%s -> %s\n", inputPath, outputPath)
	fmt.Printf("  jump=$%04X $0001=$%02X $002D/$002E=$%02X%02X $%04X..$%04X=% X\n",
		result.jumpTarget,
		mem[0x0001],
		mem[0x002E],
		mem[0x002D],
		result.jumpTarget,
		result.jumpTarget+7,
		mem[result.jumpTarget:result.jumpTarget+8],
	)
	return nil
}

func runDecoder(mem []byte, trace bool, watch *watchRange) (decoderResult, error) {
	result, err := validateDecoderStub(mem)
	if err != nil {
		return decoderResult{}, err
	}

	state := decoderState{
		src:    loadPtr(mem, 0x002D),
		dst:    loadPtr(mem, 0x00AE),
		marker: mem[0x0339],
	}
	storePtr(mem, 0x002D, state.src)
	storePtr(mem, 0x00AE, state.dst)

	const maxOps = 1 << 24
	for op := 0; op < maxOps; op++ {
		b := mem[state.src]
		if b != state.marker {
			if watch != nil && state.dst >= watch.start && state.dst <= watch.end {
				fmt.Printf("  lit src=$%04X dst=$%04X value=$%02X\n", state.src, state.dst, b)
			}
			mem[state.dst] = b
			state.src++
			state.dst++
			storePtr(mem, 0x002D, state.src)
			storePtr(mem, 0x00AE, state.dst)
			continue
		}

		count := mem[state.src+1]
		if count != 0 {
			value := mem[state.src+2]
			if trace {
				fmt.Printf("  rle src=$%04X dst=$%04X count=$%02X value=$%02X\n", state.src, state.dst, count, value)
			}
			for i := uint16(0); i < uint16(count); i++ {
				dst := state.dst + i
				if watch != nil && dst >= watch.start && dst <= watch.end {
					fmt.Printf("  rle-byte src=$%04X dst=$%04X value=$%02X\n", state.src, dst, value)
				}
				mem[state.dst+i] = value
			}
			state.src += 3
			state.dst += uint16(count)
			storePtr(mem, 0x002D, state.src)
			storePtr(mem, 0x00AE, state.dst)
			continue
		}

		lo := mem[state.src+2]
		hi := mem[state.src+3]
		if lo == 0 && hi == 0 {
			if trace {
				fmt.Printf("  end src=$%04X jump=$%04X\n", state.src, result.jumpTarget)
			}
			mem[0x0001] = 0x37
			mem[0x002D] = 0xFF
			mem[0x002E] = 0xFF
			return result, nil
		}

		if trace {
			fmt.Printf("  ctrl src=$%04X dst=$%04X -> $%02X%02X memcfg=$%02X marker=$%02X\n",
				state.src, state.dst, hi, lo, mem[state.src+4], mem[state.src+5])
		}
		memCfg := mem[state.src+4]
		nextMarker := mem[state.src+5]
		state.src += 6
		state.dst = uint16(lo) | uint16(hi)<<8
		storePtr(mem, 0x002D, state.src)
		storePtr(mem, 0x00AE, state.dst)
		mem[0x0001] = memCfg
		state.marker = nextMarker
		mem[0x0339] = state.marker
	}

	return decoderResult{}, errors.New("decoder did not reach the final jump before the operation limit")
}

func validateDecoderStub(mem []byte) (decoderResult, error) {
	jumpTarget := uint16(mem[0x03A3]) | uint16(mem[0x03A4])<<8
	expect := map[int]byte{
		0x0334: 0xA0, // LDY #$00
		0x0335: 0x00,
		0x0336: 0xB1, // LDA ($2D),Y
		0x0337: 0x2D,
		0x0338: 0xC9, // CMP #imm
		0x033A: 0xD0, // BNE
		0x033B: 0x49,
		0x033C: 0xC8, // INY
		0x033D: 0xB1, // LDA ($2D),Y
		0x033E: 0x2D,
		0x033F: 0xF0, // BEQ
		0x0340: 0x24,
		0x0385: 0x91, // STA ($AE),Y
		0x0386: 0xAE,
		0x0395: 0xA9, // LDA #$37
		0x0396: 0x37,
		0x03A2: 0x4C, // JMP abs
	}

	for addr, want := range expect {
		if mem[addr] != want {
			return decoderResult{}, fmt.Errorf("unsupported decoder stub: $%04X expected $%02X, found $%02X", addr, want, mem[addr])
		}
	}
	if int(jumpTarget)+8 > len(mem) {
		return decoderResult{}, fmt.Errorf("decoder handoff target $%04X is outside the memory image", jumpTarget)
	}
	return decoderResult{jumpTarget: jumpTarget}, nil
}

func loadPtr(mem []byte, addr int) uint16 {
	return uint16(mem[addr]) | uint16(mem[addr+1])<<8
}

func storePtr(mem []byte, addr int, value uint16) {
	mem[addr] = byte(value)
	mem[addr+1] = byte(value >> 8)
}

func outputName(inputPath, outDir string) string {
	ext := filepath.Ext(inputPath)
	base := strings.TrimSuffix(filepath.Base(inputPath), ext)
	name := strings.Replace(base, "_pre0334_64k", "_pre2080_64k", 1) + ".bin"
	if outDir == "" {
		return filepath.Join(filepath.Dir(inputPath), name)
	}
	return filepath.Join(outDir, name)
}

func fatalf(format string, args ...any) {
	fmt.Fprintf(os.Stderr, format+"\n", args...)
	os.Exit(1)
}
