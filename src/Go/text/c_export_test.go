package main

import (
	"bytes"
	"os"
	"os/exec"
	"path/filepath"
	"strconv"
	"strings"
	"testing"
)

func TestCompiledCTexts(t *testing.T) {
	for _, language := range []string{"de", "en"} {
		t.Run(language, func(t *testing.T) { compiledCTexts(t, language) })
	}
}
func compiledCTexts(t *testing.T, language string) {
	root, err := filepath.Abs("../../..")
	if err != nil {
		t.Fatal(err)
	}
	dir := t.TempDir()
	// Dump actual linked C strings, including all ordinary routed messages.
	harness := `#include "game_texts.h"
#include <stdio.h>
static void emit(const char *s) { if(s) fputs(s,stdout); putchar(0); }
int main(void) {
 emit(GameIntroText); emit(GameDiaryText);
 for(unsigned p=1;p<=4;p++) {
  for(unsigned r=0;r<GameTextRecordCount(p);r++) emit(GameTextRecord(p,r));
  for(unsigned id=0;id<=636;id++) { GameText t=GameTextLookup(p,id); printf("%d:",t.kind); emit(t.text); }
 }
 if(GameTextRecord(0,0)||GameTextRecord(5,0)||GameTextRecord(1,312)) return 1;
 if(GameTextLookup(0,1).kind!=TextUnavailable||GameTextLookup(5,1).kind!=TextUnavailable||GameTextLookup(1,637).kind!=TextUnavailable) return 2;
 return 0;
}`
	stem := "game_texts"
	if language == "en" {
		stem = "game_texts_en"
		harness = strings.NewReplacer("game_texts.h", "game_texts_en.h", "GameIntroText", "GameEnglishIntroText", "GameDiaryText", "GameEnglishDiaryText", "GameTextRecordCount", "GameEnglishTextRecordCount", "GameTextRecord", "GameEnglishTextRecord", "GameTextLookup", "GameEnglishTextLookup").Replace(harness)
	}
	source := filepath.Join(dir, "test.c")
	if err := os.WriteFile(source, []byte(harness), 0600); err != nil {
		t.Fatal(err)
	}
	exe := filepath.Join(dir, "test")
	cmd := exec.Command("clang", "-std=c11", "-pedantic-errors", "-I"+root, "-I"+filepath.Join(root, "out"), source, filepath.Join(root, "out/"+stem+".c"), "-o", exe)
	if b, err := cmd.CombinedOutput(); err != nil {
		t.Fatalf("compile: %v\n%s", err, b)
	}
	got, err := exec.Command(exe).Output()
	if err != nil {
		t.Fatal(err)
	}
	var want bytes.Buffer
	documents := []string{"texts/C64/story.txt", "data/tagebuch.txt"}
	if language == "en" {
		documents = []string{"texts/C64_en/story.txt", "texts/C64_en/diary.txt"}
	}
	for _, path := range documents {
		data, err := os.ReadFile(filepath.Join(root, path))
		if err != nil {
			t.Fatal(err)
		}
		want.WriteString(strings.ReplaceAll(string(data), "\r\n", "\n"))
		want.WriteByte(0)
	}
	for side, disk := range knownRanges {
		path := disk.path
		if language == "en" {
			path = "data/c64_en/SoulCrystal" + disk.name + ".d64"
		}
		raw, err := os.ReadFile(filepath.Join(root, path))
		if err != nil {
			t.Fatal(err)
		}
		records := make([]string, disk.lastIdx+1)
		for i := range records {
			lines, err := decodeScreen(raw, i)
			if err != nil {
				t.Fatal(err)
			}
			records[i] = strings.Join(strings.Fields(strings.Join(lines, "\n")), " ")
			want.WriteString(records[i])
			want.WriteByte(0)
		}
		tail := int(raw[0x2fa]) + 256*int(raw[0x2fb])
		for id := 0; id <= 636; id++ {
			kind, text := 0, ""
			if id == 0 {
				kind = 1
			} else if id == 1 || id == 2 || id == 8 || id == 12 {
				kind = 3
			} else if r, ok := route(id, side+1, tail); ok {
				kind = 2
				text = records[r]
			}
			want.WriteString(strconv.Itoa(kind) + ":" + text)
			want.WriteByte(0)
		}
	}
	if !bytes.Equal(got, want.Bytes()) {
		t.Fatal("compiled C text or routing differs from original disks")
	}
}
