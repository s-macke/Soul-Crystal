; ========================================
; New Subroutine: sub_1bd7_57a4
; ========================================
sub_1bd7_57a4:
    push si
    push di
    mov si, bx
    mov bx, [69fa]
    add bx, 0c
    mov di, bx
    mov cx, ds
    mov es, cx
    cld
    movsw
    movsw
    mov si, bx
    cmp bx, 69e6
    jz loc_1bd7_580e
    mov [69fa], bx
    mov [bx-4], si
    mov byte ptr [bx-2], 03
    pop di
    pop si
    retf
