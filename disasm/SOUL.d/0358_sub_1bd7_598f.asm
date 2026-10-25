; ========================================
; New Subroutine: sub_1bd7_598f
; ========================================
sub_1bd7_598f:
    mov ax, ds
    mov es, ax
    push si
    push di
    mov di, bx
    cld
    mov bx, [69fa]
    cmp byte ptr [bx-2], 07
    jnz loc_1bd7_59b1
    mov si, [bx-4]

loc_1bd7_59a5:
    movsw
    movsw
    movsw
    movsw
    sub word ptr [69fa], 0c
    pop di
    pop si
    retf

loc_1bd7_59b1:
    xchg di, bx
    call sub_1bd7_5e07
    mov si, di
    xchg di, bx
    jmp loc_1bd7_59a5
