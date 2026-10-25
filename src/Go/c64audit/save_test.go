package main

import (
	"bytes"
	"encoding/binary"
	"os"
	"testing"
)

// Test-only bounded execution of the ORIGINAL save/load routines. No game VM.
// Hooks: runtime FOR descriptors and 256-byte disk I/O; all serialization
// instructions including the byte buffer and little-endian words execute here.
func nativeSaveLoad(t *testing.T, memory []byte, loading bool, input []byte) ([]byte, []byte) {
	entry := 0x5934
	if loading {
		entry = 0x56fd
	}
	return nativeStateRoutine(t, memory, loading, input, entry)
}

func nativeStateRoutine(t *testing.T, memory []byte, loading bool, input []byte, entry int) ([]byte, []byte) {
	t.Helper()
	m := append([]byte(nil), memory...)
	pc := entry
	a, x, y := byte(0), byte(0), byte(0)
	carry, zero := false, false
	stack := []int{}
	type loop struct{ variable, step, end, body int }
	loops := []loop{}
	output := []byte{}
	inputPos := 0
	m[0x70d8] = 0
	m[0x70d9] = 0
	next := func() byte { b := m[pc]; pc++; return b }
	word := func() int { v := int(next()); return v | int(next())<<8 }
	getword := func(addr int) int { return int(binary.LittleEndian.Uint16(m[addr:])) }
	setword := func(addr, v int) { binary.LittleEndian.PutUint16(m[addr:], uint16(v)) }
	for steps := 0; steps < 300000; steps++ {
		op := next()
		switch op {
		case 0xa9:
			a = next()
			zero = a == 0
		case 0xad:
			a = m[word()]
			zero = a == 0
		case 0xa0:
			y = next()
			zero = y == 0
		case 0x8d:
			m[word()] = a
		case 0x85:
			m[int(next())] = a
		case 0xb1:
			p := int(next())
			a = m[(getword(p)+int(y))&0xffff]
			zero = a == 0
		case 0x91:
			p := int(next())
			m[(getword(p)+int(y))&0xffff] = a
		case 0x18:
			carry = false
		case 0x38:
			carry = true
		case 0x69, 0x6d:
			v := byte(0)
			if op == 0x69 {
				v = next()
			} else {
				v = m[word()]
			}
			n := int(a) + int(v)
			if carry {
				n++
			}
			carry = n > 255
			a = byte(n)
			zero = a == 0
		case 0xed:
			v := m[word()]
			n := int(a) - int(v)
			if !carry {
				n--
			}
			carry = n >= 0
			a = byte(n)
			zero = a == 0
		case 0xc9:
			v := next()
			carry = a >= v
			zero = a == v
		case 0xee:
			p := word()
			m[p]++
			zero = m[p] == 0
		case 0xc8:
			y++
			zero = y == 0
		case 0xaa:
			x = a
			zero = x == 0
		case 0xa8:
			y = a
			zero = y == 0
		case 0x8a:
			a = x
			zero = a == 0
		case 0x98:
			a = y
			zero = a == 0
		case 0x0a:
			carry = a&128 != 0
			a <<= 1
			zero = a == 0
		case 0x2a:
			c := carry
			carry = a&128 != 0
			a <<= 1
			if c {
				a |= 1
			}
			zero = a == 0
		case 0xd0, 0xf0:
			delta := int(int8(next()))
			if (op == 0xd0 && !zero) || (op == 0xf0 && zero) {
				pc += delta
			}
		case 0x4c:
			pc = word()
		case 0x20:
			target := word()
			switch target {
			case 0x0d4f:
				if next() != 4 {
					t.Fatal("unexpected FOR type")
				}
				variable := word()
				step := word()
				end := word()
				if step != 1 || getword(variable) > end {
					t.Fatal("unexpected loop descriptor")
				}
				loops = append(loops, loop{variable, step, end, pc})
			case 0x0ded:
				if next() != 4 {
					t.Fatal("unexpected NEXT type")
				}
				variable := word()
				l := loops[len(loops)-1]
				if variable != l.variable {
					t.Fatal("wrong loop variable")
				}
				v := getword(variable) + l.step
				setword(variable, v)
				if v <= l.end {
					pc = l.body
				} else {
					loops = loops[:len(loops)-1]
				}
			case 0x5bd8:
				if loading {
					t.Fatal("write during load")
				}
				output = append(output, m[0x9500:0x9600]...)
			case 0x5bce:
				if !loading || inputPos+256 > len(input) {
					t.Fatal("unexpected disk read")
				}
				copy(m[0x9500:0x9600], input[inputPos:inputPos+256])
				inputPos += 256
			default:
				stack = append(stack, pc)
				pc = target
			}
		case 0x60:
			if len(stack) == 0 {
				return output, m
			}
			pc = stack[len(stack)-1]
			stack = stack[:len(stack)-1]
		default:
			t.Fatalf("unsupported native opcode $%02x at $%04x", op, pc-1)
		}
	}
	t.Fatal("save/load did not terminate")
	return nil, nil
}

func expectedSave(m []byte) []byte {
	out := []byte{}
	object := func(i int) {
		out = append(out, m[0x69c6+2*i:0x69c6+2*i+2]...)
		out = append(out, m[0x6b12+2*i:0x6b12+2*i+2]...)
		out = append(out, m[0x6c5e+i], m[0x6d04+i])
	}
	for i := 1; i <= 103; i++ {
		for _, base := range []int{0x6daa, 0x6ee2, 0x6e12, 0x6e7a, 0x6f4a, 0x6fb2, 0x7027} {
			out = append(out, m[base+i])
		}
		object(i)
	}
	for i := 104; i <= 165; i++ {
		object(i)
	}
	out = append(out, m[0x7027], m[0x695d], m[0x698e], m[0x698f], m[0x698c], m[0x698d], m[0x69bf], m[0x70ca])
	return out
}

func TestNativeSaveAndLoad(t *testing.T) {
	for _, side := range []string{"b1", "b2", "c1", "c2"} {
		snapshot, e := os.ReadFile("../../../data/C64/snapshots/disk" + side + ".vsf")
		if e != nil {
			t.Fatal(e)
		}
		m := append([]byte(nil), snapshot[0x99:0x10099]...)
		m[0x70ca] = m[0x6963] // Save wrapper preserves game part here.
		for _, synthetic := range []bool{false, true} {
			if synthetic { // Distinct values expose ordering, truncation and off-by-one errors.
				for i := 0x69c6; i <= 0x708e; i++ {
					m[i] = byte(i*37 + i/256)
				}
				m[0x695d] = 103
				m[0x698c] = 0xab
				m[0x698d] = 0xcd
				m[0x698e] = 0x34
				m[0x698f] = 0x12
				m[0x69bf] = 0xfe
			}
			want := expectedSave(m)
			if len(want) != 1719 {
				t.Fatal(len(want))
			}
			blocks, _ := nativeSaveLoad(t, m, false, nil)
			if len(blocks) != 1792 || !bytes.Equal(blocks[:1719], want) {
				t.Fatalf("%s save differs, blocks=%d", side, len(blocks))
			}
			target := append([]byte(nil), m...)
			for i := 0x69c6; i <= 0x708e; i++ {
				target[i] = 0x5a
			}
			_, loaded := nativeSaveLoad(t, target, true, blocks)
			loaded[0x70ca] = loaded[0x6963] // Writer uses the wrapper's saved part, loader sets live part.
			if !bytes.Equal(expectedSave(loaded), want) {
				t.Fatalf("%s native load did not restore payload", side)
			}
			if loaded[0x69c0] != 0 {
				t.Fatal("load should zero the high byte of $69BF state")
			}
			if loaded[0x69c6] != 0x5a || loaded[0x6b12] != 0x5a || loaded[0x6c5e] != 0x5a || loaded[0x6d04] != 0x5a || loaded[0x6daa] != 0x5a {
				t.Fatal("unsaved index zero overwritten")
			}
		}
	}
}
