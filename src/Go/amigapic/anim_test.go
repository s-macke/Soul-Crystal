package main

import (
	"crypto/sha256"
	"encoding/json"
	"fmt"
	"os"
	"path/filepath"
	"testing"
)

func TestAnimationFrames(t *testing.T) {
	paths, _ := filepath.Glob("../../../data/Amiga/extracted/*/Data/Graphic/*.ANIM")
	if len(paths) != 13 {
		t.Fatalf("got %d ANIM files", len(paths))
	}
	var oracle map[string][]string
	data, err := os.ReadFile("testdata/native_anim_frames_sha256.json")
	if err != nil {
		t.Fatal(err)
	}
	if err = json.Unmarshal(data, &oracle); err != nil {
		t.Fatal(err)
	}
	if len(oracle) != len(paths) {
		t.Fatal("native oracle does not cover all animations")
	}
	for _, path := range paths {
		t.Run(filepath.Base(path), func(t *testing.T) {
			a, err := decodeAnim(path)
			if err != nil {
				t.Fatal(err)
			}
			if len(a.frames) < 2 {
				t.Fatal("no animation")
			}
			if out := os.Getenv("SOUL_ANIM_NATIVE_DUMP"); out != "" {
				dir := filepath.Join(out, filepath.Base(path))
				if err = os.MkdirAll(dir, 0755); err != nil {
					t.Fatal(err)
				}
				for i, raw := range a.raw {
					if err = os.WriteFile(filepath.Join(dir, fmt.Sprintf("%03d.bin", i)), raw, 0644); err != nil {
						t.Fatal(err)
					}
				}
			}
			if oracle != nil {
				want := oracle[filepath.Base(path)]
				if len(want) != len(a.raw) {
					t.Fatal("frame count differs from native oracle")
				}
				for i, raw := range a.raw {
					if fmt.Sprintf("%x", sha256.Sum256(raw)) != want[i] {
						t.Fatalf("native mismatch frame %d", i)
					}
				}
			}
		})
	}
}
func TestInvalidAnimationDelta(t *testing.T) {
	for _, b := range [][]byte{nil, make([]byte, 15), append([]byte{0, 0, 255, 255}, make([]byte, 60)...)} {
		if applyAnimDelta(make([]byte, 32000), b, 40) == nil {
			t.Fatal("accepted invalid delta")
		}
	}
}
