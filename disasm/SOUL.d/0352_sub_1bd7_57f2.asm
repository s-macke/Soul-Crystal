; ========================================
; New Subroutine: sub_1bd7_57f2
; ========================================
sub_1bd7_57f2:
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
    movsw
    movsw
    mov si, bx
    cmp bx, 69e6

loc_1bd7_580e:
    jz loc_1bd7_581e
    mov [69fa], bx
    mov byte ptr [bx-2], 07
    mov [bx-4], si
    pop di
    pop si
    retf

loc_1bd7_581e:
    jmp loc_1bd7_5e72
