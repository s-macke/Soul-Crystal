; ========================================
; New Subroutine: sub_1bd7_232e
; ========================================
sub_1bd7_232e:
    cmp byte ptr [57b4], 00  ; data_7fc1_57b4 byte read
    jz loc_1bd7_2338
    jmp loc_1bd7_23fb

loc_1bd7_2338:
    and byte ptr [6618], bf  ; data_7fc1_6618 byte readwrite
    xor bx, bx
    mov es, bx
    mov al, es:[0410]  ; 07dc:0410 byte read
    mov ah, al
    mov [57b0], ax  ; data_7fc1_57b0 word write
    mov ah, 0f
    call sub_1bd7_0b1a
    mov dl, bh
    mov dh, bh
    mov [6ab8], al  ; data_7fc1_6ab8 byte write
    mov cl, ah
    cmp al, 40
    jnz loc_1bd7_2360
    mov al, 04
    jmp loc_1bd7_236d

loc_1bd7_2360:
    mov ah, al
    mov bx, 6dde
    xlat
    and ah, 01
    cmp al, 01
    jbe loc_1bd7_236f

loc_1bd7_236d:
    xor ah, ah

loc_1bd7_236f:
    push ax
    push dx
    push cx
    call sub_1bd7_2439
    mov al, 30
    xor bx, bx
    xor cx, cx
    mov dx, 0018
    mov ah, 11
    call sub_1bd7_0b1a
    inc dx
    pop cx
    mov ch, dl
    pop dx
    pop ax
    push ax
    push cx
    call sub_1bd7_0d4e
    pop cx
    pop ax
    cmp al, [6ac0]  ; data_7fc1_6ac0 byte read
    jnz loc_1bd7_23a2
    cmp cl, [6ac3]  ; data_7fc1_6ac3 byte read
    jnz loc_1bd7_23a2
    cmp ch, [6ac4]  ; data_7fc1_6ac4 byte read
    jz loc_1bd7_23a7

loc_1bd7_23a2:
    or byte ptr [6abf], 01

loc_1bd7_23a7:
    mov al, [6ac0]  ; data_7fc1_6ac0 byte read
    mov ah, [6ac2]  ; data_7fc1_6ac2 byte read
    mov [6ab9], ax  ; data_7fc1_6ab9 word write
    mov ax, [6637]  ; data_7fc1_6637 word read
    mov [6abb], ax  ; data_7fc1_6abb word write
    mov ax, [6ac3]  ; data_7fc1_6ac3 word read
    mov [6abd], ax  ; data_7fc1_6abd word write
    cmp ah, 19
    jnz loc_1bd7_23d2
    cmp byte ptr [6ac1], 07  ; data_7fc1_6ac1 byte read
    jnz loc_1bd7_23d2
    mov ax, 0c0c
    mov [6ab4], ax
    mov [6ab2], al

loc_1bd7_23d2:
    call sub_1bd7_0b5e
    mov [6ab6], cx  ; data_7fc1_6ab6 word write
    add byte ptr [6abf], 01  ; data_7fc1_6abf byte readwrite
    jnz loc_1bd7_23e5
    call sub_1bd7_0b2e
    jz loc_1bd7_23e8

loc_1bd7_23e5:
    mov dx, 0101

loc_1bd7_23e8:
    cmp dl, [6ac4]  ; data_7fc1_6ac4 byte read
    jnz loc_1bd7_23f4
    dec dx
    or byte ptr [6618], 80  ; data_7fc1_6618 byte readwrite

loc_1bd7_23f4:
    mov [675a], dx  ; data_7fc1_675a word write
    call sub_1bd7_038e

loc_1bd7_23fb:
    clc
    ret
