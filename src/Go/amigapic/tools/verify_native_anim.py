"""Optional machine68k 0.4.1 oracle; first run TestAnimationFrames with
SOUL_ANIM_NATIVE_DUMP=/tmp/soul-anim-raw. Base composition is shared input.
"""
from pathlib import Path
import struct,hashlib,json
import machine68k as m
root=Path(__file__).resolve().parents[4]
ma=m.Machine(m.CPUType.M68000,2048)
class Done(Exception):pass
def hook(pc):
 if pc==0x800: raise Done()
ma.cpu.set_instr_hook_callback(hook)
ma.mem.w16(0x800,0x4e71)
def run(pc,regs):
 ma.cpu.w_sr(0x2700);ma.cpu.w_sp(0x1f0000);ma.mem.w32(0x1f0000,0x800)
 for reg,value in regs.items():ma.cpu.w_reg(reg,value)
 ma.cpu.w_pc(pc)
 try:ma.cpu.execute(50000000)
 except Done:return
 raise RuntimeError('routine did not return')
k=(root/'data/Amiga/extracted/Disk 1/Code/Kernal').read_bytes();ma.mem.w_block(0x1000,k)
def record(b,pos):
 n,s=struct.unpack_from('>II',b,pos);pos+=8
 if not n:return None,pos
 packed=b[pos:pos+s];pos+=s
 if n==s:return packed,pos
 ma.mem.w_block(0x30000,packed);ma.mem.clear_block(0x60000,n,0)
 run(0x1000,{m.Register.A0:0x30000,m.Register.D0:s,m.Register.A3:0x60000})
 return bytes(ma.mem.r_block(0x60000,n)),pos
oracle={};total=0
for path in sorted((root/'data/Amiga/extracted').glob('*/Data/Graphic/*.ANIM')):
 victory=path.name=='Victory.ANIM';b=path.read_bytes();pos=0
 for _ in range(4 if victory else 2):raw,pos=record(b,pos)
 if victory:_,pos=record(b,pos)
 exe=root/f'data/Amiga/extracted/Disk {4 if victory else 1}/Code/{"Endpart" if victory else "Intro"}'
 code=exe.read_bytes()[32:];ma.mem.w_block(0x10000,code)
 # Base composition is a shared input, not claimed independently emulated.
 base=(Path('/tmp/soul-anim-raw')/path.name/'000.bin').read_bytes()
 buffers=[bytearray(base),bytearray(base)];hashes=[hashlib.sha256(base).hexdigest()];i=0
 while struct.unpack_from('>I',b,pos)[0]:
  delta,pos=record(b,pos);ma.mem.w_block(0x80000,bytes(buffers[i%2]));ma.mem.w_block(0x40000,delta)
  run(0x10000+(0xeae if victory else 0xc7a),{m.Register.A0:0x80000,m.Register.A1:0x40000})
  result=bytes(ma.mem.r_block(0x80000,len(base)));buffers[i%2][:]=result;i+=1
  want=(Path('/tmp/soul-anim-raw')/path.name/f'{i:03d}.bin').read_bytes()
  assert result==want,(path.name,i)
  hashes.append(hashlib.sha256(result).hexdigest());total+=1
 oracle[path.name]=hashes;print(path.name,i,'native delta frames match',flush=True)
(root/'src/Go/amigapic/testdata/native_anim_frames_sha256.json').write_text(json.dumps(oracle,indent=2)+'\n')
print(total,'native delta frames matched')
