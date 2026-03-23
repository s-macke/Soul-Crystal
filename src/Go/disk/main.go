package main

import (
	"fmt"
	"os"
	"path/filepath"
	"strings"
)

const (
	d64Size            = 174848
	overlayTrack       = 18
	overlaySector      = 5
	outputDir          = "sequential"
	sectorSize         = 256
	rootTableOffset    = 0xA0
	rootIndexMapOffset = 0xC0
	rootIndexMapSize   = 0x40
)

type diskSpec struct {
	name string
	path string
}

type sectorRef struct {
	track  byte
	sector byte
}

type extractedChain struct {
	root    sectorRef
	payload []byte
}

var knownDisks = []diskSpec{
	{name: "B1", path: "data/C64/d64/Soul Crystal SideB1.d64"},
	{name: "B2", path: "data/C64/d64/Soul Crystal SideB2.d64"},
	{name: "C1", path: "data/C64/d64/Soul Crystal SideC1.d64"},
	{name: "C2", path: "data/C64/d64/Soul Crystal SideC2.d64"},
}

func sectorCount(track int) int {
	switch {
	case 1 <= track && track <= 17:
		return 21
	case 18 <= track && track <= 24:
		return 19
	case 25 <= track && track <= 30:
		return 18
	case 31 <= track && track <= 35:
		return 17
	default:
		return 0
	}
}

func d64Pos(track, sector, b int) (int, error) {
	maxSector := sectorCount(track)
	if maxSector == 0 {
		return 0, fmt.Errorf("invalid track %d", track)
	}
	if sector < 0 || sector >= maxSector {
		return 0, fmt.Errorf("invalid sector %d for track %d", sector, track)
	}
	if b < 0 || b >= sectorSize {
		return 0, fmt.Errorf("invalid byte offset %d", b)
	}

	switch {
	case 1 <= track && track <= 17:
		return ((track-1)*21+sector)*sectorSize + b, nil
	case 18 <= track && track <= 24:
		return (17*21+(track-18)*19+sector)*sectorSize + b, nil
	case 25 <= track && track <= 30:
		return (17*21+7*19+(track-25)*18+sector)*sectorSize + b, nil
	default:
		return (17*21+7*19+6*18+(track-31)*17+sector)*sectorSize + b, nil
	}
}

func readSector(buf []byte, track, sector int) ([]byte, error) {
	offset, err := d64Pos(track, sector, 0)
	if err != nil {
		return nil, err
	}
	if offset+sectorSize > len(buf) {
		return nil, fmt.Errorf("sector %d/%d runs past EOF", track, sector)
	}
	return buf[offset : offset+sectorSize], nil
}

func extractRoots(overlay []byte) ([]sectorRef, error) {
	// The selector table at $C9C0..$C9FF stores 1-based indices into the
	// root table at $C9A0+, so the highest referenced index gives the active
	// root count for the current side.
	maxIndex := byte(0)
	for _, idx := range overlay[rootIndexMapOffset : rootIndexMapOffset+rootIndexMapSize] {
		if idx > maxIndex {
			maxIndex = idx
		}
	}

	roots := make([]sectorRef, 0, int(maxIndex))
	for idx := byte(1); idx <= maxIndex; idx++ {
		pos := rootTableOffset + int(idx)*2
		if pos+1 >= len(overlay) {
			return nil, fmt.Errorf("root index %d exceeds overlay size", idx)
		}

		ref := sectorRef{
			track:  overlay[pos],
			sector: overlay[pos+1],
		}
		if _, err := d64Pos(int(ref.track), int(ref.sector), 0); err != nil {
			return nil, fmt.Errorf("root index %d has invalid track/sector %02X/%02X: %w", idx, ref.track, ref.sector, err)
		}
		roots = append(roots, ref)
	}

	return roots, nil
}

func extractChain(buf []byte, root sectorRef) ([]byte, error) {
	track := int(root.track)
	sector := int(root.sector)
	visited := make(map[int]struct{})
	payload := make([]byte, 0, sectorSize)

	for {
		key := track<<8 | sector
		if _, ok := visited[key]; ok {
			return nil, fmt.Errorf("loop detected at $%02X/$%02X", track, sector)
		}
		visited[key] = struct{}{}

		block, err := readSector(buf, track, sector)
		if err != nil {
			return nil, err
		}

		nextTrack := int(block[0])
		nextSector := int(block[1])

		if nextTrack == 0 {
			byteCount := nextSector
			if byteCount < 2 {
				return nil, fmt.Errorf("final sector $%02X/$%02X has invalid byte count %d", track, sector, byteCount)
			}
			payload = append(payload, block[2:byteCount+1]...)
			return payload, nil
		}

		payload = append(payload, block[2:]...)

		track = nextTrack
		sector = nextSector
	}
}

func loadChains(spec diskSpec) ([]extractedChain, error) {
	buf, err := os.ReadFile(spec.path)
	if err != nil {
		return nil, err
	}
	if len(buf) != d64Size {
		return nil, fmt.Errorf("%s has unexpected size %d", spec.path, len(buf))
	}

	overlay, err := readSector(buf, overlayTrack, overlaySector)
	if err != nil {
		return nil, err
	}
	roots, err := extractRoots(overlay)
	if err != nil {
		return nil, err
	}

	chains := make([]extractedChain, 0, len(roots))
	for _, root := range roots {
		payload, err := extractChain(buf, root)
		if err != nil {
			return nil, fmt.Errorf("root $%02X/$%02X: %w", root.track, root.sector, err)
		}
		chains = append(chains, extractedChain{
			root:    root,
			payload: payload,
		})
	}

	return chains, nil
}

func formatRoots(roots []sectorRef) string {
	var out strings.Builder
	for i, root := range roots {
		if i > 0 {
			out.WriteString(", ")
		}
		fmt.Fprintf(&out, "$%02X/$%02X", root.track, root.sector)
	}
	return out.String()
}

func findDisk(name string) (diskSpec, bool) {
	for _, spec := range knownDisks {
		if spec.name == name {
			return spec, true
		}
	}
	return diskSpec{}, false
}

func main() {
	disks := knownDisks
	if len(os.Args) > 1 {
		disks = make([]diskSpec, 0, len(os.Args)-1)
		for _, name := range os.Args[1:] {
			spec, ok := findDisk(name)
			if !ok {
				fmt.Fprintf(os.Stderr, "unknown disk %q\n", name)
				os.Exit(1)
			}
			disks = append(disks, spec)
		}
	}

	if err := os.MkdirAll(outputDir, 0o755); err != nil {
		fmt.Fprintf(os.Stderr, "create %s: %v\n", outputDir, err)
		os.Exit(1)
	}

	for _, spec := range disks {
		chains, err := loadChains(spec)
		if err != nil {
			fmt.Fprintf(os.Stderr, "%s: %v\n", spec.name, err)
			os.Exit(1)
		}

		roots := make([]sectorRef, 0, len(chains))
		for _, chain := range chains {
			roots = append(roots, chain.root)
		}
		fmt.Printf("- %s: %s\n", spec.name, formatRoots(roots))

		for idx, chain := range chains {
			outPath := filepath.Join(outputDir, fmt.Sprintf("%s_seq%d.bin", spec.name, idx+1))
			if err := os.WriteFile(outPath, chain.payload, 0o644); err != nil {
				fmt.Fprintf(os.Stderr, "%s: write %s: %v\n", spec.name, outPath, err)
				os.Exit(1)
			}
			fmt.Printf("  %s $%02X/$%02X -> %s (%d bytes)\n", spec.name, chain.root.track, chain.root.sector, outPath, len(chain.payload))
		}
	}
}
