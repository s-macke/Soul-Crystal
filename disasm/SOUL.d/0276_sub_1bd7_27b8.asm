; ========================================
; New Subroutine: sub_1bd7_27b8
; ========================================
sub_1bd7_27b8:
    call sub_1bd7_23fd
    xor ax, ax
    mov [57b8], ax
    push ds
    mov ds, ax
    mov al, [0410]
    pop ds
    cmp al, [57b1]
    jz loc_1bd7_27d3
    mov [57b1], al
    call sub_1bd7_2439

loc_1bd7_27d3:
    jcxz loc_1bd7_2824
    call sub_1bd7_0d31
    mov bx, [6ac1]
    mov [57ba], bl
    mov bl, [6ac0]
    mov [57ab], bx
    mov dx, [6637]
    jz loc_1bd7_27fa
    mov byte ptr [57b8], 01
    or al, al
    jnz loc_1bd7_27f9
    inc ah

loc_1bd7_27f9:
    xchg ax, bx

loc_1bd7_27fa:
    call sub_1bd7_0d31
    jz loc_1bd7_2808
    mov byte ptr [57b8], 01
    neg al
    rcl bh, 01

loc_1bd7_2808:
    and bh, 01
    call sub_1bd7_0d31
    jz loc_1bd7_2817
    inc byte ptr [57b9]
    xchg ax, dx
    mov dh, dl

loc_1bd7_2817:
    call sub_1bd7_0d31
    jz loc_1bd7_2822
    inc byte ptr [57b9]
    mov dh, al

loc_1bd7_2822:
    jcxz loc_1bd7_2827

loc_1bd7_2824:
    jmp loc_1bd7_28b8

loc_1bd7_2827:
    xchg ax, bx
    cmp [6637], dx
    jnz loc_1bd7_283d
    cmp [57ab], ax
    jz loc_1bd7_28a6
    cmp byte ptr [57b9], 00
    jnz loc_1bd7_283d
    xor dx, dx

loc_1bd7_283d:
    push ax
    push dx
    mov dx, [675a]
    call sub_1bd7_0bbb
    pop dx
    pop ax
    mov cl, [6ac3]
    mov ch, [6ac4]
    call sub_1bd7_0d16
    jb loc_1bd7_28b8
    xchg cx, bx
    push bx
    push dx
    mov bl, [6ac3]
    call word ptr [6ad9]
    pop dx
    pop cx
    cmp dl, [6ad0]
    ja loc_1bd7_28a9
    cmp dh, [6ad0]
    ja loc_1bd7_28a9
    push dx
    mov al, [6ac3]
    mov cl, [6ac4]
    call sub_1bd7_022e
    cmp byte ptr [57b8], 00
    jz loc_1bd7_2898
    mov al, [6ac1]
    cmp al, [57ba]
    jz loc_1bd7_2898
    call sub_1bd7_25dc
    call word ptr [6adb]
    call sub_1bd7_0384
    call word ptr [6adf]

loc_1bd7_2898:
    call sub_1bd7_29c8
    pop ax
    call word ptr [6add]
    call sub_1bd7_0b5e
    call sub_1bd7_0b8f

loc_1bd7_28a6:
    clc
    jmp loc_1bd7_28b9

loc_1bd7_28a9:
    mov ax, [57ab]
    call sub_1bd7_0d16
    xchg cx, bx
    call word ptr [6ad9]
    call sub_1bd7_29c8

loc_1bd7_28b8:
    stc

loc_1bd7_28b9:
    ret

data_1bd7_28ba:
    db 00, 00, 00, 28, 19, 40, 01, c8, 00, 00, b8, 0f, 3f, 02, 80, 00  ; |...(.@......?...|
    db 07, 07, 07, 00, 00, 38, 56, d7, 1b, 03, 2a, 5c, 2a, c6, 2a, 58  ; |.....8V...*\*.*X|
    db 56, 88, 56, b0, 56, d5, 56, f6, 2a, 00, 02, 00, 50, 19, 80, 02  ; |V.V.V.V.*...P...|
    db c8, 00, 00, b8, 0f, 3f, 04, 00, 01, 03, 07, 07, 00, 00, 38, 56  ; |.....?........8V|
    db d7, 1b, 00, 2a, 5c, 2a, c6, 2a, 58, 56, 88, 56, b0, 56, d5, 56  ; |...*\*.*XV.V.V.V|
    db f6, 2a, 00, 07, 00, 50, 19, d0, 02, 5e, 01, 00, b0, 0f, 02, 04  ; |.*...P...^......|
    db 00, 01, 00, 07, 07, 00, 00, 35, 29, d7, 1b, 58, 2a, 5c, 2a, c6  ; |.......5)..X*\*.|
    db 2a, 58, 56, 88, 56, d6, 2a, d5, 56, f6, 2a, 00, 08, 08, 08, 08  ; |*XV.V.*.V.*.....|
    db 08, 08, 08, 00, 18, 18, 18, 18, 18, 18, 18  ; |...........|
