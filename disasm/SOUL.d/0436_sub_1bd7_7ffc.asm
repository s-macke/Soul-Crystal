; ========================================
; New Subroutine: sub_1bd7_7ffc
; ========================================
sub_1bd7_7ffc:
    push bp
    mov bp, sp
    sub sp, 04
    push si
    mov si, 6b4c
    sub ax, ax
    mov [bp-2], ax
    mov [bp-4], ax
    jmp loc_1bd7_8013

loc_1bd7_8010:
    add si, 0c

loc_1bd7_8013:
    cmp [6d2c], si  ; data_7fc1_6d2c word read
    jb loc_1bd7_803f
    add byte ptr [si+a], 83
    jnz loc_1bd7_8010
    mov word ptr [si+4], 0000
    mov byte ptr [si+a], 00
    sub ax, ax
    mov [si+8], ax
    mov [si+6], ax
    mov [si+2], ax
    mov [si], ax
    mov byte ptr [si+b], ff
    mov [bp-4], si
    mov [bp-2], ds

loc_1bd7_803f:
    mov ax, [bp-4]
    mov dx, [bp-2]
    pop si
    mov sp, bp
    pop bp
    retf
