package main

import (
	"encoding/json"
	"fmt"
	"os"
	"path/filepath"
	"strconv"
	"strings"
)

// Native evidence is separate from edited prose. Only the exporter reads JSON;
// the game continues to link ordinary C strings.
var englishAuxiliary = []struct{ file, list, field, key, prefix string }{
	{"objects", "objects", "name", "id", "object:"},
	{"verbs", "commands", "label", "command_id", "verb:"},
	{"frontend_labels", "labels", "label", "address", "frontend:"},
	{"engine_texts", "records", "text", "address", "engine:"},
}

func englishAuxiliaryTexts(root string) (map[string]string, error) {
	result := map[string]string{}
	for _, spec := range englishAuxiliary {
		var doc map[string]interface{}
		data, err := os.ReadFile(filepath.Join(root, "texts/C64_en/original", spec.file+".json"))
		if err != nil {
			return nil, err
		}
		if err = json.Unmarshal(data, &doc); err != nil {
			return nil, err
		}
		for _, value := range doc[spec.list].([]interface{}) {
			row := value.(map[string]interface{})
			result[spec.prefix+fmt.Sprint(row[spec.key])] = row[spec.field].(string)
		}
	}
	return result, nil
}

func exportReviewedEnglish(root string, catalogs []Catalog, intro, diary []byte) error {
	dir := filepath.Join(root, "texts/C64_en")
	for _, cat := range catalogs {
		if err := writeJSON(filepath.Join(dir, cat.Side+".json"), cat); err != nil {
			return err
		}
		var md strings.Builder
		fmt.Fprintf(&md, "# %s · Reviewed English texts\n\nEdited prose; IDs and original screen lines are preserved in JSON. Native extraction: [original/%s.md](original/%s.md).\n\n", cat.Side, cat.Side, cat.Side)
		for i := 0; i < len(cat.Records); i++ {
			fmt.Fprintf(&md, "## %03d\n\n%s\n\n", i, cat.Records[strconv.Itoa(i)].Text)
		}
		if err := os.WriteFile(filepath.Join(dir, cat.Side+".md"), []byte(md.String()), 0644); err != nil {
			return err
		}
	}
	for name, data := range map[string][]byte{"story": intro, "diary": diary} {
		if err := os.WriteFile(filepath.Join(dir, name+".txt"), data, 0644); err != nil {
			return err
		}
	}
	var story map[string]interface{}
	data, err := os.ReadFile(filepath.Join(dir, "original/story.json"))
	if err != nil {
		return err
	}
	if err = json.Unmarshal(data, &story); err != nil {
		return err
	}
	pages := strings.Split(string(intro), "[Page ")[1:]
	rows := story["pages"].([]interface{})
	if len(pages) != len(rows) {
		return fmt.Errorf("reviewed intro page count changed")
	}
	for i, p := range pages {
		row := rows[i].(map[string]interface{})
		row["text"] = strings.TrimSpace(strings.SplitN(p, "]", 2)[1])
	}
	story["edition"] = "Reviewed English prose; screen_lines retain native evidence."
	if err = writeJSON(filepath.Join(dir, "story.json"), story); err != nil {
		return err
	}
	rules, err := readEnglishCorrections(root)
	if err != nil {
		return err
	}
	for _, spec := range englishAuxiliary {
		var doc map[string]interface{}
		data, err := os.ReadFile(filepath.Join(dir, "original", spec.file+".json"))
		if err != nil {
			return err
		}
		if err = json.Unmarshal(data, &doc); err != nil {
			return err
		}
		var md strings.Builder
		fmt.Fprintf(&md, "# Reviewed English %s\n\n| ID | English |\n| --- | --- |\n", spec.file)
		for _, value := range doc[spec.list].([]interface{}) {
			row := value.(map[string]interface{})
			before := row[spec.field].(string)
			after, err := correctedEnglishText(rules, spec.prefix+fmt.Sprint(row[spec.key]), before)
			if err != nil {
				return err
			}
			row[spec.field] = after
			if before != after {
				row["original_"+spec.field] = before
			}
			fmt.Fprintf(&md, "| %v | %s |\n", row[spec.key], strings.ReplaceAll(after, "|", "\\|"))
		}
		doc["edition"] = "Reviewed English; native extraction is in original/."
		if err = writeJSON(filepath.Join(dir, spec.file+".json"), doc); err != nil {
			return err
		}
		if spec.file == "objects" || spec.file == "verbs" {
			if err = os.WriteFile(filepath.Join(dir, spec.file+".md"), []byte(md.String()), 0644); err != nil {
				return err
			}
		}
	}
	return nil
}
