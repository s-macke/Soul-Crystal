; ========================================
; New Subroutine: sub_1bd7_3fc0
; ========================================
sub_1bd7_3fc0:
    add ax, 000f
    adc dx, 00
    shr dx, 01
    rcr ax, 01
    shr dx, 01
    rcr ax, 01
    shr dx, 01
    rcr ax, 01
    shr dx, 01
    rcr ax, 01
    ret
