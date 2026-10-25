; ========================================
; New Subroutine: sub_1bd7_7936
; ========================================
sub_1bd7_7936:
    push bp
    mov bp, sp
    sub sp, 08
    push di
    push si
    les bx, [bp+a]
    mov al, es:[bx]
    cbw
    cmp ax, 0077
    jz loc_1bd7_7992
    ja loc_1bd7_7954
    sub al, 61
    jz loc_1bd7_799c
    sub al, 11
    jz loc_1bd7_795a

loc_1bd7_7954:
    sub ax, ax
    cwd
    jmp loc_1bd7_7a27

loc_1bd7_795a:
    sub si, si
    mov byte ptr [bp-4], 01

loc_1bd7_7960:
    mov word ptr [bp-2], 0001

loc_1bd7_7965:
    inc word ptr [bp+a]
    les bx, [bp+a]
    cmp byte ptr es:[bx], 00
    jz loc_1bd7_79cc
    cmp word ptr [bp-2], 00
    jz loc_1bd7_79cc
    mov al, es:[bx]
    cbw
    cmp ax, 0074
    jz loc_1bd7_79b4
    ja loc_1bd7_798a
    sub al, 2b
    jz loc_1bd7_79a2
    sub al, 37
    jz loc_1bd7_79c0

loc_1bd7_798a:
    mov word ptr [bp-2], 0000
    jmp loc_1bd7_7965
