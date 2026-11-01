#!/usr/bin/env python3
"""Merge the complete English editorial review into source-checked export rules."""
import json
from pathlib import Path
ROOT = Path(__file__).resolve().parents[2]
TEXTS = ROOT / 'texts/C64_en'
SIDES = ('B1', 'B2', 'C1', 'C2')

def read(path):
    return json.loads(path.read_text())

def main():
    raw = {side: read(TEXTS / 'original' / (side + '.json')) for side in SIDES}
    german = {side: read(ROOT / 'texts/C64' / (side + '.json')) for side in SIDES}
    sources = {f'{s}:{i}': r['text'] for s, cat in raw.items() for i, r in cat['records'].items()}
    for name in ('story', 'diary'):
        sources[name] = (TEXTS / 'original' / (name + '.txt')).read_text()
    for file, rows, key, field, prefix in (
        ('objects','objects','id','name','object'), ('verbs','commands','command_id','label','verb'),
        ('frontend_labels','labels','address','label','frontend'), ('engine_texts','records','address','text','engine')):
        for row in read(TEXTS / 'original' / (file + '.json'))[rows]:
            sources[f'{prefix}:{row[key]}'] = row[field]
    edits = {}
    reviewed = {}
    for file in ('review-b.json','review-d.json','review-a-c.json','review-documents.json'):
        doc = read(TEXTS / file)
        reviewed.update(doc['reviewed'])
        for item in doc['replacements']:
            assert item['target'] in sources, item['target']
            edits[item['target']] = item
    for side in SIDES:
        assert sorted(reviewed[side]) == list(range(len(raw[side]['records']))), side
    # A/C is the agreed canonical wording for shared records. Match by German
    # meaning, never by record number alone (the side-specific sections differ).
    common = {}
    for item in read(TEXTS / 'review-a-c.json')['replacements']:
        side, index = item['target'].split(':')
        common[german[side]['records'][index]['text']] = item
    for side in SIDES:
        for index, record in german[side]['records'].items():
            if record['text'] in common:
                item = common[record['text']]
                edits[f'{side}:{index}'] = {**item, 'target': f'{side}:{index}'}
    prior = read(TEXTS / 'corrections.json')
    rules = [r for r in prior['corrections'] if r['target'] not in edits]
    for target, item in sorted(edits.items()):
        before = sources[target]
        if before != item['text']:
            rules.append({'target': target, 'before': before, 'after': item['text'], 'count': 1, 'reason': item['reason']})
    (TEXTS / 'corrections.json').write_text(json.dumps({'schema_version': 1,
        'source': 'Complete English editorial review against German C64 texts. Native evidence is in original/.',
        'corrections': rules}, ensure_ascii=False, indent=2) + '\n')
    counts = {s: sum(r['target'].startswith(s+':') for r in rules) for s in SIDES}
    report = {'reviewed':reviewed,'archive_records_reviewed':sum(len(raw[s]['records']) for s in SIDES),
              'changed_archive_records':counts,'correction_rules':len(rules),
              'shared_text_policy':'Canonical A/C wording propagated only for identical German source text.'}
    (TEXTS / 'review-coverage.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
    print(report['archive_records_reviewed'], 'archive records reviewed;',counts, ';',len(rules),'rules')

if __name__ == '__main__':
    main()
