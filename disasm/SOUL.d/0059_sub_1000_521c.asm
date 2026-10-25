; ========================================
; New Subroutine: sub_1000_521c
; ========================================
sub_1000_521c:
    push bp
    mov bp, sp
    sub sp, 001e
    push si
    mov cx, 0006
    lea di, [bp-1e]
    push ss
    pop es
    xor ax, ax
    repz stosw
    mov ax, 3850
    push ax
    lea ax, [bp-16]
    push ax
    call sub_1bd7_0696
    mov ax, 0001
    jmp loc_1000_529b

loc_1000_5244:
    mov ax, 0010
    push ax
    mov ax, [bp-1a]
    dec ax
    shl ax, 01
    mov bx, ax
    mov ax, 014a
    imul word ptr [0032]
    mov dx, bx
    mov bx, ax
    mov si, 00e4
    add bx, [si+a]
    mov es, [si+2]
    add bx, dx
    push word ptr es:[bx]
    call sub_1bd7_8af3
    add sp, 04
    mov [bp-18], ax
    mov ax, [bp-18]
    and ax, ax
    jz loc_1000_5297
    lea ax, [bp-16]
    push ax
    push word ptr [bp-1a]
    call sub_1bd7_0852
    push ax
    call sub_1bd7_06cf
    push ax
    lea ax, [bp-16]
    push ax
    call sub_1bd7_0696

loc_1000_5297:
    mov ax, [bp-1a]
    inc ax

loc_1000_529b:
    mov [bp-1a], ax
    cmp ax, 00a5
    jle loc_1000_5244
    lea ax, [bp-16]
    push ax
    lea ax, [bp-1e]
    push ax
    call sub_1bd7_0696
    lea ax, [bp-16]
    push ax
    call sub_1bd7_09be
    lea ax, [bp-1e]
    push ax
    call sub_1bd7_09cf
    pop si
    mov sp, bp
    pop bp
    retf
