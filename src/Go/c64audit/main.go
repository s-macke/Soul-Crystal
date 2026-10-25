// Audit C64 script-table layouts against original disks and played snapshots.
package main

import (
	"bytes"
	"crypto/sha256"
	"encoding/binary"
	"encoding/json"
	"flag"
	"fmt"
	"os"
	"path/filepath"
	"regexp"
	"strconv"
	"strings"
)

type reader struct {
	Address     string `json:"address"`
	Records     int    `json:"records"`
	RecordBytes int    `json:"record_bytes"`
}
type table struct {
	Name             string   `json:"name"`
	Address          string   `json:"address"`
	Fields           []string `json:"fields"`
	PhysicalBytes    int      `json:"physical_bytes"`
	PhysicalRecords  int      `json:"physical_records"`
	Readers          []reader `json:"readers"`
	MaximumReadBytes int      `json:"maximum_read_bytes"`
	OverlapHex       string   `json:"overlap_hex,omitempty"`
	DiskSHA256       string   `json:"disk_sha256"`
	MatchesSnapshot  bool     `json:"matches_snapshot"`
	SameAsPartA      bool     `json:"same_as_part_a"`
}
type part struct {
	Side            string  `json:"side"`
	ScriptBytes     int     `json:"script_bytes_including_end_marker"`
	MatchesSnapshot bool    `json:"whole_script_matches_snapshot"`
	Tables          []table `json:"tables"`
}
type stateArray struct {
	Name           string   `json:"name"`
	Address        string   `json:"address"`
	Entries        int      `json:"native_capacity"`
	Width          int      `json:"entry_bytes"`
	LegacyEntries  int      `json:"legacy_header_entries"`
	SnapshotHashes []string `json:"snapshot_hashes_not_initial_state"`
}
type report struct {
	Parts       []part       `json:"parts"`
	StateArrays []stateArray `json:"state_arrays"`
	Notes       []string     `json:"notes"`
}

var starts = [4][7]int{{0x825e, 0x8286, 0x82d7, 0x82ef, 0x82f6, 0x834a, 0x8366}, {0x9374, 0x939c, 0x93ed, 0x9405, 0x940c, 0x9460, 0x947c}, {0x8345, 0x836d, 0x83be, 0x83d6, 0x83dd, 0x8431, 0x844d}, {0x8fbe, 0x8fe6, 0x9037, 0x904f, 0x9056, 0x90aa, 0x90c6}}
var lengths = [7]int{40, 81, 24, 7, 84, 28, 60}
var widths = [7]int{1, 3, 2, 1, 4, 4, 4}
var names = [7]string{"TakeableObjects", "OpenCloseObjects", "LockKeyPairs", "LockingExceptions", "HelpResponses", "DestroyResponses", "TalkResponses"}
var fields = [7][]string{{"object:u8"}, {"object:u8", "direction:u8", "destination:u8"}, {"object:u8", "key:u8"}, {"object:u8"}, {"object:u16le", "text:u16le"}, {"object:u16le", "text:u16le"}, {"object:u16le", "text:u16le"}}

func mustRead(path string) []byte {
	b, e := os.ReadFile(path)
	if e != nil {
		panic(e)
	}
	return b
}
func hash(b []byte) string { return fmt.Sprintf("%x", sha256.Sum256(b)) }
func sectors(track int) int {
	if track <= 17 {
		return 21
	}
	if track <= 24 {
		return 19
	}
	if track <= 30 {
		return 18
	}
	return 17
}
func diskScript(d []byte) []byte {
	t, s := int(d[0x260]), int(d[0x261])
	visited := map[int]bool{}
	payload := []byte{}
	for {
		if t < 1 || t > 35 || s < 0 || s >= sectors(t) || visited[t*256+s] {
			panic("invalid disk chain")
		}
		visited[t*256+s] = true
		offset := s
		for k := 1; k < t; k++ {
			offset += sectors(k)
		}
		offset *= 256
		block := d[offset : offset+256]
		if block[0] == 0 {
			if block[1] < 2 {
				panic("invalid final sector")
			}
			payload = append(payload, block[2:int(block[1])+1]...)
			break
		}
		payload = append(payload, block[2:]...)
		t, s = int(block[0]), int(block[1])
	}
	if binary.LittleEndian.Uint16(payload) != 0x7600 {
		panic("wrong script load address")
	}
	return payload[2:]
}
func audit(root string) report {
	result := report{Notes: []string{
		"Snapshots contain played state; differing state bytes do not prove part-specific initial data.",
		"Every script byte is compared with the original D64 chain before table comparisons.",
		"OpenCloseObjects scans 28 triples but has only 27 before LockKeyPairs; native overlap bytes are 10 11 30.",
		"Six lookup-table kinds are identical on all disks. OpenCloseObjects differs only for object $70: A/B/C=(70,00,00), D=(70,02,41).",
		"Lookup tables are not in the save payload. State arrays are serialized by $5934 and loaded by $56FD.",
		"Legacy tables.h is not a canonical initial save state; canonical values are separately extracted from B1 track 35 and verified against initializer $569D.",
	}}
	var snapshots [4][]byte
	var first [7][]byte
	for i, side := range []string{"B1", "B2", "C1", "C2"} {
		snap := mustRead(filepath.Join(root, "data/C64/snapshots/disk"+strings.ToLower(side)+".vsf"))[0x99:0x10099]
		snapshots[i] = snap
		script := diskScript(mustRead(filepath.Join(root, "data/C64/d64/Soul Crystal Side"+side+".d64")))
		if script[len(script)-1] != 0xff {
			panic("missing script end")
		}
		p := part{Side: side, ScriptBytes: len(script), MatchesSnapshot: bytes.Equal(script, snap[0x7600:0x7600+len(script)])}
		for j, address := range starts[i] {
			offset := address - 0x7600
			data := script[offset : offset+lengths[j]]
			if i == 0 {
				first[j] = append([]byte(nil), data...)
			}
			v := table{Name: fmt.Sprintf("Part%c_%s", 'A'+i, names[j]), Address: fmt.Sprintf("$%04X", address), Fields: fields[j], PhysicalBytes: len(data), PhysicalRecords: len(data) / widths[j], DiskSHA256: hash(data), MatchesSnapshot: bytes.Equal(data, snap[address:address+len(data)]), SameAsPartA: bytes.Equal(data, first[j])}
			pattern := []byte{0xe6, byte(address), byte(address >> 8), 0x93, 0xc0, 1, 0xd7}
			for pos := 0; pos < starts[i][0]-0x7600; pos++ {
				if !bytes.HasPrefix(script[pos:], pattern) {
					continue
				}
				readPC := pos + 7
				end := readPC
				recordBytes := 0
				for script[end] == 0xe4 || script[end] == 0xe5 {
					if script[end] == 0xe4 {
						recordBytes++
					} else {
						recordBytes += 2
					}
					end += 2
				}
				increment := []byte{0x93, 0x93, 0xd5, 0xc0, 1, 0xd0, 0x93, 0xdf, 0xc0}
				at := bytes.Index(script[end:end+64], increment)
				if at < 0 {
					panic("unrecognized scan")
				}
				at += end
				count := int(script[at+9])
				target := readPC + 0x7600
				if !bytes.Equal(script[at+10:at+14], []byte{0xd1, 0xe1, byte(target), byte(target >> 8)}) || recordBytes != widths[j] {
					panic("wrong reader")
				}
				v.Readers = append(v.Readers, reader{fmt.Sprintf("$%04X", pos+0x7600), count, recordBytes})
				if count*recordBytes > v.MaximumReadBytes {
					v.MaximumReadBytes = count * recordBytes
				}
			}
			if len(v.Readers) == 0 {
				panic("table without verified reader")
			}
			if v.MaximumReadBytes > len(data) {
				v.OverlapHex = fmt.Sprintf("% x", script[offset+len(data):offset+v.MaximumReadBytes])
			}
			p.Tables = append(p.Tables, v)
		}
		result.Parts = append(result.Parts, p)
	}
	legacy := string(mustRead(filepath.Join(root, "src/C/tables.h")))
	for _, a := range []struct {
		name                    string
		address, entries, width int
	}{
		{"objectDescriptionID", 0x69c6, 166, 2}, {"remainingPoints", 0x6b12, 166, 2}, {"objectLocation", 0x6c5e, 166, 1}, {"objectState", 0x6d04, 166, 1},
		{"north", 0x6daa, 104, 1}, {"south", 0x6e12, 104, 1}, {"west", 0x6e7a, 104, 1}, {"east", 0x6ee2, 104, 1}, {"up", 0x6f4a, 104, 1}, {"down", 0x6fb2, 104, 1}, {"visited", 0x7027, 104, 1},
	} {
		match := regexp.MustCompile(`(?s)\b` + a.name + `\[\] = \{(.*?)\};`).FindStringSubmatch(legacy)
		count := len(regexp.MustCompile(`0x[0-9a-fA-F]+`).FindAllString(match[1], -1))
		item := stateArray{Name: a.name, Address: fmt.Sprintf("$%04X", a.address), Entries: a.entries, Width: a.width, LegacyEntries: count}
		for _, s := range snapshots {
			item.SnapshotHashes = append(item.SnapshotHashes, hash(s[a.address:a.address+a.entries*a.width]))
		}
		result.StateArrays = append(result.StateArrays, item)
	}
	return result
}
func main() {
	state := flag.Bool("state", false, "extract the original new-game seed and emit game_state.c")
	flag.Parse()
	if *state {
		exportInitialState()
		return
	}
	result := audit(".")
	b, e := json.MarshalIndent(result, "", "  ")
	if e != nil {
		panic(e)
	}
	if e = os.WriteFile("spec/C64/table_audit.json", append(b, '\n'), 0644); e != nil {
		panic(e)
	}
	for _, p := range result.Parts {
		fmt.Println(p.Side, "script bytes", p.ScriptBytes, "matches disk/snapshot", strconv.FormatBool(p.MatchesSnapshot))
	}
	fmt.Println("Audited 28 script tables and 11 mutable-state arrays; wrote spec/C64/table_audit.json")
}
