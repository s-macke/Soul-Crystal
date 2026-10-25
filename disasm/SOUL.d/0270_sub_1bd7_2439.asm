; ========================================
; New Subroutine: sub_1bd7_2439
; ========================================
sub_1bd7_2439:
    push ax
    push bx
    push cx
    push di
    mov ax, 0002
    mov [57b4], al  ; data_7fc1_57b4 byte write
    mov word ptr [57b6], 0010  ; data_7fc1_57b6 word write
    mov [57b5], al  ; data_7fc1_57b5 byte write
    mov [57af], ah  ; data_7fc1_57af byte write
    push ds
    pop es
    mov di, 6644
    xor bx, bx
    mov ah, 1b
    call sub_1bd7_0b1a
    cmp al, 1b
    jnz loc_1bd7_24a3
    mov al, [di+25]
    cmp al, 06
    jb loc_1bd7_24a3
    mov bl, [di+31]
    mov al, [di+2d]
    mov [57b2], al  ; data_7fc1_57b2 byte write
    les di, [di]
    mov ax, es:[di]
    mov [57a8], ax  ; data_7fc1_57a8 word write
    mov al, es:[di+2]
    mov [57aa], al  ; data_7fc1_57aa byte write
    mov byte ptr [57b4], 10  ; data_7fc1_57b4 byte write
    mov byte ptr [57b5], 10  ; data_7fc1_57b5 byte write
    test al, 04
    jz loc_1bd7_24e3
    mov byte ptr [57b5], 18  ; data_7fc1_57b5 byte write
    call sub_1bd7_257c
    jb loc_1bd7_24f1
    mov byte ptr [57b4], 08  ; data_7fc1_57b4 byte write
    mov byte ptr [57af], 01  ; data_7fc1_57af byte write
    jmp loc_1bd7_24e3

loc_1bd7_24a3:
    mov bl, 10
    mov ah, 12
    call sub_1bd7_0b1a
    add bl, fc
    jnz loc_1bd7_24f1
    mov al, [57b1]
    and ax, 0030
    cmp al, 30
    jnz loc_1bd7_24bb
    inc ah

loc_1bd7_24bb:
    cmp ah, bh
    jnz loc_1bd7_24f1
    mov byte ptr [57b4], 04
    mov byte ptr [57af], 01
    and cl, 0f
    cmp cl, 05
    ja loc_1bd7_24d4
    add cl, 06

loc_1bd7_24d4:
    sub cl, 09
    jb loc_1bd7_24e3
    mov ch, 04
    jz loc_1bd7_24df
    mov ch, 01

loc_1bd7_24df:
    mov [57b5], ch

loc_1bd7_24e3:
    inc bl
    xor bh, bh
    mov cl, 06
    shl bx, cl
    mov [57b6], bx  ; data_7fc1_57b6 word write
    jmp loc_1bd7_2508

loc_1bd7_24f1:
    mov al, [57b1]
    and al, 30
    cmp al, 30
    jnz loc_1bd7_2508
    dec byte ptr [57b5]
    dec byte ptr [57b4]
    mov word ptr [57b6], 0004

loc_1bd7_2508:
    add byte ptr [57b4], 0e  ; data_7fc1_57b4 byte readwrite
    jz loc_1bd7_2527
    xor ax, ax
    call sub_1bd7_271c
    jz loc_1bd7_2527
    or [57b4], al
    cmp word ptr [57b6], 20
    ja loc_1bd7_2527
    mov word ptr [57b6], 0020

loc_1bd7_2527:
    mov dx, ffff
    mov ah, ef
    call sub_1bd7_0b1a
    cmp dl, ff
    jz loc_1bd7_2554
    add byte ptr [57b4], 01
    jz loc_1bd7_254e
    mov byte ptr [57b4], 20
    mov word ptr [57b6], 0040
    or dh, dh
    jnz loc_1bd7_2554
    shr word ptr [57b6], 01

loc_1bd7_254e:
    mov dx, 03bf
    mov al, 01
    out dx, al

loc_1bd7_2554:
    cmp byte ptr [57b4], 02  ; data_7fc1_57b4 byte read
    jnz loc_1bd7_2577
    xor cx, cx
    mov byte ptr [57b3], 01
    mov dx, 03da
    in al, dx
    and al, 01
    mov ah, al

loc_1bd7_256a:
    in al, dx
    and al, 01
    cmp al, ah
    loope loc_1bd7_256a
    jnz loc_1bd7_2577
    mov [57b3], cl

loc_1bd7_2577:
    pop di
    pop cx
    pop bx
    pop ax
    ret
