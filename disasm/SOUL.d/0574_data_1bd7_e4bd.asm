data_1bd7_e4bd:
    db 90  ; |.|

loc_1bd7_e4be:
    mov al, 20
    out 20, al

loc_1bd7_e4c2:
    dec bh
    jz loc_1bd7_e4ce
    mov cs:[e2a0], bx  ; data_1bd7_e2a0 word write
    jmp loc_1bd7_e589

loc_1bd7_e4ce:
    mov bh, cs:[e2b0]  ; data_1bd7_e2b0 byte read
    mov cs:[e2a0], bx  ; data_1bd7_e2a0 word write
    cmp byte ptr cs:[e2b1], ff  ; data_1bd7_e2b1 byte read
    jnz loc_1bd7_e4e3
    jmp loc_1bd7_e589

loc_1bd7_e4e3:
    push cx
    push dx
    push si
    push ds
    cld
    lds si, cs:[e2a6]  ; data_1bd7_e2a6 word read

loc_1bd7_e4ed:
    lodsb byte ptr [si]
    cmp al, 01
    jnz loc_1bd7_e51d

loc_1bd7_e4f2:
    lodsw word ptr [si]
    cmp al, ff
    jz loc_1bd7_e4fc
    call sub_1bd7_e3c2
    jmp loc_1bd7_e4f2

loc_1bd7_e4fc:
    cmp ah, ff
    jz loc_1bd7_e57b
    cmp ah, fe
    jnz loc_1bd7_e57b
    lds si, cs:[e2a2]
    mov bx, cs:[e2ae]
    add bx, 02
    mov cs:[e2ae], bx
    add si, [bx+si]
    jmp loc_1bd7_e57b

data_1bd7_e51c:
    db 90  ; |.|

loc_1bd7_e51d:
    cmp al, 00
    jnz loc_1bd7_e524
    jmp loc_1bd7_e57b

data_1bd7_e523:
    db 90  ; |.|

loc_1bd7_e524:
    cmp al, 02
    jnz loc_1bd7_e531
    mov byte ptr cs:[e2b1], ff
    jmp loc_1bd7_e57b

data_1bd7_e530:
    db 90  ; |.|

loc_1bd7_e531:
    cmp al, 03
    jnz loc_1bd7_e542
    mov cs:[e2aa], si
    mov cs:[e2ac], ds
    jmp loc_1bd7_e57b

data_1bd7_e541:
    db 90  ; |.|

loc_1bd7_e542:
    cmp al, 04
    jnz loc_1bd7_e54d
    lds si, cs:[e2aa]
    jmp loc_1bd7_e4ed

loc_1bd7_e54d:
    cmp al, 05
    jnz loc_1bd7_e558
    lodsb byte ptr [si]
    mov cs:[e2b0], al  ; data_1bd7_e2b0 byte write
    jmp loc_1bd7_e4ed

loc_1bd7_e558:
    cmp al, 06
    jnz loc_1bd7_e575
    lodsb byte ptr [si]
    xor ah, ah
    shl ax, 01
    mov cs:[e2ae], ax
    mov bx, ax
    mov cs:[e2ae], ax
    lds si, cs:[e2a2]
    add si, [bx+si]
    jmp loc_1bd7_e4ed

loc_1bd7_e575:
    mov byte ptr cs:[e2b1], ff

loc_1bd7_e57b:
    mov cs:[e2a6], si  ; data_1bd7_e2a6 word write
    mov cs:[e2a8], ds  ; data_1bd7_e2a8 word write
    pop ds
    pop si
    pop dx
    pop cx

loc_1bd7_e589:
    pop bx
    pop ax
    iret
