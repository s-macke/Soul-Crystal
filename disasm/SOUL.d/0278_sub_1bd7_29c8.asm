; ========================================
; New Subroutine: sub_1bd7_29c8
; ========================================
sub_1bd7_29c8:
    push di
    xor ax, ax
    cmp [6ac0], al  ; data_7fc1_6ac0 byte read
    jnz loc_1bd7_29fe
    push es
    cmp byte ptr [6ac4], 19  ; data_7fc1_6ac4 byte read
    jz loc_1bd7_29e6
    mov es, ax
    mov ax, es:[044c]
    mov cl, 04
    shr ax, cl
    mov [6ace], ax

loc_1bd7_29e6:
    mov di, 57bc
    mov bx, [6ace]  ; data_7fc1_6ace word read
    mov cl, 04
    shl bx, cl
    xor ax, ax
    mov cx, 0008
    push ds
    pop es

loc_1bd7_29f8:
    stosw
    add ax, bx
    loop loc_1bd7_29f8
    pop es

loc_1bd7_29fe:
    pop di
    ret
    mov cl, 28
    cmp ax, 50b1
    xor ax, ax
    cmp bl, cl
    jz loc_1bd7_2a57
    cmp bl, [6ac3]  ; data_7fc1_6ac3 byte read
    stc
    jnz loc_1bd7_2a57
    cmp bh, 19
    jz loc_1bd7_2a52
    dec ax
    add byte ptr [57b4], 0c
    stc
    jz loc_1bd7_2a57
    add byte ptr [57b5], 02
    stc
    jnz loc_1bd7_2a57
    cmp bh, 2b
    jz loc_1bd7_2a3d
    add byte ptr [57b4], 08
    stc
    jz loc_1bd7_2a57
    cmp bh, 32
    stc
    jnz loc_1bd7_2a57
    jmp loc_1bd7_2a42

loc_1bd7_2a3d:
    cmp bl, 28
    jz loc_1bd7_2a47

loc_1bd7_2a42:
    mov byte ptr [6ad0], 03

loc_1bd7_2a47:
    cmp word ptr [57b6], 40
    ja loc_1bd7_2a52
    shr byte ptr [6ad0], 01

loc_1bd7_2a52:
    mov [6ac4], bh  ; data_7fc1_6ac4 byte write
    clc

loc_1bd7_2a57:
    ret

data_1bd7_2a58:
    db 32, c0, eb, af, f6, 06, b4, 57, 18, 74, 17, b8, 02, 12, 80, 3e  ; |2......W.t.....>|
    db c4, 6a, 2b, 75, 03, b8, 01, 12, b3, 30, 55, 56, 57, cd, 10, 5f  ; |.j+u.....0UVW.._|
    db 5e, 5d, a0, c1, 6a, 55, 56, 57, b4, 00, cd, 10, 5f, 5e, 5d, 80  ; |^]..jUVW...._^].|
    db 3e, c4, 6a, 32, 74, 07, 80, 3e, c4, 6a, 2b, 75, 12, b8, 12, 11  ; |>.j2t..>.j+u....|
    db 32, db, 55, 56, 57, cd, 10, 5f, 5e, 5d, b8, 07, 07, eb, 0c, b8  ; |2.UVW.._^]......|
    db 07, 07, 38, 06, c1, 6a, 75, 03, b8, 0c, 0c, a3, b4, 6a, a2, b2  ; |..8..ju......j..|
    db 6a, 8b, 16, 5a, 67, c6, 06, 34, 66, ff, e8, e6, e0, c3  ; |j..Zg..4f.....|
