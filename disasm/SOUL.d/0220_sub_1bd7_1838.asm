; ========================================
; New Subroutine: sub_1bd7_1838
; ========================================
sub_1bd7_1838:
    push cx
    mov bx, [682d]  ; data_7fc1_682d word read
    mov ax, [bx+2]
    mov [5778], ax  ; data_7fc1_5778 word write
    mov si, [bx]
    mov [5776], si  ; data_7fc1_5776 word write

loc_1bd7_1849:
    push ax
    or ax, si
    pop ax
    jz loc_1bd7_187e
    add bx, 04
    mov es, ax
    cmp ax, [6825]  ; data_7fc1_6825 word read
    jb loc_1bd7_1860
    cmp ax, [6823]  ; data_7fc1_6823 word read
    jb loc_1bd7_1877

loc_1bd7_1860:
    mov ax, es:[si+2e]
    or [6843], ax  ; data_7fc1_6843 word readwrite
    test ax, 0200
    jnz loc_1bd7_1833
    test ax, 0008
    jz loc_1bd7_1833
    test ax, 0002
    jnz loc_1bd7_1833

loc_1bd7_1877:
    mov si, [bx]
    mov ax, [bx+2]
    jmp loc_1bd7_1849

loc_1bd7_187e:
    pop cx
    ret
