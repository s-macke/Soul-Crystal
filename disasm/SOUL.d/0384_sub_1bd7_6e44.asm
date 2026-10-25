; ========================================
; New Subroutine: sub_1bd7_6e44
; ========================================
sub_1bd7_6e44:
    mov ah, 30
    int 21
    mov [67d8], ax  ; data_7fc1_67d8 word write
    mov ax, 3500
    int 21
    mov [67c4], bx  ; data_7fc1_67c4 word write
    mov [67c6], es  ; data_7fc1_67c6 word write
    mov cx, [6dfe]  ; data_7fc1_6dfe word read
    jcxz loc_1bd7_6e8c
    mov es, [67d6]  ; data_7fc1_67d6 word read
    mov si, es:[002c]  ; 0ff0:002c word read
    lds ax, [6e00]  ; data_7fc1_6e00 word read
    mov dx, ds
    xor bx, bx
    call far, ss:[6dfc]
    jae loc_1bd7_6e7b
    push ss
    pop ds
    jmp loc_1bd7_6d7a

loc_1bd7_6e7b:
    lds ax, ss:[6e04]  ; data_7fc1_6e04 word read
    mov dx, ds
    mov bx, 0003
    call far, ss:[6dfc]
    push ss
    pop ds

loc_1bd7_6e8c:
    add byte ptr [6b2a], 03  ; data_7fc1_6b2a byte readwrite
    jz loc_1bd7_6e99
    mov byte ptr [6b2a], 00
    retf

loc_1bd7_6e99:
    mov es, [67d6]  ; data_7fc1_67d6 word read
    mov cx, es:[002c]  ; 0ff0:002c word read
    jcxz loc_1bd7_6ee2
    mov es, cx
    xor di, di

loc_1bd7_6ea8:
    cmp byte ptr es:[di], 00
    jz loc_1bd7_6ee2
    mov cx, 000d
    mov si, 67b6
    repz cmpsb
    jz loc_1bd7_6ec3
    mov cx, 7fff
    xor ax, ax
    repnz scasb
    jnz loc_1bd7_6ee2
    jmp loc_1bd7_6ea8

loc_1bd7_6ec3:
    push es
    push ds
    pop es
    pop ds
    mov si, di
    mov di, 67df
    mov cl, 04

loc_1bd7_6ece:
    lodsb byte ptr [si]
    sub al, 41
    jb loc_1bd7_6ee0
    shl al, cl
    xchg ax, dx
    lodsb byte ptr [si]
    sub al, 41
    jb loc_1bd7_6ee0
    or al, dl
    stosb
    jmp loc_1bd7_6ece

loc_1bd7_6ee0:
    push ss
    pop ds

loc_1bd7_6ee2:
    mov bx, 0004

loc_1bd7_6ee5:
    and byte ptr ss:[bx+67df], bf
    mov ax, 4400
    int 21
    jb loc_1bd7_6efd
    add dl, 80
    jz loc_1bd7_6efd
    or byte ptr ss:[bx+67df], 40

loc_1bd7_6efd:
    dec bx
    jns loc_1bd7_6ee5
    mov si, 6e18
    mov di, 6e18
    call sub_1bd7_6fb8
    mov si, 6df6
    mov di, 6dfa
    call sub_1bd7_6fb8
    retf
