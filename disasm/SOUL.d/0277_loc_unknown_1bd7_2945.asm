loc_unknown_1bd7_2945:
    mov bx, 290c
    mov al, 07
    add byte ptr [57b5], 01  ; data_7fc1_57b5 byte readwrite
    jnz loc_1bd7_2971
    cmp byte ptr [57b5], 08  ; data_7fc1_57b5 byte read
    jz loc_1bd7_2971
    and al, [6ab8]  ; data_7fc1_6ab8 byte readwrite
    cmp al, 07
    jz loc_1bd7_2971
    xor al, al
    mov bx, 28ba
    cmp cl, 28
    jz loc_1bd7_296f
    mov bx, 28e3
    mov al, 02

loc_1bd7_296f:
    add al, ah

loc_1bd7_2971:
    mov cx, 0029
    push ax
    call sub_1bd7_2c06
    pop ax
    mov [6ac1], ax  ; data_7fc1_6ac1 word write
    add byte ptr [57b4], 23  ; data_7fc1_57b4 byte readwrite
    jnz loc_1bd7_29a9
    mov ah, 07
    add byte ptr [57b4], 04  ; data_7fc1_57b4 byte readwrite
    jz loc_1bd7_2999
    cmp word ptr [57b6], 40
    ja loc_1bd7_2999
    cmp al, 01
    jbe loc_1bd7_2999
    shr ah, 01

loc_1bd7_2999:
    mov [6ad0], ah  ; data_7fc1_6ad0 byte write
    add byte ptr [57b5], 02  ; data_7fc1_57b5 byte readwrite
    jz loc_1bd7_29a9
    mov byte ptr [6acc], 0f

loc_1bd7_29a9:
    cmp al, 07
    jz loc_1bd7_29ba
    add byte ptr [57b5], 1c  ; data_7fc1_57b5 byte readwrite
    jz loc_1bd7_29ba
    mov word ptr [6ad5], 5648  ; data_7fc1_6ad5 word write

loc_1bd7_29ba:
    mov al, [6ad2]  ; data_7fc1_6ad2 byte read
    mov [6636], al  ; data_7fc1_6636 byte write
    mov word ptr [6ab0], 0770  ; data_7fc1_6ab0 word write
    clc
    ret
