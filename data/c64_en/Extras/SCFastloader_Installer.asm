
;-------------------------------------------------------------------------------
; Soul Crystal Fast Loader
; Source-code reconstruction by CSixx^MYD/ONS (2023)
;
; The original code loaded drivecode directly from tracks/sectors into drive
; memory, this one is self-contained and sends the code to the drive during
; install.
;
; To install drivecode:
; Include the SCFastloader_Installer.asm (this file) in your source and
; JSR InstallFastload. Once complete, memory can be reused.
;
; To install runtime:
; Include the SCFastloader_Runtime.asm in your source and
; JSR SCRelocateRuntime. This will install the loader to $0280.
;
; *Use at your own risk: may contain errors and/or misinterpretations.
;
;-------------------------------------------------------------------------------

datbf           = $14           		;Temp variable
loadtempreg		= $72
codepointer		= $73

;-------------------------------------------------------------------------------
; START OF DRIVE CODE
; This is a small transfer routine used to load code from the C64 to the
; drive, done so that drivecode can cover 100-6ff.
;-------------------------------------------------------------------------------
drvprog:								;Address in C64's memory
!pseudopc $0700 {						;Start of code in diskdrive's memory
drvprogstart
		sei
		LDX #$15						;not necessary from cold-boot
		TXS								;but left in just incase.
		
--		ldx #$0							;start getting bytes from c64 and 
-		jsr drv_getbyte					;storing at 100
gbsta=*+2
		sta $100,x						
		inx
		bne -
		inc gbsta
		lda gbsta
		cmp #$07
		bne --
		;rts
		jmp $0118						;start of drivecode execution
		

;-------------------------------------------------------------------------------
; GETBYTE
; From COVERT BITOPS IRQ-loader
;-------------------------------------------------------------------------------
drv_getbyte:        
		ldy #$08						;Counter: receive 8 bits
recvbit:        
		lda #$85
		and $1800						;Wait for CLK==low || DATA==low
		bmi gotatn						;Quit if ATN
		beq recvbit
		lsr								;Read the data bit
		lda #2							;Prepare for CLK=high, DATA=low
		bcc rskip
		lda #8							;Prepare for CLK=low, DATA=high
rskip:          
		sta $1800						;Acknowledge the bit received
		ror datbf						;and store it
rwait:          
		lda $1800						;Wait for CLK==high || DATA==high
		and #5
		eor #5
		beq rwait
		lda #0
		sta $1800						;Set CLK=DATA=high
		dey
		bne recvbit						;Loop until all bits have been received
		lda datbf						;Return the data to A
		rts
gotatn:         
		pla								;If ATN goes low, exit to the operating
		pla								;system. Discard the return address.
		rts
		

drvproglength		
}
drvprogend


mwcmd:          !byte AMOUNT,>drvprogstart,<drvprogstart
!text "W-M"
emwcmd
lmwcmd   =      emwcmd-mwcmd

mecmd:          !byte >drvprogstart,<drvprogstart
!text "E-M"
emecmd
lmecmd   =      emecmd-mecmd

;-------------------------------------------------------------------------------
; Routine to send initial drivecode via m-w
; From COVERT BITOPS IRQ-loader
;-------------------------------------------------------------------------------
InstallFastload
il_isntsc:      lda #<drvprog           ;Initialize selfmodifying code
                sta il_mwbyte+1
                lda #>drvprog
                sta il_mwbyte+2
                lda #<drvprogstart
                sta mwcmd+2
                lda #>drvprogstart
                sta mwcmd+1
il_mwloop:      jsr il_device           ;Set drive to listen
                ldx #lmwcmd - 1
il_sendmw:      lda mwcmd,x             ;Send M-W command
                jsr ciout
                dex
                bpl il_sendmw
                ldx #0
il_mwbyte:      lda drvprog,x			;Send AMOUNT bytes of drive
                jsr ciout				;code
                inx
                cpx #AMOUNT
                bne il_mwbyte
                jsr unlsn               ;Unlisten starts the command
                lda mwcmd+2
                clc
                adc #AMOUNT
                sta mwcmd+2
                bcc il_nohigh
                inc mwcmd+1
il_nohigh:      lda il_mwbyte+1
                clc                     ;Move pointers
                adc #AMOUNT
                sta il_mwbyte+1
                tax
                bcc il_nohigh2
                inc il_mwbyte+2
il_nohigh2:     lda il_mwbyte+2
                cpx #<drvprogend
                sbc #>drvprogend
                bcc il_mwloop

                jsr il_device           ;Set drive to listen again
                ldx #lmecmd - 1
il_sendme:      lda mecmd,x             ;Send M-E command
                jsr ciout
                dex
                bpl il_sendme
                jsr unlsn               ;Unlisten starts the command
				jmp SendDrivecode

il_device:      lda fa
                jsr listen
                lda #$6f
                jmp second

;-------------------------------------------------------------------------------
; SendDrivecode
; Once the initial drivecode is sent and started, this routine starts
; sending the main drivecode.
;-------------------------------------------------------------------------------				
SendDrivecode
		lda #<FullDriveCode
		sta codepointer
		lda #>FullDriveCode
		sta codepointer+1
		
-		ldy totalBytes
		lda (codepointer),y
		jsr load_sendbyte
		inc totalBytes
		bne -
		
		inc codepointer+1
		lda codepointer+1
		cmp #>FullDriveCodeEnd
		bne -
		
		rts
		
totalBytes !byte 0		

;-------------------------------------------------------------------------------
; SENDBYTE
; From COVERT BITOPS IRQ-loader
;-------------------------------------------------------------------------------
load_sendbyte:
		clc
		sta loadtempreg
		ldy #$08						;Bit counter
sendbyte_bitloop:
		lsr loadtempreg					;Rotate byte to be sent
		lda $dd00
		and #$ff-$30
		ora #$10
		bcc sendbyte_zerobit
		eor #$30
sendbyte_zerobit:
		sta $dd00
		lda #$c0						;Wait for CLK & DATA low
sendbyte_ack:   
		bit $dd00
		bne sendbyte_ack
		lda $dd00
		and #$ff-$30					;Set DATA and CLK high
		sta $dd00
sendbyte_ack2:  
		bit $dd00						;Wait for CLK & DATA high
		bvc sendbyte_ack2
		bpl sendbyte_ack2
		dey
		bne sendbyte_bitloop
sendbyte_endloop:
		rts
		
;-------------------------------------------------------------------------------
; FullDriveCode
; This is the main drivecode.
; Loads to 0100 in drive mem and is started with jmp to $0118
;-------------------------------------------------------------------------------
!align 255, 0
FullDriveCode
!pseudopc $0100 {
!byte $17,$01
!byte $17,$01
!byte $17,$01
!byte $17,$01
!byte $17,$01
!byte $17,$01
!byte $17,$01
!byte $17,$01
!byte $17,$01
!byte $17,$01
!byte $17,$01
!byte $17,$01

a0118	LDA #$EA
a011a	STA a04fb
a011d	JSR a0334
a0120	LDX #$17
a0122	TXS
a0123	LDA #$04
a0125	BIT $1800
a0128	BEQ a0125
a012a	LDA $1C00
a012d	AND #$F7
a012f	STA $1C00
a0132	LDA #$FC
a0134	STA $0D
a0136	INC $0B
a0138	BNE a014a
a013a	INC $0C
a013c	BNE a014a
a013e	INC $0D
a0140	BNE a014a
a0142	LDA $1C00
a0145	AND #$F3
a0147	STA $1C00
a014a	LDA #$01
a014c	BIT $1800
a014f	BEQ a0136
a0151	LDA #$00
a0153	STA $1800
a0156	LDA $1C00
a0159	ORA #$08
a015b	STA $1C00
a015e	JSR a01a6
a0161	TAY
a0162	JSR a01a6
a0165	STA $00
a0167	JSR a01a6
a016a	STA $01
a016c	LDA #$01
a016e	PHA
a016f	LDA #$88
a0171	PHA
a0172	LDA a017b+1,Y
a0175	PHA
a0176	LDA a017b,Y
a0179	PHA
a017a	RTS

a017b
!byte $5B,$02,$29	
!byte $02	
!byte $21,$02	
!byte $DB,$01,$88	
!byte $00	
!byte $90,$01	
!byte $9E,$01,$A9	
!byte $FF,$20,$09	
!byte $03,$4C	
!byte $1D,$01,$A0	
!byte $00

a0193	JSR a01a6
a0196	STA $0700,Y
a0199	INY
a019a	BNE a0193
a019c	JMP $0700
a019f	LDA #$EA
a01a1	STA a01c7
a01a4	LDY #$00
a01a6	LDX #$04
a01a9=*+1
a01a8	LDA #$04
a01aa	BIT $1800
a01ad	BEQ a01aa
a01af	LDA $1800
a01b2	LSR
a01b3	ROR $03
a01b5	LDA #$04
a01b7	BIT $1800
a01ba	BNE a01b7
a01bc	LDA $1800
a01bf	LSR
a01c0	ROR $03
a01c2	DEX
a01c3	BNE a01a8
a01c5	LDA $03
a01c7	RTS

a01c8	STA $0700,Y
a01cb	INY
a01cc	BNE a01a6
a01ce	JSR a0334
a01d1	LDA #$60
a01d3	STA a01c7
a01d6	JSR a0299
a01d9	JMP a033c
a01dc	JSR a0334
a01df	LDA $00
a01e1	STA a0201
a01e4	JSR a0347
a01e7	LDA #$00
a01e9	STA $16
a01eb	STA $17
a01ed	LDX #$14
a01ef	LDA #$80
a01f1	AND $1C00
a01f4	BPL a01fc
a01f6	INY
a01f7	BNE a01f1
a01f9	DEX
a01fa	BNE a01f1
a01fc	PHA
a01fd	TAX
a01fe	BMI a0211
a0201=*+1
a0200	LDA #$00
a0202	JSR a0573
a0205	BCC a0211
a0207	LDA #$00
a0209	STA $12
a020b	STA $13
a020d	STA $16
a020f	STA $17
a0211	JSR a033c
a0214	LDA $16
a0216	JSR a0309
a0219	LDA $17
a021b	JSR a0309
a021e	PLA
a021f	JMP a0309
a0222	LDA $1C00
a0225	AND #$10
a0227	JMP a0309
a022a	JSR a03d6
a022d	LDY #$FF
a022f	LDA $0700
a0232	BNE a0237
a0234	LDY $0701
a0237	DEY
a0238	TYA
a0239	PHA
a023a	JSR a0309
a023d	PLA
a023e	CLC
a023f	ADC #$02
a0241	STA a0295
a0244	LDY #$02
a0246	JSR a0266
a0249	LDA $0700
a024c	JSR a0309
a024f	LDA $0701
a0252	STA $01
a0254	LDA $0700
a0257	STA $00
a0259	BNE a022a
a025b	RTS

a025c	JSR a03d6
a025f	LDA #$00
a0261	STA a0295
a0264	LDY #$00
a0266	LDA $0700,Y
a0269	STA $03
a026b	LDA #$04
a026d	STA $0E
a026f	LSR $03
a0271	LDX #$02
a0273	BCC a0277
a0275	LDX #$00
a0277	BIT $1800
a027a	BNE a0277
a027c	STX $1800
a027f	LSR $03
a0281	LDX #$02
a0283	BCC a0287
a0285	LDX #$00
a0287	BIT $1800
a028a	BEQ a0287
a028c	STX $1800
a028f	DEC $0E
a0291	BNE a026f
a0293	INY
a0295=*+1
a0294	CPY #$00
a0296	BNE a0266
a0298	RTS

a0299	JSR a0509
a029c	STA $3A
a029e	LDA #$00
a02a0	STA $30
a02a2	STA $31
a02a4	STA $2E
a02a6	STA $36
a02a8	LDA #$BB
a02aa	STA $34
a02ac	STA $50
a02ae	LDA #$07
a02b0	STA $2F
a02b2	LDA #$07
a02b4	STA $52
a02b6	JSR $F7A9
a02b9	JSR a03ca
a02bc	BCS a0308
a02be	LDX #$08
a02c0	BVC a02c0
a02c2	CLV
a02c3	DEX
a02c4	BPL a02c0
a02c6	STX $1C03
a02c9	LDA $1C0C
a02cc	AND #$1F
a02ce	ORA #$C0
a02d0	STA $1C0C
a02d3	TXA
a02d4	LDX #$05
a02d6	STA $1C01
a02d9	CLV
a02da	BVC a02da
a02dc	CLV
a02dd	DEX
a02de	BNE a02da
a02e0	LDY #$BB
a02e2	LDA $0000,Y
a02e5	BVC a02e5
a02e7	CLV
a02e8	STA $1C01
a02eb	INY
a02ec	BNE a02e2
a02ee	LDA $0700,Y
a02f1	BVC a02f1
a02f3	CLV
a02f4	STA $1C01
a02f7	INY
a02f8	BNE a02ee
a02fa	BVC a02fa
a02fc	LDA $1C0C
a02ff	ORA #$E0
a0301	STA $1C0C
a0304	STY $1C03
a0307	CLC
a0308	RTS

a0309	STA $03
a030b	LDA #$04
a030d	STA $0E
a030f	LSR $03
a0311	LDX #$02
a0313	BCC a0317
a0315	LDX #$00
a0317	BIT $1800
a031a	BNE a0317
a031c	STX $1800
a031f	LSR $03
a0321	LDX #$02
a0323	BCC a0327
a0325	LDX #$00
a0327	BIT $1800
a032a	BEQ a0327
a032c	STX $1800
a032f	DEC $0E
a0331	BNE a030f
a0333	RTS

a0334	PHA
a0335	LDA $1800
a0338	ORA #$08
a033a	BNE a0342
a033c	PHA
a033d	LDA $1800
a0340	AND #$F7
a0342	STA $1800
a0345	PLA
a0346	RTS

a0347	LDA #$00
a0349	STA $1C03
a034c	LDA $1C0C
a034f	ORA #$EE
a0351	STA $1C0C
a0354	LDA $1C00
a0357	AND #$04
a0359	BNE a0368
a035b	LDA $1C00
a035e	ORA #$04
a0360	STA $1C00
a0363	LDA #$00
a0365	JSR a03bf
a0368	RTS

a0369	LDA $08
a036b	BEQ a0387
a036d	CMP $00
a036f	BEQ a0391
a0371	BCS a037a
a0373	INC $08
a0375	LDX #$01
a0377	JMP a037e
a037a	DEC $08
a037c	LDX #$FF
a037e	JSR a03aa
a0381	JSR a03aa
a0384	JMP a0369
a0387	LDA #$80
a0389	JSR a0573
a038c	BCS a03a9
a038e	JMP a0369
a0391	LDX #$04
a0393	CMP $FED6,X
a0396	DEX
a0397	BPL a039b
a0399	INX
a039a	CLC
a039b	BCS a0393
a039d	LDA $1C00
a03a0	AND #$9F
a03a2	ORA a0682+4,X
a03a5	STA $1C00
a03a8	CLC
a03a9	RTS

a03aa	LDA $1C00
a03ad	AND #$FC
a03af	STA $04
a03b1	TXA
a03b2	CLC
a03b3	ADC $1C00
a03b6	AND #$03
a03b8	ORA $04
a03ba	STA $1C00
a03bd	LDA #$04
a03bf	LDY #$00
a03c1	INY
a03c2	BNE a03c1
a03c4	SEC
a03c5	SBC #$01
a03c7	BNE a03bf
a03c9	RTS

a03ca	JSR a0347
a03cd	JSR a0369
a03d0	BCS a03d5
a03d2	JSR a051d
a03d5	RTS

a03d6	JSR a0334
a03d9	LDA #$04
a03db	STA $07
a03dd	JSR a03ca
a03e0	BCC a03e5
a03e2	JMP a04ef
a03e5	JSR a0638
a03e8	BVC a03e8
a03ea	CLV
a03eb	LDA $1C01
a03ee	STA $0700,Y
a03f1	INY
a03f2	BNE a03e8
a03f4	LDY #$BA
a03f6	BVC a03f6
a03f8	CLV
a03f9	LDA $1C01
a03fc	STA $0000,Y
a03ff	INY
a0400	BNE a03f6
a0402	STY $34
a0404	STY $36
a0406	LDA #$00
a0408	STA $30
a040a	LDA #$07
a040c	STA $31
a040e	LDA #$60
a0410	STA a04bb
a0413	JSR a042d
a0416	LDA #$EA
a0418	STA a04bb
a041b	LDA $52
a041d	CMP #$07
a041f	BEQ a0426
a0421	LDA #$02
a0423	JMP a04ef
a0426	LDY #$00
a0428	JMP a04c6
a042b	STY $36
a042d	LDY $34
a042f	LDA ($30),Y
a0431	TAX
a0432	LSR
a0433	LSR
a0434	LSR
a0435	STA $56
a0437	TXA
a0438	AND #$07
a043a	ASL
a043b	ASL
a043c	STA $57
a043e	INY
a043f	BNE a0445
a0441	STY $31
a0443	LDY #$BA
a0445	LDA ($30),Y
a0447	ROL
a0448	ROL
a0449	ROL
a044a	AND #$03
a044c	ORA $57
a044e	TAX
a044f	LDA $F8C0,X
a0452	LDX $56
a0454	ORA $F8A0,X
a0457	STA $52
a0459	LDA ($30),Y
a045b	LSR
a045c	AND #$1F
a045e	STA $58
a0460	INY
a0461	LDA ($30),Y
a0463	PHA
a0464	ROL
a0465	ROL
a0466	ROL
a0467	ROL
a0468	ROL
a0469	AND #$1F
a046b	TAX
a046c	LDA $F8C0,X
a046f	LDX $58
a0471	ORA $F8A0,X
a0474	STA $53
a0476	INY
a0477	LDA ($30),Y
a0479	STA $5B
a047b	ASL
a047c	PLA
a047d	AND #$0F
a047f	ROL
a0480	STA $5A
a0482	LDA $5B
a0484	LSR
a0485	LSR
a0486	AND #$1F
a0488	TAX
a0489	LDA $F8C0,X
a048c	LDX $5A
a048e	ORA $F8A0,X
a0491	STA $54
a0493	LDA $5B
a0495	AND #$03
a0497	ASL
a0498	ASL
a0499	ASL
a049a	STA $5C
a049c	INY
a049d	LDA ($30),Y
a049f	ROL
a04a0	ROL
a04a1	ROL
a04a2	ROL
a04a3	AND #$07
a04a5	ORA $5C
a04a7	STA $5C
a04a9	LDA ($30),Y
a04ab	AND #$1F
a04ad	TAX
a04ae	LDA $F8C0,X
a04b1	LDX $5C
a04b3	ORA $F8A0,X
a04b6	STA $55
a04b8	INY
a04b9	STY $34
a04bb	NOP
a04bc	LDY $36
a04be	LDA $52
a04c0	STA $0700,Y
a04c3	INY
a04c4	BEQ a04db
a04c6	LDA $53
a04c8	STA $0700,Y
a04cb	INY
a04cc	LDA $54
a04ce	STA $0700,Y
a04d1	INY
a04d2	LDA $55
a04d4	STA $0700,Y
a04d7	INY
a04d8	JMP a042b
a04db	LDA $53
a04dd	STA $3A
a04df	LDA $2F
a04e1	STA $31
a04e3	JSR a0509
a04e6	CMP $3A
a04e8	BEQ a04ed
a04ea	LDA #$04
a04ed=*+1
a04ec	BIT $00A9
a04ef	CMP #$00
a04f1	BEQ a04fb
a04f3	DEC $07
a04f5	JSR a0626
a04f8	JMP a03dd
a04fb	RTS

a04fc	PHA
a04fd	JSR a033c
a0500	JSR a0309
a0503	PLA
a0504	BEQ a0508
a0506	PLA
a0507	PLA
a0508	RTS

a0509	LDY #$3F
a050b	LDA #$00
a050d	EOR $0700,Y
a0510	EOR $0700+$40,Y
a0513	EOR $0700+$80,Y
a0516	EOR $0700+$C0,Y
a0519	DEY
a051a	BPL a050d
a051c	RTS

a051d	LDA #$00
a051f	STA $63
a0521	LDA $12
a0523	STA $16
a0525	LDA $13
a0527	STA $17
a0529	LDA $00
a052b	STA $18
a052d	LDA $01
a052f	STA $19
a0531	EOR $18
a0533	EOR $17
a0535	EOR $16
a0537	STA $1A
a0539	LDA #$08
a053b	STA $39
a053d	JSR $F934
a0540	JSR a0369
a0543	BCS a0572
a0545	LDX #$50
a0547	JSR a0638
a054a	BVC a054a
a054c	CLV
a054d	LDA $1C01
a0550	CMP $0024,Y
a0553	BNE a055e
a0555	INY
a0556	CPY #$08
a0558	BNE a054a
a055a	LDA #$00
a055c	CLC
a055d	RTS

a055e	DEX
a055f	BNE a0547
a0561	JSR a0626
a0564	BNE a0521
a0566	LDA #$80
a0568	JSR a0573
a056b	BCS a0572
a056d	JSR a0369
a0570	BCC a0521
a0572	RTS

a0573	STA $10
a0575	LDA $63
a0577	PHA
a0578	LDA #$04
a057a	STA $61
a057c	LDA #$00
a057e	STA $63
a0580	LDA #$03
a0582	STA $06
a0584	LDA #$52
a0586	STA $24
a0588	LDX $06
a058a	JSR a039d
a058d	LDA #$32
a058f	STA $05
a0591	JSR a0638
a0594	BVC a0594
a0596	CLV
a0597	LDA $1C01
a059a	CMP $24
a059c	BNE a05e5
a059e	BVC a059e
a05a0	CLV
a05a1	LDA $1C01
a05a4	STA $0025,Y
a05a7	INY
a05a8	CPY #$07
a05aa	BNE a059e
a05ac	JSR $F497
a05af	LDY #$04
a05b1	AND #$00
a05b3	EOR $0016,Y
a05b6	DEY
a05b7	BPL a05b3
a05b9	TAY
a05ba	BNE a05e2
a05bc	LDA $10
a05be	BMI a05d3
a05c0	LDA $16
a05c2	STA $12
a05c4	LDA $17
a05c6	STA $13
a05c8	LDA $18
a05ca	STA $08
a05cc	PLA
a05cd	STA $63
a05cf	LDA #$00
a05d1	CLC
a05d2	RTS

a05d3	LDA #$05
a05d5	LDX $16
a05d7	CPX $12
a05d9	BNE a05e1
a05db	LDX $17
a05dd	CPX $13
a05df	BEQ a05c8
a05e2=*+1
a05e1	BIT a03a9
a05e5=*+1
a05e4	BIT a01a9
a05e7	STA $60
a05e9	DEC $05
a05eb	BNE a0591
a05ed	DEC $06
a05ef	BPL a0588
a05f1	JSR a0626
a05f4	BNE a0580
a05f6	LDA $61
a05f8	BEQ a0602
a05fa	JSR a0609
a05fd	DEC $61
a05ff	JMP a057c
a0602	PLA
a0603	STA $63
a0605	LDA $60
a0607	SEC
a0608	RTS

a0609	LDA #$50
a060b	STA $0F
a060d	LDX #$FF
a060f	LDA $1C00
a0612	EOR #$08
a0614	STA $1C00
a0617	JSR a03aa
a061a	DEC $0F
a061c	BNE a060f
a061e	LDX #$01
a0620	JSR a03aa
a0623	JMP a03aa
a0626	LDA $63
a0628	INC $63
a062a	AND #$03
a062c	TAX
a062d	LDA a0682,X
a0630	JSR a03aa
a0633	LDA $63
a0635	AND #$03
a0637	RTS

a0638	TXA
a0639	PHA
a063a	LDA #$01
a063c	STA a065c
a063f	LDA #$20
a0641	STA a066e
a0644	LDA #$03
a0646	STA $62
a0648	LDX #$1E
a064a	LDY #$00
a064c	BIT $1C00
a064f	BPL a0679
a0651	DEY
a0652	BNE a064c
a0654	DEX
a0655	BNE a064c
a0657	BIT $10
a0659	BVS a0648
a065c=*+1
a065b	LDX #$01
a065d	JSR a03aa
a0660	DEC $62
a0662	BNE a0648
a0664	LDA a065c
a0667	EOR #$FE
a0669	STA a065c
a066c	BPL a0644
a066e	JSR a0609
a0671	LDA #$2C
a0673	STA a066e
a0676	JMP a0644
a0679	LDA $1C01
a067c	CLV
a067d	PLA
a067e	TAX
a067f	LDY #$00
a0681	RTS

a0682
!byte $01,$FF
!byte $FF,$01,$00
!byte $20,$40,$60
	
}
!align 255, 0	
FullDriveCodeEnd
