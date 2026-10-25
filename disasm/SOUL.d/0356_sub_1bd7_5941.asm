; ========================================
; New Subroutine: sub_1bd7_5941
; ========================================
sub_1bd7_5941:
    mov ax, ds
    mov es, ax
    push si
    push di
    mov di, bx
    cld
    mov bx, [69fa]
    cmp byte ptr [bx-2], 03
    jnz loc_1bd7_5961
    mov si, [bx-4]

loc_1bd7_5957:
    movsw
    movsw
    sub word ptr [69fa], 0c
    pop di
    pop si
    retf

loc_1bd7_5961:
    push bp
    mov [69fc], sp
    mov si, [bx-4]
    push di
    call sub_1bd7_5ec0
    pop di
    mov bx, si
    pop bp
    jmp loc_1bd7_5957
