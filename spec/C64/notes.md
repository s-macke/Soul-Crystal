
# Length of bytes after entry

- 0 bytes: $0F77
- 2 bytes: $0E11, $0F5B, $0FAB
- 3 bytes: $0CDB, $0DF0, $0DED
- 4 bytes: $0C4D, $0D1E, $0D28, $0F91, $0D19, $0C80, $0D26, $0F84
- 6 bytes: $0C6D, $0CFF, $0D0C, $0F9E, $1029, $1033
- 7 bytes: $0D4F

0x0d37 4 or 6 bytes
0x0f17 6 or 8 bytes
0x0f29 4 or 6 bytes
0x0f3e 4 or 6 bytes
0x0fd0 4 or 6 bytes
0xc8d 6 or 8 parameters
0xe7d 2 or 3 parameters
0x0ff0 4 or 6 bytes
0x1052 4 or 6 bytes
0x1040 6 or 8 bytes
0x1065 4 or 6 bytes
0x0f5b 2 + A register ???, probably 2

what is?
#0x5db3 ???

# Disk A2
A2_seq1.bin  $b000 Sid Player 
A2_seq2.bin  $c000 Something with the inventory text?
    - $C000-$C0A4 = 165-byte class table
    - $C0A5-$C149 = 165-byte pointer-high/group table
    - $C14A-$C1EE = 165-byte pointer-low/offset table
    - $C1EF-$C293 = 165-byte permutation/order table
    - That is:
    - 4 * 165 = 660 = $0294 bytes
    - Then the token text area starts at:
    - $C294
A2_seq3.bin   $e000 Screen bitmap for background
A2_seq4.bin   $fb80 Additional screen data for text or border of textboxes maybe?
A2_seq5.bin   $fc00 Additional screen data for text or border of textboxes maybe?
A2_seq6.bin   $1340 ???
A2_seq7.bin   $9600 front-end subsystem, command and presentation engine. mouse or joystick
A2_seq8.bin   $9600 front-end subsystem, command and presentation engine.  mouse or joystick
A2_seq9.bin   $9600 front-end subsystem, command and presentation engine.  keyboard only?
A2_seq10.bin  $0a00 ??? runtime + VM + gameplay engine

A2_seq11.bin  $0800 Initial story pictures
A2_seq12.bin  $0800 ???
A2_seq13.bin  $0800 Hölle + Extraleben
A2_seq14.bin  $0800 Gewonnen
A2_seq15.bin  $0800 Credits
A2_seq16.bin  $0801 A.C.A-DOS Screen Release 1.4 Start with SYS 2049

Start of $0x800 .bin files possible via load"...",8,1 and then sys 2071.




















B1_seq1.bin Sid Song Data at b926
...
B2_seq1.bin Sid Song Data at b926
...
C1_seq1.bin Sid Song Data at b926
...
C2_seq1.bin Sid Song Data at b926
...

