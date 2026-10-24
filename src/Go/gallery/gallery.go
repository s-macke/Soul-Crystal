// Package gallery writes a standalone, offline PNG gallery.
package gallery

import (
	"fmt"
	"html/template"
	"image"
	_ "image/png"
	"os"
	"path/filepath"
	"sort"
	"strings"
)

type Picture struct {
	Name, Path    string
	Width, Height int
}
type Group struct {
	Name     string
	Pictures []Picture
}
type Page struct {
	Title, Note string
	Groups      []Group
	Count       int
}

// Write scans immediate group folders. PNG files retain their native pixels;
// optional doubled height is a viewing aid, not a measured monitor correction.
func Write(root, title, note string) error {
	page := Page{Title: title, Note: note}
	dirs, err := os.ReadDir(root)
	if err != nil {
		return err
	}
	for _, dir := range dirs {
		if !dir.IsDir() {
			continue
		}
		group := Group{Name: dir.Name()}
		paths, err := filepath.Glob(filepath.Join(root, dir.Name(), "*.png"))
		if err != nil {
			return err
		}
		sort.Slice(paths, func(i, j int) bool { return natural(paths[i]) < natural(paths[j]) })
		for _, path := range paths {
			f, err := os.Open(path)
			if err != nil {
				return err
			}
			cfg, _, err := image.DecodeConfig(f)
			f.Close()
			if err != nil {
				return err
			}
			group.Pictures = append(group.Pictures, Picture{filepath.Base(path), filepath.ToSlash(filepath.Join(dir.Name(), filepath.Base(path))), cfg.Width, cfg.Height})
		}
		if len(group.Pictures) > 0 {
			page.Groups = append(page.Groups, group)
			page.Count += len(group.Pictures)
		}
	}
	t, err := template.New("gallery").Parse(pageHTML)
	if err != nil {
		return err
	}
	f, err := os.Create(filepath.Join(root, "index.html"))
	if err != nil {
		return err
	}
	if err = t.Execute(f, page); err != nil {
		f.Close()
		return err
	}
	return f.Close()
}

func natural(s string) string {
	var b strings.Builder
	for i := 0; i < len(s); {
		if s[i] < '0' || s[i] > '9' {
			b.WriteByte(s[i])
			i++
			continue
		}
		j := i
		for j < len(s) && s[j] >= '0' && s[j] <= '9' {
			j++
		}
		fmt.Fprintf(&b, "%020s", s[i:j])
		i = j
	}
	return b.String()
}

const pageHTML = `<!doctype html>
<html lang="en"><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>{{.Title}}</title>
<style>
:root{color-scheme:dark}body{font:16px system-ui;margin:2rem;background:#151820;color:#eee}a{color:#9cd4ff}nav{display:flex;gap:1rem;flex-wrap:wrap;margin:1.5rem 0}p{max-width:85ch;line-height:1.6}.grid{display:flex;flex-wrap:wrap;gap:1rem;align-items:flex-start}figure{margin:0;padding:12px;background:#242936;border-radius:8px;max-width:100%;overflow:auto}img{image-rendering:pixelated;display:block;width:calc(var(--w)*1px);height:calc(var(--h)*1px)}body.tall img{height:calc(var(--h)*2px)}figcaption{font:13px monospace;margin-top:10px;color:#c1cad8}h2{margin-top:2rem}button{padding:.6rem 1rem;cursor:pointer}
</style>
<h1>{{.Title}}</h1><p>{{.Note}}</p><p>{{.Count}} images. Original PNG dimensions are preserved. The height toggle is an optional viewing aid.</p>
<button type="button" onclick="document.body.classList.toggle('tall');this.setAttribute('aria-pressed',document.body.classList.contains('tall'))" aria-pressed="false">Double display height</button>
<nav>{{range .Groups}}<a href="#{{.Name}}">{{.Name}} ({{len .Pictures}})</a>{{end}}</nav>
{{range .Groups}}<section id="{{.Name}}"><h2>{{.Name}}</h2><div class="grid">{{range .Pictures}}<figure><a href="{{.Path}}"><img loading="lazy" src="{{.Path}}" alt="{{.Name}}" width="{{.Width}}" height="{{.Height}}" style="--w:{{.Width}};--h:{{.Height}}"></a><figcaption>{{.Name}} · {{.Width}} × {{.Height}}</figcaption></figure>{{end}}</div></section>{{end}}
</html>
`
