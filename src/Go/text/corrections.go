package main

// Corrections are applied only while generating the English C assets. The raw
// disk/PDF exports remain immutable evidence; C/C++ never reads this JSON.
import (
	"encoding/json"
	"fmt"
	"os"
	"path/filepath"
	"strconv"
	"strings"
)

type englishCorrection struct {
	Target string `json:"target"`
	Before string `json:"before"`
	After  string `json:"after"`
	Count  int    `json:"count"`
	Reason string `json:"reason"`
}

func readEnglishCorrections(root string) ([]englishCorrection, error) {
	b, err := os.ReadFile(filepath.Join(root, "texts/C64_en/corrections.json"))
	if err != nil {
		return nil, err
	}
	var data struct {
		Version     int                 `json:"schema_version"`
		Corrections []englishCorrection `json:"corrections"`
	}
	if err = json.Unmarshal(b, &data); err != nil {
		return nil, err
	}
	if data.Version != 1 {
		return nil, fmt.Errorf("unsupported English correction schema")
	}
	for _, c := range data.Corrections {
		if c.Target == "" || c.Before == "" || c.After == "" || c.Count < 1 || c.Reason == "" {
			return nil, fmt.Errorf("incomplete English correction: %+v", c)
		}
	}
	return data.Corrections, nil
}
func correctedEnglishText(corrections []englishCorrection, target, text string) (string, error) {
	for _, c := range corrections {
		if c.Target != target {
			continue
		}
		if n := strings.Count(text, c.Before); n != c.Count {
			return "", fmt.Errorf("English correction %s expected %d matches, got %d: %q", target, c.Count, n, c.Before)
		}
		text = strings.ReplaceAll(text, c.Before, c.After)
	}
	return text, nil
}
func correctEnglishAssets(root string, catalogs []Catalog, intro, diary []byte) ([]Catalog, []byte, []byte, map[int]string, error) {
	corrections, err := readEnglishCorrections(root)
	if err != nil {
		return nil, nil, nil, nil, err
	}
	texts := map[string]string{"story": string(intro), "diary": string(diary)}
	for _, cat := range catalogs {
		for key, r := range cat.Records {
			texts[cat.Side+":"+key] = r.Text
		}
	}
	var objects struct {
		Objects []struct {
			ID   int    `json:"id"`
			Name string `json:"name"`
		} `json:"objects"`
	}
	b, err := os.ReadFile(filepath.Join(root, "texts/C64_en/objects.json"))
	if err != nil {
		return nil, nil, nil, nil, err
	}
	if err = json.Unmarshal(b, &objects); err != nil {
		return nil, nil, nil, nil, err
	}
	for _, o := range objects.Objects {
		texts["object:"+strconv.Itoa(o.ID)] = o.Name
	}
	targets := map[string]bool{}
	for _, c := range corrections {
		targets[c.Target] = true
	}
	overrides := map[int]string{}
	for target := range targets {
		text, ok := texts[target]
		if !ok {
			return nil, nil, nil, nil, fmt.Errorf("unknown English correction target %s", target)
		}
		texts[target], err = correctedEnglishText(corrections, target, text)
		if err != nil {
			return nil, nil, nil, nil, err
		}
		if strings.HasPrefix(target, "object:") {
			id, _ := strconv.Atoi(strings.TrimPrefix(target, "object:"))
			overrides[id] = texts[target]
		}
	}
	// Copy so raw catalogs and their native screen_lines cannot be altered.
	corrected := append([]Catalog(nil), catalogs...)
	for i, cat := range catalogs {
		corrected[i].Records = map[string]Record{}
		for key, r := range cat.Records {
			r.Text = texts[cat.Side+":"+key]
			corrected[i].Records[key] = r
		}
	}
	return corrected, []byte(texts["story"]), []byte(texts["diary"]), overrides, nil
}
