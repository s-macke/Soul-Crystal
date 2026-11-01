#!/usr/bin/env python3
"""Check extracted command IDs against the English game's native 6502 routine.
Usage: python3 src/Python/check_c64_en_vocabulary.py /tmp/soul-c64-en
Run from the repository root, after rebuilding/executing extract_vocabulary.cpp.
"""
import json
from pathlib import Path
import sys
sys.dont_write_bytecode = True
from extract_c64_en_intro import run


def main():
    source = Path(sys.argv[1])
    data = (source / 'A2_seq10.bin').read_bytes()
    assert int.from_bytes(data[:2], 'little') == 0x0a00
    ram = bytearray(65536)
    ram[0xa00:0xa00 + len(data) - 2] = data[2:]
    assert ram[0x42d1:0x42d4] == bytes.fromhex('ad0096')
    directory = Path('texts/C64_en/original')
    verbs = json.loads((directory / 'verbs.json').read_text())['commands']
    assert {v['command_id'] for v in verbs} == set(range(1, 45)) - {25, 26}
    for verb in verbs:
        m = bytearray(ram)
        m[0x9600] = verb['frontend_code']
        m[0x9601] = m[0x9602] = 1  # Valid objects: only command conversion is tested.
        run(m, 0x42d1, 0x4433)
        actual = int.from_bytes(m[0x6986:0x6988], 'little')
        assert actual == verb['command_id'], (verb, actual)
    objects = json.loads((directory / 'objects.json').read_text())['objects']
    assert [o['id'] for o in objects] == list(range(1, 166))
    names = {o['id']: o['name'] for o in objects}
    symbols = {o['id']: o['symbol'] for o in objects}
    assert symbols[7] == 'GAESTEBETT' and symbols[8] == 'BETT1' and symbols[9] == 'BETT2'
    assert next(v for v in verbs if v['command_id'] == 38)['symbol'] == 'NIMM'
    assert names[1] == 'Adventurer' and names[45] == 'Diary'
    assert names[163] == 'Dave' and names[164] == 'Zargon'
    labels = {v['command_id']: v['label'] for v in verbs}
    assert labels[38] == 'TAKE' and labels[42] == 'GIV'
    assert labels[2] == 'COMPACT' and labels[22] == 'VERBOSE'
    # Deliberately retain the original MUSIC / SID TYPE IDs, not enum-name guesses.
    assert labels[18] == 'MUSIC' and labels[17] == 'SID TYPE'
    print('42 command IDs verified against native English code; object and label checks passed.')


if __name__ == '__main__':
    main()
