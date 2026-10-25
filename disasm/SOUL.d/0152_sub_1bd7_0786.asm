; ========================================
; New Subroutine: sub_1bd7_0786
; ========================================
sub_1bd7_0786:
    push bp
    mov bp, sp
    push si
    push di
    push es
    les si, [bp+e]
    mov bx, es
    mov cx, [bp+c]
    les di, [bp+8]
    mov ax, [bp+6]
    or ax, ax
    jcxz loc_1bd7_07c7
    jz loc_1bd7_07b6
    sub ax, cx
    jae loc_1bd7_07a9
    mov cx, [bp+6]
    xor ax, ax

loc_1bd7_07a9:
    push ds
    mov ds, bx
    repz movsb
    xchg ax, cx
    mov al, 20
    repz stosb
    pop ds
    jmp loc_1bd7_07d3

loc_1bd7_07b6:
    push bx
    push si
    push cx
    nop
    push cs
    call sub_1bd7_075e

loc_1bd7_07be:
    push ax
    push di
    nop
    push cs
    call sub_1bd7_0696
    jmp loc_1bd7_07d3

loc_1bd7_07c7:
    xchg ax, si
    jz loc_1bd7_07be
    push ax
    push es
    push di
    push si
    nop
    push cs
    call sub_1bd7_1b6d

loc_1bd7_07d3:
    pop es
    pop di
    pop si
    pop bp
    retf 000c
