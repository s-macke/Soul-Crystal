; ========================================
; New Subroutine: sub_1bd7_2b8e
; ========================================
sub_1bd7_2b8e:
    call sub_1bd7_0fcd
    jb loc_1bd7_2b9f
    xor ah, ah
    int 2a
    or ah, ah
    jz loc_1bd7_2b9f
    inc byte ptr [57cd]

loc_1bd7_2b9f:
    mov bx, ffff
    mov es, bx
    mov ah, es:[000e]
    mov [57cf], ah  ; data_7fc1_57cf byte write
    mov dx, 0021
    cli
    in al, dx
    cmp ah, fc
    jnz loc_1bd7_2bba
    and al, fb
    out dx, al

loc_1bd7_2bba:
    sti
    mov [57ce], al  ; data_7fc1_57ce byte write
    call sub_1bd7_0f72
    or byte ptr [6839], 10  ; data_7fc1_6839 byte readwrite
    xor ax, ax
    mov es, ax
    cmp byte ptr [57cf], fc  ; data_7fc1_57cf byte read
    jbe loc_1bd7_2bd8
    cmp byte ptr [57cf], fe
    jnz loc_1bd7_2be1

loc_1bd7_2bd8:
    mov al, es:[0496]  ; 07dc:0496 byte read
    and al, 10
    mov [57cc], al  ; data_7fc1_57cc byte write

loc_1bd7_2be1:
    call sub_1bd7_2bff
    xor ax, ax
    ret
