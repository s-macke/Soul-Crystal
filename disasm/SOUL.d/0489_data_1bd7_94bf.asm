data_1bd7_94bf:
    db 90  ; |.|

loc_1bd7_94c0:
    sub si, si
    mov ax, 2c43
    mov ds, ax

loc_1bd7_94c7:
    mov al, [si+300]
    mov bx, di
    add bx, si
    mov es:[bx-354a], al
    or al, al
    jz loc_1bd7_94de
    inc si
    cmp si, 10
    jb loc_1bd7_94c7

loc_1bd7_94de:
    mov ax, 7fc1
    mov ds, ax
    add di, si
    mov byte ptr es:[di-354a], 20
    inc di
    mov word ptr [bp-4], 0000

loc_1bd7_94f1:
    les bx, [bp+6]
    mov si, [bp-4]
    cmp byte ptr es:[bx+si], 00
    jnz loc_1bd7_9500
    jmp loc_1bd7_958c

loc_1bd7_9500:
    sub si, si
    mov ax, 458f
    mov es, ax

loc_1bd7_9507:
    lds bx, ss:[5d46]
    add bx, [bp-4]
    mov bl, [bx]
    sub bh, bh
    mov cl, 04
    shl bx, cl
    add bx, si
    mov ax, 2c43
    mov ds, ax
    mov al, [bx]
    mov bx, di
    add bx, si
    mov es:[bx-354a], al
    or al, al
    jz loc_1bd7_9535
    inc si
    cmp si, 10
    jb loc_1bd7_9507

loc_1bd7_9535:
    mov ax, 7fc1
    mov ds, ax
    add di, si
    mov byte ptr es:[di-354a], 2c
    inc di
    mov byte ptr es:[di-354a], 20
    inc di
    dec word ptr [bp-6]
    cmp word ptr [bp-6], 01
    jnz loc_1bd7_958c
    dec di
    dec di
    mov byte ptr es:[di-354a], 20
    inc di
    sub si, si
    mov ax, 2c43
    mov ds, ax

loc_1bd7_9563:
    mov al, [si+2f0]
    mov bx, di
    add bx, si
    mov es:[bx-354a], al
    or al, al
    jz loc_1bd7_957a
    inc si
    cmp si, 10
    jb loc_1bd7_9563

loc_1bd7_957a:
    mov ax, 7fc1
    mov ds, ax
    mov es, [6e2e]
    add di, si
    mov byte ptr es:[di-354a], 20
    inc di

loc_1bd7_958c:
    inc word ptr [bp-4]
    cmp word ptr [bp-4], 06
    jae loc_1bd7_9598
    jmp loc_1bd7_94f1

loc_1bd7_9598:
    mov es, [6e2e]
    lea bx, [di-2]
    mov byte ptr es:[bx-354a], 2e
    mov byte ptr es:[bx-3549], 00
    sub ax, ax
    push ax
    mov ax, cab6
    push es
    push ax
    nop
    push cs
    call sub_1bd7_a5b6
    add sp, 06
    pop si
    pop di
    mov sp, bp
    pop bp
    retf

data_1bd7_95c1:
    db 90  ; |.|
