package main

import (
	"encoding/binary"
	"testing"
)

// Execute only the original straight-line predicate routines ($305C..$36B2).
// No runtime hooks, game VM or inferred meaning of disassembler labels.
func nativePredicate(t *testing.T, m []byte, pc int) uint16 {
	t.Helper()
	a := byte(0)
	carry, zero := false, false
	next := func() byte { v := m[pc]; pc++; return v }
	word := func() int { lo := int(next()); return lo + 256*int(next()) }
	for steps := 0; steps < 1000; steps++ {
		op := next()
		switch op {
		case 0xa9:
			a = next()
			zero = a == 0
		case 0xad:
			a = m[word()]
			zero = a == 0
		case 0x8d:
			m[word()] = a
		case 0x85:
			m[int(next())] = a
		case 0xc9, 0xcd:
			var b byte
			if op == 0xc9 {
				b = next()
			} else {
				b = m[word()]
			}
			carry = a >= b
			zero = a == b
		case 0xed, 0xe9:
			var b byte
			if op == 0xe9 {
				b = next()
			} else {
				b = m[word()]
			}
			n := int(a) - int(b)
			if !carry {
				n--
			}
			carry = n >= 0
			a = byte(n)
			zero = a == 0
		case 0x0d:
			a |= m[word()]
			zero = a == 0
		case 0x2d:
			a &= m[word()]
			zero = a == 0
		case 0x90, 0xb0, 0xd0, 0xf0:
			d := int(int8(next()))
			if op == 0x90 && !carry || op == 0xb0 && carry || op == 0xd0 && !zero || op == 0xf0 && zero {
				pc += d
			}
		case 0x4c:
			pc = word()
		case 0x60:
			return binary.LittleEndian.Uint16(m[0x6992:])
		default:
			t.Fatalf("predicate opcode %02x at %04x", op, pc-1)
		}
	}
	t.Fatal("predicate instruction limit")
	return 0
}

func TestSpecialPredicates(t *testing.T) {
	m := mustRead("../../../opcodeoracle/soul_crystal/soul_crystal_origin_0x0000.bin")
	for _, side := range []string{"b1", "b2", "c1", "c2"} {
		s := mustRead("../../../data/C64/snapshots/disk" + side + ".vsf")[0x99:0x10099]
		if string(m[0x305c:0x36b3]) != string(s[0x305c:0x36b3]) {
			t.Fatal("predicate code differs", side)
		}
	}
	check := func(entry int, want bool) {
		v := nativePredicate(t, m, entry)
		if v != 0 && v != 1 || (v == 1) != want {
			t.Fatalf("%04x got %d want %v", entry, v, want)
		}
	}
	// Suspicious native OR chain: command!=20 OR command!=22 is always true.
	for command := 0; command < 65536; command++ {
		binary.LittleEndian.PutUint16(m[0x6986:], uint16(command))
		check(0x324f, true)
	}
	// Seven clothing states: exhaust all 0/1/2 combinations (2 must not act as 1).
	addresses := []int{0x6d51, 0x6d93, 0x6d82, 0x6d98, 0x6d81, 0x6d18, 0x6d9b}
	for values := 0; values < 2187; values++ {
		n := values
		for _, addr := range addresses {
			m[addr] = byte(n % 3)
			n /= 3
		}
		jeans, tshirt, shoes, trousers, shirt, boots, swim := m[0x6d51], m[0x6d93], m[0x6d82], m[0x6d98], m[0x6d81], m[0x6d18], m[0x6d9b]
		check(0x305c, (jeans == 0 || tshirt == 0 || shoes == 0) && (trousers == 0 || shirt == 0 || boots == 0) && swim == 0)
		check(0x31ab, (jeans == 1 && tshirt == 1 && shoes == 1) || (trousers == 1 && shirt == 1 && boots == 1))
		for _, v := range []byte{0, 1, 2, 255} {
			m[0x6d97] = v
			check(0x3317, (jeans == 0 && trousers == 0) || (shirt == 0 && tshirt == 0 && v == 0) || (boots == 0 && shoes == 0))
		}
	}
	for r := 0; r < 256; r++ {
		m[0x695d] = byte(r)
		check(0x33da, r == 3 || r == 4 || r == 7 || r == 8 || r >= 10 && r <= 15)
		check(0x347e, r == 20 || r == 21 || r >= 23 && r <= 26 || r >= 28 && r <= 30 || r == 32 || r == 34 || r == 35 || r == 38 || r >= 40 && r <= 43)
		check(0x35bb, r >= 66 && r <= 68 || r >= 75 && r <= 77)
		check(0x362d, r == 25)
	}
	for obj := 0; obj < 65536; obj++ {
		binary.LittleEndian.PutUint16(m[0x698a:], uint16(obj))
		for _, v := range []byte{0, 1, 2} {
			m[0x6d0f] = v
			check(0x364c, obj == 163 || obj == 11 && v == 1)
		}
	}
}
