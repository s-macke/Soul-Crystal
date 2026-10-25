package main

import (
	"os"
	"path/filepath"
	"testing"
)

func TestCorrectionRejectsChangedSource(t *testing.T) {
	rules := []englishCorrection{{Target: "B1:121", Before: "Good, finished.", After: "Good, locked.", Count: 1, Reason: "lock"}}
	if _, err := correctedEnglishText(rules, "B1:121", "Changed original text"); err == nil {
		t.Fatal("source drift must fail")
	}
	if _, err := correctedEnglishText(rules, "B1:121", "Good, finished. Good, finished."); err == nil {
		t.Fatal("unexpected duplicate must fail")
	}
	text, err := correctedEnglishText(rules, "B2:121", "Good, finished.")
	if err != nil || text != "Good, finished." {
		t.Fatal("correction escaped its target")
	}
}

func TestReviewedEnglishCorrections(t *testing.T) {
	root, err := filepath.Abs("../../..")
	if err != nil {
		t.Fatal(err)
	}
	rules, err := readEnglishCorrections(root)
	if err != nil {
		t.Fatal(err)
	}
	for _, side := range []string{"B1", "B2", "C1", "C2"} {
		got, err := correctedEnglishText(rules, side+":121", "Good, finished.")
		if err != nil || got != "Good, locked." {
			t.Fatalf("%s lock correction: %q, %v", side, got, err)
		}
	}
	for target, want := range map[string]string{"object:5": "Leather pouch"} {
		got, err := correctedEnglishText(rules, target, "Leather socks")
		if err != nil || got != want {
			t.Fatal(got, err)
		}
	}
	for _, name := range []string{"story", "diary"} {
		raw, err := os.ReadFile(filepath.Join(root, "texts/C64_en", name+".txt"))
		if err != nil {
			t.Fatal(err)
		}
		if _, err = correctedEnglishText(rules, name, string(raw)); err != nil {
			t.Fatal(err)
		}
	}
}
