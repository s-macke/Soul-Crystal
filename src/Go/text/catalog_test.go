package main

import (
	"encoding/binary"
	"os"
	"testing"
)

// Bounded test harness for the ORIGINAL 6502 routing routine, not a game VM.
// It starts at $3CF2 and stops before displaying a record or returning. Every
// opcode encountered must be explicitly supported; unknown instructions fail.
func originalRoute(t *testing.T, code []byte, id, side, tail int) (int, bool) {
	t.Helper()
	mem := append([]byte(nil), code...)
	pc := 0x3cf2
	a := byte(0)
	carry, zero := false, false
	mem[0x6990] = byte(id)
	mem[0x6991] = byte(id >> 8)
	mem[0x6963] = byte(side)
	binary.LittleEndian.PutUint16(mem[0x70bb:], uint16(tail-126))
	next := func() byte { v := mem[pc]; pc++; return v }
	word := func() int { v := int(next()); return v | int(next())<<8 }
	for steps := 0; steps < 500; steps++ {
		if pc == 0x4002 {
			return 0, false
		}
		op := next()
		switch op {
		case 0xa9:
			a = next()
			zero = a == 0
		case 0xad:
			a = mem[word()]
			zero = a == 0
		case 0x8d:
			mem[word()] = a
		case 0x18:
			carry = false
		case 0x38:
			carry = true
		case 0xc9, 0xcd:
			var b byte
			if op == 0xc9 {
				b = next()
			} else {
				b = mem[word()]
			}
			carry = a >= b
			zero = a == b
		case 0xe9, 0xed:
			var b byte
			if op == 0xe9 {
				b = next()
			} else {
				b = mem[word()]
			}
			borrow := 1
			if carry {
				borrow = 0
			}
			n := int(a) - int(b) - borrow
			carry = n >= 0
			a = byte(n)
			zero = a == 0
		case 0x69, 0x6d:
			var b byte
			if op == 0x69 {
				b = next()
			} else {
				b = mem[word()]
			}
			n := int(a) + int(b)
			if carry {
				n++
			}
			carry = n > 255
			a = byte(n)
			zero = a == 0
		case 0x0d:
			a |= mem[word()]
			zero = a == 0
		case 0x4c:
			pc = word()
		case 0xd0, 0xf0, 0x90:
			delta := int(int8(next()))
			if (op == 0xd0 && !zero) || (op == 0xf0 && zero) || (op == 0x90 && !carry) {
				pc += delta
			}
		case 0x20:
			target := word()
			if target == 0x4022 {
				return int(binary.LittleEndian.Uint16(mem[0x6990:])), true
			}
			t.Fatalf("unexpected call $%04x", target)
		default:
			t.Fatalf("unsupported original opcode $%02x at $%04x", op, pc-1)
		}
	}
	t.Fatal("routing did not terminate")
	return 0, false
}
func TestRouteAgainstOriginal6502(t *testing.T) {
	code, err := os.ReadFile("../../../opcodeoracle/soul_crystal/soul_crystal_origin_0x0000.bin")
	if err != nil {
		t.Fatal(err)
	}
	if len(code) != 65536 {
		t.Fatal("wrong memory image size")
	}
	for side, tail := range []int{271, 396, 251, 391} {
		for id := 25; id <= 636; id++ {
			want, visible := originalRoute(t, code, id, side+1, tail)
			got, ok := route(id, side+1, tail)
			if ok != visible || (ok && got != want) {
				t.Fatalf("side %d ID %d: got %d/%v, native %d/%v", side+1, id, got, ok, want, visible)
			}
		}
	}
}
func TestSnapshotSources(t *testing.T) {
	code, err := os.ReadFile("../../../opcodeoracle/soul_crystal/soul_crystal_origin_0x0000.bin")
	if err != nil {
		t.Fatal(err)
	}
	for _, d := range knownRanges {
		b, err := os.ReadFile("../../../" + d.path)
		if err != nil {
			t.Fatal(err)
		}
		for idx := 0; idx <= d.lastIdx; idx++ {
			if _, err = decodeScreen(b, idx); err != nil {
				t.Fatalf("%s %d: %v", d.name, idx, err)
			}
		}
		snapshot := "../../../data/C64/snapshots/disk" + map[string]string{"B1": "b1", "B2": "b2", "C1": "c1", "C2": "c2"}[d.name] + ".vsf"
		s, err := os.ReadFile(snapshot)
		if err != nil {
			t.Fatal(err)
		}
		ram := s[0x99:0x10099]
		for i := 0x3c02; i < 0x4069; i++ {
			if ram[i] != code[i] {
				t.Fatalf("%s routing differs at %x", d.name, i)
			}
		}
		for i := 0; i < 256; i++ {
			if ram[0xca00+i] != b[0x200+i] {
				t.Fatalf("%s snapshot/D64 Huffman table mismatch", d.name)
			}
		}
	}
}
