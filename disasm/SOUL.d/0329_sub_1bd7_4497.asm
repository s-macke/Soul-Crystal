; ========================================
; New Subroutine: sub_1bd7_4497
; ========================================
sub_1bd7_4497:
    push bx
    push cx
    cmp byte ptr [si], 08
    jnz loc_1bd7_44da
    lea bx, [si+3]
    sub bx, [si-3]
    cmp bx, es:[686a]
    jnz loc_1bd7_44b0
    add es:[686a], ax

loc_1bd7_44b0:
    cmp word ptr [si-9], 00
    jz loc_1bd7_44d8
    mov bx, [si-7]
    add [bx-2], ax
    or ax, ax
    jnz loc_1bd7_44c8
    mov byte ptr [si], 01
    call sub_1bd7_4518
    jmp loc_1bd7_4515

loc_1bd7_44c8:
    mov cx, [si-9]
    shr cx, 01
    push si

loc_1bd7_44ce:
    mov si, [bx]
    add [si+2], ax
    inc bx
    inc bx
    loop loc_1bd7_44ce
    pop si

loc_1bd7_44d8:
    jmp loc_1bd7_4515

loc_1bd7_44da:
    cmp byte ptr [si], 02
    jnz loc_1bd7_4508
    mov bx, [si-5]
    or ax, ax
    jnz loc_1bd7_44ef
    mov [bx+2], ax
    mov [si-5], ax
    mov byte ptr [si], 01

loc_1bd7_44ef:
    mov cx, [si-3]
    mov bx, si
    sub bx, cx
    add bx, 03
    sub cx, 08
    shr cx, 01
    shr cx, 01

loc_1bd7_4500:
    call sub_1bd7_1e55
    add bx, 04
    loop loc_1bd7_4500

loc_1bd7_4508:
    mov bx, [si-5]
    add [bx], ax
    cmp byte ptr [si], 02
    jnz loc_1bd7_4515
    add [bx+a], ax

loc_1bd7_4515:
    pop cx
    pop bx
    ret
