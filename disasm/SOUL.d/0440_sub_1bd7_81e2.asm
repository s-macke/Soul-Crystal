; ========================================
; New Subroutine: sub_1bd7_81e2
; ========================================
sub_1bd7_81e2:
    push bp
    mov bp, sp
    sub sp, 08
    mov bx, [bp+6]
    cmp bx, [67dd]
    jb loc_1bd7_81f8
    mov ax, 0900
    stc

loc_1bd7_81f5:
    jmp loc_1bd7_7735

loc_1bd7_81f8:
    cmp word ptr [6e0a], d6d6
    jnz loc_1bd7_8204
    call word ptr [6e0c]

loc_1bd7_8204:
    add byte ptr [bx+67df], 20
    jz loc_1bd7_8216
    mov ax, 4202
    xor cx, cx
    mov dx, cx
    int 21
    jb loc_1bd7_81f5

loc_1bd7_8216:
    add byte ptr [bx+67df], 80
    jz loc_1bd7_8299
    mov [bp-6], ds
    mov es, [bp+a]
    lds dx, [bp+8]
    xor ax, ax
    mov [bp-2], ax
    mov [bp-4], ax
    cld
    push di
    push si
    mov di, dx
    mov si, dx
    mov [bp-8], sp
    mov cx, [bp+c]
    jcxz loc_1bd7_827c
    mov al, 0a
    repnz scasb
    jnz loc_1bd7_8294
    push ds
    mov ds, [bp-6]
    nop
    push cs
    call sub_1bd7_8766
    cmp ax, 00a8
    jbe loc_1bd7_829b
    pop ds
    sub sp, 02
    mov bx, sp
    mov dx, 0200
    cmp ax, 0228
    jae loc_1bd7_8262
    mov dx, 0080

loc_1bd7_8262:
    sub sp, dx
    mov dx, sp
    mov di, dx
    push ss
    pop es
    mov cx, [bp+c]

loc_1bd7_826d:
    lodsb byte ptr [si]
    cmp al, 0a
    jz loc_1bd7_827e

loc_1bd7_8272:
    cmp di, bx
    jz loc_1bd7_828f

loc_1bd7_8276:
    stosb
    loop loc_1bd7_826d
    call sub_1bd7_82a2

loc_1bd7_827c:
    jmp loc_1bd7_82f7

loc_1bd7_827e:
    mov al, 0d
    cmp di, bx
    jnz loc_1bd7_8287
    call sub_1bd7_82a2

loc_1bd7_8287:
    stosb
    mov al, 0a
    inc word ptr [bp-4]
    jmp loc_1bd7_8272

loc_1bd7_828f:
    call sub_1bd7_82a2
    jmp loc_1bd7_8276

loc_1bd7_8294:
    pop si
    pop di
    mov ds, [bp-6]

loc_1bd7_8299:
    jmp loc_1bd7_8308

loc_1bd7_829b:
    mov ax, fffc
    push cs
    call sub_1bd7_6d48
