; ============================================================
; AUTO-GENERATED FILE - DO NOT EDIT
; ============================================================
; Generated: 2026-03-22T22:07:03Z
; Source:    C2.bin
; ============================================================

         .ORG $C900

; === SUBROUTINE: ENTRY_C900 ===

$C900 ENTRY_C900:       
    JMP $C926                         ; Jump to L_C926

; === SUBROUTINE: ENTRY_C903 ===

$C903 ENTRY_C903:       
    JMP $C910                         ; Jump to L_C910

; === SUBROUTINE: ENTRY_C906 ===

$C906 ENTRY_C906:       
    JSR $C97E                         ; Call SUB_C97E
    JSR $B006                         ; Call SUB_B006
    JSR $C988                         ; Call SUB_C988
    RTS
$C910 L_C910:                         ; xref: jump from $C903 (ENTRY_C903)
    JSR $C97E                         ; Call SUB_C97E
    LDA $CFF5
    BNE $C91F                         ; Branch to L_C91F
    JSR $B006                         ; Call SUB_B006
    JSR $C988                         ; Call SUB_C988
    RTS
$C91F L_C91F:                         ; xref: branch from $C916
    JSR $B003                         ; Call SUB_B003
    JSR $C988                         ; Call SUB_C988
    RTS
$C926 L_C926:                         ; xref: jump from $C900 (ENTRY_C900)
    JSR $C97E                         ; Call SUB_C97E
    AND #$3F
    TAX
    LDA $C9C0,X
    STA $C99E
    CMP $CFF3
    BNE $C942                         ; Branch to L_C942
    LDA $C99F
    CMP $CFF2
    BNE $C942                         ; Branch to L_C942
    JMP $C97A                         ; Jump to L_C97A
$C942 L_C942:                         ; xref: branch from $C935
                                      ; xref: branch from $C93D
    LDA $C99E
    BEQ $C97A                         ; Branch to L_C97A
    JSR $B006                         ; Call SUB_B006
    LDA $C99E
    ASL A
    TAX
    LDA $C9A0,X
    STA $C99C
    LDA $C9A1,X
    STA $C99D
    LDA #$00
    LDX $C99C
    LDY $C99D
    JSR $CB09                         ; Call SUB_CB09
    LDA $C99F
    STA $CFF2
    LDA $C99E
    STA $CFF3
    LDA $CFF5
    BEQ $C97A                         ; Branch to L_C97A
    JSR $B003                         ; Call SUB_B003
$C97A L_C97A:                         ; xref: jump from $C93F
                                      ; xref: branch from $C945
                                      ; xref: branch from $C975
    JSR $C988                         ; Call SUB_C988
    RTS

; === SUBROUTINE: SUB_C97E ===

$C97E SUB_C97E:                       ; xref: call from $C906 (ENTRY_C906)
                                      ; xref: call from $C910 (L_C910)
                                      ; xref: call from $C926 (L_C926)
    LDX $01
    STX $C98E
    LDX #$36
    STX $01
    RTS

; === SUBROUTINE: SUB_C988 ===

$C988 SUB_C988:                       ; xref: call from $C90C
                                      ; xref: call from $C91B
                                      ; xref: call from $C922
                                      ; xref: call from $C97A (L_C97A)
    LDX $C98E
    STX $01
    RTS

; === DATA SECTION ===

; xref: write from $C980
; xref: read from $C988 (SUB_C988)
$C98E                   .BYTE $00,$00                                                          ; ".."
$C990                   .BYTE $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00                  ; "............"
; xref: write from $C952
; xref: read from $C95D
$C99C                   .BYTE $00                                                              ; "."
; xref: write from $C958
; xref: read from $C960
$C99D                   .BYTE $00                                                              ; "."
; xref: write from $C92F
; xref: read from $C942 (L_C942)
; xref: read from $C94A
; xref: read from $C96C
$C99E                   .BYTE $00                                                              ; "."
; xref: read from $C937
; xref: read from $C966
$C99F                   .BYTE $04                                                              ; "."
; xref: read from $C94F
$C9A0                   .BYTE $A0                                                              ; "."
; xref: read from $C955
$C9A1                   .BYTE $A1,$1F,$0F,$1F,$0F,$20,$01,$22,$02,$20,$0B,$22,$01,$22,$05      ; "..... .". ."."."
$C9B0                   .BYTE $B0,$B1,$B2,$B3,$B4,$B5,$B6,$B7,$B8,$B9,$BA,$BB,$BC,$BD,$BE,$BF  ; "................"
; xref: read from $C92C
$C9C0                   .BYTE $00,$05,$01,$01,$01,$02,$02,$02,$02,$02,$02,$02,$07,$07,$01,$04  ; "................"
$C9D0                   .BYTE $04,$04,$04,$04,$03,$03,$04,$03,$04,$04,$04,$04,$04,$04,$05,$05  ; "................"
$C9E0                   .BYTE $05,$05,$05,$05,$05,$05,$05,$05,$06,$06,$06,$06,$06,$06,$06,$06  ; "................"
$C9F0                   .BYTE $06,$06,$06,$06,$06,$06,$06,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; "................"

; End of disassembly
