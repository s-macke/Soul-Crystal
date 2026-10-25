; ========================================
; New Subroutine: sub_1bd7_a004
; ========================================
sub_1bd7_a004:
    push bp
    mov bp, sp
    sub sp, 0e
    push di
    push si
    mov word ptr [bp-4], 0000
    mov ax, 2020
    mov es, [6e34]
    mov cx, 002d
    mov di, 648a
    repz stosw
    sub bx, bx
    mov si, [bp+a]
    or si, si
    jz loc_1bd7_a07a
    mov cx, [bp+6]
    mov ds, [bp+8]

loc_1bd7_a02f:
    mov di, cx
    add di, bx
    cmp byte ptr [di+1], 00
    jz loc_1bd7_a04d
    mov di, cx
    add di, bx
    cmp byte ptr [di+1], 21
    jae loc_1bd7_a060
    mov di, cx
    add di, bx
    cmp byte ptr [di+2], 2d
    jz loc_1bd7_a060

loc_1bd7_a04d:
    mov ax, cx
    add ax, bx
    mov dx, ds
    inc ax
    mov [bp-e], ax
    mov [bp-c], dx
    lea ax, [bx+1]
    mov [bp-4], ax

loc_1bd7_a060:
    mov di, cx
    add di, bx
    cmp byte ptr [di+1], 00
    jnz loc_1bd7_a072

loc_1bd7_a06a:
    mov ax, 7fc1
    mov ds, ax
    jmp loc_1bd7_a07a
