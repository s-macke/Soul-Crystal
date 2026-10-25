; ========================================
; New Subroutine: sub_1bd7_fb56
; ========================================
sub_1bd7_fb56:
    push bp
    mov bp, sp
    sub sp, 16
    push di
    push si
    mov word ptr [bp-6], 0000
    mov es, [6e96]
    mov al, es:[0540]
    sub ah, ah
    push ax
    nop
    push cs
    call sub_1bd7_cbee
    add sp, 02
    sub di, di
    mov ax, 2c43
    mov ds, ax

loc_1bd7_fb7d:
    cmp byte ptr [di+370], 00
    jz loc_1bd7_fb9c
    mov al, [di+370]
    mov [bp+di-16], al
    inc di
    cmp di, 10
    jb loc_1bd7_fb7d
    mov ax, 7fc1
    mov ds, ax
    mov si, [bp-2]
    jmp loc_1bd7_fba3
