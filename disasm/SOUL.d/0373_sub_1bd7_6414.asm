; ========================================
; New Subroutine: sub_1bd7_6414
; ========================================
sub_1bd7_6414:
    cmp byte ptr [6a06], 00
    jz loc_1bd7_641e
    jmp loc_1bd7_659a

loc_1bd7_641e:
    cmp dl, 80
    ja loc_1bd7_642a
    jb loc_1bd7_6439
    add dh, 01
    jz loc_1bd7_6439

loc_1bd7_642a:
    add dh, 01
    adc bx, 00
    jae loc_1bd7_6439
    inc ah
    cmp ah, ff
    jz loc_1bd7_6473

loc_1bd7_6439:
    shl al, 01
    rcr ax, 01
    test ax, 7f80
    jz loc_1bd7_6459
    and al, 80
    and bh, 7f
    or al, bh
    mov di, [69fa]
    mov [di+2], ax
    mov ah, bl
    mov al, dh
    mov [di], ax
    mov si, di
    ret

loc_1bd7_6459:
    cmp byte ptr [6a06], 00
    jz loc_1bd7_6463
    jmp loc_1bd7_65e1

loc_1bd7_6463:
    xor ax, ax
    mov di, [69fa]
    mov [di+2], ax
    mov [di], ax
    mov si, di
    ret
