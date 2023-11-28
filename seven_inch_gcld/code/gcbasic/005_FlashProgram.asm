;Program compiled by GCBASIC (1.01.00 2023-11-28 (Windows 64 bit) : Build 1310) for Microchip MPASM/MPLAB-X Assembler using FreeBASIC 1.07.1/2023-11-28 CRC93
;Need help? 
;  See the GCBASIC forums at http://sourceforge.net/projects/gcbasic/forums,
;  Check the documentation and Help at http://gcbasic.sourceforge.net/help/,
;or, email us:
;   w_cholmondeley at users dot sourceforge dot net
;   evanvennn at users dot sourceforge dot net
;********************************************************************************
;   Source file    : D:\GreatCowBASICGits\Help.git\trunk\seven_inch_gcld\code\gcbasic\005_FlashProgram.gcb
;   Setting file   : C:\GCstudio\gcbasic\use.ini
;   Preserve mode  : 2
;   Assembler      : GCASM
;   Programmer     : C:\GCstudio\gcbasic\..\PICKitPlus\PICKitCommandline.exe
;   Output file    : D:\GreatCowBASICGits\Help.git\trunk\seven_inch_gcld\code\gcbasic\005_FlashProgram.asm
;********************************************************************************

;Set up the assembler options (Chip type, clock source, other bits and pieces)
 LIST p=18F27Q84, r=DEC
#include <P18F27Q84.inc>
 CONFIG CP = OFF, WRTSAF = OFF, WRTD = OFF, WRTB = OFF, WDTE = OFF, XINST = OFF, LVP = OFF, MVECEN = OFF, MCLRE = INTMCLR, FCMEN = ON, CLKOUTEN = OFF, RSTOSC = HFINTOSC_1MHZ, FEXTOSC = OFF

;********************************************************************************

;Set aside memory locations for variables
COMPORT                          EQU    1284          ; 0x504
DELAYTEMP                        EQU    1280          ; 0x500
DELAYTEMP2                       EQU    1281          ; 0x501
INITLENGTH                       EQU    1293          ; 0x50D
INITLENGTH_H                     EQU    1294          ; 0x50E
PFMREAD                          EQU    1295          ; 0x50F
POINTER                          EQU    1296          ; 0x510
POINTER_E                        EQU    1299          ; 0x513
POINTER_H                        EQU    1297          ; 0x511
POINTER_U                        EQU    1298          ; 0x512
PRINTLEN                         EQU    1300          ; 0x514
SERDATA                          EQU    1301          ; 0x515
STRINGPOINTER                    EQU    1302          ; 0x516
SYSBITVAR0                       EQU    1303          ; 0x517
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
SYSPRINTDATAHANDLER              EQU    1304          ; 0x518
SYSPRINTDATAHANDLER_H            EQU    1305          ; 0x519
SYSPRINTTEMP                     EQU    1306          ; 0x51A
SYSREPEATTEMP1                   EQU    1307          ; 0x51B
SYSREPEATTEMP1_E                 EQU    1310          ; 0x51E
SYSREPEATTEMP1_H                 EQU    1308          ; 0x51C
SYSREPEATTEMP1_U                 EQU    1309          ; 0x51D
SYSREPEATTEMP2                   EQU    1311          ; 0x51F
SYSREPEATTEMP4                   EQU    1312          ; 0x520
SYSREPEATTEMP4_H                 EQU    1313          ; 0x521
SYSREPEATTEMP5                   EQU    1314          ; 0x522
SYSREPEATTEMP6                   EQU    1315          ; 0x523
SYSREPEATTEMP7                   EQU    1316          ; 0x524
SYSREPEATTEMP8                   EQU    1317          ; 0x525
SYSSTRINGA                       EQU    1287          ; 0x507
SYSSTRINGA_H                     EQU    1288          ; 0x508
SYSSTRINGLENGTH                  EQU    1286          ; 0x506
SYSSTRINGPARAM1                  EQU   14059          ; 0x36EB
SYSTEMP1                         EQU    1318          ; 0x526
SYSTEMP1_H                       EQU    1319          ; 0x527
SYSTEMP2                         EQU    1320          ; 0x528
SYSWAITTEMPMS                    EQU    1282          ; 0x502
SYSWAITTEMPMS_H                  EQU    1283          ; 0x503
SYSWORDTEMPA                     EQU    1285          ; 0x505
SYSWORDTEMPA_H                   EQU    1286          ; 0x506
SYSWORDTEMPB                     EQU    1289          ; 0x509
SYSWORDTEMPB_H                   EQU    1290          ; 0x50A
_DUMMY                           EQU    1321          ; 0x529
_PFM_DATABYTE                    EQU    1322          ; 0x52A
__DATAADDRESS                    EQU    1323          ; 0x52B
__DATAADDRESS_E                  EQU    1326          ; 0x52E
__DATAADDRESS_H                  EQU    1324          ; 0x52C
__DATAADDRESS_U                  EQU    1325          ; 0x52D
__DATALENGTH                     EQU    1327          ; 0x52F
__DATALENGTH_E                   EQU    1330          ; 0x532
__DATALENGTH_H                   EQU    1328          ; 0x530
__DATALENGTH_U                   EQU    1329          ; 0x531
__DATAPOINTER                    EQU    1331          ; 0x533
__DATAPOINTER_H                  EQU    1332          ; 0x534
__FLASHBYTE                      EQU    1333          ; 0x535
__FLASHLONG                      EQU    1334          ; 0x536
__FLASHLONG_E                    EQU    1337          ; 0x539
__FLASHLONG_H                    EQU    1335          ; 0x537
__FLASHLONG_U                    EQU    1336          ; 0x538
__FLASHWORD                      EQU    1338          ; 0x53A
__FLASHWORD_H                    EQU    1339          ; 0x53B
__FLASH_OUTBUFFER                EQU    1340          ; 0x53C
__FLASH_OUTBUFFER_E              EQU    1343          ; 0x53F
__FLASH_OUTBUFFER_H              EQU    1341          ; 0x53D
__FLASH_OUTBUFFER_U              EQU    1342          ; 0x53E

;********************************************************************************

;Alias variables
AFSR0 EQU 1257
AFSR0_H EQU 1258
_TFM_ABS_ADDR EQU 1270
_TFM_ABS_ADDR_H EQU 1271
_TFM_ABS_ADDR_U EQU 1272
_TFM_ABS_ADDR_E EQU 1321

;********************************************************************************

;Vectors
	ORG	0
	goto	BASPROGRAMSTART
	ORG	8
	retfie

;********************************************************************************

;Start of program memory page 0
	ORG	12
BASPROGRAMSTART
;Call initialisation routines
	rcall	INITSYS
	rcall	INITUSART
;Automatic pin direction setting
	bcf	TRISC,5,ACCESS
	bcf	TRISC,3,ACCESS
	bcf	TRISA,2,ACCESS

;Start of the main program
;
;https://gettobyte.com/w25q128jv-spi-flash-memory-part3/
;
;
;Setup USART
;Setup SPI
;#define FLASH_HARDWARESPI
;Pin mappings for  SPI
;Main program
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
;Dim pointer as Long
;Dim initlength, __FLASHWord as Word
;Dim __FLASHreg, __FLASHbyte as Byte
;Reset the chip
;FLASH_SPI_W25_Reset()
	rcall	FLASH_SPI_W25_RESET
;Erase chip
;FLASH_SPI_W25_WriteBytetoFlash ( W25Q128JV_CHIPERASE )
	movlw	199
	movwf	__FLASHBYTE,ACCESS
	rcall	FLASH_SPI_W25_WRITEBYTETOFLASH
;Wait 10 ms
	movlw	10
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	rcall	Delay_MS
;Set address for this boot loader program
;FLASH_SPI_W25_SetFlashAddress ( [Long]0x00 )
	clrf	__FLASHLONG,ACCESS
	clrf	__FLASHLONG_H,ACCESS
	clrf	__FLASHLONG_U,ACCESS
	clrf	__FLASHLONG_E,ACCESS
	rcall	FLASH_SPI_W25_SETFLASHADDRESS
;Set the table to the chip, do not send the first byte, hence start at address plus 1.
;pointer = 0
	clrf	POINTER,ACCESS
	clrf	POINTER_H,ACCESS
	clrf	POINTER_U,ACCESS
	clrf	POINTER_E,ACCESS
;readtable InitTFT, pointer, initlength
	movff	POINTER,SYSSTRINGA
	movff	POINTER_H,SYSSTRINGA_H
	rcall	INITTFT
	movwf	INITLENGTH,ACCESS
	movff	POINTER,SYSSTRINGA
	movff	POINTER_H,SYSSTRINGA_H
	rcall	INITTFT_H
	movwf	INITLENGTH_H,ACCESS
;FLASH_SPI_W25_WriteBuffertoFlash (  @TABLEINITTFT + 1, initlength )
	movlw	low(TABLEINITTFT+1)
	movwf	__DATAADDRESS,ACCESS
	movlw	high(TABLEINITTFT+1)
	movwf	__DATAADDRESS_H,ACCESS
	movlw	upper(TABLEINITTFT+1)
	movwf	__DATAADDRESS_U,ACCESS
	movlw	0
	movwf	__DATAADDRESS_E,ACCESS
	movff	INITLENGTH,__DATALENGTH
	movff	INITLENGTH_H,__DATALENGTH_H
	rcall	FLASH_SPI_W25_WRITEBUFFERTOFLASH
;HSerPrintStringCRLF "Completed bootloader"
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable2
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable2
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable2
	movwf	TBLPTRU,ACCESS
	rcall	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	movwf	SysPRINTDATAHandler,ACCESS
	movlw	high SYSSTRINGPARAM1
	movwf	SysPRINTDATAHandler_H,ACCESS
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM1*20
	rcall	HSERPRINTSTRINGCRLF
;Set address to 0x00020000.  Can be a 24bit value. This address needs to match the bootloader code in the table
;FLASH_SPI_W25_SetFlashAddress ( [Long]0x00020000 )
	clrf	__FLASHLONG,ACCESS
	clrf	__FLASHLONG_H,ACCESS
	movlw	2
	movwf	__FLASHLONG_U,ACCESS
	clrf	__FLASHLONG_E,ACCESS
	rcall	FLASH_SPI_W25_SETFLASHADDRESS
;Set screen to RED 1024 * 768 = 0xC0000 words
;FLASH_SPI_W25_WriteMultipleBytestoFlash (  0xC0000 , TFT_RED )
	clrf	__DATALENGTH,ACCESS
	clrf	__DATALENGTH_H,ACCESS
	movlw	12
	movwf	__DATALENGTH_U,ACCESS
	clrf	__DATALENGTH_E,ACCESS
	clrf	__FLASHWORD,ACCESS
	movlw	248
	movwf	__FLASHWORD_H,ACCESS
	rcall	FLASH_SPI_W25_WRITEMULTIPLEBYTESTOFLASH
;HSerPrintStringCRLF "Completed color"
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable3
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable3
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable3
	movwf	TBLPTRU,ACCESS
	rcall	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	movwf	SysPRINTDATAHandler,ACCESS
	movlw	high SYSSTRINGPARAM1
	movwf	SysPRINTDATAHandler_H,ACCESS
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM1*15
	rcall	HSERPRINTSTRINGCRLF
;end
	bra	BASPROGRAMEND
;Table is 285 elements.  Taken from Datasheet
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

;Source: 005_FlashProgram.gcb (74)
FLASH_SPI_W25_RESET
;wait 100 ms
	movlw	100
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	rcall	Delay_MS
;FLASH_SPI_W25_WriteWordtoFlash ( W25Q128JV_RESET_SEQUENCE, False )
	movlw	153
	movwf	__FLASHWORD,ACCESS
	movlw	102
	movwf	__FLASHWORD_H,ACCESS
	bcf	SYSBITVAR0,0,ACCESS
	rcall	FLASH_SPI_W25_WRITEWORDTOFLASH
;wait 100 ms
	movlw	100
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	bra	Delay_MS

;********************************************************************************

;Source: 005_FlashProgram.gcb (217)
FLASH_SPI_W25_SETFLASHADDRESS
;FLASH_SPI_W25_CS = 0
	bcf	LATA,2,ACCESS
;Set the three parameters using Bit Banging
;dim __FLASH_outbuffer as Long
;__FLASH_outbuffer = __FLASHLong
	movff	__FLASHLONG,__FLASH_OUTBUFFER
	movff	__FLASHLONG_H,__FLASH_OUTBUFFER_H
	movff	__FLASHLONG_U,__FLASH_OUTBUFFER_U
	movff	__FLASHLONG_E,__FLASH_OUTBUFFER_E
;repeat 24
	movlw	24
	movwf	SysRepeatTemp8,ACCESS
SysRepeatLoop8
;if __FLASH_outbuffer.23 = ON  then
	btfss	__FLASH_OUTBUFFER_U,7,ACCESS
	bra	ELSE12_1
;set FLASH_SPI_W25_DO ON;
	bsf	LATC,5,ACCESS
;else
	bra	ENDIF12
ELSE12_1
;set FLASH_SPI_W25_DO OFF;
	bcf	LATC,5,ACCESS
;end if
ENDIF12
;SET FLASH_SPI_W25_SCK On;
	bsf	LATC,3,ACCESS
;rotate __FLASH_outbuffer left
	rlcf	__FLASH_OUTBUFFER,F,ACCESS
	rlcf	__FLASH_OUTBUFFER_H,F,ACCESS
	rlcf	__FLASH_OUTBUFFER_U,F,ACCESS
	rlcf	__FLASH_OUTBUFFER_E,F,ACCESS
;set FLASH_SPI_W25_SCK Off;
	bcf	LATC,3,ACCESS
;end repeat
	decfsz	SysRepeatTemp8,F,ACCESS
	bra	SysRepeatLoop8
SysRepeatLoopEnd8
;FLASH_SPI_W25_CS = 1
	bsf	LATA,2,ACCESS
	return

;********************************************************************************

;Source: 005_FlashProgram.gcb (125)
FLASH_SPI_W25_WRITEBUFFERTOFLASH
;Dim __FLASHbyte as Byte
;Dim __DataPointer as Word
;__DataPointer = 0
	clrf	__DATAPOINTER,ACCESS
	clrf	__DATAPOINTER_H,ACCESS
;FLASH_SPI_W25_WriteBytetoFlash ( W25Q128JV_WRITEENABLE )
	movlw	6
	movwf	__FLASHBYTE,ACCESS
	rcall	FLASH_SPI_W25_WRITEBYTETOFLASH
;FLASH_SPI_W25_CS = 0
	bcf	LATA,2,ACCESS
;repeat  __DataLength
	movff	__DATALENGTH,SysRepeatTemp4
	movff	__DATALENGTH_H,SysRepeatTemp4_H
	movff	SYSREPEATTEMP4,SysWORDTempA
	movff	SYSREPEATTEMP4_H,SysWORDTempA_H
	movlw	1
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	rcall	SYSCOMPLESSTHAN16
	btfsc	SysByteTempX,0,ACCESS
	bra	SysRepeatLoopEnd4
	movf	SYSREPEATTEMP4,F,ACCESS
	btfss	STATUS, Z,ACCESS
	incf	SysRepeatTemp4_H,F,ACCESS
SysRepeatLoop4
;PFMRead  ( __DataAddress + __DataPointer, __FLASHbyte )
	movf	__DATAPOINTER,W,ACCESS
	addwf	__DATAADDRESS,W,ACCESS
	movwf	_TFM_ABS_ADDR,ACCESS
	movf	__DATAPOINTER_H,W,ACCESS
	addwfc	__DATAADDRESS_H,W,ACCESS
	movwf	_TFM_ABS_ADDR_H,ACCESS
	movlw	0
	addwfc	__DATAADDRESS_U,W,ACCESS
	movwf	_TFM_ABS_ADDR_U,ACCESS
	movlw	0
	addwfc	__DATAADDRESS_E,W,ACCESS
	movwf	_TFM_ABS_ADDR_E,ACCESS
	rcall	PFMREAD758
	movff	_PFM_DATABYTE,__FLASHBYTE
;__DataPointer++
	incf	__DATAPOINTER,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	__DATAPOINTER_H,F,ACCESS
;Force the last byte to be 0x00, as we are reading the progmem
;if __DataLength = __DataPointer Then __FLASHbyte = 0
	movff	__DATALENGTH,SysWORDTempA
	movff	__DATALENGTH_H,SysWORDTempA_H
	movff	__DATAPOINTER,SysWORDTempB
	movff	__DATAPOINTER_H,SysWORDTempB_H
	rcall	SYSCOMPEQUAL16
	btfsc	SysByteTempX,0,ACCESS
;if __DataLength = __DataPointer Then __FLASHbyte = 0
	clrf	__FLASHBYTE,ACCESS
;if __DataLength = __DataPointer Then __FLASHbyte = 0
;Set the three parameters using Bit Banging
;dim __FLASH_outbuffer as Byte
;__FLASH_outbuffer = __FLASHbyte
	movff	__FLASHBYTE,__FLASH_OUTBUFFER
;repeat 8
	movlw	8
	movwf	SysRepeatTemp5,ACCESS
SysRepeatLoop5
;if __FLASH_outbuffer.7 = ON  then
	btfss	__FLASH_OUTBUFFER,7,ACCESS
	bra	ELSE8_1
;set FLASH_SPI_W25_DO ON;
	bsf	LATC,5,ACCESS
;else
	bra	ENDIF8
ELSE8_1
;set FLASH_SPI_W25_DO OFF;
	bcf	LATC,5,ACCESS
;end if
ENDIF8
;SET FLASH_SPI_W25_SCK On;
	bsf	LATC,3,ACCESS
;rotate __FLASH_outbuffer left
	rlcf	__FLASH_OUTBUFFER,F,ACCESS
;set FLASH_SPI_W25_SCK Off;
	bcf	LATC,3,ACCESS
;end repeat
	decfsz	SysRepeatTemp5,F,ACCESS
	bra	SysRepeatLoop5
SysRepeatLoopEnd5
;end repeat
	decfsz	SysRepeatTemp4,F,ACCESS
	bra	SysRepeatLoop4
	decfsz	SysRepeatTemp4_H,F,ACCESS
	bra	SysRepeatLoop4
SysRepeatLoopEnd4
;FLASH_SPI_W25_CS = 1
	bsf	LATA,2,ACCESS
	return

;********************************************************************************

;Source: 005_FlashProgram.gcb (164)
FLASH_SPI_W25_WRITEBYTETOFLASH
;FLASH_SPI_W25_CS = 0
	bcf	LATA,2,ACCESS
;Set the three parameters using Bit Banging
;dim __FLASH_outbuffer as Byte
;__FLASH_outbuffer = __FLASHbyte
	movff	__FLASHBYTE,__FLASH_OUTBUFFER
;repeat 8
	movlw	8
	movwf	SysRepeatTemp6,ACCESS
SysRepeatLoop6
;if __FLASH_outbuffer.7 = ON  then
	btfss	__FLASH_OUTBUFFER,7,ACCESS
	bra	ELSE9_1
;set FLASH_SPI_W25_DO ON;
	bsf	LATC,5,ACCESS
;else
	bra	ENDIF9
ELSE9_1
;set FLASH_SPI_W25_DO OFF;
	bcf	LATC,5,ACCESS
;end if
ENDIF9
;SET FLASH_SPI_W25_SCK On;
	bsf	LATC,3,ACCESS
;rotate __FLASH_outbuffer left
	rlcf	__FLASH_OUTBUFFER,F,ACCESS
;set FLASH_SPI_W25_SCK Off;
	bcf	LATC,3,ACCESS
;end repeat
	decfsz	SysRepeatTemp6,F,ACCESS
	bra	SysRepeatLoop6
SysRepeatLoopEnd6
;FLASH_SPI_W25_CS = 1
	bsf	LATA,2,ACCESS
	return

;********************************************************************************

;Source: 005_FlashProgram.gcb (84)
FLASH_SPI_W25_WRITEMULTIPLEBYTESTOFLASH
;FLASH_SPI_W25_WriteBytetoFlash ( W25Q128JV_WRITEENABLE )
	movlw	6
	movwf	__FLASHBYTE,ACCESS
	rcall	FLASH_SPI_W25_WRITEBYTETOFLASH
;FLASH_SPI_W25_CS = 0
	bcf	LATA,2,ACCESS
;repeat  __DataLength
	movff	__DATALENGTH,SysRepeatTemp1
	movff	__DATALENGTH_H,SysRepeatTemp1_H
	movff	__DATALENGTH_U,SysRepeatTemp1_U
	movff	__DATALENGTH_E,SysRepeatTemp1_E
	movff	SYSREPEATTEMP1,SysLONGTempA
	movff	SYSREPEATTEMP1_H,SysLONGTempA_H
	movff	SYSREPEATTEMP1_U,SysLONGTempA_U
	movff	SYSREPEATTEMP1_E,SysLONGTempA_E
	movlw	1
	movwf	SysLONGTempB,ACCESS
	clrf	SysLONGTempB_H,ACCESS
	clrf	SysLONGTempB_U,ACCESS
	clrf	SysLONGTempB_E,ACCESS
	rcall	SYSCOMPLESSTHAN32
	btfsc	SysByteTempX,0,ACCESS
	bra	SysRepeatLoopEnd1
	movf	SYSREPEATTEMP1,F,ACCESS
	btfss	STATUS, Z,ACCESS
	incf	SysRepeatTemp1_H,F,ACCESS
	movf	SYSREPEATTEMP1_H,F,ACCESS
	btfss	STATUS, Z,ACCESS
	incf	SysRepeatTemp1_U,F,ACCESS
	movf	SYSREPEATTEMP1_U,F,ACCESS
	btfss	STATUS, Z,ACCESS
	incf	SysRepeatTemp1_E,F,ACCESS
SysRepeatLoop1
;Set the three parameters using Bit Banging
;dim __FLASH_outbuffer as Byte
;__FLASH_outbuffer = __FLASHWord_H
	movff	__FLASHWORD_H,__FLASH_OUTBUFFER
;repeat 8
	movlw	8
	movwf	SysRepeatTemp2,ACCESS
SysRepeatLoop2
;if __FLASH_outbuffer.7 = ON  then
	btfss	__FLASH_OUTBUFFER,7,ACCESS
	bra	ELSE4_1
;set FLASH_SPI_W25_DO ON;
	bsf	LATC,5,ACCESS
;else
	bra	ENDIF4
ELSE4_1
;set FLASH_SPI_W25_DO OFF;
	bcf	LATC,5,ACCESS
;end if
ENDIF4
;SET FLASH_SPI_W25_SCK On;
	bsf	LATC,3,ACCESS
;rotate __FLASH_outbuffer left
	rlcf	__FLASH_OUTBUFFER,F,ACCESS
;set FLASH_SPI_W25_SCK Off;
	bcf	LATC,3,ACCESS
;end repeat
	decfsz	SysRepeatTemp2,F,ACCESS
	bra	SysRepeatLoop2
SysRepeatLoopEnd2
;__FLASH_outbuffer = __FLASHWord
	movff	__FLASHWORD,__FLASH_OUTBUFFER
;repeat 8
	movlw	8
	movwf	SysRepeatTemp2,ACCESS
SysRepeatLoop3
;if __FLASH_outbuffer.7 = ON  then
	btfss	__FLASH_OUTBUFFER,7,ACCESS
	bra	ELSE5_1
;set FLASH_SPI_W25_DO ON;
	bsf	LATC,5,ACCESS
;else
	bra	ENDIF5
ELSE5_1
;set FLASH_SPI_W25_DO OFF;
	bcf	LATC,5,ACCESS
;end if
ENDIF5
;SET FLASH_SPI_W25_SCK On;
	bsf	LATC,3,ACCESS
;rotate __FLASH_outbuffer left
	rlcf	__FLASH_OUTBUFFER,F,ACCESS
;set FLASH_SPI_W25_SCK Off;
	bcf	LATC,3,ACCESS
;end repeat
	decfsz	SysRepeatTemp2,F,ACCESS
	bra	SysRepeatLoop3
SysRepeatLoopEnd3
;end repeat
	decfsz	SysRepeatTemp1,F,ACCESS
	bra	SysRepeatLoop1
	decfsz	SysRepeatTemp1_H,F,ACCESS
	bra	SysRepeatLoop1
	decfsz	SysRepeatTemp1_U,F,ACCESS
	bra	SysRepeatLoop1
	decfsz	SysRepeatTemp1_E,F,ACCESS
	bra	SysRepeatLoop1
SysRepeatLoopEnd1
;FLASH_SPI_W25_CS = 1
	bsf	LATA,2,ACCESS
	return

;********************************************************************************

;Source: 005_FlashProgram.gcb (188)
FLASH_SPI_W25_WRITEWORDTOFLASH
;If __FLASHSendEnable = 1 Then
	btfss	SYSBITVAR0,0,ACCESS
	bra	ENDIF10
;FLASH_SPI_W25_WriteBytetoFlash ( W25Q128JV_WRITEENABLE )
	movlw	6
	movwf	__FLASHBYTE,ACCESS
	rcall	FLASH_SPI_W25_WRITEBYTETOFLASH
;End If
ENDIF10
;FLASH_SPI_W25_CS = 0
	bcf	LATA,2,ACCESS
;Set the three parameters using Bit Banging
;dim __FLASH_outbuffer as Word
;__FLASH_outbuffer = __FLASHWord
	movff	__FLASHWORD,__FLASH_OUTBUFFER
	movff	__FLASHWORD_H,__FLASH_OUTBUFFER_H
;repeat 16
	movlw	16
	movwf	SysRepeatTemp7,ACCESS
SysRepeatLoop7
;if __FLASH_outbuffer.15 = ON  then
	btfss	__FLASH_OUTBUFFER_H,7,ACCESS
	bra	ELSE11_1
;set FLASH_SPI_W25_DO ON;
	bsf	LATC,5,ACCESS
;else
	bra	ENDIF11
ELSE11_1
;set FLASH_SPI_W25_DO OFF;
	bcf	LATC,5,ACCESS
;end if
ENDIF11
;SET FLASH_SPI_W25_SCK On;
	bsf	LATC,3,ACCESS
;rotate __FLASH_outbuffer left
	rlcf	__FLASH_OUTBUFFER,F,ACCESS
	rlcf	__FLASH_OUTBUFFER_H,F,ACCESS
;set FLASH_SPI_W25_SCK Off;
	bcf	LATC,3,ACCESS
;end repeat
	decfsz	SysRepeatTemp7,F,ACCESS
	bra	SysRepeatLoop7
SysRepeatLoopEnd7
;FLASH_SPI_W25_CS = 1
	bsf	LATA,2,ACCESS
	return

;********************************************************************************

;Source: usart.h (2438)
HSERPRINTSTRINGCRLF
;PrintLen = PrintData(0)
	movff	SysPRINTDATAHandler,AFSR0
	movff	SysPRINTDATAHandler_H,AFSR0_H
	movff	INDF0,PRINTLEN
;If PrintLen <> 0 then
	movf	PRINTLEN,F,ACCESS
	btfsc	STATUS, Z,ACCESS
	bra	ENDIF13
;Write Data
;for SysPrintTemp = 1 to PrintLen
	movlw	1
	movwf	SYSPRINTTEMP,ACCESS
SysForLoop1
;HSerSend(PrintData(SysPrintTemp),comport )
	movf	SYSPRINTTEMP,W,ACCESS
	addwf	SysPRINTDATAHandler,W,ACCESS
	movwf	AFSR0,ACCESS
	movlw	0
	addwfc	SysPRINTDATAHandler_H,W,ACCESS
	movwf	AFSR0_H,ACCESS
	movff	INDF0,SERDATA
	rcall	HSERSEND807
;next
;Positive value Step Handler in For-next statement :#4p 
	movf	SYSPRINTTEMP,W,ACCESS
	subwf	PRINTLEN,W,ACCESS
	movwf	SysTemp1,ACCESS
	movff	SysTemp1,SysBYTETempA
	clrf	SysBYTETempB,ACCESS
	rcall	SYSCOMPEQUAL
	comf	SysByteTempX,F,ACCESS
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF14
;Set LoopVar to LoopVar + StepValue where StepValue is a positive value
	incf	SYSPRINTTEMP,F,ACCESS
	bra	SysForLoop1
;END IF
ENDIF14
SysForLoopEnd1
;End If
ENDIF13
;HSerSend(13,comport)
	movlw	13
	movwf	SERDATA,ACCESS
	rcall	HSERSEND807
;HSerSend(10,comport)
	movlw	10
	movwf	SERDATA,ACCESS
	bra	HSERSEND807

;********************************************************************************

;Overloaded signature: BYTE:byte:, Source: usart.h (1567)
HSERSEND807
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

;Source: system.h (175)
INITSYS
;Clear BSR on ChipFamily16 MCUs
;MOVLB 0
	movlb	0
;asm showdebug This code block sets the internal oscillator to ChipMHz
;asm showdebug Default settings for microcontrollers with _OSCCON1_
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
;asm showdebug The MCU is a chip family ChipFamily
;Section supports many MCUs, 18FxxK40, 18FxxK42 etc that have NDIV3 bit
;asm showdebug OSCCON type is 101
;OSCCON1 = 0x60
	movlw	96
	movwf	OSCCON1,BANKED
;Clear NDIV3:0
;NDIV3 = 0
	bcf	OSCCON1,NDIV3,BANKED
;NDIV2 = 0
	bcf	OSCCON1,NDIV2,BANKED
;NDIV1 = 0
	bcf	OSCCON1,NDIV1,BANKED
;NDIV0 = 0
	bcf	OSCCON1,NDIV0,BANKED
;OSCFRQ = 0b00001000  '64mhz
	movlw	8
	movwf	OSCFRQ,BANKED
;asm showdebug _Complete_the_chip_setup_of_BSR_ADCs_ANSEL_and_other_key_setup_registers_or_register_bits
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
;
;'Turn off all ports
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

INITTFT
	movff	SYSSTRINGA,SysWORDTempA
	movff	SYSSTRINGA_H,SysWORDTempA_H
	movlw	29
	movwf	SysWORDTempB,ACCESS
	movlw	1
	movwf	SysWORDTempB_H,ACCESS
	rcall	SYSCOMPLESSTHAN16
	btfss	SysByteTempX,0,ACCESS
	retlw	0
	movf	SysStringA, W,ACCESS
	addlw	low TABLEINITTFT
	movwf	TBLPTRL,ACCESS
	movlw	high TABLEINITTFT
	addwfc	SysStringA_H, W,ACCESS
	movwf	TBLPTRH,ACCESS
	movlw	upper TABLEINITTFT
	btfsc	STATUS, C,ACCESS
	addlw	1
	movwf	TBLPTRU,ACCESS
	tblrd*
	movf	TABLAT, W,ACCESS
	return
TABLEINITTFT
	db	29,97,114,119,99,119,98,120,103,17,5,19,138,17,6,19,49,17,7,19,138,17,8,19,100,17
	db	9,19,138,17,10,19,100,17,0,19,128,17,1,19,130,17,1,18,130,17,2,19,64,170,170,170
	db	170,17,224,19,41,17,225,19,3,17,226,19,11,17,227,19,3,17,228,19,1,170,170,170
	db	170,17,16,19,4,17,18,19,133,17,19,19,3,17,20,19,127,17,21,19,0,17,26,19,255,17
	db	27,19,2,17,32,19,0,17,33,19,0,17,34,19,0,17,35,19,0,17,36,19,0,17,37,19,4,17,38,19
	db	0,17,39,19,0,17,40,19,0,17,41,19,0,170,170,170,170,17,80,19,0,17,81,19,0,17,82,19
	db	0,17,83,19,0,17,84,19,0,17,85,19,4,17,86,19,0,17,87,19,0,17,88,19,0,17,89,19,0,17
	db	90,19,0,17,91,19,4,17,92,19,0,17,93,19,3,17,94,19,2,17,188,19,0,17,189,19,2,17
	db	190,19,0,17,191,19,0,17,192,19,0,17,193,19,0,17,194,19,0,17,195,19,0,17,198,19
	db	0,17,199,19,4,17,200,19,0,17,201,19,3,17,202,19,0,17,203,19,4,17,183,19,192,17
	db	182,19,1,170,170,170,170,17,182,18,0,17,18,19,64

;********************************************************************************

INITTFT_H
	movff	SYSSTRINGA,SysWORDTempA
	movff	SYSSTRINGA_H,SysWORDTempA_H
	movlw	1
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	rcall	SYSCOMPLESSTHAN16
	btfss	SysByteTempX,0,ACCESS
	retlw	0
	movf	SysStringA, W,ACCESS
	addlw	low TABLEINITTFT_H
	movwf	TBLPTRL,ACCESS
	movlw	high TABLEINITTFT_H
	addwfc	SysStringA_H, W,ACCESS
	movwf	TBLPTRH,ACCESS
	movlw	upper TABLEINITTFT_H
	btfsc	STATUS, C,ACCESS
	addlw	1
	movwf	TBLPTRU,ACCESS
	tblrd*
	movf	TABLAT, W,ACCESS
	return
TABLEINITTFT_H
	db	1

;********************************************************************************

;Source: usart.h (1013)
INITUSART
;Set the default value for USART handler - required when more than one USART
;comport = 1
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

;Overloaded signature: LONG:BYTE:, Source: system.h (4272)
PFMREAD758
;Dim _dummy as byte
;Dim _TFM_ABS_ADDR as Long Alias _dummy, TBLPTRU, TBLPTRH, TBLPTRL
;TBLRD*+
	tblrd*+
;_PFM_DataByte = TABLAT
	movff	TABLAT,_PFM_DATABYTE
	return

;********************************************************************************

;Source: system.h (3103)
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

;Source: system.h (3129)
SYSCOMPEQUAL16
;dim SysWordTempA as word
;dim SysWordTempB as word
;dim SysByteTempX as byte
;clrf SysByteTempX
	clrf	SYSBYTETEMPX,ACCESS
;Test low, exit if false
;movf SysWordTempB, W
	movf	SYSWORDTEMPB, W,ACCESS
;cpfseq SysWordTempA
	cpfseq	SYSWORDTEMPA,ACCESS
;return
	return
;Test high, exit if false
;movf SysWordTempB_H, W
	movf	SYSWORDTEMPB_H, W,ACCESS
;cpfseq SysWordTempA_H
	cpfseq	SYSWORDTEMPA_H,ACCESS
;return
	return
;setf SysByteTempX
	setf	SYSBYTETEMPX,ACCESS
	return

;********************************************************************************

;Source: system.h (3438)
SYSCOMPLESSTHAN16
;dim SysWordTempA as word
;dim SysWordTempB as word
;dim SysByteTempX as byte
;clrf SysByteTempX
	clrf	SYSBYTETEMPX,ACCESS
;Test High, exit if more
;movf SysWordTempA_H,W
	movf	SYSWORDTEMPA_H,W,ACCESS
;subwf SysWordTempB_H,W
	subwf	SYSWORDTEMPB_H,W,ACCESS
;btfss STATUS,C
	btfss	STATUS,C,ACCESS
;return
	return
;Test high, exit true if less
;movf SysWordTempB_H,W
	movf	SYSWORDTEMPB_H,W,ACCESS
;subwf SysWordTempA_H,W
	subwf	SYSWORDTEMPA_H,W,ACCESS
;bnc SCLT16True
	bnc	SCLT16TRUE
;Test Low, exit if more or equal
;movf SysWordTempB,W
	movf	SYSWORDTEMPB,W,ACCESS
;subwf SysWordTempA,W
	subwf	SYSWORDTEMPA,W,ACCESS
;btfsc STATUS,C
	btfsc	STATUS,C,ACCESS
;return
	return
SCLT16TRUE
;comf SysByteTempX,F
	comf	SYSBYTETEMPX,F,ACCESS
	return

;********************************************************************************

;Source: system.h (3496)
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

;Source: system.h (1596)
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


StringTable2
	db	20,67,111,109,112,108,101,116,101,100,32,98,111,111,116,108,111,97,100,101,114


StringTable3
	db	15,67,111,109,112,108,101,116,101,100,32,99,111,108,111,114


;********************************************************************************


 END
