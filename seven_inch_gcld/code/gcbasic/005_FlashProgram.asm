;Program compiled by GCBASIC (1.01.00 2023-11-23 (Windows 64 bit) : Build 1308) for Microchip MPASM/MPLAB-X Assembler using FreeBASIC 1.07.1/2023-11-24 CRC93
;Need help? 
;  See the GCBASIC forums at http://sourceforge.net/projects/gcbasic/forums,
;  Check the documentation and Help at http://gcbasic.sourceforge.net/help/,
;or, email us:
;   w_cholmondeley at users dot sourceforge dot net
;   evanvennn at users dot sourceforge dot net
;********************************************************************************
;   Source file    : D:\GreatCowBASICGits\Help.git\trunk\seven_inch_gcld\code\gcbasic\005_FlashProgram.gcb
;   Setting file   : C:\GCstudio\gcbasic\use.ini
;   Preserve mode  : 0
;   Assembler      : GCASM
;   Programmer     : 
;   Output file    : D:\GreatCowBASICGits\Help.git\trunk\seven_inch_gcld\code\gcbasic\005_FlashProgram.asm
;********************************************************************************

;Set up the assembler options (Chip type, clock source, other bits and pieces)
 LIST p=16F877A, r=DEC
#include <P16F877A.inc>
 __CONFIG _CP_OFF & _WRT_OFF & _CPD_OFF & _LVP_OFF & _WDTE_OFF & _FOSC_HS

;********************************************************************************

;Set aside memory locations for variables
COMPORT                          EQU      32          ; 0x20
INITLENGTH                       EQU      33          ; 0x21
INITLENGTH_H                     EQU      34          ; 0x22
OUTVALUETEMP                     EQU      35          ; 0x23
POINTER                          EQU      36          ; 0x24
POINTER_H                        EQU      37          ; 0x25
SERDATA                          EQU      38          ; 0x26
SERPRINTVAL                      EQU      39          ; 0x27
SERPRINTVAL_H                    EQU      40          ; 0x28
SYSBYTETEMPX                     EQU     112          ; 0x70
SYSCALCTEMPX                     EQU     112          ; 0x70
SYSCALCTEMPX_H                   EQU     113          ; 0x71
SYSDIVLOOP                       EQU     116          ; 0x74
SYSDIVMULTA                      EQU     119          ; 0x77
SYSDIVMULTA_H                    EQU     120          ; 0x78
SYSDIVMULTB                      EQU     123          ; 0x7B
SYSDIVMULTB_H                    EQU     124          ; 0x7C
SYSDIVMULTX                      EQU     114          ; 0x72
SYSDIVMULTX_H                    EQU     115          ; 0x73
SYSREPEATTEMP1                   EQU      41          ; 0x29
SYSSTRINGA                       EQU     119          ; 0x77
SYSSTRINGA_H                     EQU     120          ; 0x78
SYSTEMP1                         EQU      42          ; 0x2A
SYSTEMP1_H                       EQU      43          ; 0x2B
SYSTEMP2                         EQU      44          ; 0x2C
SYSWORDTEMPA                     EQU     117          ; 0x75
SYSWORDTEMPA_H                   EQU     118          ; 0x76
SYSWORDTEMPB                     EQU     121          ; 0x79
SYSWORDTEMPB_H                   EQU     122          ; 0x7A
SYSWORDTEMPX                     EQU     112          ; 0x70
SYSWORDTEMPX_H                   EQU     113          ; 0x71
__FLASHBYTE                      EQU      45          ; 0x2D
__FLASH_OUTBUFFER                EQU      46          ; 0x2E

;********************************************************************************

;Vectors
	ORG	0
	pagesel	BASPROGRAMSTART
	goto	BASPROGRAMSTART
	ORG	4
	retfie

;********************************************************************************

;Start of program memory page 0
	ORG	5
BASPROGRAMSTART
;Call initialisation routines
	call	INITSYS
	call	INITUSART
;Automatic pin direction setting
	banksel	TRISC
	bcf	TRISC,5
	bcf	TRISC,3
	bcf	TRISA,2

;Start of the main program
	movlw	29
	banksel	INITLENGTH
	movwf	INITLENGTH
	movlw	1
	movwf	INITLENGTH_H
	movf	INITLENGTH,W
	movwf	SERPRINTVAL
	movf	INITLENGTH_H,W
	movwf	SERPRINTVAL_H
	movlw	1
	movwf	COMPORT
	call	HSERPRINT314
	movlw	1
	movwf	POINTER
	clrf	POINTER_H
SysForLoop1
	movf	POINTER,W
	movwf	SYSSTRINGA
	movf	POINTER_H,W
	movwf	SYSSTRINGA_H
	call	INITTFT
	movwf	__FLASHBYTE
	call	FLASH_SPI_WRITETOFLASH
	movf	POINTER,W
	subwf	INITLENGTH,W
	movwf	SysTemp1
	movf	INITLENGTH_H,W
	movwf	SysTemp1_H
	movf	POINTER_H,W
	btfss	STATUS,C
	incfsz	POINTER_H,W
	subwf	SysTemp1_H,F
	movf	SysTemp1,W
	movwf	SysWORDTempA
	movf	SysTemp1_H,W
	movwf	SysWORDTempA_H
	clrf	SysWORDTempB
	clrf	SysWORDTempB_H
	call	SYSCOMPEQUAL16
	comf	SysByteTempX,F
	btfss	SysByteTempX,0
	goto	ENDIF1
	incf	POINTER,F
	btfsc	STATUS,Z
	incf	POINTER_H,F
	goto	SysForLoop1
ENDIF1
SysForLoopEnd1
	goto	BASPROGRAMEND
BASPROGRAMEND
	sleep
	goto	BASPROGRAMEND

;********************************************************************************

FLASH_SPI_WRITETOFLASH
	bcf	PORTA,2
	movf	__FLASHBYTE,W
	movwf	__FLASH_OUTBUFFER
	movlw	8
	movwf	SysRepeatTemp1
SysRepeatLoop1
	btfss	__FLASH_OUTBUFFER,7
	goto	ELSE3_1
	bsf	PORTC,5
	goto	ENDIF3
ELSE3_1
	bcf	PORTC,5
ENDIF3
	bsf	PORTC,3
	rlf	__FLASH_OUTBUFFER,F
	bcf	PORTC,3
	decfsz	SysRepeatTemp1,F
	goto	SysRepeatLoop1
SysRepeatLoopEnd1
	bsf	PORTA,2
	return

;********************************************************************************

HSERPRINT314
	clrf	OUTVALUETEMP
	movf	SERPRINTVAL,W
	movwf	SysWORDTempA
	movf	SERPRINTVAL_H,W
	movwf	SysWORDTempA_H
	movlw	16
	movwf	SysWORDTempB
	movlw	39
	movwf	SysWORDTempB_H
	call	SYSCOMPLESSTHAN16
	comf	SysByteTempX,F
	btfss	SysByteTempX,0
	goto	ENDIF4
	movf	SERPRINTVAL,W
	movwf	SysWORDTempA
	movf	SERPRINTVAL_H,W
	movwf	SysWORDTempA_H
	movlw	16
	movwf	SysWORDTempB
	movlw	39
	movwf	SysWORDTempB_H
	call	SYSDIVSUB16
	movf	SysWORDTempA,W
	movwf	OUTVALUETEMP
	movf	SYSCALCTEMPX,W
	movwf	SERPRINTVAL
	movf	SYSCALCTEMPX_H,W
	movwf	SERPRINTVAL_H
	movlw	48
	addwf	OUTVALUETEMP,W
	movwf	SERDATA
	call	HSERSEND301
	goto	HSERPRINTWORD1000
ENDIF4
	movf	SERPRINTVAL,W
	movwf	SysWORDTempA
	movf	SERPRINTVAL_H,W
	movwf	SysWORDTempA_H
	movlw	232
	movwf	SysWORDTempB
	movlw	3
	movwf	SysWORDTempB_H
	call	SYSCOMPLESSTHAN16
	comf	SysByteTempX,F
	btfss	SysByteTempX,0
	goto	ENDIF5
HSERPRINTWORD1000
	movf	SERPRINTVAL,W
	movwf	SysWORDTempA
	movf	SERPRINTVAL_H,W
	movwf	SysWORDTempA_H
	movlw	232
	movwf	SysWORDTempB
	movlw	3
	movwf	SysWORDTempB_H
	call	SYSDIVSUB16
	movf	SysWORDTempA,W
	movwf	OUTVALUETEMP
	movf	SYSCALCTEMPX,W
	movwf	SERPRINTVAL
	movf	SYSCALCTEMPX_H,W
	movwf	SERPRINTVAL_H
	movlw	48
	addwf	OUTVALUETEMP,W
	movwf	SERDATA
	call	HSERSEND301
	goto	HSERPRINTWORD100
ENDIF5
	movf	SERPRINTVAL,W
	movwf	SysWORDTempA
	movf	SERPRINTVAL_H,W
	movwf	SysWORDTempA_H
	movlw	100
	movwf	SysWORDTempB
	clrf	SysWORDTempB_H
	call	SYSCOMPLESSTHAN16
	comf	SysByteTempX,F
	btfss	SysByteTempX,0
	goto	ENDIF6
HSERPRINTWORD100
	movf	SERPRINTVAL,W
	movwf	SysWORDTempA
	movf	SERPRINTVAL_H,W
	movwf	SysWORDTempA_H
	movlw	100
	movwf	SysWORDTempB
	clrf	SysWORDTempB_H
	call	SYSDIVSUB16
	movf	SysWORDTempA,W
	movwf	OUTVALUETEMP
	movf	SYSCALCTEMPX,W
	movwf	SERPRINTVAL
	movf	SYSCALCTEMPX_H,W
	movwf	SERPRINTVAL_H
	movlw	48
	addwf	OUTVALUETEMP,W
	movwf	SERDATA
	call	HSERSEND301
	goto	HSERPRINTWORD10
ENDIF6
	movf	SERPRINTVAL,W
	movwf	SysWORDTempA
	movf	SERPRINTVAL_H,W
	movwf	SysWORDTempA_H
	movlw	10
	movwf	SysWORDTempB
	clrf	SysWORDTempB_H
	call	SYSCOMPLESSTHAN16
	comf	SysByteTempX,F
	btfss	SysByteTempX,0
	goto	ENDIF7
HSERPRINTWORD10
	movf	SERPRINTVAL,W
	movwf	SysWORDTempA
	movf	SERPRINTVAL_H,W
	movwf	SysWORDTempA_H
	movlw	10
	movwf	SysWORDTempB
	clrf	SysWORDTempB_H
	call	SYSDIVSUB16
	movf	SysWORDTempA,W
	movwf	OUTVALUETEMP
	movf	SYSCALCTEMPX,W
	movwf	SERPRINTVAL
	movf	SYSCALCTEMPX_H,W
	movwf	SERPRINTVAL_H
	movlw	48
	addwf	OUTVALUETEMP,W
	movwf	SERDATA
	call	HSERSEND301
ENDIF7
	movf	SERPRINTVAL,W
	movwf	OUTVALUETEMP
	movlw	48
	addwf	OUTVALUETEMP,W
	movwf	SERDATA
	goto	HSERSEND301

;********************************************************************************

HSERSEND301
HSERSENDUSART1HANDLER
SysWaitLoop1
	btfss	PIR1,TXIF
	goto	SysWaitLoop1
SysWaitLoop2
	banksel	TXSTA
	btfss	TXSTA,TRMT
	goto	SysWaitLoop2
	banksel	SERDATA
	movf	SERDATA,W
	movwf	TXREG
	return

;********************************************************************************

INITSYS
;asm showdebug _For_selected_frequency_-_the_external_oscillator_has_been_selected_by_compiler ChipMHz
;asm showdebug _Complete_the_chip_setup_of_BSR_ADCs_ANSEL_and_other_key_setup_registers_or_register_bits
	banksel	ADCON1
	bcf	ADCON1,ADFM
	banksel	ADCON0
	bcf	ADCON0,ADON
	banksel	ADCON1
	bcf	ADCON1,PCFG3
	bsf	ADCON1,PCFG2
	bsf	ADCON1,PCFG1
	bcf	ADCON1,PCFG0
	movlw	7
	movwf	CMCON
	banksel	PORTA
	clrf	PORTA
	clrf	PORTB
	clrf	PORTC
	clrf	PORTD
	clrf	PORTE
	return

;********************************************************************************

INITTFT
	movf	SYSSTRINGA,W
	movwf	SysWORDTempA
	movf	SYSSTRINGA_H,W
	movwf	SysWORDTempA_H
	movlw	29
	movwf	SysWORDTempB
	movlw	1
	movwf	SysWORDTempB_H
	call	SYSCOMPLESSTHAN16
	btfss	SysByteTempX,0
	retlw	0
	movf	SysStringA, W
	addlw	low TABLEINITTFT
	movwf	SysStringA
	movlw	high TABLEINITTFT
	btfsc	STATUS, C
	addlw	1
	addwf	SysStringA_H, W
	movwf	PCLATH
	movf	SysStringA, W
	movwf	PCL
TABLEINITTFT
	retlw	29
	retlw	97
	retlw	114
	retlw	119
	retlw	99
	retlw	119
	retlw	98
	retlw	120
	retlw	103
	retlw	17
	retlw	5
	retlw	19
	retlw	138
	retlw	17
	retlw	6
	retlw	19
	retlw	49
	retlw	17
	retlw	7
	retlw	19
	retlw	138
	retlw	17
	retlw	8
	retlw	19
	retlw	100
	retlw	17
	retlw	9
	retlw	19
	retlw	138
	retlw	17
	retlw	10
	retlw	19
	retlw	100
	retlw	17
	retlw	0
	retlw	19
	retlw	128
	retlw	17
	retlw	1
	retlw	19
	retlw	130
	retlw	17
	retlw	1
	retlw	18
	retlw	130
	retlw	17
	retlw	2
	retlw	19
	retlw	64
	retlw	170
	retlw	170
	retlw	170
	retlw	170
	retlw	17
	retlw	224
	retlw	19
	retlw	41
	retlw	17
	retlw	225
	retlw	19
	retlw	3
	retlw	17
	retlw	226
	retlw	19
	retlw	11
	retlw	17
	retlw	227
	retlw	19
	retlw	3
	retlw	17
	retlw	228
	retlw	19
	retlw	1
	retlw	170
	retlw	170
	retlw	170
	retlw	170
	retlw	17
	retlw	16
	retlw	19
	retlw	4
	retlw	17
	retlw	18
	retlw	19
	retlw	133
	retlw	17
	retlw	19
	retlw	19
	retlw	3
	retlw	17
	retlw	20
	retlw	19
	retlw	127
	retlw	17
	retlw	21
	retlw	19
	retlw	0
	retlw	17
	retlw	26
	retlw	19
	retlw	255
	retlw	17
	retlw	27
	retlw	19
	retlw	2
	retlw	17
	retlw	32
	retlw	19
	retlw	0
	retlw	17
	retlw	33
	retlw	19
	retlw	0
	retlw	17
	retlw	34
	retlw	19
	retlw	0
	retlw	17
	retlw	35
	retlw	19
	retlw	0
	retlw	17
	retlw	36
	retlw	19
	retlw	0
	retlw	17
	retlw	37
	retlw	19
	retlw	4
	retlw	17
	retlw	38
	retlw	19
	retlw	0
	retlw	17
	retlw	39
	retlw	19
	retlw	0
	retlw	17
	retlw	40
	retlw	19
	retlw	0
	retlw	17
	retlw	41
	retlw	19
	retlw	0
	retlw	170
	retlw	170
	retlw	170
	retlw	170
	retlw	17
	retlw	80
	retlw	19
	retlw	0
	retlw	17
	retlw	81
	retlw	19
	retlw	0
	retlw	17
	retlw	82
	retlw	19
	retlw	0
	retlw	17
	retlw	83
	retlw	19
	retlw	0
	retlw	17
	retlw	84
	retlw	19
	retlw	0
	retlw	17
	retlw	85
	retlw	19
	retlw	4
	retlw	17
	retlw	86
	retlw	19
	retlw	0
	retlw	17
	retlw	87
	retlw	19
	retlw	0
	retlw	17
	retlw	88
	retlw	19
	retlw	0
	retlw	17
	retlw	89
	retlw	19
	retlw	0
	retlw	17
	retlw	90
	retlw	19
	retlw	0
	retlw	17
	retlw	91
	retlw	19
	retlw	4
	retlw	17
	retlw	92
	retlw	19
	retlw	0
	retlw	17
	retlw	93
	retlw	19
	retlw	3
	retlw	17
	retlw	94
	retlw	19
	retlw	2
	retlw	17
	retlw	188
	retlw	19
	retlw	0
	retlw	17
	retlw	189
	retlw	19
	retlw	2
	retlw	17
	retlw	190
	retlw	19
	retlw	0
	retlw	17
	retlw	191
	retlw	19
	retlw	0
	retlw	17
	retlw	192
	retlw	19
	retlw	0
	retlw	17
	retlw	193
	retlw	19
	retlw	0
	retlw	17
	retlw	194
	retlw	19
	retlw	0
	retlw	17
	retlw	195
	retlw	19
	retlw	0
	retlw	17
	retlw	198
	retlw	19
	retlw	0
	retlw	17
	retlw	199
	retlw	19
	retlw	4
	retlw	17
	retlw	200
	retlw	19
	retlw	0
	retlw	17
	retlw	201
	retlw	19
	retlw	3
	retlw	17
	retlw	202
	retlw	19
	retlw	0
	retlw	17
	retlw	203
	retlw	19
	retlw	4
	retlw	17
	retlw	183
	retlw	19
	retlw	192
	retlw	17
	retlw	182
	retlw	19
	retlw	1
	retlw	170
	retlw	170
	retlw	170
	retlw	170
	retlw	17
	retlw	182
	retlw	18
	retlw	0
	retlw	17
	retlw	18
	retlw	19
	retlw	64

;********************************************************************************

INITTFT_H
	movf	SYSSTRINGA,W
	movwf	SysWORDTempA
	movf	SYSSTRINGA_H,W
	movwf	SysWORDTempA_H
	movlw	1
	movwf	SysWORDTempB
	clrf	SysWORDTempB_H
	call	SYSCOMPLESSTHAN16
	btfss	SysByteTempX,0
	retlw	0
	movf	SysStringA, W
	addlw	low TABLEINITTFT_H
	movwf	SysStringA
	movlw	high TABLEINITTFT_H
	btfsc	STATUS, C
	addlw	1
	addwf	SysStringA_H, W
	movwf	PCLATH
	movf	SysStringA, W
	movwf	PCL
TABLEINITTFT_H
	retlw	1

;********************************************************************************

INITUSART
	movlw	129
	banksel	SPBRG
	movwf	SPBRG
	bsf	TXSTA,BRGH
	bcf	TXSTA,SYNC
	bsf	TXSTA,TXEN
	banksel	RCSTA
	bsf	RCSTA,SPEN
	bsf	RCSTA,CREN
	return

;********************************************************************************

SYSCOMPEQUAL16
	clrf	SYSBYTETEMPX
	movf	SYSWORDTEMPA, W
	subwf	SYSWORDTEMPB, W
	btfss	STATUS, Z
	return
	movf	SYSWORDTEMPA_H, W
	subwf	SYSWORDTEMPB_H, W
	btfss	STATUS, Z
	return
	comf	SYSBYTETEMPX,F
	return

;********************************************************************************

SYSCOMPLESSTHAN16
	clrf	SYSBYTETEMPX
	movf	SYSWORDTEMPA_H,W
	subwf	SYSWORDTEMPB_H,W
	btfss	STATUS,C
	return
	movf	SYSWORDTEMPB_H,W
	subwf	SYSWORDTEMPA_H,W
	btfss	STATUS,C
	goto	SCLT16TRUE
	movf	SYSWORDTEMPB,W
	subwf	SYSWORDTEMPA,W
	btfsc	STATUS,C
	return
SCLT16TRUE
	comf	SYSBYTETEMPX,F
	return

;********************************************************************************

SYSDIVSUB16
	movf	SYSWORDTEMPA,W
	movwf	SYSDIVMULTA
	movf	SYSWORDTEMPA_H,W
	movwf	SYSDIVMULTA_H
	movf	SYSWORDTEMPB,W
	movwf	SYSDIVMULTB
	movf	SYSWORDTEMPB_H,W
	movwf	SYSDIVMULTB_H
	clrf	SYSDIVMULTX
	clrf	SYSDIVMULTX_H
	movf	SYSDIVMULTB,W
	movwf	SysWORDTempA
	movf	SYSDIVMULTB_H,W
	movwf	SysWORDTempA_H
	clrf	SysWORDTempB
	clrf	SysWORDTempB_H
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0
	goto	ENDIF8
	clrf	SYSWORDTEMPA
	clrf	SYSWORDTEMPA_H
	return
ENDIF8
	movlw	16
	movwf	SYSDIVLOOP
SYSDIV16START
	bcf	STATUS,C
	rlf	SYSDIVMULTA,F
	rlf	SYSDIVMULTA_H,F
	rlf	SYSDIVMULTX,F
	rlf	SYSDIVMULTX_H,F
	movf	SYSDIVMULTB,W
	subwf	SYSDIVMULTX,F
	movf	SYSDIVMULTB_H,W
	btfss	STATUS,C
	incfsz	SYSDIVMULTB_H,W
	subwf	SYSDIVMULTX_H,F
	bsf	SYSDIVMULTA,0
	btfsc	STATUS,C
	goto	ENDIF9
	bcf	SYSDIVMULTA,0
	movf	SYSDIVMULTB,W
	addwf	SYSDIVMULTX,F
	movf	SYSDIVMULTB_H,W
	btfsc	STATUS,C
	incfsz	SYSDIVMULTB_H,W
	addwf	SYSDIVMULTX_H,F
ENDIF9
	decfsz	SYSDIVLOOP, F
	goto	SYSDIV16START
	movf	SYSDIVMULTA,W
	movwf	SYSWORDTEMPA
	movf	SYSDIVMULTA_H,W
	movwf	SYSWORDTEMPA_H
	movf	SYSDIVMULTX,W
	movwf	SYSWORDTEMPX
	movf	SYSDIVMULTX_H,W
	movwf	SYSWORDTEMPX_H
	return

;********************************************************************************

;Start of program memory page 1
	ORG	2048
;Start of program memory page 2
	ORG	4096
;Start of program memory page 3
	ORG	6144

 END
