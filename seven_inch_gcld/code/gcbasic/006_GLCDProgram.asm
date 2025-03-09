;Program compiled by GCBASIC (2024.11.30 (Windows 64 bit) : Build 1445) for Microchip MPASM/MPLAB-X Assembler using FreeBASIC 1.07.1/2024-12-01 CRC248
;Need help? 
;  Please donate to help support the operational costs of the project.  Donate via https://gcbasic.com/donate/
;  
;  See the GCBASIC forums at http://sourceforge.net/projects/gcbasic/forums,
;  Check the documentation and Help at http://gcbasic.sourceforge.net/help/,
;or, email us:
;   evanvennn at users dot sourceforge dot net
;********************************************************************************
;   Installation Dir : C:\GCstudio\gcbasic
;   Source file      : D:\GreatCowBASICGits\Help.git\seven_inch_gcld\code\gcbasic\006_GLCDProgram.gcb
;   Setting file     : C:\GCstudio\gcbasic\use.ini
;   Preserve mode    : 2
;   Assembler        : GCASM
;   Programmer       : 
;   Output file      : D:\GreatCowBASICGits\Help.git\seven_inch_gcld\code\gcbasic\006_GLCDProgram.asm
;   Float Capability : 1
;********************************************************************************

;Set up the assembler options (Chip type, clock source, other bits and pieces)
 LIST p=18F27Q84, r=DEC
#include <P18F27Q84.inc>
 CONFIG CP = OFF, WRTSAF = OFF, WRTD = OFF, WRTB = OFF, WDTE = OFF, XINST = OFF, LVP = OFF, MVECEN = OFF, MCLRE = INTMCLR, FCMEN = ON, CLKOUTEN = OFF, RSTOSC = HFINTOSC_1MHZ, FEXTOSC = OFF

;********************************************************************************

;Set aside memory locations for variables
COMPORT                          EQU    1293          ; 0x50D
DELAYTEMP                        EQU    1280          ; 0x500
DELAYTEMP2                       EQU    1281          ; 0x501
FNLSR                            EQU    1294          ; 0x50E
FNLSR_E                          EQU    1297          ; 0x511
FNLSR_H                          EQU    1295          ; 0x50F
FNLSR_U                          EQU    1296          ; 0x510
GLCDBACKGROUND                   EQU    1298          ; 0x512
GLCDBACKGROUND_E                 EQU    1301          ; 0x515
GLCDBACKGROUND_H                 EQU    1299          ; 0x513
GLCDBACKGROUND_U                 EQU    1300          ; 0x514
GLCDDEVICEHEIGHT                 EQU    1302          ; 0x516
GLCDDEVICEHEIGHT_H               EQU    1303          ; 0x517
GLCDDEVICEWIDTH                  EQU    1304          ; 0x518
GLCDDEVICEWIDTH_H                EQU    1305          ; 0x519
GLCDFNTDEFAULT                   EQU    1306          ; 0x51A
GLCDFNTDEFAULTHEIGHT             EQU    1307          ; 0x51B
GLCDFNTDEFAULTSIZE               EQU    1308          ; 0x51C
GLCDFONTWIDTH                    EQU    1309          ; 0x51D
GLCDFOREGROUND                   EQU    1310          ; 0x51E
GLCDFOREGROUND_E                 EQU    1313          ; 0x521
GLCDFOREGROUND_H                 EQU    1311          ; 0x51F
GLCDFOREGROUND_U                 EQU    1312          ; 0x520
GLCD_YORDINATE                   EQU    1314          ; 0x522
GLCD_YORDINATE_H                 EQU    1315          ; 0x523
LT7686_DATAREAD                  EQU    1316          ; 0x524
LT7686_STATUSREAD                EQU    1317          ; 0x525
NUMBITS                          EQU    1318          ; 0x526
PRINTLEN                         EQU    1319          ; 0x527
SERDATA                          EQU    1320          ; 0x528
STRINGPOINTER                    EQU    1321          ; 0x529
SYSBITVAR0                       EQU    1322          ; 0x52A
SYSBITVAR3                       EQU    1323          ; 0x52B
SYSBYTETEMPA                     EQU    1285          ; 0x505
SYSBYTETEMPB                     EQU    1289          ; 0x509
SYSBYTETEMPX                     EQU    1280          ; 0x500
SYSCALCTEMPA                     EQU    1285          ; 0x505
SYSLONGTEMPA                     EQU    1285          ; 0x505
SYSLONGTEMPA_E                   EQU    1288          ; 0x508
SYSLONGTEMPA_H                   EQU    1286          ; 0x506
SYSLONGTEMPA_U                   EQU    1287          ; 0x507
SYSLONGTEMPB                     EQU    1289          ; 0x509
SYSLONGTEMPB_E                   EQU    1292          ; 0x50C
SYSLONGTEMPB_H                   EQU    1290          ; 0x50A
SYSLONGTEMPB_U                   EQU    1291          ; 0x50B
SYSPRINTDATAHANDLER              EQU    1324          ; 0x52C
SYSPRINTDATAHANDLER_H            EQU    1325          ; 0x52D
SYSPRINTTEMP                     EQU    1326          ; 0x52E
SYSREPEATTEMP1                   EQU    1327          ; 0x52F
SYSREPEATTEMP3                   EQU    1328          ; 0x530
SYSREPEATTEMP5                   EQU    1329          ; 0x531
SYSREPEATTEMP7                   EQU    1330          ; 0x532
SYSREPEATTEMP9                   EQU    1331          ; 0x533
SYSSTRINGA                       EQU    1287          ; 0x507
SYSSTRINGA_H                     EQU    1288          ; 0x508
SYSSTRINGLENGTH                  EQU    1286          ; 0x506
SYSSTRINGPARAM1                  EQU   14059          ; 0x36EB
SYSSTRINGPARAM2                  EQU   14038          ; 0x36D6
SYSSTRINGPARAM3                  EQU   14017          ; 0x36C1
SYSSTRINGTEMP                    EQU    1332          ; 0x534
SYSTEMP1                         EQU    1333          ; 0x535
SYSTEMP2                         EQU    1334          ; 0x536
SYSVALTEMP                       EQU    1335          ; 0x537
SYSWAITTEMPMS                    EQU    1282          ; 0x502
SYSWAITTEMPMS_H                  EQU    1283          ; 0x503
SYSWAITTEMPS                     EQU    1284          ; 0x504
SYSWAITTEMPUS                    EQU    1285          ; 0x505
SYSWAITTEMPUS_H                  EQU    1286          ; 0x506
_HEXPICAS                        EQU   14013          ; 0x36BD
__BYTE                           EQU    1336          ; 0x538
__LT7686_OUTBUFFER               EQU    1337          ; 0x539
__LT7686_OUTBUFFER_E             EQU    1340          ; 0x53C
__LT7686_OUTBUFFER_H             EQU    1338          ; 0x53A
__LT7686_OUTBUFFER_U             EQU    1339          ; 0x53B

;********************************************************************************

;Alias variables
AFSR0 EQU 1257
AFSR0_H EQU 1258
LT7686_INITCOUNTER EQU 1303
LT7686_INITDATA EQU 1302
LT7686_INITLENGTH EQU 1310
LT7686_INITLENGTH_H EQU 1311
LT7686_POINTER EQU 1298
LT7686_POINTER_H EQU 1299
LT7686_POINTER_U EQU 1300
LT7686_POINTER_E EQU 1301
SYSFNLSRLONG EQU 1294
SYSFNLSRLONG_H EQU 1295
SYSFNLSRLONG_U EQU 1296
SYSFNLSRLONG_E EQU 1297
SYS_HEXPICAS_0 EQU 14013
SYS_HEXPICAS_1 EQU 14014
SYS_HEXPICAS_2 EQU 14015

;********************************************************************************

;Vectors
	ORG	0
	goto	BASPROGRAMSTART
	ORG	8
	retfie

;********************************************************************************

;Program_memory_page: 0
	ORG	12
BASPROGRAMSTART
;Call initialisation routines
	rcall	INITSYS
	rcall	INITPPS
	rcall	INITUSART

;Start_of_the_main_program
;Prototype GLCD library
;Hardware setup
;Setup USART used fro debugging
;PIC PPS Tool version: 0.0.6.5
;Add this code segment to your GCBASIC source program
;
;// Setup SPI
;#ifdef FLASH_HARDWARESPI
;// This is conditional to support Hardware SPI
;SSP1CLKPPS = 0x13;   //RC3->MSSP1:SCK1;
;RC3PPS = 0x19;   //RC3->MSSP1:SCK1;
;RC5PPS = 0x1A;   //RC5->MSSP1:SDO1;
;SSP1DATPPS = 0x14;   //RC4->MSSP1:SDI1;
;#endif
;
;// #define FLASH_HARDWARESPI
;#define HWSPIMODE MASTERFAST
;
;Pin mappings for  SPI
;end of hardware setup
;Main program
;wait 1 s
	movlw	1
	movwf	SysWaitTempS,ACCESS
	rcall	Delay_S
;HSerPrintStringCRLF "Commenced"
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable1
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable1
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable1
	movwf	TBLPTRU,ACCESS
	rcall	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	movwf	SysPRINTDATAHandler,ACCESS
	movlw	high SYSSTRINGPARAM1
	movwf	SysPRINTDATAHandler_H,ACCESS
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM1*9
	rcall	HSERPRINTSTRINGCRLF
;This will initialise and clear the screen
;InitGLCD
	rcall	INITGLCD_LT7686
;GLCDCLS ( TFT_RED )
	clrf	GLCDBACKGROUND,ACCESS
	movlw	248
	movwf	GLCDBACKGROUND_H,ACCESS
	clrf	GLCDBACKGROUND_U,ACCESS
	clrf	GLCDBACKGROUND_E,ACCESS
	rcall	GLCDCLS_LT7686
;Do
SysDoLoop_S1
;Loop
	bra	SysDoLoop_S1
SysDoLoop_E1
;End
	bra	BASPROGRAMEND
;Registers and constants for LT7686 & RA8876  from Character/Graphic TFT LCD Controller
;0x46 - 0x4f reserved
;0x74 - 0x75 reserved
;0x7f reserved
;0xc4 - 0xc5 reserved
;0xd8 - 0xda reserved
;Constants
BASPROGRAMEND
	sleep
	bra	BASPROGRAMEND

;********************************************************************************

Delay_MS
	incf	SysWaitTempMS_H, F,ACCESS
DMS_START
	movlw	129
	movwf	DELAYTEMP2,ACCESS
DMS_OUTER
	movlw	40
	movwf	DELAYTEMP,ACCESS
DMS_INNER
	decfsz	DELAYTEMP, F,ACCESS
	bra	DMS_INNER
	decfsz	DELAYTEMP2, F,ACCESS
	bra	DMS_OUTER
	decfsz	SysWaitTempMS, F,ACCESS
	bra	DMS_START
	decfsz	SysWaitTempMS_H, F,ACCESS
	bra	DMS_START
	return

;********************************************************************************

Delay_S
DS_START
	movlw	232
	movwf	SysWaitTempMS,ACCESS
	movlw	3
	movwf	SysWaitTempMS_H,ACCESS
	rcall	Delay_MS
	decfsz	SysWaitTempS, F,ACCESS
	bra	DS_START
	return

;********************************************************************************

;Overloaded signature: LONG:BYTE:, Source: stdbasic.h (381)
FN_FNLSR165
;Repeat NumBits
	movff	NUMBITS,SysRepeatTemp9
	movf	SYSREPEATTEMP9,F,ACCESS
	btfsc	STATUS, Z,ACCESS
	bra	SysRepeatLoopEnd9
SysRepeatLoop9
;Set C Off
	bcf	STATUS,C,ACCESS
;Rotate SysLongTempB Right
	rrcf	SYSLONGTEMPB_E,F,ACCESS
	rrcf	SYSLONGTEMPB_U,F,ACCESS
	rrcf	SYSLONGTEMPB_H,F,ACCESS
	rrcf	SYSLONGTEMPB,F,ACCESS
;End Repeat
	decfsz	SysRepeatTemp9,F,ACCESS
	bra	SysRepeatLoop9
SysRepeatLoopEnd9
;FnLSR = SysLongTempB
	movff	SYSLONGTEMPB,FNLSR
	movff	SYSLONGTEMPB_H,FNLSR_H
	movff	SYSLONGTEMPB_U,FNLSR_U
	movff	SYSLONGTEMPB_E,FNLSR_E
	return

;********************************************************************************

;Source: 006_GLCDProgram.gcb (172)
GLCDCLS_LT7686
;initialise global variable. Required variable for Circle in all DEVICE DRIVERS- DO NOT DELETE
;GLCD_yordinate = 0
	clrf	GLCD_YORDINATE,ACCESS
	clrf	GLCD_YORDINATE_H,ACCESS
;red
;LT7686_WriteCMD(LT7686_REG_FGCR)
	movlw	210
	movwf	__BYTE,ACCESS
	rcall	LT7686_WRITECMD
;LT7686_WriteData( FnLSR ( GLCDbackground, 11 ) )
	movff	GLCDBACKGROUND,SYSLONGTEMPB
	movff	GLCDBACKGROUND_H,SYSLONGTEMPB_H
	movff	GLCDBACKGROUND_U,SYSLONGTEMPB_U
	movff	GLCDBACKGROUND_E,SYSLONGTEMPB_E
	movlw	11
	movwf	NUMBITS,ACCESS
	rcall	FN_FNLSR165
	movff	SYSFNLSRLONG,__BYTE
	rcall	LT7686_WRITEDATA
;green
;LT7686_WriteCMD(LT7686_REG_FGCG)
	movlw	211
	movwf	__BYTE,ACCESS
	rcall	LT7686_WRITECMD
;LT7686_WriteData( FnLSR ( GLCDbackground, 11 ) & 0x3F )
	movff	GLCDBACKGROUND,SYSLONGTEMPB
	movff	GLCDBACKGROUND_H,SYSLONGTEMPB_H
	movff	GLCDBACKGROUND_U,SYSLONGTEMPB_U
	movff	GLCDBACKGROUND_E,SYSLONGTEMPB_E
	movlw	11
	movwf	NUMBITS,ACCESS
	rcall	FN_FNLSR165
	movlw	63
	andwf	SYSFNLSRLONG,W,ACCESS
	movwf	__BYTE,ACCESS
	rcall	LT7686_WRITEDATA
;blue
;LT7686_WriteCMD(LT7686_REG_FGCB)
	movlw	212
	movwf	__BYTE,ACCESS
	rcall	LT7686_WRITECMD
;LT7686_WriteData( GLCDbackground & 0x1F )
	movlw	31
	andwf	GLCDBACKGROUND,W,ACCESS
	movwf	__BYTE,ACCESS
	rcall	LT7686_WRITEDATA
;LT7686_Check_Busy_Draw
	rcall	LT7686_CHECK_BUSY_DRAW
;LT7686_WriteCMD( LT7686_REG_DCR1 )
	movlw	118
	movwf	__BYTE,ACCESS
	rcall	LT7686_WRITECMD
;LT7686_WriteData(0xE0)
	movlw	224
	movwf	__BYTE,ACCESS
	rcall	LT7686_WRITEDATA
;LT7686_Check_Busy_Draw
	bra	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

;Source: 006_GLCDProgram.gcb (197)
GLCDROTATE_LT7686
	return

;********************************************************************************

;Source: usart.h (3281)
HSERPRINTSTRINGCRLF
;PrintLen = PrintData(0)
	movff	SysPRINTDATAHandler,AFSR0
	movff	SysPRINTDATAHandler_H,AFSR0_H
	movff	INDF0,PRINTLEN
;If PrintLen <> 0 then
	movf	PRINTLEN,F,ACCESS
	btfsc	STATUS, Z,ACCESS
	bra	ENDIF17
;Write Data
;for SysPrintTemp = 1 to PrintLen
;Legacy method
	clrf	SYSPRINTTEMP,ACCESS
	movlw	1
	subwf	PRINTLEN,W,ACCESS
	btfss	STATUS, C,ACCESS
	bra	SysForLoopEnd2
SysForLoop2
	incf	SYSPRINTTEMP,F,ACCESS
;HSerSend(PrintData(SysPrintTemp),comport )
	movf	SYSPRINTTEMP,W,ACCESS
	addwf	SysPRINTDATAHandler,W,ACCESS
	movwf	AFSR0,ACCESS
	movlw	0
	addwfc	SysPRINTDATAHandler_H,W,ACCESS
	movwf	AFSR0_H,ACCESS
	movff	INDF0,SERDATA
	rcall	HSERSEND416
;next
	movf	PRINTLEN,W,ACCESS
	subwf	SYSPRINTTEMP,W,ACCESS
	btfss	STATUS, C,ACCESS
	bra	SysForLoop2
SysForLoopEnd2
;End If
ENDIF17
;HSerSend(13,comport)
	movlw	13
	movwf	SERDATA,ACCESS
	rcall	HSERSEND416
;HSerSend(10,comport)
	movlw	10
	movwf	SERDATA,ACCESS
	bra	HSERSEND416

;********************************************************************************

;Overloaded signature: BYTE:byte:, Source: usart.h (1993)
HSERSEND416
HSERSENDUSART1HANDLER
;USART_TX_BLOCKING
;Wait While U1TXIF = Off
SysWaitLoop1
	btfss	PIR4,U1TXIF,ACCESS
	bra	SysWaitLoop1
;TXREG = SerData
	movff	SERDATA,U1TXB
	return

;********************************************************************************

;Source: 006_GLCDProgram.gcb (68)
INITGLCD_LT7686
;Dim LT7686status as Bit
;Dir LT7686_DO   Out
	bcf	TRISB,0,ACCESS
;Dir LT7686_DI   In
	bsf	TRISC,4,ACCESS
;Dir LT7686_SCK  Out
	bcf	TRISC,3,ACCESS
;Dir LT7686_CS   Out
	bcf	TRISA,3,ACCESS
;Dir LT7686_RST  Out
	bcf	TRISB,5,ACCESS
;Force SPI to known state for MODE 3
;LT7686_DO  = 1
	bsf	LATB,0,ACCESS
;LT7686_DI  = 1
	bsf	LATC,4,ACCESS
;LT7686_CS  = 1
	bsf	LATA,3,ACCESS
;LT7686_SCK = 1
	bsf	LATC,3,ACCESS
;LT7686_Hardware_Reset
	rcall	LT7686_HARDWARE_RESET
;LT7686_Software_Reset
	rcall	LT7686_SOFTWARE_RESET
;LT7686status = LT7686_Check_Init
	rcall	FN_LT7686_CHECK_INIT6
	bcf	SYSBITVAR0,0,ACCESS
	btfsc	SYSBITVAR3,3,ACCESS
	bsf	SYSBITVAR0,0,ACCESS
;readtable to init LCD
;Dim GLCDbackground, GLCDForeground as Long
;Reuse variables to reduce RAM
;Dim LT7686_pointer as Long alias GLCDbackground_E, GLCDbackground_U, GLCDbackground_H, GLCDbackground
;Dim tableloop  as Word alias GLCDForeground_E, GLCDForeground_U
;Dim LT7686_initlength as Word alias GLCDForeground_H, GLCDForeground
;Dim LT7686_initdata as Byte alias GLCDDeviceHeight
;Get init dataset
;LT7686_pointer = [Long]0
	clrf	LT7686_POINTER,ACCESS
	clrf	LT7686_POINTER_H,ACCESS
	clrf	LT7686_POINTER_U,ACCESS
	clrf	LT7686_POINTER_E,ACCESS
;readtable LT7686_InitTFT_Dataset, LT7686_pointer, LT7686_initlength
	movff	LT7686_POINTER,SYSSTRINGA
	rcall	LT7686_INITTFT_DATASET
	movwf	LT7686_INITLENGTH,ACCESS
	clrf	LT7686_INITLENGTH_H,ACCESS
;LT7686_pointer++
	incf	LT7686_POINTER,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_POINTER_H,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_POINTER_U,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_POINTER_E,F,ACCESS
;Do Forever
SysDoLoop_S2
;readtable LT7686_InitTFT_Dataset, LT7686_pointer, LT7686_initdata
	movff	LT7686_POINTER,SYSSTRINGA
	rcall	LT7686_INITTFT_DATASET
	movwf	LT7686_INITDATA,ACCESS
;LT7686_pointer++
	incf	LT7686_POINTER,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_POINTER_H,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_POINTER_U,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_POINTER_E,F,ACCESS
;Select Case LT7686_initdata
;Case 0x11
SysSelect1Case1
	movlw	17
	subwf	LT7686_INITDATA,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect1Case2
;readtable LT7686_InitTFT_Dataset, LT7686_pointer, LT7686_initdata
	movff	LT7686_POINTER,SYSSTRINGA
	rcall	LT7686_INITTFT_DATASET
	movwf	LT7686_INITDATA,ACCESS
;LT7686_pointer++
	incf	LT7686_POINTER,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_POINTER_H,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_POINTER_U,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_POINTER_E,F,ACCESS
;LT7686_WriteCMD( LT7686_initdata)
	movff	LT7686_INITDATA,__BYTE
	rcall	LT7686_WRITECMD
;Case 0x13
	bra	SysSelectEnd1
SysSelect1Case2
	movlw	19
	subwf	LT7686_INITDATA,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect1Case3
;readtable LT7686_InitTFT_Dataset, LT7686_pointer, LT7686_initdata
	movff	LT7686_POINTER,SYSSTRINGA
	rcall	LT7686_INITTFT_DATASET
	movwf	LT7686_INITDATA,ACCESS
;LT7686_pointer++
	incf	LT7686_POINTER,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_POINTER_H,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_POINTER_U,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_POINTER_E,F,ACCESS
;LT7686_WriteData( LT7686_initdata)
	movff	LT7686_INITDATA,__BYTE
	rcall	LT7686_WRITEDATA
;Case 0xAA
	bra	SysSelectEnd1
SysSelect1Case3
	movlw	170
	subwf	LT7686_INITDATA,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelectEnd1
;readtable LT7686_InitTFT_Dataset, LT7686_pointer, LT7686_initdata
	movff	LT7686_POINTER,SYSSTRINGA
	rcall	LT7686_INITTFT_DATASET
	movwf	LT7686_INITDATA,ACCESS
;LT7686_pointer++
	incf	LT7686_POINTER,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_POINTER_H,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_POINTER_U,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_POINTER_E,F,ACCESS
;Wait 15 ms
	movlw	15
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	rcall	Delay_MS
;End Select
SysSelectEnd1
;If LT7686_pointer > LT7686_initlength then Exit Do
	movff	LT7686_POINTER,SysLONGTempB
	movff	LT7686_POINTER_H,SysLONGTempB_H
	movff	LT7686_POINTER_U,SysLONGTempB_U
	movff	LT7686_POINTER_E,SysLONGTempB_E
	movff	LT7686_INITLENGTH,SysLONGTempA
	movff	LT7686_INITLENGTH_H,SysLONGTempA_H
	clrf	SysLONGTempA_U,ACCESS
	clrf	SysLONGTempA_E,ACCESS
	rcall	SYSCOMPLESSTHAN32
	btfsc	SysByteTempX,0,ACCESS
;If LT7686_pointer > LT7686_initlength then Exit Do
	bra	SysDoLoop_E2
;If LT7686_pointer > LT7686_initlength then Exit Do
;Loop
	bra	SysDoLoop_S2
SysDoLoop_E2
;Default Colours
;GLCDForeground = TFT_WHITE
	setf	GLCDFOREGROUND,ACCESS
	setf	GLCDFOREGROUND_H,ACCESS
	clrf	GLCDFOREGROUND_U,ACCESS
	clrf	GLCDFOREGROUND_E,ACCESS
;Default Colours
;GLCDbackground = TFT_BLACK
	clrf	GLCDBACKGROUND,ACCESS
	clrf	GLCDBACKGROUND_H,ACCESS
	clrf	GLCDBACKGROUND_U,ACCESS
	clrf	GLCDBACKGROUND_E,ACCESS
;Variables required for device
;GLCDDeviceWidth = GLCD_WIDTH
	movlw	32
	movwf	GLCDDEVICEWIDTH,ACCESS
	movlw	3
	movwf	GLCDDEVICEWIDTH_H,ACCESS
;GLCDDeviceHeight = GLCD_HEIGHT
	movlw	88
	movwf	GLCDDEVICEHEIGHT,ACCESS
	movlw	2
	movwf	GLCDDEVICEHEIGHT_H,ACCESS
;GLCDFontWidth = 6
	movlw	6
	movwf	GLCDFONTWIDTH,ACCESS
;GLCDfntDefault = 0
	clrf	GLCDFNTDEFAULT,ACCESS
;GLCDfntDefaultsize = 2
	movlw	2
	movwf	GLCDFNTDEFAULTSIZE,ACCESS
;GLCDfntDefaultHeight = 7  'used by GLCDPrintString and GLCDPrintStringLn
	movlw	7
	movwf	GLCDFNTDEFAULTHEIGHT,ACCESS
;GLCDRotate Portrait
	rcall	GLCDROTATE_LT7686
;GLCDCLS
	bra	GLCDCLS_LT7686

;********************************************************************************

;Source: 006_GLCDProgram.gcb (23)
INITPPS
;Module: UART pin directions
;Dir PORTC.6 Out    ' Make TX1 pin an output
	bcf	TRISC,6,ACCESS
;Module: UART1
;RC6PPS = 0x0020    // TX1 > RC6
	movlw	32
	banksel	RC6PPS
	movwf	RC6PPS,BANKED
	banksel	0
	return

;********************************************************************************

;Source: system.h (197)
INITSYS
;Clear BSR on ChipFamily16 MCUs
;MOVLB 0
	movlb	0
;Default settings for microcontrollers with _OSCCON1_
;Default OSCCON1 typically, NOSC HFINTOSC; NDIV 1 - Common as this simply sets the HFINTOSC
;OSCCON1 = 0x60
	movlw	96
	movwf	OSCCON1,BANKED
;Default value typically, CSWHOLD may proceed; SOSCPWR Low power
;OSCCON3 = 0x00
	clrf	OSCCON3,BANKED
;Default value typically, MFOEN disabled; LFOEN disabled; ADOEN disabled; SOSCEN disabled; EXTOEN disabled; HFOEN disabled
;OSCEN = 0x00
	clrf	OSCEN,BANKED
;Default value
;OSCTUNE = 0x00
	clrf	OSCTUNE,BANKED
;The MCU is a chip family 16
;Section supports many MCUs, 18FxxK40, 18FxxK42 etc that have NDIV3 bit
;OSCCON type is 101
;OSCCON1 = 0x60          // Setting OSCCON1 implies clearing Clear NDIV3:0
	movlw	96
	movwf	OSCCON1,BANKED
;OSCFRQ = 0b00001000  '64mhz
	movlw	8
	movwf	OSCFRQ,BANKED
;_Complete_the_chip_setup_of_BSR_ADCs_ANSEL_and_other_key_setup_registers_or_register_bits
;Clear TBLPTRU on MCUs with this bit as this must be zero
;TBLPTRU = 0
	clrf	TBLPTRU,ACCESS
;Ensure all ports are set for digital I/O and, turn off A/D
;SET ADFM OFF
	banksel	ADCON0
	bcf	ADCON0,ADFM0,BANKED
;Switch off A/D Var(ADCON0)
;SET ADCON0.ADON OFF
	bcf	ADCON0,ADON,BANKED
;ANSELA = 0
	banksel	ANSELA
	clrf	ANSELA,BANKED
;ANSELB = 0
	clrf	ANSELB,BANKED
;ANSELC = 0
	clrf	ANSELC,BANKED
;Set comparator register bits for many MCUs with register CM2CON0
;C2EN = 0
	banksel	CM2CON0
	bcf	CM2CON0,C2EN,BANKED
;C1EN = 0
	bcf	CM1CON0,C1EN,BANKED
;Turn off all ports
;PORTA = 0
	clrf	PORTA,ACCESS
;PORTB = 0
	clrf	PORTB,ACCESS
;PORTC = 0
	clrf	PORTC,ACCESS
;PORTE = 0
	clrf	PORTE,ACCESS
	return

;********************************************************************************

;Source: usart.h (1206)
INITUSART
;Set the default value for USART handler - required when more than one USART
;comport = SCRIPT_DEFAULT_COMPORT
	movlw	1
	movwf	COMPORT,ACCESS
;PIC USART 1 Init
;U1BRGH=SPBRGH_TEMP
	movlw	6
	banksel	U1BRGH
	movwf	U1BRGH,BANKED
;U1BRGL=SPBRGL_TEMP
	movlw	129
	movwf	U1BRGL,BANKED
;U1BRGS = BRGS1_SCRIPT
	bsf	U1CON0,U1BRGS,BANKED
;U1TXEN=1   'Enable TX1
	bsf	U1CON0,U1TXEN,BANKED
;U1RXEN=1   'Enable RX1
	bsf	U1CON0,U1RXEN,BANKED
;ON_U1CON1=1 'Enable USART1
	bsf	U1CON1,ON_U1CON1,BANKED
	banksel	0
	return

;********************************************************************************

;Source: 006_GLCDProgram.gcb (485)
LT7686_CHECK_BUSY_DRAW
;do
SysDoLoop_S4
;HSerPrintStringCRLF "LT7686_StatusRead() " + hex(LT7686_StatusRead())
	rcall	FN_LT7686_STATUSREAD
	movff	LT7686_STATUSREAD,SYSVALTEMP
	rcall	FN__HEXPICAS
	lfsr	1,SYSSTRINGPARAM2
	clrf	SysStringLength,ACCESS
	movlw	low StringTable3
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable3
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable3
	movwf	TBLPTRU,ACCESS
	rcall	SYSREADSTRINGPART
	lfsr	0,_HEXPICAS
	rcall	SYSCOPYSTRINGPART
	lfsr	0,SYSSTRINGPARAM2
	movff	SysStringLength, INDF0
	movlw	low SYSSTRINGPARAM2
	movwf	SysPRINTDATAHandler,ACCESS
	movlw	high SYSSTRINGPARAM2
	movwf	SysPRINTDATAHandler_H,ACCESS
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM2*20
	rcall	HSERPRINTSTRINGCRLF
;loop while  ( LT7686_StatusRead() & 0x08 )
	rcall	FN_LT7686_STATUSREAD
	movlw	8
	andwf	lt7686_statusread,W,ACCESS
	movwf	SysTemp1,ACCESS
	btfsc	SysTemp1,0,ACCESS
	bra	SysDoLoop_S4
SysDoLoop_E4
	return

;********************************************************************************

;Overloaded signature: , Source: 006_GLCDProgram.gcb (212)
FN_LT7686_CHECK_INIT6
;Reuse variables to save RAM
;Dim LT7686_Initcounter as Byte alias GLCDDeviceHeight_H
;LT7686_Check_Init = 0
	bcf	SYSBITVAR0,1,ACCESS
;do
SysDoLoop_S3
;if ( LT7686_StatusRead() & 0x02 ) =0x00 Then
	rcall	FN_LT7686_STATUSREAD
	movlw	2
	andwf	LT7686_STATUSREAD,W,ACCESS
	movwf	SysTemp1,ACCESS
	movff	SysTemp1,SysBYTETempA
	clrf	SysBYTETempB,ACCESS
	rcall	SYSCOMPEQUAL
	btfss	SysByteTempX,0,ACCESS
	bra	ELSE3_1
;wait 1 ms
	movlw	1
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	rcall	Delay_MS
;LT7686_WriteCMD( 0x01 )
	movlw	1
	movwf	__BYTE,ACCESS
	rcall	LT7686_WRITECMD
;wait 1 ms
	movlw	1
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	rcall	Delay_MS
;if( ( LT7686_DataRead() & 0x80 ) = 0x80 ) Then       // Check if CCR register and PLL are ready
	rcall	FN_LT7686_DATAREAD
	movlw	128
	andwf	LT7686_DATAREAD,W,ACCESS
	movwf	SysTemp1,ACCESS
	movff	SysTemp1,SysBYTETempA
	movlw	128
	movwf	SysBYTETempB,ACCESS
	rcall	SYSCOMPEQUAL
	btfss	SysByteTempX,0,ACCESS
	bra	ELSE5_1
;LT7686_Check_Init = 1
	bsf	SYSBITVAR0,1,ACCESS
;LT7686_Initcounter = 0
	clrf	LT7686_INITCOUNTER,ACCESS
;else
	bra	ENDIF5
ELSE5_1
;wait 1 ms
	movlw	1
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	rcall	Delay_MS
;LT7686_WriteCMD(0x01)
	movlw	1
	movwf	__BYTE,ACCESS
	rcall	LT7686_WRITECMD
;wait 1 ms
	movlw	1
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	rcall	Delay_MS
;LT7686_WriteData(0x80)
	movlw	128
	movwf	__BYTE,ACCESS
	rcall	LT7686_WRITEDATA
;end if
ENDIF5
;else
	bra	ENDIF3
ELSE3_1
;LT7686_Check_Init = 0
	bcf	SYSBITVAR0,1,ACCESS
;LT7686_Initcounter ++
	incf	LT7686_INITCOUNTER,F,ACCESS
;End if
ENDIF3
;if LT7686_Check_Init = 0 & LT7686_Initcounter=5 Then
	btfsc	SYSBITVAR0,1,ACCESS
	btfss	STATUS,Z,ACCESS
	comf	SysByteTempX,F,ACCESS
	movff	SysByteTempX,SysTemp1
	movff	LT7686_INITCOUNTER,SysBYTETempA
	movlw	5
	movwf	SysBYTETempB,ACCESS
	rcall	SYSCOMPEQUAL
	movf	SysTemp1,W,ACCESS
	andwf	SysByteTempX,W,ACCESS
	movwf	SysTemp2,ACCESS
	btfss	SysTemp2,0,ACCESS
	bra	ENDIF4
;LT7686_Hardware_Reset
	rcall	LT7686_HARDWARE_RESET
;LT7686_Initcounter = 0
	clrf	LT7686_INITCOUNTER,ACCESS
;End if
ENDIF4
;Loop while ( LT7686_Check_Init = 0 )
	btfss	SYSBITVAR0,1,ACCESS
	bra	SysDoLoop_S3
SysDoLoop_E3
	return

;********************************************************************************

;Source: 006_GLCDProgram.gcb (373)
FN_LT7686_DATAREAD
;LT7686_DataRead = 0x00
	clrf	LT7686_DATAREAD,ACCESS
;dim __LT7686_outbuffer as Long
;LT7686_CS = 0
	bcf	LATA,3,ACCESS
;Wait LT7686_LO_DELAY us
	movlw	122
	movwf	DELAYTEMP,ACCESS
DelayUS9
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS9
	nop
;__LT7686_outbuffer = 0xC0
	movlw	192
	movwf	__LT7686_OUTBUFFER,ACCESS
	clrf	__LT7686_OUTBUFFER_H,ACCESS
	clrf	__LT7686_OUTBUFFER_U,ACCESS
	clrf	__LT7686_OUTBUFFER_E,ACCESS
;repeat 8
	movlw	8
	movwf	SysRepeatTemp5,ACCESS
SysRepeatLoop5
;if __LT7686_outbuffer.7 = ON  then
	btfss	__LT7686_OUTBUFFER,7,ACCESS
	bra	ELSE10_1
;set LT7686_DO ON;
	bsf	LATB,0,ACCESS
;else
	bra	ENDIF10
ELSE10_1
;set LT7686_DO OFF;
	bcf	LATB,0,ACCESS
;end if
ENDIF10
;SET LT7686_SCK OFF;
	bcf	LATC,3,ACCESS
;Wait LT7686_LO_DELAY us
	movlw	122
	movwf	DELAYTEMP,ACCESS
DelayUS10
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS10
	nop
;rotate __LT7686_outbuffer left
	rlcf	__LT7686_OUTBUFFER,F,ACCESS
	rlcf	__LT7686_OUTBUFFER_H,F,ACCESS
	rlcf	__LT7686_OUTBUFFER_U,F,ACCESS
	rlcf	__LT7686_OUTBUFFER_E,F,ACCESS
;SET LT7686_SCK ON;
	bsf	LATC,3,ACCESS
;Wait LT7686_LO_DELAY us
	movlw	122
	movwf	DELAYTEMP,ACCESS
DelayUS11
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS11
	nop
;end repeat
	decfsz	SysRepeatTemp5,F,ACCESS
	bra	SysRepeatLoop5
SysRepeatLoopEnd5
;repeat 8
	movlw	8
	movwf	SysRepeatTemp5,ACCESS
SysRepeatLoop6
;SET LT7686_SCK OFF
	bcf	LATC,3,ACCESS
;Set C Off
	bcf	STATUS,C,ACCESS
;rotate LT7686_DataRead left
	rlcf	LT7686_DATAREAD,F,ACCESS
;Wait LT7686_LO_DELAY us
	movlw	122
	movwf	DELAYTEMP,ACCESS
DelayUS12
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS12
	nop
;if LT7686_DI = On then
	btfss	PORTC,4,ACCESS
	bra	ELSE11_1
;set LT7686_DataRead.0 On
	bsf	LT7686_DATAREAD,0,ACCESS
;Else
	bra	ENDIF11
ELSE11_1
;set LT7686_DataRead.0 Off
	bcf	LT7686_DATAREAD,0,ACCESS
;end if
ENDIF11
;SET LT7686_SCK ON
	bsf	LATC,3,ACCESS
;Wait LT7686_LO_DELAY us
	movlw	122
	movwf	DELAYTEMP,ACCESS
DelayUS13
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS13
	nop
;end repeat
	decfsz	SysRepeatTemp5,F,ACCESS
	bra	SysRepeatLoop6
SysRepeatLoopEnd6
;Wait LT7686_LO_DELAY us
	movlw	122
	movwf	DELAYTEMP,ACCESS
DelayUS14
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS14
	nop
;LT7686_CS = 1
	bsf	LATA,3,ACCESS
	return

;********************************************************************************

;Source: 006_GLCDProgram.gcb (200)
LT7686_HARDWARE_RESET
;Dir LT7686_RST Out
	bcf	TRISB,5,ACCESS
;LT7686_RST = 1
	bsf	LATB,5,ACCESS
;Wait 50 ms
	movlw	50
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	rcall	Delay_MS
;LT7686_RST = 0
	bcf	LATB,5,ACCESS
;Wait 50 ms
	movlw	50
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	rcall	Delay_MS
;LT7686_RST = 1
	bsf	LATB,5,ACCESS
;Wait 50 ms
	movlw	50
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	bra	Delay_MS

;********************************************************************************

LT7686_INITTFT_DATASET
	movlw	205
	cpfslt	SysStringA,ACCESS
	retlw	0
	movf	SysStringA, W,ACCESS
	addlw	low TABLELT7686_INITTFT_DATASET
	movwf	TBLPTRL,ACCESS
	movlw	high TABLELT7686_INITTFT_DATASET
	btfsc	STATUS, C,ACCESS
	addlw	1
	movwf	TBLPTRH,ACCESS
	movlw	upper TABLELT7686_INITTFT_DATASET
	btfsc	STATUS, C,ACCESS
	addlw	1
	movwf	TBLPTRU,ACCESS
	tblrd*
	movf	TABLAT, W,ACCESS
	return
TABLELT7686_INITTFT_DATASET
	db	204,17,5,19,6,17,6,19,65,17,7,19,138,17,8,19,100,17,9,19,138,17,10,19,100,17,0,19
	db	128,17,1,19,130,17,2,19,64,170,170,170,170,17,224,19,41,17,225,19,3,17,226,19
	db	11,17,227,19,3,17,228,19,1,170,170,170,170,17,16,19,4,17,18,19,133,17,19,19,3,17
	db	20,19,127,17,21,19,0,17,26,19,255,17,27,19,2,17,32,19,0,17,33,19,0,17,34,19,0,17
	db	35,19,0,17,36,19,0,17,37,19,4,17,38,19,0,17,39,19,0,17,40,19,0,17,41,19,0,170
	db	170,170,170,17,80,19,0,17,81,19,0,17,82,19,0,17,83,19,0,17,84,19,0,17,85,19,4,17
	db	86,19,0,17,87,19,0,17,88,19,0,17,89,19,0,17,90,19,0,17,91,19,4,17,92,19,0,17,93,19
	db	3,17,94,19,2,170,170,170,170,17,18,19,197

;********************************************************************************

;Source: 006_GLCDProgram.gcb (247)
LT7686_SOFTWARE_RESET
;LT7686_WriteCMD( 0x01 )
	movlw	1
	movwf	__BYTE,ACCESS
	rcall	LT7686_WRITECMD
;wait 1 ms
	movlw	1
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	bra	Delay_MS

;********************************************************************************

;Source: 006_GLCDProgram.gcb (432)
FN_LT7686_STATUSREAD
;LT7686_StatusRead = 0x00
	clrf	LT7686_STATUSREAD,ACCESS
;dim __LT7686_outbuffer as Long
;LT7686_CS = 0
	bcf	LATA,3,ACCESS
;__LT7686_outbuffer = 0x40
	movlw	64
	movwf	__LT7686_OUTBUFFER,ACCESS
	clrf	__LT7686_OUTBUFFER_H,ACCESS
	clrf	__LT7686_OUTBUFFER_U,ACCESS
	clrf	__LT7686_OUTBUFFER_E,ACCESS
;repeat 8
	movlw	8
	movwf	SysRepeatTemp7,ACCESS
SysRepeatLoop7
;if __LT7686_outbuffer.7 = ON  then
	btfss	__LT7686_OUTBUFFER,7,ACCESS
	bra	ELSE12_1
;set LT7686_DO ON;
	bsf	LATB,0,ACCESS
;else
	bra	ENDIF12
ELSE12_1
;set LT7686_DO OFF;
	bcf	LATB,0,ACCESS
;end if
ENDIF12
;SET LT7686_SCK OFF;
	bcf	LATC,3,ACCESS
;Wait LT7686_LO_DELAY us
	movlw	122
	movwf	DELAYTEMP,ACCESS
DelayUS15
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS15
	nop
;rotate __LT7686_outbuffer left
	rlcf	__LT7686_OUTBUFFER,F,ACCESS
	rlcf	__LT7686_OUTBUFFER_H,F,ACCESS
	rlcf	__LT7686_OUTBUFFER_U,F,ACCESS
	rlcf	__LT7686_OUTBUFFER_E,F,ACCESS
;SET LT7686_SCK ON;
	bsf	LATC,3,ACCESS
;Wait LT7686_LO_DELAY us
	movlw	122
	movwf	DELAYTEMP,ACCESS
DelayUS16
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS16
	nop
;end repeat
	decfsz	SysRepeatTemp7,F,ACCESS
	bra	SysRepeatLoop7
SysRepeatLoopEnd7
;repeat 8
	movlw	8
	movwf	SysRepeatTemp7,ACCESS
SysRepeatLoop8
;SET LT7686_SCK OFF
	bcf	LATC,3,ACCESS
;Set C Off
	bcf	STATUS,C,ACCESS
;rotate LT7686_StatusRead left
	rlcf	LT7686_STATUSREAD,F,ACCESS
;Wait LT7686_LO_DELAY us
	movlw	122
	movwf	DELAYTEMP,ACCESS
DelayUS17
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS17
	nop
;if LT7686_DI = On then
	btfss	PORTC,4,ACCESS
	bra	ELSE13_1
;set LT7686_StatusRead.0 On
	bsf	LT7686_STATUSREAD,0,ACCESS
;Else
	bra	ENDIF13
ELSE13_1
;set LT7686_StatusRead.0 Off
	bcf	LT7686_STATUSREAD,0,ACCESS
;end if
ENDIF13
;SET LT7686_SCK ON
	bsf	LATC,3,ACCESS
;Wait LT7686_LO_DELAY us
	movlw	122
	movwf	DELAYTEMP,ACCESS
DelayUS18
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS18
	nop
;end repeat
	decfsz	SysRepeatTemp7,F,ACCESS
	bra	SysRepeatLoop8
SysRepeatLoopEnd8
;LT7686_CS = 1
	bsf	LATA,3,ACCESS
	return

;********************************************************************************

;Source: 006_GLCDProgram.gcb (289)
LT7686_WRITECMD
;LT7686_CS = 0
	bcf	LATA,3,ACCESS
;dim __LT7686_outbuffer as Byte
;__LT7686_outbuffer = 0x00
	clrf	__LT7686_OUTBUFFER,ACCESS
;repeat 8
	movlw	8
	movwf	SysRepeatTemp1,ACCESS
SysRepeatLoop1
;if __LT7686_outbuffer.7 = ON  then
	btfss	__LT7686_OUTBUFFER,7,ACCESS
	bra	ELSE6_1
;set LT7686_DO ON;
	bsf	LATB,0,ACCESS
;else
	bra	ENDIF6
ELSE6_1
;set LT7686_DO OFF;
	bcf	LATB,0,ACCESS
;end if
ENDIF6
;SET LT7686_SCK OFF;
	bcf	LATC,3,ACCESS
;Wait LT7686_LO_DELAY us
	movlw	122
	movwf	DELAYTEMP,ACCESS
DelayUS1
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS1
	nop
;rotate __LT7686_outbuffer left
	rlcf	__LT7686_OUTBUFFER,F,ACCESS
;SET LT7686_SCK ON;
	bsf	LATC,3,ACCESS
;Wait LT7686_LO_DELAY us
	movlw	122
	movwf	DELAYTEMP,ACCESS
DelayUS2
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS2
	nop
;end repeat
	decfsz	SysRepeatTemp1,F,ACCESS
	bra	SysRepeatLoop1
SysRepeatLoopEnd1
;dim __LT7686_outbuffer as Byte
;__LT7686_outbuffer = __byte
	movff	__BYTE,__LT7686_OUTBUFFER
;repeat 8
	movlw	8
	movwf	SysRepeatTemp1,ACCESS
SysRepeatLoop2
;if __LT7686_outbuffer.7 = ON  then
	btfss	__LT7686_OUTBUFFER,7,ACCESS
	bra	ELSE7_1
;set LT7686_DO ON;
	bsf	LATB,0,ACCESS
;else
	bra	ENDIF7
ELSE7_1
;set LT7686_DO OFF;
	bcf	LATB,0,ACCESS
;end if
ENDIF7
;SET LT7686_SCK OFF;
	bcf	LATC,3,ACCESS
;Wait LT7686_LO_DELAY us
	movlw	122
	movwf	DELAYTEMP,ACCESS
DelayUS3
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS3
	nop
;rotate __LT7686_outbuffer left
	rlcf	__LT7686_OUTBUFFER,F,ACCESS
;SET LT7686_SCK ON;
	bsf	LATC,3,ACCESS
;Wait LT7686_LO_DELAY us
	movlw	122
	movwf	DELAYTEMP,ACCESS
DelayUS4
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS4
	nop
;end repeat
	decfsz	SysRepeatTemp1,F,ACCESS
	bra	SysRepeatLoop2
SysRepeatLoopEnd2
;LT7686_CS = 1
	bsf	LATA,3,ACCESS
;wait 1 ms
	movlw	1
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	bra	Delay_MS

;********************************************************************************

;Source: 006_GLCDProgram.gcb (331)
LT7686_WRITEDATA
;LT7686_CS = 0
	bcf	LATA,3,ACCESS
;dim __LT7686_outbuffer as Byte
;__LT7686_outbuffer = 0x80
	movlw	128
	movwf	__LT7686_OUTBUFFER,ACCESS
;repeat 8
	movlw	8
	movwf	SysRepeatTemp3,ACCESS
SysRepeatLoop3
;if __LT7686_outbuffer.7 = ON  then
	btfss	__LT7686_OUTBUFFER,7,ACCESS
	bra	ELSE8_1
;set LT7686_DO ON;
	bsf	LATB,0,ACCESS
;else
	bra	ENDIF8
ELSE8_1
;set LT7686_DO OFF;
	bcf	LATB,0,ACCESS
;end if
ENDIF8
;SET LT7686_SCK OFF;
	bcf	LATC,3,ACCESS
;Wait LT7686_LO_DELAY us
	movlw	122
	movwf	DELAYTEMP,ACCESS
DelayUS5
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS5
	nop
;rotate __LT7686_outbuffer left
	rlcf	__LT7686_OUTBUFFER,F,ACCESS
;SET LT7686_SCK ON;
	bsf	LATC,3,ACCESS
;Wait LT7686_LO_DELAY us
	movlw	122
	movwf	DELAYTEMP,ACCESS
DelayUS6
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS6
	nop
;end repeat
	decfsz	SysRepeatTemp3,F,ACCESS
	bra	SysRepeatLoop3
SysRepeatLoopEnd3
;dim __LT7686_outbuffer as Byte
;__LT7686_outbuffer = __byte
	movff	__BYTE,__LT7686_OUTBUFFER
;repeat 8
	movlw	8
	movwf	SysRepeatTemp3,ACCESS
SysRepeatLoop4
;if __LT7686_outbuffer.7 = ON  then
	btfss	__LT7686_OUTBUFFER,7,ACCESS
	bra	ELSE9_1
;set LT7686_DO ON;
	bsf	LATB,0,ACCESS
;else
	bra	ENDIF9
ELSE9_1
;set LT7686_DO OFF;
	bcf	LATB,0,ACCESS
;end if
ENDIF9
;SET LT7686_SCK OFF;
	bcf	LATC,3,ACCESS
;Wait LT7686_LO_DELAY us
	movlw	122
	movwf	DELAYTEMP,ACCESS
DelayUS7
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS7
	nop
;rotate __LT7686_outbuffer left
	rlcf	__LT7686_OUTBUFFER,F,ACCESS
;SET LT7686_SCK ON;
	bsf	LATC,3,ACCESS
;Wait LT7686_LO_DELAY us
	movlw	122
	movwf	DELAYTEMP,ACCESS
DelayUS8
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS8
	nop
;end repeat
	decfsz	SysRepeatTemp3,F,ACCESS
	bra	SysRepeatLoop4
SysRepeatLoopEnd4
;LT7686_CS = 1
	bsf	LATA,3,ACCESS
;wait 1 ms
	movlw	1
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	bra	Delay_MS

;********************************************************************************

;Source: system.h (4061)
SYSCOMPEQUAL
;Dim SysByteTempA, SysByteTempB, SysByteTempX as byte
;setf SysByteTempX
	setf	SYSBYTETEMPX,ACCESS
;movf SysByteTempB, W
	movf	SYSBYTETEMPB, W,ACCESS
;cpfseq SysByteTempA
	cpfseq	SYSBYTETEMPA,ACCESS
;clrf SysByteTempX
	clrf	SYSBYTETEMPX,ACCESS
	return

;********************************************************************************

;Source: system.h (4539)
SYSCOMPLESSTHAN32
;dim SysLongTempA as long
;dim SysLongTempB as long
;dim SysByteTempX as byte
;clrf SysByteTempX
	clrf	SYSBYTETEMPX,ACCESS
;Test Exp, exit if more
;movf SysLongTempA_E,W
	movf	SYSLONGTEMPA_E,W,ACCESS
;subwf SysLongTempB_E,W
	subwf	SYSLONGTEMPB_E,W,ACCESS
;btfss STATUS,C
	btfss	STATUS,C,ACCESS
;return
	return
;If not more and not zero, is less
;bnz SCLT32True
	bnz	SCLT32TRUE
;Test Upper, exit if more
;movf SysLongTempA_U,W
	movf	SYSLONGTEMPA_U,W,ACCESS
;subwf SysLongTempB_U,W
	subwf	SYSLONGTEMPB_U,W,ACCESS
;btfss STATUS,C
	btfss	STATUS,C,ACCESS
;return
	return
;If not more and not zero, is less
;bnz SCLT32True
	bnz	SCLT32TRUE
;Test High, exit if more
;movf SysLongTempA_H,W
	movf	SYSLONGTEMPA_H,W,ACCESS
;subwf SysLongTempB_H,W
	subwf	SYSLONGTEMPB_H,W,ACCESS
;btfss STATUS,C
	btfss	STATUS,C,ACCESS
;return
	return
;If not more and not zero, is less
;bnz SCLT32True
	bnz	SCLT32TRUE
;Test Low, exit if more or equal
;movf SysLongTempB,W
	movf	SYSLONGTEMPB,W,ACCESS
;subwf SysLongTempA,W
	subwf	SYSLONGTEMPA,W,ACCESS
;btfsc STATUS,C
	btfsc	STATUS,C,ACCESS
;return
	return
SCLT32TRUE
;comf SysByteTempX,F
	comf	SYSBYTETEMPX,F,ACCESS
	return

;********************************************************************************

;Source: system.h (1716)
SYSCOPYSTRING
;Dim SysCalcTempA As Byte
;Dim SysStringLength As Byte
;Get and copy length for ChipFamily 16 support
;movff INDF0, SysCalcTempA
	movff	INDF0, SYSCALCTEMPA
;movff SysCalcTempA, INDF1
	movff	SYSCALCTEMPA, INDF1
;goto SysCopyStringCheck
	bra	SYSCOPYSTRINGCHECK
;When appending, add length to counter
SYSCOPYSTRINGPART
;movf INDF0, W
	movf	INDF0, W,ACCESS
;movwf SysCalcTempA
	movwf	SYSCALCTEMPA,ACCESS
;addwf SysStringLength, F
	addwf	SYSSTRINGLENGTH, F,ACCESS
SYSCOPYSTRINGCHECK
;Exit if length = 0
;movf SysCalcTempA,F
	movf	SYSCALCTEMPA,F,ACCESS
;btfsc STATUS,Z
	btfsc	STATUS,Z,ACCESS
;return
	return
SYSSTRINGCOPY
;Copy character
;movff PREINC0, PREINC1
	movff	PREINC0, PREINC1
;decfsz SysCalcTempA, F
	decfsz	SYSCALCTEMPA, F,ACCESS
;goto SysStringCopy
	bra	SYSSTRINGCOPY
	return

;********************************************************************************

;Source: system.h (1913)
SYSREADSTRING
;Dim SysCalcTempA As Byte
;Dim SysStringLength As Byte
;ChipFamily 16 support
;Get length
;TBLRD*+
	tblrd*+
;movff TABLAT,SysCalcTempA
	movff	TABLAT,SYSCALCTEMPA
;movff TABLAT,INDF1
	movff	TABLAT,INDF1
;goto SysStringReadCheck
	bra	SYSSTRINGREADCHECK
SYSREADSTRINGPART
;TBLRD*+
	tblrd*+
;movf TABLAT, W
	movf	TABLAT, W,ACCESS
;movwf SysCalcTempA
	movwf	SYSCALCTEMPA,ACCESS
;addwf SysStringLength,F
	addwf	SYSSTRINGLENGTH,F,ACCESS
;Check length
SYSSTRINGREADCHECK
;If length is 0, exit
;movf SysCalcTempA,F
	movf	SYSCALCTEMPA,F,ACCESS
;btfsc STATUS,Z
	btfsc	STATUS,Z,ACCESS
;return
	return
;Copy
SYSSTRINGREAD
;Copy char
;TBLRD*+
	tblrd*+
;movff TABLAT,PREINC1
	movff	TABLAT,PREINC1
;decfsz SysCalcTempA, F
	decfsz	SYSCALCTEMPA, F,ACCESS
;goto SysStringRead
	bra	SYSSTRINGREAD
	return

;********************************************************************************

SysStringTables

StringTable1
	db	9,67,111,109,109,101,110,99,101,100


StringTable3
	db	20,76,84,55,54,56,54,95,83,116,97,116,117,115,82,101,97,100,40,41,32


;********************************************************************************

;Source: picas.h (7)
FN__HEXPICAS
;_HexPICAS(0) = 2
	movlw	2
	banksel	SYS_HEXPICAS_0
	movwf	SYS_HEXPICAS_0,BANKED
;dim SysStringTemp as byte
;Low nibble
;SysStringTemp = SysValTemp And 0x0F
	movlw	15
	andwf	SYSVALTEMP,W,ACCESS
	banksel	SYSSTRINGTEMP
	movwf	SYSSTRINGTEMP,BANKED
;If SysStringTemp > 9 Then SysStringTemp = SysStringTemp + 7
	sublw	9
	btfsc	STATUS, C,ACCESS
	bra	ENDIF14
;If SysStringTemp > 9 Then SysStringTemp = SysStringTemp + 7
	movlw	7
	addwf	SYSSTRINGTEMP,F,BANKED
;If SysStringTemp > 9 Then SysStringTemp = SysStringTemp + 7
ENDIF14
;_HexPICAS(2) = SysStringTemp + 48
	movlw	48
	addwf	SYSSTRINGTEMP,W,BANKED
	banksel	SYS_HEXPICAS_2
	movwf	SYS_HEXPICAS_2,BANKED
;Get high nibble
;For SysStringTemp = 1 to 4
;Legacy method
	banksel	SYSSTRINGTEMP
	clrf	SYSSTRINGTEMP,BANKED
SysForLoop1
	incf	SYSSTRINGTEMP,F,BANKED
;Rotate SysValTemp Right
	rrcf	SYSVALTEMP,F,ACCESS
;Next
	movlw	4
	subwf	SYSSTRINGTEMP,W,BANKED
	btfss	STATUS, C,ACCESS
	bra	SysForLoop1
SysForLoopEnd1
;SysStringTemp = SysValTemp And 0x0F
	movlw	15
	andwf	SYSVALTEMP,W,ACCESS
	movwf	SYSSTRINGTEMP,BANKED
;If SysStringTemp > 9 Then SysStringTemp = SysStringTemp + 7
	sublw	9
	btfsc	STATUS, C,ACCESS
	bra	ENDIF16
;If SysStringTemp > 9 Then SysStringTemp = SysStringTemp + 7
	movlw	7
	addwf	SYSSTRINGTEMP,F,BANKED
;If SysStringTemp > 9 Then SysStringTemp = SysStringTemp + 7
ENDIF16
;_HexPICAS(1) = SysStringTemp + 48
	movlw	48
	addwf	SYSSTRINGTEMP,W,BANKED
	banksel	SYS_HEXPICAS_1
	movwf	SYS_HEXPICAS_1,BANKED
	banksel	0
	return

;********************************************************************************


 END
