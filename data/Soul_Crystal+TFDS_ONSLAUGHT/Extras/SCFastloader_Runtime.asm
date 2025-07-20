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

;-------------------------------------------------------------------------------
; SCRelocateRuntime
; Relocates the runtime code to $0280
;-------------------------------------------------------------------------------				
SCRelocateRuntime
		lda #<SCLoaderStart
		sta cpsrc+1
		lda #>SCLoaderStart
		sta cpsrc+2
		lda #$80
		sta cpdst+1
		lda #$02
		sta cpdst+2
		lda #$06
		sta enddesthi
		;lda #$0
		;sta enddestlo
		jsr CopyData
		rts

CopyData
cpsrc 
		lda $0000
cpdst
		sta $0000
		
		lda cpsrc+1
		clc
		adc #$01
		sta cpsrc+1
		bcc +
		inc cpsrc+2
+
		lda cpdst+1
		clc
		adc #$01
		sta cpdst+1
		bcc +
		inc cpdst+2
+
		lda cpdst+2
enddesthi = *+1
		cmp #$02
		bne cpsrc
		;lda cpdst+1
enddestlo = *+1
		;cmp #$a0
		;bne cpsrc
		rts	


!align 255, 0
SCLoaderStart
!pseudopc $0280 {


r0280	JMP FastLoad_LoadFileByIndex
r0283	JMP FastLoad_SetLoadDest
r0286	JMP GetDiskID
r0289	JMP r0336
r028c	JMP FastLoad_Disk_Sector
r028f	JMP FastLoad_SaveFile
r0292	JMP FastLoad_Disk_File
r0295	JMP FastLoad_SaveSector
r0298	JMP FlipDisk

FastLoad_SetLoadDest
r029b	STX $A1
r029d	STY $A2
r029f	RTS

FastLoad_SendDriveCommand
r02a0	PHA
r02a1	LDA $DD00
r02a4	AND #$07
r02a6	STA r0480
r02a9	EOR #$10
r02ab	STA r0481
r02ae	EOR #$30
r02b0	STA r0482
r02b3	EOR #$B0
r02b5	STA datadirection
r02b8	EOR #$50
r02ba	STA r0484
r02bd	LDA r0482
r02c0	JSR r02d7
r02c3	PLA
r02c4	JSR FastLoad_SendByteToDrive
r02c7	TXA
r02c8	JSR FastLoad_SendByteToDrive
r02cb	TYA
r02cc	JSR FastLoad_SendByteToDrive
r02cf	LDY #$64
r02d1	DEY
r02d2	BNE r02d1
r02d4	LDA r0480
r02d7	STA $DD00

FastLoad_WaitForDrive
r02da	TXA
r02db	PHA
r02dc	LDX #$20
r02de	DEX
r02df	BNE r02de
r02e1	BIT $DD00
r02e4	BVC r02e1
r02e6	LDX #$20
r02e8	DEX
r02e9	BNE r02e8
r02eb	PLA
r02ec	TAX
r02ed	RTS

FastLoad_SaveSector
r02ee	LDA #$0A
r02f0	JSR FastLoad_SendDriveCommand
r02f3	JSR FastLoad_WaitForDrive
r02f6	LDY #$00
r02f8	LDA ($A1),Y
r02fa	JSR FastLoad_SendByteToDrive
r02fd	INY
r02fe	BNE r02f8
r0300	RTS

FastLoad_SaveFile
r0301	LDA #$0C
r0303	JSR FastLoad_SendDriveCommand
r0306	JSR FastLoad_WaitForDrive
r0309	LDA #$20
r030b	STA r031d
r030e	LDY #$00
r0310	LDA ($A1),Y

FastLoad_SendByteToDrive
r0312	STA $A0
r0314	JSR FastLoad_SendDriveByte
r0317	JSR FastLoad_SendDriveByte
r031a	JSR FastLoad_SendDriveByte
r031d	JMP FastLoad_SendDriveByte
r0320	INY
r0321	BNE r0310
r0323	LDA #$4C
r0325	STA r031d
r0328	JSR FastLoad_WaitForDrive
r032b	JMP FastLoad_CheckError

FlipDisk
r032e	LDX #$40
GetDiskID
r03318=*+1
r0330	BIT $00A2
r0333	LDA #$06
r0336=*+1
r0335	BIT $04A9
r0338	PHA
r0339	JSR FastLoad_SendDriveCommand
r033c	JSR FastLoad_WaitForDrive
r033f	PLA
r0340	CMP #$04
r0342	BEQ r0350
r0344	JSR FastLoad_GetDriveByte
r0347	STA r047d
r034a	JSR FastLoad_GetDriveByte
r034d	STA r047e
r0350	JSR FastLoad_GetDriveByte
r0353	PHA
r0354	JSR FastLoad_CheckError
r0357	LDX r047d
r035a	LDY r047e
r035d	PLA
r035e	RTS

FastLoad_CheckDriveReady
r035f	JSR FastLoad_WaitForDrive
r0362	JSR FastLoad_GetDriveByte
r0365	BEQ r0369
r0367	SEC
r0368	RTS
r0369	JSR FastLoad_WaitForDrive
r036c	CLC
r036d	RTS

FastLoad_LoadFileByIndex
r036e	LDY $0501,X
r0371	LDA $0500,X
r0374	TAX
r0375	AND #$00

FastLoad_Disk_File
r0377	PHA
r0378	LDA #$02
r037a	JSR FastLoad_SendDriveCommand
r037d	JSR FastLoad_CheckDriveReady
r0380	BCS FastLoad_DriveNotReady
r0382	JSR FastLoad_GetDriveByte
r0385	SEC
r0386	SBC #$02
r0388	STA FastLoad_NumBytesToRead
r038b	JSR FastLoad_GetDriveByte
r038e	PHA
r038f	JSR FastLoad_GetDriveByte
r0392	TAX
r0393	PLA
r0394	TAY
r0395	PLA
r0396	BNE r03aa
r0398	STY $A1
r039a	STX $A2
r039c	JMP r03aa
r039f	JSR FastLoad_CheckDriveReady
r03a2	BCS FastLoad_DriveNotReady
r03a4	JSR FastLoad_GetDriveByte
r03a7	STA FastLoad_NumBytesToRead
r03aa	JSR FastLoad_WaitForDrive
r03ad	JSR FastLoad_LoadBytes
r03b0	TYA
r03b1	CLC
r03b2	ADC $A1
r03b4	STA $A1
r03b6	BCC r03ba
r03b8	INC $A2
r03ba	JSR FastLoad_GetDriveByte
r03bd	BNE r039f
r03bf	JMP FastLoad_CheckError

FastLoad_LoadBytes
r03c2	LDY #$00
r03c4	LDA #$04
r03c6	STA r047f
r03c9	LDX datadirection
r03cc	LDA $DD00
r03cf	STX $DD00
r03d2	ASL
r03d3	ROR $00A0
r03d6	NOP
r03d7	LDX r0484
r03da	LDA $DD00
r03dd	STX $DD00
r03e0	ASL
r03e1	ROR $00A0
r03e4	DEC r047f
r03e7	BNE r03c9
r03e9	LDA $A0
r03eb	STA ($A1),Y
r03ed	INY

FastLoad_NumBytesToRead=*+1
r03ee	CPY #$00
r03f0	BNE r03c4
r03f2	RTS

FastLoad_DriveNotReady
r03f3	STA r03fe
r03f6	JSR FastLoad_CheckError
r03f9	LDA r03fe
r03fc	SEC
r03fd	RTS

r03fe	BRK

FastLoad_Disk_Sector
r03ff	LDA #$00
r0401	JSR FastLoad_SendDriveCommand
r0404	JSR FastLoad_CheckDriveReady
r0407	BCS FastLoad_DriveNotReady
r0409	LDA #$00
r040b	STA FastLoad_NumBytesToRead
r040e	JSR FastLoad_LoadBytes

FastLoad_CheckError
r0411	LDX #$20
r0413	DEX
r0414	BNE r0413
r0416	JSR FastLoad_GetDriveByte
r0419	CMP #$FE
r041b	BCC FastLoad_ErrorTrap
r041d	LDX #$20
r041f	DEX
r0420	BNE r041f
r0422	TXA
r0423	CLC
r0424	RTS

FastLoad_ErrorTrap
r0425	SEI
r0426	LDA #$0B
r0428	STA $D011
r042b	STA $D020
r042e	LDA $D020
r0431	EOR #$07
r0433	STA $D020
r0436	JMP r042e

FastLoad_GetDriveByte
r0439	LDA #$04
r043b	STA r047f
r043e	LDX datadirection
r0441	LDA $DD00
r0444	STX $DD00
r0447	ASL
r0448	ROR $00A0
r044b	NOP
r044c	LDX r0484
r044f	LDA $DD00
r0452	STX $DD00
r0455	ASL
r0456	ROR $00A0
r0459	DEC r047f
r045c	BNE r043e
r045e	LDA $00A0
r0461	NOP								;and 5 total nops here
r0462	RTS

FastLoad_SendDriveByte
r0463	LDA r0481
r0466	LSR $A0
r0468	BCC r046c
r046a	ORA #$20
r046c	STA $DD00
r046f	NOP
r0470	LDA r0480
r0473	LSR $A0
r0475	BCC r0479
r0477	ORA #$20
r0479	STA $DD00
r047c	RTS

r047d !byte 0
r047e !byte 0
r047f !byte 0

r0480 !byte 0
r0481 !byte 0
r0482 !byte 0

datadirection ;($97 drive receiveing, $c7 drive sending)
; $dd00 bits (right to left)
; 0..1 vic bank
; 2 rs-232 txd ausgang, user pa 2
	; 3..5 iec out. 0=high/inactive, 1=low/active.
; 3 atn out
; 4 clock out
; 5 data out
	; 6..7 iec in. 0=low/active, 1=high/inactive.
; 6 clock in
; 7 data in
r0483 !byte 0

r0484 !byte 0

r0485	RTI
}
!align 255, 0	
SCLoaderEnd