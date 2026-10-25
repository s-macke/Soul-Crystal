; ========================================
; New Subroutine: sub_1bd7_e074
; ========================================
sub_1bd7_e074:
    push bp
    mov bp, sp
    sub sp, 16
    push di
    push si
    mov word ptr [bp-8], 0000
    mov word ptr [bp-e], 0011
    mov word ptr [bp-c], 0001
    mov word ptr [bp-a], 0000
    lea ax, [bp-e]
    push ss
    push ax
    lea ax, [bp-8]
    push ss
    push ax
    nop
    push cs
    call sub_1bd7_9710
    add sp, 08
    mov ax, 0400
    mov cx, 2c43
    mov [bp-12], ax
    mov [bp-10], cx
    mov di, [bp-6]

loc_1bd7_e0b1:
    mov ax, 005a
    push ax
    mov ax, 0020
    push ax
    push word ptr [bp-10]
    push word ptr [bp-12]
    nop
    push cs
    call sub_1bd7_7648
    add sp, 08
    mov word ptr [bp-8], 0000
    mov ax, 2c43
    mov ds, ax
    mov ax, 2c43
    mov es, ax

loc_1bd7_e0d6:
    mov bx, [bp-8]
    cmp byte ptr [bx+350], 00
    jz loc_1bd7_e0fa
    mov al, [bx+350]
    mov es:[bx+400], al
    inc word ptr [bp-8]
    cmp word ptr [bp-8], 10
    jl loc_1bd7_e0d6
    mov ax, 7fc1
    mov ds, ax
    jmp loc_1bd7_e102
