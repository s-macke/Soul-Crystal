; ========================================
; New Subroutine: sub_1bd7_9710
; ========================================
sub_1bd7_9710:
    push bp
    mov bp, sp
    sub sp, 08
    push di
    push si
    mov word ptr [bp-6], 0000
    les bx, [bp+6]
    mov ax, es:[bx]
    or ax, ax
    jz loc_1bd7_9736
    dec ax
    jnz loc_1bd7_972d
    jmp loc_1bd7_98d0

loc_1bd7_972d:
    dec ax
    jnz loc_1bd7_9733
    jmp loc_1bd7_98da

loc_1bd7_9733:
    jmp loc_1bd7_98e0

loc_1bd7_9736:
    mov di, [bp+a]
    cmp word ptr [6eba], 00
    jz loc_1bd7_9769
    mov es, [bp+c]
    add byte ptr es:[di+5], ff
    jnz loc_1bd7_9769
    mov ax, 0039
    push ax
    mov ax, 0001
    push ax
    nop
    push cs
    call sub_1bd7_8c36
    add sp, 04
    sub ax, ax
    push ax
    mov ax, 0002
    push ax
    nop
    push cs
    call sub_1bd7_a954
    add sp, 04

loc_1bd7_9769:
    mov es, [bp+c]
    cmp word ptr es:[di], 52
    jbe loc_1bd7_97b6
    cmp word ptr es:[di], 0244
    jae loc_1bd7_97b6
    mov ax, [6eb8]
    cmp es:[di+2], ax
    jz loc_1bd7_97b6
    mov ax, es:[di+2]
    inc ax
    inc ax
    push ax
    sub ax, ax
    push ax
    nop
    push cs
    call sub_1bd7_b06c
    add sp, 04
    mov si, ax
    mov [bp-2], dx
    or dx, ax
    jz loc_1bd7_97b1
    mov ax, 0002
    push ax
    mov ax, [bp-2]
    push ax
    push si
    push cs
    call sub_1bd7_9a46
    add sp, 06
    or ax, ax
    jnz loc_1bd7_97ee

loc_1bd7_97b1:
    mov word ptr [bp-6], 0101

loc_1bd7_97b6:
    cmp word ptr [bp-6], 00
    jz loc_1bd7_97bf
    jmp loc_1bd7_98a8

loc_1bd7_97bf:
    mov word ptr [bp-2], 0000
    mov es, [bp+c]
    cmp word ptr es:[di+2], 00
    jnz loc_1bd7_97fa
    sub ax, ax
    push ax
    mov ax, es:[di]
    dec ax
    push ax
    push cs
    call sub_1bd7_a3a2
    add sp, 04
    mov ax, di
    mov dx, [bp+c]
    add ax, 0006
    push dx
    push ax
    push cs
    call sub_1bd7_98f0
    jmp loc_1bd7_98a5

loc_1bd7_97ee:
    mov es, [bp+c]
    mov ax, es:[di+2]
    mov [6eb8], ax
    jmp loc_1bd7_97b6

loc_1bd7_97fa:
    mov ds, [bp+c]
    cmp word ptr [di], 53
    jb loc_1bd7_9872
    cmp word ptr [di], 0243
    ja loc_1bd7_9872
    sub si, si
    mov ax, 2c43
    mov es, ax
    mov ax, es:[5682]
    mov [bp-8], ax
    or ax, ax
    jz loc_1bd7_9839

loc_1bd7_981a:
    mov ax, 458f
    mov es, ax
    mov al, es:[si+6448]
    sub ah, ah
    cmp ax, [di]
    jz loc_1bd7_9834
    inc si
    cmp [bp-8], si
    ja loc_1bd7_981a
    jmp loc_1bd7_9839
