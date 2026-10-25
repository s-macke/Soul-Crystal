package main

import (
	"encoding/binary"
	"os"
	"os/exec"
	"path/filepath"
	"testing"
)

// Compare the linked production C++ SPECIAL implementation with original 6502
// execution. The native harness is test-only; the application contains no VM.
func TestConsolePredicatesAgainstNative(t *testing.T) {
	root, e := filepath.Abs("../../..")
	if e != nil {
		t.Fatal(e)
	}
	dir := t.TempDir()
	objects := []string{}
	for _, name := range []string{"parta", "partb", "partc", "partd", "game_state", "game_tables", "game_texts", "game_texts_en"} {
		obj := filepath.Join(dir, name+".o")
		objects = append(objects, obj)
		cmd := exec.Command("clang", "-std=c11", "-O1", "-I"+filepath.Join(root, "out"), "-c", filepath.Join(root, "out", name+".c"), "-o", obj)
		if b, e := cmd.CombinedOutput(); e != nil {
			t.Fatalf("compile: %v\n%s", e, b)
		}
	}
	harness := `extern "C" {
#include "game_script.h"
}
#include <cstdio>
static void emit(unsigned op) { SPECIAL(op); std::putchar(temp); }
int main() {
 for(unsigned c=0;c<65536;++c) { command=c;emit(0x66); }
 const unsigned ids[]={JEANS,TSHIRT,TURNSCHUHE,HOSE,BAUMWOLLHEMD,FELLSTIEFEL,BADEHOSE};
 for(unsigned v=0;v<2187;++v) {
  unsigned n=v;for(auto id:ids){objectState[id]=n%3;n/=3;}
  emit(0x64);emit(0x65);
  for(unsigned coat:{0u,1u,2u,255u}){objectState[PURPURMANTEL]=coat;emit(0x67);}
 }
 for(unsigned r=0;r<256;++r){currentRoom=r;emit(0x68);emit(0x69);emit(0x6a);emit(0x6b);}
 for(unsigned o=0;o<65536;++o){object2=o;for(unsigned state=0;state<3;++state){objectState[BIENENSTOCK]=state;emit(0x6c);}}
}
`
	// Range-for over an initializer list needs this standard header explicitly.
	harness = "#include <initializer_list>\n" + harness
	path := filepath.Join(dir, "probe.cpp")
	if e := os.WriteFile(path, []byte(harness), 0600); e != nil {
		t.Fatal(e)
	}
	exe := filepath.Join(dir, "probe")
	args := []string{"-std=c++17", "-O1", "-I" + filepath.Join(root, "out"), path, filepath.Join(root, "src/console/game.cpp")}
	args = append(args, objects...)
	args = append(args, "-o", exe)
	if b, e := exec.Command("clang++", args...).CombinedOutput(); e != nil {
		t.Fatalf("link: %v\n%s", e, b)
	}
	got, e := exec.Command(exe).Output()
	if e != nil {
		t.Fatal(e)
	}
	m := mustRead(filepath.Join(root, "opcodeoracle/soul_crystal/soul_crystal_origin_0x0000.bin"))
	pos := 0
	compare := func(entry int) {
		want := nativePredicate(t, m, entry)
		if pos >= len(got) || uint16(got[pos]) != want {
			t.Fatalf("native/C++ mismatch at %04x sample %d", entry, pos)
		}
		pos++
	}
	for c := 0; c < 65536; c++ {
		binary.LittleEndian.PutUint16(m[0x6986:], uint16(c))
		compare(0x324f)
	}
	for v := 0; v < 2187; v++ {
		n := v
		for _, a := range []int{0x6d51, 0x6d93, 0x6d82, 0x6d98, 0x6d81, 0x6d18, 0x6d9b} {
			m[a] = byte(n % 3)
			n /= 3
		}
		compare(0x305c)
		compare(0x31ab)
		for _, coat := range []byte{0, 1, 2, 255} {
			m[0x6d97] = coat
			compare(0x3317)
		}
	}
	for r := 0; r < 256; r++ {
		m[0x695d] = byte(r)
		for _, entry := range []int{0x33da, 0x347e, 0x35bb, 0x362d} {
			compare(entry)
		}
	}
	for o := 0; o < 65536; o++ {
		binary.LittleEndian.PutUint16(m[0x698a:], uint16(o))
		for s := 0; s < 3; s++ {
			m[0x6d0f] = byte(s)
			compare(0x364c)
		}
	}
	if pos != len(got) {
		t.Fatalf("unexpected trailing bytes: %d", len(got)-pos)
	}
}
