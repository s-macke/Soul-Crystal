; ========================================
; New Subroutine: sub_1bd7_7812
; ========================================
sub_1bd7_7812:
    push bp
    mov bp, sp
    push si
    push di
    mov si, [bp+8]
    mov al, [si+a]
    test al, 82
    jz loc_1bd7_788b
    test al, 40
    jnz loc_1bd7_788b
    mov word ptr [si+4], 0000
    test al, 01
    jz loc_1bd7_7839
    test al, 10
    jz loc_1bd7_788b
    mov cx, [si+6]
    mov [si], cx
    and al, fe

loc_1bd7_7839:
    or al, 02
    and al, ef
    mov [si+a], al
    mov di, si
    sub di, 6b4c
    add di, 6c3c
    xor bx, bx
    mov bl, [si+b]
    test al, 08
    jnz loc_1bd7_78a4
    test al, 04
    jnz loc_1bd7_7875
    add byte ptr [di], 01
    jnz loc_1bd7_78a4
    cmp si, 6b58
    jz loc_1bd7_786e
    cmp si, 6b64
    jz loc_1bd7_786e
    cmp si, 6b7c
    jnz loc_1bd7_7894

loc_1bd7_786e:
    add byte ptr [bx+67df], 40
    jz loc_1bd7_7894

loc_1bd7_7875:
    mov cx, 0001
    push cx
    push ss
    lea di, [bp+6]
    push di
    push bx
    push cs
    call sub_1bd7_81e2
    add sp, 08
    mov cx, 0001
    jmp loc_1bd7_78d1

loc_1bd7_788b:
    mov ax, ffff
    or byte ptr [si+a], 20
    jmp loc_1bd7_78f9

loc_1bd7_7894:
    push bx
    push ds
    push si
    call sub_1bd7_854e
    add sp, 04
    pop bx
    add byte ptr [si+a], 08
    jz loc_1bd7_7875

loc_1bd7_78a4:
    mov cx, [si]
    mov dx, [si+6]
    sub cx, dx
    inc dx
    mov [si], dx
    mov dx, [di+2]
    dec dx
    mov [si+4], dx
    jcxz loc_1bd7_78dc
    push cx
    push cx
    push word ptr [si+8]
    push word ptr [si+6]
    push bx
    push cs
    call sub_1bd7_81e2
    add sp, 08
    pop cx

loc_1bd7_78c8:
    les di, [si+6]
    mov dx, [bp+6]
    mov es:[di], dl

loc_1bd7_78d1:
    cmp ax, cx
    jnz loc_1bd7_788b
    xor ax, ax
    mov al, [bp+6]
    jmp loc_1bd7_78f9

loc_1bd7_78dc:
    xor ax, ax
    add byte ptr [bx+67df], 20
    jz loc_1bd7_78c8
    mov cx, 0002
    push cx
    push ax
    push ax
    push bx
    push cs
    call sub_1bd7_806a
    add sp, 08
    xor ax, ax
    mov cx, ax
    jmp loc_1bd7_78c8

loc_1bd7_78f9:
    pop di
    pop si
    pop bp
    retf
