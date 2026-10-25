; ========================================
; New Subroutine: sub_1bd7_82a2
; ========================================
sub_1bd7_82a2:
    push ax
    push bx
    push cx
    push ds
    push es
    pop ds
    mov cx, di
    sub cx, dx
    jcxz loc_1bd7_82c0
    push cx
    mov bx, [bp+6]
    mov ah, 40
    int 21
    pop cx
    jb loc_1bd7_82c7
    add [bp-2], ax
    cmp cx, ax
    ja loc_1bd7_82c7

loc_1bd7_82c0:
    pop ds
    pop cx
    pop bx
    pop ax
    mov di, dx
    ret

loc_1bd7_82c7:
    lahf
    pop ds
    add sp, 08
    cmp word ptr [bp-2], 00
    jnz loc_1bd7_82f7
    sahf
    jae loc_1bd7_82d9
    mov ah, 09
    jmp loc_1bd7_82fd

loc_1bd7_82d9:
    mov ds, [bp-6]
    add byte ptr [bx+67df], 40
    jz loc_1bd7_82f1
    mov ds, [bp+a]
    mov bx, [bp+8]
    cmp byte ptr [bx], 1a
    jnz loc_1bd7_82f1
    clc
    jmp loc_1bd7_82fd

loc_1bd7_82f1:
    stc
    mov ax, 1c00
    jmp loc_1bd7_82fd

loc_1bd7_82f7:
    mov ax, [bp-2]
    sub ax, [bp-4]

loc_1bd7_82fd:
    mov sp, [bp-8]
    pop si
    pop di
    mov ds, [bp-6]

loc_1bd7_8305:
    jmp loc_1bd7_7735

loc_1bd7_8308:
    mov cx, [bp+c]
    or cx, cx
    jnz loc_1bd7_8314
    mov ax, cx
    jmp loc_1bd7_7735

loc_1bd7_8314:
    push ds
    lds dx, [bp+8]
    mov ah, 40
    int 21
    push ds
    pop es
    pop ds
    jae loc_1bd7_8325
    mov ah, 09
    jmp loc_1bd7_8305

loc_1bd7_8325:
    or ax, ax
    jnz loc_1bd7_8305
    add byte ptr [bx+67df], 40
    jz loc_1bd7_833b
    mov bx, dx
    cmp byte ptr es:[bx], 1a
    jnz loc_1bd7_833b
    clc
    jmp loc_1bd7_8305

loc_1bd7_833b:
    stc
    mov ax, 1c00
    jmp loc_1bd7_8305
