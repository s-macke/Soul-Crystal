; ========================================
; New Subroutine: sub_1bd7_98f0
; ========================================
sub_1bd7_98f0:
    push bp
    mov bp, sp
    sub sp, 14
    push di
    push si
    mov ax, 458f
    mov ds, ax
    mov word ptr [bp-4], 0000
    cmp byte ptr [cab6], 00
    jnz loc_1bd7_990c
    jmp loc_1bd7_9a3b

loc_1bd7_990c:
    mov bx, [bp-4]
    cmp byte ptr [bx-354a], 40
    jnz loc_1bd7_9942
    mov si, [bx-3548]
    and si, 00ff
    sub si, 31
    sub ax, ax
    mov cx, 0008
    lea di, [bp-14]
    push ss
    pop es
    repz stosw
    mov bx, [bp-4]
    mov al, [bx-3549]
    sub ah, ah
    sub ax, 0073
    jz loc_1bd7_9948
    dec ax
    dec ax
    jz loc_1bd7_9972
    jmp loc_1bd7_9993
