#!/usr/bin/env python3
"""Extract the eight English C64 intro pages from A2 chain 11.

Offline, bounded execution of the unpacker and page renderer only. This is not
an emulator for playing the game: no VIC timing, interrupts, ROM or banking.
Only the known PRG is accepted; unsupported instructions and timeouts fail.
Uses Python standard library only. See texts/C64_en/README.md for commands.
"""
import argparse
import hashlib
import json
from pathlib import Path
import struct
import zlib


def run(m, pc, stop, sp=255):
 a=x=y=0
 p=0x24
 def fetch():
  nonlocal pc
  v=m[pc];pc=(pc+1)&65535;return v
 def word():
  lo=fetch();return lo|(fetch()<<8)
 def nz(v):
  nonlocal p
  v&=255;p=(p&~130)|(128 if v&128 else 0)|(2 if not v else 0);return v
 def flag(mask,on):
  nonlocal p
  p=(p|mask) if on else (p&~mask)
 def push(v):
  nonlocal sp
  m[256+sp]=v&255;sp=(sp-1)&255
 def pop():
  nonlocal sp
  sp=(sp+1)&255;return m[256+sp]
 def addr(mode):
  if mode=='imm':
   nonlocal pc
   t=pc;pc=(pc+1)&65535;return t
  if mode=='zp':return fetch()
  if mode=='zpx':return (fetch()+x)&255
  if mode=='zpy':return (fetch()+y)&255
  if mode=='abs':return word()
  if mode=='absx':return (word()+x)&65535
  if mode=='absy':return (word()+y)&65535
  if mode=='indx':
   q=(fetch()+x)&255;return m[q]|m[(q+1)&255]<<8
  if mode=='indy':
   q=fetch();return ((m[q]|m[(q+1)&255]<<8)+y)&65535
  raise Exception(mode)
 loads={0xa0:('y','imm'),0xa4:('y','zp'),0xb4:('y','zpx'),0xac:('y','abs'),0xbc:('y','absx'),0xa2:('x','imm'),0xa6:('x','zp'),0xb6:('x','zpy'),0xae:('x','abs'),0xbe:('x','absy')}
 stores={0x84:('y','zp'),0x94:('y','zpx'),0x8c:('y','abs'),0x86:('x','zp'),0x96:('x','zpy'),0x8e:('x','abs')}
 for steps in range(8000000):
  if pc == stop and steps > 0:
   return m
  old=pc;op=fetch()
  if op&31==16:
   offset=fetch();mask=[128,128,64,64,1,1,2,2][op>>5];want=bool((op>>5)&1)
   if bool(p&mask)==want:pc=(pc+(offset if offset<128 else offset-256))&65535
  elif op&3==1:
   mode=['indx','zp','imm','abs','indy','zpx','absy','absx'][(op>>2)&7];q=addr(mode);v=m[q];fn=op>>5
   if fn==0:a=nz(a|v)
   elif fn==1:a=nz(a&v)
   elif fn==2:a=nz(a^v)
   elif fn in (3,7):
    if fn==7:v^=255
    r=a+v+(p&1);flag(64, bool((~(a^v)&(a^r))&128));flag(1,r>255);a=nz(r)
   elif fn==4:m[q]=a
   elif fn==5:a=nz(v)
   elif fn==6:flag(1,a>=v);nz(a-v)
  elif op in loads:
   reg,mode=loads[op];v=nz(m[addr(mode)])
   if reg=='x':x=v
   else:y=v
  elif op in stores:
   reg,mode=stores[op];m[addr(mode)]=x if reg=='x' else y
  elif op in (0xe0,0xe4,0xec,0xc0,0xc4,0xcc):
   mode={0:'imm',4:'zp',12:'abs'}[op&15];v=m[addr(mode)];r=x if op&32 else y;flag(1,r>=v);nz(r-v)
  elif op&3==2 and op not in (0x8a,0x9a,0xaa,0xba,0xca,0xea):
   fn=op>>5;mi=(op>>2)&7
   if mi==2:q=None;v=a
   else:q=addr({1:'zp',3:'abs',5:'zpx',7:'absx'}[mi]);v=m[q]
   carry=p&1
   if fn==0:flag(1,v&128);v<<=1
   elif fn==1:flag(1,v&128);v=(v<<1)|carry
   elif fn==2:flag(1,v&1);v>>=1
   elif fn==3:flag(1,v&1);v=(v>>1)|(carry<<7)
   elif fn==6:v-=1
   elif fn==7:v+=1
   else:raise Exception(('group2',hex(old),hex(op)))
   v=nz(v)
   if q is None:a=v
   else:m[q]=v
  elif op in (0x24,0x2c):
   v=m[addr('zp' if op==0x24 else 'abs')];flag(2,not(a&v));p=(p&~192)|(v&192)
  elif op==0x4c:pc=word()
  elif op==0x6c:
   q=word();pc=m[q]|(m[(q&0xff00)|((q+1)&255)]<<8)
  elif op==0x20:
   q=word();r=(pc-1)&65535;push(r>>8);push(r);pc=q
  elif op==0x60:pc=((pop()|(pop()<<8))+1)&65535
  elif op==0x48:push(a)
  elif op==0x68:a=nz(pop())
  elif op==0x08:push(p|0x30)
  elif op==0x28:p=pop()|32
  elif op==0x40:p=pop();pc=pop()|(pop()<<8)
  elif op==0xaa:x=nz(a)
  elif op==0xa8:y=nz(a)
  elif op==0x8a:a=nz(x)
  elif op==0x98:a=nz(y)
  elif op==0xba:x=nz(sp)
  elif op==0x9a:sp=x
  elif op==0xe8:x=nz(x+1)
  elif op==0xca:x=nz(x-1)
  elif op==0xc8:y=nz(y+1)
  elif op==0x88:y=nz(y-1)
  elif op in (0x18,0x38,0x58,0x78,0xb8,0xd8,0xf8):
   mask={0x18:1,0x38:1,0x58:4,0x78:4,0xb8:64,0xd8:8,0xf8:8}[op];flag(mask,op in (0x38,0x78,0xf8))
  elif op==0xea:pass
  else:
   raise Exception(('unsupported',steps,hex(old),hex(op),hex(a),hex(x),hex(y)))
 else:raise Exception(('limit',hex(pc)))

PALETTE = [0x000000, 0xffffff, 0x880000, 0xaaffee, 0xcc44cc, 0x00cc55,
           0x0000aa, 0xeeee77, 0xdd8855, 0x664400, 0xff7777, 0x333333,
           0x777777, 0xaaff66, 0x0088ff, 0xbbbbbb]


def png(m):
    pixels = bytearray()
    for y in range(200):
        pixels.append(0)  # PNG filter: none
        for x in range(160):
            cell = (y // 8) * 40 + x // 4
            screen = m[0x400 + cell]
            colors = [0, screen >> 4, screen & 15, m[0xd800 + cell] & 15]
            bits = m[0x2000 + cell * 8 + y % 8]
            rgb = PALETTE[colors[(bits >> (6 - 2 * (x % 4))) & 3]]
            pixels.extend(rgb.to_bytes(3, 'big') * 2)
    def chunk(kind, payload):
        return (struct.pack('>I', len(payload)) + kind + payload +
                struct.pack('>I', zlib.crc32(kind + payload)))
    return (b'\x89PNG\r\n\x1a\n' +
            chunk(b'IHDR', struct.pack('>IIBBBBB', 320, 200, 8, 2, 0, 0, 0)) +
            chunk(b'IDAT', zlib.compress(pixels)) + chunk(b'IEND', b''))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('prg', type=Path)
    parser.add_argument('--images', type=Path, default=Path('images/C64_en/story'))
    parser.add_argument('--texts', type=Path, default=Path('texts/C64_en/original'))
    args = parser.parse_args()
    data = args.prg.read_bytes()
    digest = hashlib.sha256(data).hexdigest()
    if digest != '056914a72c113ddd241483fb0f3f3346868ebdcf31175ab97074b55f1b0f2da9':
        raise ValueError('Unexpected A2 chain 11: unsupported intro version')
    load = int.from_bytes(data[:2], 'little')
    ram = bytearray(65536)
    ram[load:load + len(data) - 2] = data[2:]
    ram[1] = 0x37
    ram = run(ram, load, 0x2080)
    args.images.mkdir(parents=True, exist_ok=True)
    args.texts.mkdir(parents=True, exist_ok=True)
    pages = []
    for page in range(8):
        # 1 KB per page: 1000 screen codes, then illustration placement triples.
        start = 0x4000 + page * 1024
        raw = ram[start:start + 1000]
        def char(c):
            if 1 <= c <= 26:
                return chr(c + 96)
            if 32 <= c <= 90:
                return chr(c)
            raise ValueError(f'Unknown story character ${c:02x}')
        lines = [''.join(map(char, raw[i:i + 40])) for i in range(0, 1000, 40)]
        pages.append({'page': page + 1, 'image': f'story{page}.png',
                      'screen_lines': lines})
        m = bytearray(ram)
        m[0x1e], m[0x1f] = start & 255, start >> 8
        # Call original page composition routine, returning to sentinel $ffff.
        m[0x1fe], m[0x1ff] = 0xfe, 0xff
        m = run(m, 0x1299, 0xffff, sp=253)
        (args.images / f'story{page}.png').write_bytes(png(m))
    # Title is part of the illustration, not the screen-code text layer.
    text = 'THE STORY\n\n'
    for page in pages:
        lines = [line.strip() for line in page['screen_lines']]
        text += f"[Page {page['page']}]\n\n" + '\n'.join(lines).strip() + '\n\n'
    (args.texts / 'story.txt').write_text(text.rstrip() + '\n', encoding='utf-8')
    catalog = {'source': 'data/c64_en/SoulCrystalA2.d64', 'chain': 11,
               'prg_sha256': digest, 'title': 'THE STORY', 'pages': pages}
    (args.texts / 'story.json').write_text(json.dumps(catalog, indent=2) + '\n', encoding='utf-8')
    print('Extracted eight intro images and text pages.')


if __name__ == '__main__':
    main()
