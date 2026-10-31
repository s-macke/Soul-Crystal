#!/usr/bin/env python3
"""Extract the twelve story panels and prepare correctly proportioned references."""
from pathlib import Path
import json, subprocess
root=Path(__file__).resolve().parent
repo=root.parent.parent
common=json.loads((root/'prompts/remaining.json').read_text())['common']
scenes=[]
# Source rectangles in original 640x200 stored pixels, before vertical correction.
rects=[[(0,0,240,58),(400,70,240,58),(0,140,240,58)],[(400,0,240,58),(0,70,240,58),(400,140,240,58)],[(0,0,240,58),(400,70,240,58),(0,140,240,58)],[(400,0,240,58),(0,70,240,58),(400,140,240,58)]]
titles=['Buch und Kerzen','Gepackte Koffer','Abschied am Zug','Paar vor einem Schaufenster','Die Eltern','Gespräch auf dem Sofa','See und Berge','An der Bar','Eintrag ins Gästebuch','Armbanduhr','Zimmerschlüssel','Schottland am Abend']
for page,items in enumerate(rects,1):
 for panel,(x,y,w,h) in enumerate(items,1):
  ident=f'Story{page}-{panel:02d}';source=f'images/Amiga/Disk 1/Story{page}.png';inp=root/'inputs'/f'{ident}.png'
  subprocess.run(['magick',str(repo/source),'-crop',f'{w}x{h}+{x}+{y}','+repage','-sample',f'{w}x{h*2}!',str(inp)],check=True)
  prompt=common.replace('352x64 to 352x128',f'{w}x{h} to {w}x{h*2}').replace('2.75:1 image, target 2112x768 pixels',f'{w/(h*2):.6f}:1 image, target 2048x990 pixels')
  prompt+='Faithfully preserve this small illustration from the intro, including every depicted person and object. Keep only the panel artwork; do not add story paragraphs, invented words or decorative borders. If the first panel has the heading DIE STORY, retain that heading exactly.'
  scenes.append(dict(id=ident,disk=1,title=titles[len(scenes)],source=source,crop=[x,y,w,h],vertical_scale=2,input_width=w,input_height=h*2,prompt=prompt))
for ident,disk,source,scale in [('Title',1,'images/Amiga/Disk 1/Title.png',2),('Victory-000',4,'images/Amiga/Disk 4/animations/Victory/Victory-000.png',1),('Victory-015',4,'images/Amiga/Disk 4/animations/Victory/Victory-015.png',1)]:
 w,h=(640,200) if ident=='Title' else (320,200)
 subprocess.run(['magick',str(repo/source),'-sample',f'{w}x{h*scale}!',str(root/'inputs'/f'{ident}.png')],check=True)
 prompt=common.replace('352x64 to 352x128',f'{w}x{h} to {w}x{h*scale}').replace('2.75:1 image, target 2112x768 pixels','1.6:1 image, target 1920x1200 pixels')
 if scale==1:prompt=prompt.replace('using nearest-neighbor vertical doubling','with no shape correction because this is a low-resolution Amiga frame')
 prompt+=('Preserve the large SOUL CRYSTAL title lettering exactly, its interlocking ornate gold and cyan shapes, the magical cyan portal, wooden boards, character and eyes on the black background. Keep existing small logos, do not add text.' if ident=='Title' else 'Preserve the castle gate, exact state of the doors and portcullis, stone passage and distant landscape. Preserve the words The End exactly if present; do not add them if absent.')
 scenes.append(dict(id=ident,disk=disk,title=ident,source=source,vertical_scale=scale,input_width=w,input_height=h*scale,prompt=prompt))
(root/'prompts/extras.json').write_text(json.dumps({'scenes':scenes},ensure_ascii=False,indent=2)+'\n')
print('Prepared',len(scenes),'intro/title/victory references')
