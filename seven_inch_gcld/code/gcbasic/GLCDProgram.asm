;Program compiled by GCBASIC (2024.4.26 (Windows 64 bit) : Build 1386) for Microchip MPASM/MPLAB-X Assembler using FreeBASIC 1.07.1/2024-04-26 CRC248
;Need help? 
;  Please donate to help support the operational costs of the project.  Donate via http://paypal.me/gcbasic
;  
;  See the GCBASIC forums at http://sourceforge.net/projects/gcbasic/forums,
;  Check the documentation and Help at http://gcbasic.sourceforge.net/help/,
;or, email us:
;   w_cholmondeley at users dot sourceforge dot net
;   evanvennn at users dot sourceforge dot net
;********************************************************************************
;   Source file      : D:\GreatCowBASICGits\Help.git\seven_inch_gcld\code\gcbasic\GLCDProgram.gcb
;   Setting file     : C:\GCstudio\gcbasic\use.ini
;   Preserve mode    : 2
;   Assembler        : GCASM
;   Programmer       : C:\GCstudio\gcbasic\..\PICKitPlus\PICKitCommandline.exe
;   Output file      : D:\GreatCowBASICGits\Help.git\seven_inch_gcld\code\gcbasic\GLCDProgram.asm
;   Float Capability : 0
;********************************************************************************

;Set up the assembler options (Chip type, clock source, other bits and pieces)
 LIST p=18F27Q43, r=DEC
#include <P18F27Q43.inc>
 CONFIG CP = OFF, WRTSAF = OFF, WRTD = OFF, WRTB = OFF, WDTE = OFF, XINST = OFF, LVP = OFF, MVECEN = OFF, MCLRE = INTMCLR, FCMEN = ON, CLKOUTEN = OFF, RSTOSC = HFINTOSC_1MHZ, FEXTOSC = OFF

;********************************************************************************

;Set aside memory locations for variables
ABS                              EQU    1294          ; 0x50E
ABS_H                            EQU    1295          ; 0x50F
ADREADPORT                       EQU    1296          ; 0x510
CACHE_LT7686_FILLCOLOUR          EQU    1297          ; 0x511
CACHE_LT7686_FILLCOLOUR_E        EQU    1300          ; 0x514
CACHE_LT7686_FILLCOLOUR_H        EQU    1298          ; 0x512
CACHE_LT7686_FILLCOLOUR_U        EQU    1299          ; 0x513
CACHE_LT7686_LINECOLOUR          EQU    1301          ; 0x515
CACHE_LT7686_LINECOLOUR_E        EQU    1304          ; 0x518
CACHE_LT7686_LINECOLOUR_H        EQU    1302          ; 0x516
CACHE_LT7686_LINECOLOUR_U        EQU    1303          ; 0x517
DELAYTEMP                        EQU    1280          ; 0x500
DELAYTEMP2                       EQU    1281          ; 0x501
GLCDBACKGROUND                   EQU    1305          ; 0x519
GLCDBACKGROUND_E                 EQU    1308          ; 0x51C
GLCDBACKGROUND_H                 EQU    1306          ; 0x51A
GLCDBACKGROUND_U                 EQU    1307          ; 0x51B
GLCDDEVICEHEIGHT                 EQU    1309          ; 0x51D
GLCDDEVICEHEIGHT_H               EQU    1310          ; 0x51E
GLCDDEVICEWIDTH                  EQU    1311          ; 0x51F
GLCDDEVICEWIDTH_H                EQU    1312          ; 0x520
GLCDFNTDEFAULT                   EQU    1313          ; 0x521
GLCDFNTDEFAULTHEIGHT             EQU    1314          ; 0x522
GLCDFNTDEFAULTSIZE               EQU    1315          ; 0x523
GLCDFONTWIDTH                    EQU    1316          ; 0x524
GLCDFOREGROUND                   EQU    1317          ; 0x525
GLCDFOREGROUND_E                 EQU    1320          ; 0x528
GLCDFOREGROUND_H                 EQU    1318          ; 0x526
GLCDFOREGROUND_U                 EQU    1319          ; 0x527
GLCDROTATESTATE                  EQU    1321          ; 0x529
GLCD_YORDINATE                   EQU    1322          ; 0x52A
GLCD_YORDINATE_H                 EQU    1323          ; 0x52B
LT7686_CHECK_INIT                EQU    1324          ; 0x52C
LT7686_CHECK_INIT_COUNTER        EQU    1325          ; 0x52D
LT7686_CHECK_INIT_FAIL           EQU    1326          ; 0x52E
LT7686_DATAREAD                  EQU    1327          ; 0x52F
LT7686_DISPLAY_PWM               EQU    1328          ; 0x530
LT7686_FILLCOLOUR                EQU    1329          ; 0x531
LT7686_FILLCOLOUR_E              EQU    1332          ; 0x534
LT7686_FILLCOLOUR_H              EQU    1330          ; 0x532
LT7686_FILLCOLOUR_U              EQU    1331          ; 0x533
LT7686_INITVERIFYCOUNTER         EQU    1333          ; 0x535
LT7686_INITVERIFYCOUNTER_H       EQU    1334          ; 0x536
LT7686_ITEMCOLOUR                EQU    1335          ; 0x537
LT7686_ITEMCOLOUR_E              EQU    1338          ; 0x53A
LT7686_ITEMCOLOUR_H              EQU    1336          ; 0x538
LT7686_ITEMCOLOUR_U              EQU    1337          ; 0x539
LT7686_LINECOLOUR                EQU    1339          ; 0x53B
LT7686_LINECOLOUR_E              EQU    1342          ; 0x53E
LT7686_LINECOLOUR_H              EQU    1340          ; 0x53C
LT7686_LINECOLOUR_U              EQU    1341          ; 0x53D
LT7686_POINTER                   EQU    1343          ; 0x53F
LT7686_POINTER_H                 EQU    1344          ; 0x540
LT7686_STATUSREAD                EQU    1345          ; 0x541
LT7686_STATUSREADRESULT          EQU    1346          ; 0x542
LT7686_TABLECOLOUR               EQU    1347          ; 0x543
LT7686_TABLECOLOUR_E             EQU    1350          ; 0x546
LT7686_TABLECOLOUR_H             EQU    1348          ; 0x544
LT7686_TABLECOLOUR_U             EQU    1349          ; 0x545
L_CALIBRATE                      EQU    1351          ; 0x547
L_CALIBRATE_H                    EQU    1352          ; 0x548
L_FROMHIGH                       EQU    1353          ; 0x549
L_FROMHIGH_H                     EQU    1354          ; 0x54A
L_FROMLOW                        EQU    1355          ; 0x54B
L_FROMLOW_H                      EQU    1356          ; 0x54C
L_MAP                            EQU    1357          ; 0x54D
L_MAP_H                          EQU    1358          ; 0x54E
L_SYSCALC                        EQU    1359          ; 0x54F
L_SYSCALCF                       EQU    1361          ; 0x551
L_SYSCALCF_E                     EQU    1364          ; 0x554
L_SYSCALCF_H                     EQU    1362          ; 0x552
L_SYSCALCF_U                     EQU    1363          ; 0x553
L_SYSCALC_H                      EQU    1360          ; 0x550
L_TOHIGH                         EQU    1365          ; 0x555
L_TOHIGH_H                       EQU    1366          ; 0x556
L_TOLOW                          EQU    1367          ; 0x557
L_TOLOW_H                        EQU    1368          ; 0x558
POSX                             EQU    1369          ; 0x559
POSX_H                           EQU    1370          ; 0x55A
POSY                             EQU    1371          ; 0x55B
POSY_H                           EQU    1372          ; 0x55C
PRINTX                           EQU    1373          ; 0x55D
PRINTX_H                         EQU    1374          ; 0x55E
PRINTY                           EQU    1375          ; 0x55F
PRINTY_H                         EQU    1376          ; 0x560
RANDOM                           EQU    1377          ; 0x561
RANDOMCOLOR                      EQU    1378          ; 0x562
RANDOMCOLOR_H                    EQU    1379          ; 0x563
RANDOMSEED                       EQU    1380          ; 0x564
RANDOMSEED_H                     EQU    1381          ; 0x565
RANDOMTEMP                       EQU    1382          ; 0x566
RANDOMTEMP_H                     EQU    1383          ; 0x567
RANDOMX                          EQU    1384          ; 0x568
RANDOMX_H                        EQU    1385          ; 0x569
RANDOMY                          EQU    1386          ; 0x56A
RANDOMY_H                        EQU    1387          ; 0x56B
READAD                           EQU    1388          ; 0x56C
SCALE                            EQU    1389          ; 0x56D
SCALE_H                          EQU    1390          ; 0x56E
SPICLOCKMODE                     EQU    1391          ; 0x56F
SPICURRENTMODE                   EQU    1392          ; 0x570
SPIRXDATA                        EQU    1393          ; 0x571
SPITXDATA                        EQU    1394          ; 0x572
SYSBYTETEMPA                     EQU    1285          ; 0x505
SYSBYTETEMPB                     EQU    1289          ; 0x509
SYSBYTETEMPX                     EQU    1280          ; 0x500
SYSCALCTEMPA                     EQU    1285          ; 0x505
SYSCALCTEMPA_H                   EQU    1286          ; 0x506
SYSDIVLOOP                       EQU    1284          ; 0x504
SYSDIVMULTA                      EQU    1287          ; 0x507
SYSDIVMULTA_H                    EQU    1288          ; 0x508
SYSDIVMULTB                      EQU    1291          ; 0x50B
SYSDIVMULTB_H                    EQU    1292          ; 0x50C
SYSDIVMULTX                      EQU    1282          ; 0x502
SYSDIVMULTX_H                    EQU    1283          ; 0x503
SYSINTEGERTEMPA                  EQU    1285          ; 0x505
SYSINTEGERTEMPA_H                EQU    1286          ; 0x506
SYSINTEGERTEMPB                  EQU    1289          ; 0x509
SYSINTEGERTEMPB_H                EQU    1290          ; 0x50A
SYSINTEGERTEMPX                  EQU    1280          ; 0x500
SYSINTEGERTEMPX_H                EQU    1281          ; 0x501
SYSLONGDIVMULTA                  EQU    1395          ; 0x573
SYSLONGDIVMULTA_E                EQU    1398          ; 0x576
SYSLONGDIVMULTA_H                EQU    1396          ; 0x574
SYSLONGDIVMULTA_U                EQU    1397          ; 0x575
SYSLONGDIVMULTB                  EQU    1399          ; 0x577
SYSLONGDIVMULTB_E                EQU    1402          ; 0x57A
SYSLONGDIVMULTB_H                EQU    1400          ; 0x578
SYSLONGDIVMULTB_U                EQU    1401          ; 0x579
SYSLONGDIVMULTX                  EQU    1403          ; 0x57B
SYSLONGDIVMULTX_E                EQU    1406          ; 0x57E
SYSLONGDIVMULTX_H                EQU    1404          ; 0x57C
SYSLONGDIVMULTX_U                EQU    1405          ; 0x57D
SYSLONGTEMPA                     EQU    1285          ; 0x505
SYSLONGTEMPA_E                   EQU    1288          ; 0x508
SYSLONGTEMPA_H                   EQU    1286          ; 0x506
SYSLONGTEMPA_U                   EQU    1287          ; 0x507
SYSLONGTEMPB                     EQU    1289          ; 0x509
SYSLONGTEMPB_E                   EQU    1292          ; 0x50C
SYSLONGTEMPB_H                   EQU    1290          ; 0x50A
SYSLONGTEMPB_U                   EQU    1291          ; 0x50B
SYSLONGTEMPX                     EQU    1280          ; 0x500
SYSLONGTEMPX_E                   EQU    1283          ; 0x503
SYSLONGTEMPX_H                   EQU    1281          ; 0x501
SYSLONGTEMPX_U                   EQU    1282          ; 0x502
SYSREPEATTEMP1                   EQU    1407          ; 0x57F
SYSREPEATTEMP2                   EQU    1408          ; 0x580
SYSREPEATTEMP3                   EQU    1409          ; 0x581
SYSSIGNBYTE                      EQU    1293          ; 0x50D
SYSSTRINGA                       EQU    1287          ; 0x507
SYSSTRINGA_H                     EQU    1288          ; 0x508
SYSTEMP1                         EQU    1410          ; 0x582
SYSTEMP1_E                       EQU    1413          ; 0x585
SYSTEMP1_H                       EQU    1411          ; 0x583
SYSTEMP1_U                       EQU    1412          ; 0x584
SYSTEMP2                         EQU    1414          ; 0x586
SYSTEMP2_H                       EQU    1415          ; 0x587
SYSWAITTEMP10US                  EQU    1285          ; 0x505
SYSWAITTEMPMS                    EQU    1282          ; 0x502
SYSWAITTEMPMS_H                  EQU    1283          ; 0x503
SYSWAITTEMPS                     EQU    1284          ; 0x504
SYSWAITTEMPUS                    EQU    1285          ; 0x505
SYSWAITTEMPUS_H                  EQU    1286          ; 0x506
SYSWORDTEMPA                     EQU    1285          ; 0x505
SYSWORDTEMPA_H                   EQU    1286          ; 0x506
SYSWORDTEMPB                     EQU    1289          ; 0x509
SYSWORDTEMPB_H                   EQU    1290          ; 0x50A
SYSWORDTEMPX                     EQU    1280          ; 0x500
SYSWORDTEMPX_H                   EQU    1281          ; 0x501
TEMP_LT7686                      EQU    1416          ; 0x588
TEMP_LT7686_H                    EQU    1417          ; 0x589
WTEMP                            EQU    1418          ; 0x58A
WTEMP_H                          EQU    1419          ; 0x58B
XOFFSET1                         EQU    1420          ; 0x58C
XOFFSET1_H                       EQU    1421          ; 0x58D
XOFFSET2                         EQU    1422          ; 0x58E
XOFFSET2_H                       EQU    1423          ; 0x58F
XTEMP                            EQU    1424          ; 0x590
XTEMP_H                          EQU    1425          ; 0x591
YOFFSET1                         EQU    1426          ; 0x592
YOFFSET1_H                       EQU    1427          ; 0x593
YOFFSET2                         EQU    1428          ; 0x594
YOFFSET2_H                       EQU    1429          ; 0x595
YTEMP                            EQU    1430          ; 0x596
YTEMP_H                          EQU    1431          ; 0x597
_TEMP_LT7686                     EQU    1432          ; 0x598
_WOFFSET                         EQU    1433          ; 0x599
_WOFFSET_H                       EQU    1434          ; 0x59A
_XOFFSET1                        EQU    1435          ; 0x59B
_XOFFSET1_H                      EQU    1436          ; 0x59C
_XOFFSET2                        EQU    1437          ; 0x59D
_XOFFSET2_H                      EQU    1438          ; 0x59E
_YOFFSET1                        EQU    1439          ; 0x59F
_YOFFSET1_H                      EQU    1440          ; 0x5A0
_YOFFSET2                        EQU    1441          ; 0x5A1
_YOFFSET2_H                      EQU    1442          ; 0x5A2
__HOFFSET                        EQU    1443          ; 0x5A3
__HOFFSET_H                      EQU    1444          ; 0x5A4
__LT7686_FBUFFER                 EQU    1445          ; 0x5A5
__LT7686_OUTBUFFER               EQU    1446          ; 0x5A6
__MODE                           EQU    1447          ; 0x5A7
__OUTBYTE                        EQU    1448          ; 0x5A8
__SET_LT7686_BACKGROUNDCOLOUR    EQU    1449          ; 0x5A9
__SET_LT7686_BACKGROUNDCOLOUR_E  EQU    1452          ; 0x5AC
__SET_LT7686_BACKGROUNDCOLOUR_H  EQU    1450          ; 0x5AA
__SET_LT7686_BACKGROUNDCOLOUR_U  EQU    1451          ; 0x5AB
__SET_LT7686_LINECOLOUR          EQU    1453          ; 0x5AD
__SET_LT7686_LINECOLOUR_E        EQU    1456          ; 0x5B0
__SET_LT7686_LINECOLOUR_H        EQU    1454          ; 0x5AE
__SET_LT7686_LINECOLOUR_U        EQU    1455          ; 0x5AF
__TABLECOLUMNS                   EQU    1457          ; 0x5B1
__TABLECOLUMNS_H                 EQU    1458          ; 0x5B2
__TABLEROWS                      EQU    1459          ; 0x5B3
__TABLEROWS_H                    EQU    1460          ; 0x5B4
__TEMP_LT7686                    EQU    1461          ; 0x5B5
__TEMP_LT7686_H                  EQU    1462          ; 0x5B6
__WIDTH1                         EQU    1463          ; 0x5B7
__WIDTH1_H                       EQU    1464          ; 0x5B8
__WIDTH2                         EQU    1465          ; 0x5B9
__WIDTH2_H                       EQU    1466          ; 0x5BA
__WOFFSET                        EQU    1467          ; 0x5BB
__WOFFSET_H                      EQU    1468          ; 0x5BC
__X2                             EQU    1469          ; 0x5BD
__X2_H                           EQU    1470          ; 0x5BE
__XOFFSET1                       EQU    1471          ; 0x5BF
__XOFFSET1_H                     EQU    1472          ; 0x5C0
__Y2                             EQU    1473          ; 0x5C1
__Y2_H                           EQU    1474          ; 0x5C2
__YOFFSET1                       EQU    1475          ; 0x5C3
__YOFFSET1_H                     EQU    1476          ; 0x5C4

;********************************************************************************

;Alias variables
LASTLT7686_CMD EQU 1312
LT7686_INITDATA EQU 1309
LT7686_INITLENGTH EQU 1317
LT7686_INITLENGTH_H EQU 1318
OLDLT7686_INITDATA EQU 1310
SYSREADADBYTE EQU 1388
SYSSCALEWORD EQU 1389
SYSSCALEWORD_H EQU 1390

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
	call	INITSYS
	rcall	INITPPS
	call	INITRANDOM
	rcall	INITGLCD_LT7686

;Start_of_the_main_program
;Prototype GLCD library
;Development configuration options
;Hardware setup
;Setup USART used fro debugging
;PIC PPS
;Add this code segment to your GCBASIC source program
;Pin mappings for LCD SPI
;Comment out the next line... but you MUST disable the PPS!!! This is done via Conditional statement in this program
;end of hardware setup
;Inserts
;#insert "009_GLCDProgram.gcb"    // Tests lots of primitives
;#insert "010_GLCDProgram.gcb"    // Show GCBASIC logo
;#insert "011_GLCDProgram.gcb"    // Show GCBASIC test screen
;#insert "012_GLCDProgram.gcb"    // Show Framed primitives
;#insert "014_GLCDProgram.gcb"    // Shows all the colors and PWM control on ADC0
;#insert "015_GLCDProgram.gcb"    // Shows ADC values on a table
;#insert "016_GLCDProgram.gcb"    // Rotate.. or, lack of ROTATE!!!
;#insert "017_GLCDProgram.gcb"    // Shows super computer
;
;
;Super Computer display
;
;Using the drawing of a horizontal table window at (20, 20) position. The sub-table size is 80*40, table
;number of row is 9, table number of column is 11, the frame color is red, foreground color of
;Item table is green, foreground color of content table is white, inner frame width is 1, outer
;frame width is 3.
;GLCDMakeTable (XSTARTPOS, YSTARTPOS, CELLW, CELLH, NUMOFCOLS, NUMOFROWS, 1, 3, 3, TFT_RED, TFT_GREEN, TFT_WHITE)
;
;These control the accent of the table
;Set PWM for LCD
;LT7686_PWM_DUTY ( LT7686_PWM_PRESCALER_MAX )
	movlw	200
	movwf	LT7686_DISPLAY_PWM,ACCESS
	call	LT7686_PWM_DUTY
;Dim the variables
;Dim logadc, posx, posy, printx, printy, randomx, randomy, randomcolor as word
;Make the TABLE
;GLCDMakeTable ( XSTARTPOS, YSTARTPOS, CELLW, CELLH, NUMOFCOLS, NUMOFROWS, INNERFRAME, OUTERFRAME,  TOPROWACCENT+LEFTCOLUMNACCENT, TFT_RED, TFT_BLUE, TFT_WHITE)
	movlw	3
	banksel	__XOFFSET1
	movwf	__XOFFSET1,BANKED
	clrf	__XOFFSET1_H,BANKED
	clrf	__YOFFSET1,BANKED
	clrf	__YOFFSET1_H,BANKED
	movlw	15
	movwf	__WOFFSET,BANKED
	clrf	__WOFFSET_H,BANKED
	movlw	15
	movwf	__HOFFSET,BANKED
	clrf	__HOFFSET_H,BANKED
	movlw	3
	subwf	GLCDDEVICEWIDTH,W,ACCESS
	movwf	SysTemp1,BANKED
	movlw	0
	subwfb	GLCDDEVICEWIDTH_H,W,ACCESS
	movwf	SysTemp1_H,BANKED
	movff	SysTemp1,SysWORDTempA
	movff	SysTemp1_H,SysWORDTempA_H
	movlw	15
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	banksel	0
	call	SYSDIVSUB16
	movff	SysWORDTempA,__TABLECOLUMNS
	movff	SysWORDTempA_H,__TABLECOLUMNS_H
	movlw	0
	subwf	GLCDDEVICEHEIGHT,W,ACCESS
	banksel	SYSTEMP1
	movwf	SysTemp1,BANKED
	movlw	0
	subwfb	GLCDDEVICEHEIGHT_H,W,ACCESS
	movwf	SysTemp1_H,BANKED
	movff	SysTemp1,SysWORDTempA
	movff	SysTemp1_H,SysWORDTempA_H
	movlw	15
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	banksel	0
	call	SYSDIVSUB16
	movff	SysWORDTempA,__TABLEROWS
	movff	SysWORDTempA_H,__TABLEROWS_H
	movlw	1
	banksel	__WIDTH1
	movwf	__WIDTH1,BANKED
	clrf	__WIDTH1_H,BANKED
	movlw	3
	movwf	__WIDTH2,BANKED
	clrf	__WIDTH2_H,BANKED
	movlw	3
	movwf	__MODE,BANKED
	clrf	LT7686_TABLECOLOUR,ACCESS
	movlw	248
	movwf	LT7686_TABLECOLOUR_H,ACCESS
	clrf	LT7686_TABLECOLOUR_U,ACCESS
	clrf	LT7686_TABLECOLOUR_E,ACCESS
	movlw	31
	movwf	LT7686_ITEMCOLOUR,ACCESS
	clrf	LT7686_ITEMCOLOUR_H,ACCESS
	clrf	LT7686_ITEMCOLOUR_U,ACCESS
	clrf	LT7686_ITEMCOLOUR_E,ACCESS
	setf	LT7686_FILLCOLOUR,ACCESS
	setf	LT7686_FILLCOLOUR_H,ACCESS
	clrf	LT7686_FILLCOLOUR_U,ACCESS
	clrf	LT7686_FILLCOLOUR_E,ACCESS
	banksel	0
	call	MAKETABLE_LT7686
;Set the BackgroundColor
;GLCDSetBackgroundColor ( TFT_WHITE )
	banksel	__SET_LT7686_BACKGROUNDCOLOUR
	setf	__SET_LT7686_BACKGROUNDCOLOUR,BANKED
	setf	__SET_LT7686_BACKGROUNDCOLOUR_H,BANKED
	clrf	__SET_LT7686_BACKGROUNDCOLOUR_U,BANKED
	clrf	__SET_LT7686_BACKGROUNDCOLOUR_E,BANKED
	banksel	0
	call	LT7686_SETBACKGROUNDCOLOR584
;LT7686_PWM_DUTY ( 100 )
	movlw	100
	movwf	LT7686_DISPLAY_PWM,ACCESS
	call	LT7686_PWM_DUTY
;wait 2 s
	movlw	2
	movwf	SysWaitTempS,ACCESS
	rcall	Delay_S
;Randomize READAD( AN0 )
	clrf	ADREADPORT,ACCESS
	call	FN_READAD74
	movff	SYSREADADBYTE,RANDOMTEMP
	banksel	RANDOMTEMP_H
	clrf	RANDOMTEMP_H,BANKED
	banksel	0
	call	RANDOMIZE
;Do
SysDoLoop_S1
;Generate some random numbers to select color, and which table cell
;randomcolor = Random
	call	FN_RANDOM
	movff	RANDOM,RANDOMCOLOR
	banksel	RANDOMCOLOR_H
	clrf	RANDOMCOLOR_H,BANKED
;Multiply by 256 to get more colors - this is faster!
;Set C Off
	bcf	STATUS,C,ACCESS
;Repeat 8
	movlw	8
	movwf	SysRepeatTemp1,BANKED
SysRepeatLoop1
;rotate randomcolor left
	rlcf	RANDOMCOLOR,F,BANKED
	rlcf	RANDOMCOLOR_H,F,BANKED
;End Repeat
	decfsz	SysRepeatTemp1,F,BANKED
	bra	SysRepeatLoop1
SysRepeatLoopEnd1
;randomx = Scale( Random, 0, 255, 1, NUMOFCOLS -1 )
	banksel	0
	call	FN_RANDOM
	movff	RANDOM,L_MAP
	clrf	L_MAP_H,ACCESS
	clrf	L_FROMLOW,ACCESS
	clrf	L_FROMLOW_H,ACCESS
	setf	L_FROMHIGH,ACCESS
	clrf	L_FROMHIGH_H,ACCESS
	movlw	1
	movwf	L_TOLOW,ACCESS
	clrf	L_TOLOW_H,ACCESS
	movlw	3
	subwf	GLCDDEVICEWIDTH,W,ACCESS
	banksel	SYSTEMP1
	movwf	SysTemp1,BANKED
	movlw	0
	subwfb	GLCDDEVICEWIDTH_H,W,ACCESS
	movwf	SysTemp1_H,BANKED
	movff	SysTemp1,SysWORDTempA
	movff	SysTemp1_H,SysWORDTempA_H
	movlw	15
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	banksel	0
	call	SYSDIVSUB16
	movlw	1
	subwf	SysWORDTempA,W,ACCESS
	movwf	L_TOHIGH,ACCESS
	movlw	0
	subwfb	SysWORDTempA_H,W,ACCESS
	movwf	L_TOHIGH_H,ACCESS
	clrf	L_CALIBRATE,ACCESS
	clrf	L_CALIBRATE_H,ACCESS
	call	FN_SCALE145
	movff	SYSSCALEWORD,RANDOMX
	movff	SYSSCALEWORD_H,RANDOMX_H
;randomy = Scale( Random, 0, 255, 1, NUMOFROWS -1 )
	call	FN_RANDOM
	movff	RANDOM,L_MAP
	clrf	L_MAP_H,ACCESS
	clrf	L_FROMLOW,ACCESS
	clrf	L_FROMLOW_H,ACCESS
	setf	L_FROMHIGH,ACCESS
	clrf	L_FROMHIGH_H,ACCESS
	movlw	1
	movwf	L_TOLOW,ACCESS
	clrf	L_TOLOW_H,ACCESS
	movlw	0
	subwf	GLCDDEVICEHEIGHT,W,ACCESS
	banksel	SYSTEMP1
	movwf	SysTemp1,BANKED
	movlw	0
	subwfb	GLCDDEVICEHEIGHT_H,W,ACCESS
	movwf	SysTemp1_H,BANKED
	movff	SysTemp1,SysWORDTempA
	movff	SysTemp1_H,SysWORDTempA_H
	movlw	15
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	banksel	0
	call	SYSDIVSUB16
	movlw	1
	subwf	SysWORDTempA,W,ACCESS
	movwf	L_TOHIGH,ACCESS
	movlw	0
	subwfb	SysWORDTempA_H,W,ACCESS
	movwf	L_TOHIGH_H,ACCESS
	clrf	L_CALIBRATE,ACCESS
	clrf	L_CALIBRATE_H,ACCESS
	call	FN_SCALE145
	movff	SYSSCALEWORD,RANDOMY
	movff	SYSSCALEWORD_H,RANDOMY_H
;Convert cell to XY position
;posx = randomx * CELLW
	movff	RANDOMX,SysWORDTempA
	movff	RANDOMX_H,SysWORDTempA_H
	movlw	15
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSMULTSUB16
	movff	SysWORDTempX,POSX
	movff	SysWORDTempX_H,POSX_H
;posy = randomy * CELLH
	movff	RANDOMY,SysWORDTempA
	movff	RANDOMY_H,SysWORDTempA_H
	movlw	15
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSMULTSUB16
	movff	SysWORDTempX,POSY
	movff	SysWORDTempX_H,POSY_H
;Calculate the XY position on the GLCD
;printx = posx + XSTARTPOS + 3
	movlw	3
	addwf	POSX,W,ACCESS
	banksel	SYSTEMP1
	movwf	SysTemp1,BANKED
	movlw	0
	addwfc	POSX_H,W,ACCESS
	movwf	SysTemp1_H,BANKED
	movlw	3
	addwf	SysTemp1,W,BANKED
	movwf	PRINTX,ACCESS
	movlw	0
	addwfc	SysTemp1_H,W,BANKED
	movwf	PRINTX_H,ACCESS
;printy = posy + YSTARTPOS + 3
	movlw	0
	addwf	POSY,W,ACCESS
	movwf	SysTemp1,BANKED
	movlw	0
	addwfc	POSY_H,W,ACCESS
	movwf	SysTemp1_H,BANKED
	movlw	3
	addwf	SysTemp1,W,BANKED
	movwf	PRINTY,ACCESS
	movlw	0
	addwfc	SysTemp1_H,W,BANKED
	movwf	PRINTY_H,BANKED
;if randomcolor = 0 then
	movff	RANDOMCOLOR,SysWORDTempA
	movff	RANDOMCOLOR_H,SysWORDTempA_H
	clrf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	banksel	0
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF1
;randomcolor = TFT_WHITE
	banksel	RANDOMCOLOR
	setf	RANDOMCOLOR,BANKED
	setf	RANDOMCOLOR_H,BANKED
;end if
ENDIF1
;FilledBox ( posx + XSTARTPOS + 2, posy + YSTARTPOS + 2, posx + XSTARTPOS + CELLW - 2 , posy + YSTARTPOS + CELLH - 2 , randomcolor )
	movlw	3
	addwf	POSX,W,ACCESS
	banksel	SYSTEMP1
	movwf	SysTemp1,BANKED
	movlw	0
	addwfc	POSX_H,W,ACCESS
	movwf	SysTemp1_H,BANKED
	movlw	2
	addwf	SysTemp1,W,BANKED
	movwf	XOFFSET1,BANKED
	movlw	0
	addwfc	SysTemp1_H,W,BANKED
	movwf	XOFFSET1_H,BANKED
	movlw	0
	addwf	POSY,W,ACCESS
	movwf	SysTemp1,BANKED
	movlw	0
	addwfc	POSY_H,W,ACCESS
	movwf	SysTemp1_H,BANKED
	movlw	2
	addwf	SysTemp1,W,BANKED
	movwf	YOFFSET1,BANKED
	movlw	0
	addwfc	SysTemp1_H,W,BANKED
	movwf	YOFFSET1_H,BANKED
	movlw	3
	addwf	POSX,W,ACCESS
	movwf	SysTemp1,BANKED
	movlw	0
	addwfc	POSX_H,W,ACCESS
	movwf	SysTemp1_H,BANKED
	movlw	15
	addwf	SysTemp1,W,BANKED
	movwf	SysTemp2,BANKED
	movlw	0
	addwfc	SysTemp1_H,W,BANKED
	movwf	SysTemp2_H,BANKED
	movlw	2
	subwf	SysTemp2,W,BANKED
	movwf	XOFFSET2,BANKED
	movlw	0
	subwfb	SysTemp2_H,W,BANKED
	movwf	XOFFSET2_H,BANKED
	movlw	0
	addwf	POSY,W,ACCESS
	movwf	SysTemp1,BANKED
	movlw	0
	addwfc	POSY_H,W,ACCESS
	movwf	SysTemp1_H,BANKED
	movlw	15
	addwf	SysTemp1,W,BANKED
	movwf	SysTemp2,BANKED
	movlw	0
	addwfc	SysTemp1_H,W,BANKED
	movwf	SysTemp2_H,BANKED
	movlw	2
	subwf	SysTemp2,W,BANKED
	movwf	YOFFSET2,BANKED
	movlw	0
	subwfb	SysTemp2_H,W,BANKED
	movwf	YOFFSET2_H,BANKED
	movff	RANDOMCOLOR,LT7686_LINECOLOUR
	movff	RANDOMCOLOR_H,LT7686_LINECOLOUR_H
	clrf	LT7686_LINECOLOUR_U,ACCESS
	clrf	LT7686_LINECOLOUR_E,ACCESS
	banksel	0
	rcall	FILLEDBOX_LT7686
;FramedFilledbox ( posx + XSTARTPOS + 2, posy + YSTARTPOS + 2, posx + XSTARTPOS + CELLW - 2 , posy + YSTARTPOS + CELLH - 2 , 2, TFT_BLACK, randomcolor )
;Loop
	bra	SysDoLoop_S1
SysDoLoop_E1
;#insert "018_GLCDProgram.gcb"    // Shows color strips.
;#insert "019_GLCDProgram.gcb"    // Shows Elite Galaxy
;#insert "020_GLCDProgram.gcb"      //Meter for Steve
;#include <trig2places.h>
BASPROGRAMEND
	sleep
	bra	BASPROGRAMEND

;********************************************************************************

;Source: stdbasic.h (294)
FN_ABS
;If SysCalcTempA.15 Then
	btfss	SYSCALCTEMPA_H,7,ACCESS
	bra	ELSE24_1
;Abs = -SysCalcTempA
	comf	SYSCALCTEMPA,W,ACCESS
	movwf	ABS,ACCESS
	comf	SYSCALCTEMPA_H,W,ACCESS
	movwf	ABS_H,ACCESS
	incf	ABS,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	ABS_H,F,ACCESS
;Else
	bra	ENDIF24
ELSE24_1
;Abs = SysCalcTempA
	movff	SYSCALCTEMPA,ABS
	movff	SYSCALCTEMPA_H,ABS_H
;End If
ENDIF24
	return

;********************************************************************************

Delay_10US
D10US_START
	movlw	52
	movwf	DELAYTEMP,ACCESS
DelayUS0
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS0
	decfsz	SysWaitTemp10US, F,ACCESS
	bra	D10US_START
	return

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

;Source: hwspi.h (709)
FASTHWSPITRANSFER
;Master mode only
;One byte transfer count
;SPI1TCNTL = 1
	movlw	1
	movwf	SPI1TCNTL,BANKED
;SPI1TXB = SPITxData
	movff	SPITXDATA,SPI1TXB
;wait while SPI1RXIF = SPI_RX_IN_PROGRESS
SysWaitLoop3
	btfss	PIR3,SPI1RXIF,ACCESS
	bra	SysWaitLoop3
;SPIRxData = SPI1RXB
	movff	SPI1RXB,SPIRXDATA
	return

;********************************************************************************

;Source: GLCD_LT7686.H (417)
FILLEDBOX_LT7686
;LT7686_CreateBox
;Macro Source: GLCD_LT7686.H (448)
;LT7686_WriteCMD(0x68)
	movlw	104
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset1)
	movff	XOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x69)
	movlw	105
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset1_H)
	movff	XOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x6A)
	movlw	106
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset1)
	movff	YOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x6B)
	movlw	107
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset1_H)
	movff	YOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x6C)
	movlw	108
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset2)
	movff	XOFFSET2,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x6D)
	movlw	109
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset2_H)
	movff	XOFFSET2_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x6E)
	movlw	110
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset2)
	movff	YOFFSET2,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x6F)
	movlw	111
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset2_H)
	movff	YOFFSET2_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_SendColor
;Macro Source: GLCD_LT7686.H (1539)
;dim __Set_LT7686_LineColour as Long
;__Set_LT7686_LineColour = LT7686_LineColour
	movff	LT7686_LINECOLOUR,__SET_LT7686_LINECOLOUR
	movff	LT7686_LINECOLOUR_H,__SET_LT7686_LINECOLOUR_H
	movff	LT7686_LINECOLOUR_U,__SET_LT7686_LINECOLOUR_U
	movff	LT7686_LINECOLOUR_E,__SET_LT7686_LINECOLOUR_E
;Supports RGB format only
;red component
;LT7686_WriteCMD(LT7686_REG_FGCR)
	movlw	210
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData( __Set_LT7686_LineColour_H  )
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
;Set C off
	bcf	STATUS,C,ACCESS
;Rotate __Set_LT7686_LineColour Left
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
;Rotate __Set_LT7686_LineColour Left
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
;Rotate __Set_LT7686_LineColour Left
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
;blue component
;LT7686_WriteCMD(LT7686_REG_FGCB)
	movlw	212
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData( __Set_LT7686_LineColour )
	movff	__SET_LT7686_LINECOLOUR,__OUTBYTE
	call	LT7686_WRITEDATA
;Set C off
	bcf	STATUS,C,ACCESS
;Rotate __Set_LT7686_LineColour Left
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
;Rotate __Set_LT7686_LineColour Left
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
;green component
;LT7686_WriteCMD(LT7686_REG_FGCG)
	movlw	211
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData( __Set_LT7686_LineColour_H )
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD( LT7686_REG_DCR1 )
	movlw	118
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(0xE0)
	movlw	224
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	bra	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

;Source: GLCD_LT7686.H (433)
FRAMEDFILLEDBOX_LT7686
;Dim cache_LT7686_LineColour, cache_LT7686_FillColour as Long
;cache_LT7686_LineColour = LT7686_LineColour
	movff	LT7686_LINECOLOUR,CACHE_LT7686_LINECOLOUR
	movff	LT7686_LINECOLOUR_H,CACHE_LT7686_LINECOLOUR_H
	movff	LT7686_LINECOLOUR_U,CACHE_LT7686_LINECOLOUR_U
	movff	LT7686_LINECOLOUR_E,CACHE_LT7686_LINECOLOUR_E
;cache_LT7686_FillColour = LT7686_FillColour
	movff	LT7686_FILLCOLOUR,CACHE_LT7686_FILLCOLOUR
	movff	LT7686_FILLCOLOUR_H,CACHE_LT7686_FILLCOLOUR_H
	movff	LT7686_FILLCOLOUR_U,CACHE_LT7686_FILLCOLOUR_U
	movff	LT7686_FILLCOLOUR_E,CACHE_LT7686_FILLCOLOUR_E
;FilledBox ( _xoffset1, _yoffset1, _xoffset2, _yoffset2, cache_LT7686_LineColour )
	movff	_XOFFSET1,XOFFSET1
	movff	_XOFFSET1_H,XOFFSET1_H
	movff	_YOFFSET1,YOFFSET1
	movff	_YOFFSET1_H,YOFFSET1_H
	movff	_XOFFSET2,XOFFSET2
	movff	_XOFFSET2_H,XOFFSET2_H
	movff	_YOFFSET2,YOFFSET2
	movff	_YOFFSET2_H,YOFFSET2_H
	movff	CACHE_LT7686_LINECOLOUR,LT7686_LINECOLOUR
	movff	CACHE_LT7686_LINECOLOUR_H,LT7686_LINECOLOUR_H
	movff	CACHE_LT7686_LINECOLOUR_U,LT7686_LINECOLOUR_U
	movff	CACHE_LT7686_LINECOLOUR_E,LT7686_LINECOLOUR_E
	rcall	FILLEDBOX_LT7686
;FilledBox ( _xoffset1 + _woffset, _yoffset1 + _woffset, _xoffset2 - _woffset, _yoffset2 - _woffset, cache_LT7686_FillColour )
	banksel	_WOFFSET
	movf	_WOFFSET,W,BANKED
	addwf	_XOFFSET1,W,BANKED
	movwf	XOFFSET1,BANKED
	movf	_WOFFSET_H,W,BANKED
	addwfc	_XOFFSET1_H,W,BANKED
	movwf	XOFFSET1_H,BANKED
	movf	_WOFFSET,W,BANKED
	addwf	_YOFFSET1,W,BANKED
	movwf	YOFFSET1,BANKED
	movf	_WOFFSET_H,W,BANKED
	addwfc	_YOFFSET1_H,W,BANKED
	movwf	YOFFSET1_H,BANKED
	movf	_WOFFSET,W,BANKED
	subwf	_XOFFSET2,W,BANKED
	movwf	XOFFSET2,BANKED
	movf	_WOFFSET_H,W,BANKED
	subwfb	_XOFFSET2_H,W,BANKED
	movwf	XOFFSET2_H,BANKED
	movf	_WOFFSET,W,BANKED
	subwf	_YOFFSET2,W,BANKED
	movwf	YOFFSET2,BANKED
	movf	_WOFFSET_H,W,BANKED
	subwfb	_YOFFSET2_H,W,BANKED
	movwf	YOFFSET2_H,BANKED
	movff	CACHE_LT7686_FILLCOLOUR,LT7686_LINECOLOUR
	movff	CACHE_LT7686_FILLCOLOUR_H,LT7686_LINECOLOUR_H
	movff	CACHE_LT7686_FILLCOLOUR_U,LT7686_LINECOLOUR_U
	movff	CACHE_LT7686_FILLCOLOUR_E,LT7686_LINECOLOUR_E
	banksel	0
	rcall	FILLEDBOX_LT7686
;Restore colors
;LT7686_LineColour = cache_LT7686_LineColour
	movff	CACHE_LT7686_LINECOLOUR,LT7686_LINECOLOUR
	movff	CACHE_LT7686_LINECOLOUR_H,LT7686_LINECOLOUR_H
	movff	CACHE_LT7686_LINECOLOUR_U,LT7686_LINECOLOUR_U
	movff	CACHE_LT7686_LINECOLOUR_E,LT7686_LINECOLOUR_E
;LT7686_FillColour = cache_LT7686_FillColour
	movff	CACHE_LT7686_FILLCOLOUR,LT7686_FILLCOLOUR
	movff	CACHE_LT7686_FILLCOLOUR_H,LT7686_FILLCOLOUR_H
	movff	CACHE_LT7686_FILLCOLOUR_U,LT7686_FILLCOLOUR_U
	movff	CACHE_LT7686_FILLCOLOUR_E,LT7686_FILLCOLOUR_E
	return

;********************************************************************************

;Source: GLCD_LT7686.H (312)
GLCDCLS_LT7686
;Dim LT7686_LineColour as Long
;initialise global variable. Required variable for Circle In all DEVICE DRIVERS- DO NOT DELETE
;GLCD_yordinate = 0
	clrf	GLCD_YORDINATE,ACCESS
	clrf	GLCD_YORDINATE_H,ACCESS
;LT7686_Check_Busy_Draw
	rcall	LT7686_CHECK_BUSY_DRAW
;LT7686_WriteCMD(0x68)
	movlw	104
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(0x00)
	banksel	__OUTBYTE
	clrf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x69)
	movlw	105
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(0x00)
	banksel	__OUTBYTE
	clrf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x6A)
	movlw	106
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(0x00)
	banksel	__OUTBYTE
	clrf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x6B)
	movlw	107
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(0x00)
	banksel	__OUTBYTE
	clrf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x6C)
	movlw	108
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(GLCDDeviceWidth)
	movff	GLCDDEVICEWIDTH,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x6D)
	movlw	109
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(GLCDDeviceWidth_H)
	movff	GLCDDEVICEWIDTH_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x6E)
	movlw	110
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(GLCDDeviceHeight)
	movff	GLCDDEVICEHEIGHT,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x6F)
	movlw	111
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(GLCDDeviceHeight_H)
	movff	GLCDDEVICEHEIGHT_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_LineColour = GLCDbackground
	movff	GLCDBACKGROUND,LT7686_LINECOLOUR
	movff	GLCDBACKGROUND_H,LT7686_LINECOLOUR_H
	movff	GLCDBACKGROUND_U,LT7686_LINECOLOUR_U
	movff	GLCDBACKGROUND_E,LT7686_LINECOLOUR_E
;LT7686_SendColor
;Macro Source: GLCD_LT7686.H (1539)
;dim __Set_LT7686_LineColour as Long
;__Set_LT7686_LineColour = LT7686_LineColour
	movff	LT7686_LINECOLOUR,__SET_LT7686_LINECOLOUR
	movff	LT7686_LINECOLOUR_H,__SET_LT7686_LINECOLOUR_H
	movff	LT7686_LINECOLOUR_U,__SET_LT7686_LINECOLOUR_U
	movff	LT7686_LINECOLOUR_E,__SET_LT7686_LINECOLOUR_E
;Supports RGB format only
;red component
;LT7686_WriteCMD(LT7686_REG_FGCR)
	movlw	210
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData( __Set_LT7686_LineColour_H  )
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
;Set C off
	bcf	STATUS,C,ACCESS
;Rotate __Set_LT7686_LineColour Left
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
;Rotate __Set_LT7686_LineColour Left
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
;Rotate __Set_LT7686_LineColour Left
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
;blue component
;LT7686_WriteCMD(LT7686_REG_FGCB)
	movlw	212
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData( __Set_LT7686_LineColour )
	movff	__SET_LT7686_LINECOLOUR,__OUTBYTE
	call	LT7686_WRITEDATA
;Set C off
	bcf	STATUS,C,ACCESS
;Rotate __Set_LT7686_LineColour Left
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
;Rotate __Set_LT7686_LineColour Left
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
;green component
;LT7686_WriteCMD(LT7686_REG_FGCG)
	movlw	211
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData( __Set_LT7686_LineColour_H )
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	rcall	LT7686_CHECK_BUSY_DRAW
;LT7686_WriteCMD( LT7686_REG_DCR1 )
	movlw	118
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(0xE0)
	movlw	224
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	bra	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

;Source: GLCD_LT7686.H (1636)
GLCDROTATE_LT7686
;
;The internal text does NOT support rotate 180 degree. (Also, no existed API supports such function)
;It only supports 90 degree counterclockwise rotation. Refer to the LT768x datasheet, Section 13.3 for more information.
;Please also note that internal text position will be affected by the direction setting of VDIR (REG[12h] bit3).
;
;dim _temp_LT7686, __temp_LT7686 as byte
;LT7686_WriteCMD(LT7686_REG_MACR)
	movlw	2
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;__temp_LT7686 = LT7686_DataRead()
	rcall	FN_LT7686_DATAREAD
	movff	LT7686_DATAREAD,__TEMP_LT7686
;LT7686_WriteCMD(LT7686_REG_DPCR)
	movlw	18
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;_temp_LT7686 = LT7686_DataRead()
	rcall	FN_LT7686_DATAREAD
	movff	LT7686_DATAREAD,_TEMP_LT7686
;select case GLCDRotateState
;case PORTRAIT
SysSelect3Case1
	movlw	4
	subwf	GLCDROTATESTATE,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect3Case2
;GLCDDeviceWidth = GLCD_WIDTH
	clrf	GLCDDEVICEWIDTH,ACCESS
	movlw	4
	movwf	GLCDDEVICEWIDTH_H,ACCESS
;GLCDDeviceHeight = GLCD_HEIGHT
	movlw	88
	movwf	GLCDDEVICEHEIGHT,ACCESS
	movlw	2
	movwf	GLCDDEVICEHEIGHT_H,ACCESS
;case LANDSCAPE
	bra	SysSelectEnd3
SysSelect3Case2
	decf	GLCDROTATESTATE,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect3Case3
;GLCDDeviceWidth = GLCD_WIDTH
	clrf	GLCDDEVICEWIDTH,ACCESS
	movlw	4
	movwf	GLCDDEVICEWIDTH_H,ACCESS
;GLCDDeviceHeight = GLCD_HEIGHT
	movlw	88
	movwf	GLCDDEVICEHEIGHT,ACCESS
	movlw	2
	movwf	GLCDDEVICEHEIGHT_H,ACCESS
;_temp_LT7686.3 = 0
	banksel	_TEMP_LT7686
	bcf	_TEMP_LT7686,3,BANKED
;__temp_LT7686.2 = 0
	bcf	__TEMP_LT7686,2,BANKED
;__temp_LT7686.1 = 0
	bcf	__TEMP_LT7686,1,BANKED
;case PORTRAIT_REV
	bra	SysSelectEnd3
SysSelect3Case3
	movlw	2
	subwf	GLCDROTATESTATE,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect3Case4
;GLCDDeviceWidth = GLCD_WIDTH
	clrf	GLCDDEVICEWIDTH,ACCESS
	movlw	4
	movwf	GLCDDEVICEWIDTH_H,ACCESS
;GLCDDeviceHeight = GLCD_HEIGHT
	movlw	88
	movwf	GLCDDEVICEHEIGHT,ACCESS
	movlw	2
	movwf	GLCDDEVICEHEIGHT_H,ACCESS
;case LANDSCAPE_REV
	bra	SysSelectEnd3
SysSelect3Case4
	movlw	3
	subwf	GLCDROTATESTATE,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect3Case5
;GLCDDeviceWidth = GLCD_WIDTH
	clrf	GLCDDEVICEWIDTH,ACCESS
	movlw	4
	movwf	GLCDDEVICEWIDTH_H,ACCESS
;GLCDDeviceHeight = GLCD_HEIGHT
	movlw	88
	movwf	GLCDDEVICEHEIGHT,ACCESS
	movlw	2
	movwf	GLCDDEVICEHEIGHT_H,ACCESS
;_temp_LT7686.3 = 1
	banksel	_TEMP_LT7686
	bsf	_TEMP_LT7686,3,BANKED
;__temp_LT7686.2 = 0
	bcf	__TEMP_LT7686,2,BANKED
;__temp_LT7686.1 = 1
	bsf	__TEMP_LT7686,1,BANKED
;case else
	bra	SysSelectEnd3
SysSelect3Case5
;GLCDDeviceWidth = GLCD_WIDTH
	clrf	GLCDDEVICEWIDTH,ACCESS
	movlw	4
	movwf	GLCDDEVICEWIDTH_H,ACCESS
;GLCDDeviceHeight = GLCD_HEIGHT
	movlw	88
	movwf	GLCDDEVICEHEIGHT,ACCESS
	movlw	2
	movwf	GLCDDEVICEHEIGHT_H,ACCESS
;_temp_LT7686.3 = 0
	banksel	_TEMP_LT7686
	bcf	_TEMP_LT7686,3,BANKED
;__temp_LT7686.2 = 0
	bcf	__TEMP_LT7686,2,BANKED
;__temp_LT7686.1 = 0
	bcf	__TEMP_LT7686,1,BANKED
;end select
SysSelectEnd3
;rewrite to register
;LT7686_WriteCMD(LT7686_REG_MACR)
	movlw	2
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(__temp_LT7686)
	movff	__TEMP_LT7686,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_Check_Busy_Draw
	rcall	LT7686_CHECK_BUSY_DRAW
;LT7686_WriteCMD(LT7686_REG_DPCR)
	movlw	18
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(_temp_LT7686)
	movff	_TEMP_LT7686,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_Check_Busy_Draw
	bra	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

;Source: hwspi.h (624)
HWSPITRANSFER
;One byte transfer count
;SPI1TCNTL = 1
	movlw	1
	movwf	SPI1TCNTL,BANKED
;SPI1TXB = SPITxData
	movff	SPITXDATA,SPI1TXB
;wait while SPI1RXIF = SPI_RX_IN_PROGRESS
SysWaitLoop2
	btfss	PIR3,SPI1RXIF,ACCESS
	bra	SysWaitLoop2
;SPIRxData = SPI1RXB
	movff	SPI1RXB,SPIRXDATA
	return

;********************************************************************************

;Source: GLCD_LT7686.H (31)
INITGLCD_LT7686
;Dim LT7686status as Bit
;Dir LT7686_DI   In
	bsf	TRISC,4,ACCESS
;Dir LT7686_DO   Out
	bcf	TRISB,0,ACCESS
;Dir LT7686_SCK  Out
	bcf	TRISC,3,ACCESS
;Dir LT7686_CS   Out
	bcf	TRISA,3,ACCESS
;Dir LT7686_RST  Out
	bcf	TRISB,5,ACCESS
;LT7686_DO  = 0
	bcf	LATB,0,ACCESS
;LT7686_DI  = 1
	bsf	LATC,4,ACCESS
;LT7686_CS  = 1
	bsf	LATA,3,ACCESS
;SPIMode HWSPIMODESCRIPT, LT7686_SPICLOCKMODE
	movlw	12
	banksel	SPICURRENTMODE
	movwf	SPICURRENTMODE,BANKED
	movlw	3
	movwf	SPICLOCKMODE,BANKED
	banksel	0
	call	SPIMODE345
;Physical reset before any GLCD comms
;Repeat 3
	movlw	3
	banksel	SYSREPEATTEMP3
	movwf	SysRepeatTemp3,BANKED
SysRepeatLoop3
;LT7686_RST = 1
	bsf	LATB,5,ACCESS
;Wait 50 ms
	movlw	50
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	banksel	0
	rcall	Delay_MS
;LT7686_RST = 0
	bcf	LATB,5,ACCESS
;Wait 100 ms
	movlw	100
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	rcall	Delay_MS
;LT7686_RST = 1
	bsf	LATB,5,ACCESS
;Wait 50 ms
	movlw	50
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	rcall	Delay_MS
;End Repeat
	banksel	SYSREPEATTEMP3
	decfsz	SysRepeatTemp3,F,BANKED
	bra	SysRepeatLoop3
SysRepeatLoopEnd3
;LT7686_Software_Reset
	banksel	0
	call	LT7686_SOFTWARE_RESET
;wait 10 ms
	movlw	10
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	rcall	Delay_MS
;Dim GLCDbackground, GLCDForeground as Long
;LT7686_LoadDefaultRegisters
	rcall	LT7686_LOADDEFAULTREGISTERS
;! This could be a dead lock as the GLCD needs to respond
;Do While LT7686_Check_Init = False
SysDoLoop_S3
	rcall	FN_LT7686_CHECK_INIT
	movf	LT7686_CHECK_INIT,F,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysDoLoop_E3
;Loop
	bra	SysDoLoop_S3
SysDoLoop_E3
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
	clrf	GLCDDEVICEWIDTH,ACCESS
	movlw	4
	movwf	GLCDDEVICEWIDTH_H,ACCESS
;GLCDDeviceHeight = GLCD_HEIGHT
	movlw	88
	movwf	GLCDDEVICEHEIGHT,ACCESS
	movlw	2
	movwf	GLCDDEVICEHEIGHT_H,ACCESS
;GLCDfntDefault = 0
	clrf	GLCDFNTDEFAULT,ACCESS
;GLCDfntDefaultsize = 2
	movlw	2
	movwf	GLCDFNTDEFAULTSIZE,ACCESS
;GLCDfntDefaultHeight = 7  'used by GLCDPrintString and GLCDPrintStringLn
	movlw	7
	movwf	GLCDFNTDEFAULTHEIGHT,ACCESS
;GLCDRotate LANDSCAPE
	movlw	1
	movwf	GLCDROTATESTATE,ACCESS
	rcall	GLCDROTATE_LT7686
;GLCDFontWidth = 6
	movlw	6
	movwf	GLCDFONTWIDTH,ACCESS
;GLCDCLS
	bra	GLCDCLS_LT7686

;********************************************************************************

;Source: GLCDProgram.gcb (23)
INITPPS
;SLRCONC.3 = 0
	banksel	SLRCONC
	bcf	SLRCONC,3,BANKED
;Dir PORTC.6 Out    ' Make TX1 pin an output
	bcf	TRISC,6,ACCESS
;RC6PPS = 0x0020    // TX1 > RC6
	movlw	32
	banksel	RC6PPS
	movwf	RC6PPS,BANKED
;Module: SPI1
;SPI1SDIPPS = 0x0014    // RC4 > SDI1
	movlw	20
	movwf	SPI1SDIPPS,BANKED
;RB0PPS = 0x0032    // SDO1 > RB0
	movlw	50
	movwf	RB0PPS,BANKED
;RC3PPS = 0x0031    // SCK1 > RC3
	movlw	49
	movwf	RC3PPS,BANKED
;SPI1SCKPPS = 0x0013    // RC3 > SCK1 (bi-directional)
	movlw	19
	movwf	SPI1SCKPPS,BANKED
	banksel	0
	return

;********************************************************************************

;Source: random.h (35)
INITRANDOM
;Dim RandomSeed As Word
;RandomSeed = RandStart
	movlw	145
	banksel	RANDOMSEED
	movwf	RANDOMSEED,BANKED
	movlw	6
	movwf	RANDOMSEED_H,BANKED
	banksel	0
	return

;********************************************************************************

;Source: system.h (185)
INITSYS
;Clear BSR on ChipFamily16 MCUs
;MOVLB 0
	movlb	0
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
;asm showdebug The MCU is a chip family 16
;Section supports many MCUs, 18FxxK40, 18FxxK42 etc that have NDIV3 bit
;asm showdebug OSCCON type is 101
;OSCCON1 = 0x60          // Setting OSCCON1 implies clearing Clear NDIV3:0
	movlw	96
	movwf	OSCCON1,BANKED
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
;ANSELE = 0
	clrf	ANSELE,BANKED
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
;PORTD = 0
	clrf	PORTD,ACCESS
;PORTE = 0
	clrf	PORTE,ACCESS
	return

;********************************************************************************

;Source: GLCD_LT7686.H (478)
LINE_LT7686
;LT7686_WriteCMD(0x68)
	movlw	104
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset1)
	movff	XOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x69)
	movlw	105
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset1_H)
	movff	XOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x6A)
	movlw	106
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset1)
	movff	YOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x6B)
	movlw	107
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset1_H)
	movff	YOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x6C)
	movlw	108
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset2)
	movff	XOFFSET2,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x6D)
	movlw	109
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset2_H)
	movff	XOFFSET2_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x6E)
	movlw	110
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset2)
	movff	YOFFSET2,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x6F)
	movlw	111
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset2_H)
	movff	YOFFSET2_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_SendColor
;Macro Source: GLCD_LT7686.H (1539)
;dim __Set_LT7686_LineColour as Long
;__Set_LT7686_LineColour = LT7686_LineColour
	movff	LT7686_LINECOLOUR,__SET_LT7686_LINECOLOUR
	movff	LT7686_LINECOLOUR_H,__SET_LT7686_LINECOLOUR_H
	movff	LT7686_LINECOLOUR_U,__SET_LT7686_LINECOLOUR_U
	movff	LT7686_LINECOLOUR_E,__SET_LT7686_LINECOLOUR_E
;Supports RGB format only
;red component
;LT7686_WriteCMD(LT7686_REG_FGCR)
	movlw	210
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData( __Set_LT7686_LineColour_H  )
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
;Set C off
	bcf	STATUS,C,ACCESS
;Rotate __Set_LT7686_LineColour Left
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
;Rotate __Set_LT7686_LineColour Left
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
;Rotate __Set_LT7686_LineColour Left
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
;blue component
;LT7686_WriteCMD(LT7686_REG_FGCB)
	movlw	212
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData( __Set_LT7686_LineColour )
	movff	__SET_LT7686_LINECOLOUR,__OUTBYTE
	call	LT7686_WRITEDATA
;Set C off
	bcf	STATUS,C,ACCESS
;Rotate __Set_LT7686_LineColour Left
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
;Rotate __Set_LT7686_LineColour Left
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
;green component
;LT7686_WriteCMD(LT7686_REG_FGCG)
	movlw	211
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData( __Set_LT7686_LineColour_H )
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x67)
	movlw	103
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(0x80)
	movlw	128
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	bra	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

;Source: GLCD_LT7686.H (518)
LINE_WIDTH_LT7686
;Uses factorisation for integer support
;Dim xtemp, ytemp, wtemp as Integer
;Dim temp_LT7686 as Integer
;xtemp = ( _xoffset2 - _xoffset1 )
	banksel	_XOFFSET1
	movf	_XOFFSET1,W,BANKED
	subwf	_XOFFSET2,W,BANKED
	movwf	XTEMP,BANKED
	movf	_XOFFSET1_H,W,BANKED
	subwfb	_XOFFSET2_H,W,BANKED
	movwf	XTEMP_H,BANKED
;ytemp = ( _yoffset2 - _yoffset1 ) * 10  // Y factorised by 10
	movf	_YOFFSET1,W,BANKED
	subwf	_YOFFSET2,W,BANKED
	movwf	SysTemp2,BANKED
	movf	_YOFFSET1_H,W,BANKED
	subwfb	_YOFFSET2_H,W,BANKED
	movwf	SysTemp2_H,BANKED
	movff	SysTemp2,SysINTEGERTempA
	movff	SysTemp2_H,SysINTEGERTempA_H
	movlw	10
	movwf	SysINTEGERTempB,ACCESS
	clrf	SysINTEGERTempB_H,ACCESS
	banksel	0
	call	SYSMULTSUBINT
	movff	SysINTEGERTempX,YTEMP
	movff	SysINTEGERTempX_H,YTEMP_H
;wtemp = 0
	banksel	WTEMP
	clrf	WTEMP,BANKED
	clrf	WTEMP_H,BANKED
;if ( xtemp = 0 ) then
	movff	XTEMP,SysINTEGERTempA
	movff	XTEMP_H,SysINTEGERTempA_H
	clrf	SysINTEGERTempB,ACCESS
	clrf	SysINTEGERTempB_H,ACCESS
	banksel	0
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	ELSE19_1
;this is factorised by 10
;temp_LT7686 = 20
	movlw	20
	banksel	TEMP_LT7686
	movwf	TEMP_LT7686,BANKED
	clrf	TEMP_LT7686_H,BANKED
;else
	bra	ENDIF19
ELSE19_1
;this calc is factorised by 10
;temp_LT7686 = ytemp / xtemp
	movff	YTEMP,SysINTEGERTempA
	movff	YTEMP_H,SysINTEGERTempA_H
	movff	XTEMP,SysINTEGERTempB
	movff	XTEMP_H,SysINTEGERTempB_H
	call	SYSDIVSUBINT
	movff	SysINTEGERTempA,TEMP_LT7686
	movff	SysINTEGERTempA_H,TEMP_LT7686_H
;end if
ENDIF19
;if  ( ABS( temp_LT7686 ) <= 10 ) Then   // factorised by 10
	movff	TEMP_LT7686,SYSCALCTEMPA
	movff	TEMP_LT7686_H,SYSCALCTEMPA_H
	banksel	0
	rcall	FN_ABS
	movff	ABS,SysINTEGERTempB
	movff	ABS_H,SysINTEGERTempB_H
	movlw	10
	movwf	SysINTEGERTempA,ACCESS
	clrf	SysINTEGERTempA_H,ACCESS
	call	SYSCOMPLESSTHANINT
	comf	SysByteTempX,F,ACCESS
	btfss	SysByteTempX,0,ACCESS
	bra	ELSE20_1
;do while ( _woffset > 0)
SysDoLoop_S6
	movff	_woffset,SysWORDTempB
	movff	_woffset_H,SysWORDTempB_H
	clrf	SysWORDTempA,ACCESS
	clrf	SysWORDTempA_H,ACCESS
	banksel	0
	call	SYSCOMPLESSTHAN16
	btfss	SysByteTempX,0,ACCESS
	bra	SysDoLoop_E6
;_woffset--
	movlw	1
	banksel	_WOFFSET
	subwf	_WOFFSET,F,BANKED
	movlw	0
	subwfb	_WOFFSET_H,F,BANKED
;Line( _xoffset1, _yoffset1+wtemp, _xoffset2, _yoffset2+wtemp, LT7686_LineColour)
	movff	_XOFFSET1,XOFFSET1
	movff	_XOFFSET1_H,XOFFSET1_H
	movf	WTEMP,W,BANKED
	addwf	_YOFFSET1,W,BANKED
	movwf	YOFFSET1,BANKED
	movf	WTEMP_H,W,BANKED
	addwfc	_YOFFSET1_H,W,BANKED
	movwf	YOFFSET1_H,BANKED
	movff	_XOFFSET2,XOFFSET2
	movff	_XOFFSET2_H,XOFFSET2_H
	movf	WTEMP,W,BANKED
	addwf	_YOFFSET2,W,BANKED
	movwf	YOFFSET2,BANKED
	movf	WTEMP_H,W,BANKED
	addwfc	_YOFFSET2_H,W,BANKED
	movwf	YOFFSET2_H,BANKED
	banksel	0
	rcall	LINE_LT7686
;wtemp++
	banksel	WTEMP
	incf	WTEMP,F,BANKED
	btfsc	STATUS,Z,ACCESS
	incf	WTEMP_H,F,BANKED
;Loop	
	bra	SysDoLoop_S6
SysDoLoop_E6
;else
	bra	ENDIF20
ELSE20_1
;Do while ( _woffset > 0)
SysDoLoop_S7
	movff	_woffset,SysWORDTempB
	movff	_woffset_H,SysWORDTempB_H
	clrf	SysWORDTempA,ACCESS
	clrf	SysWORDTempA_H,ACCESS
	banksel	0
	call	SYSCOMPLESSTHAN16
	btfss	SysByteTempX,0,ACCESS
	bra	SysDoLoop_E7
;_woffset--
	movlw	1
	banksel	_WOFFSET
	subwf	_WOFFSET,F,BANKED
	movlw	0
	subwfb	_WOFFSET_H,F,BANKED
;Line( _xoffset1+wtemp, _yoffset1, _xoffset2+wtemp, _yoffset2, LT7686_LineColour)
	movf	WTEMP,W,BANKED
	addwf	_XOFFSET1,W,BANKED
	movwf	XOFFSET1,BANKED
	movf	WTEMP_H,W,BANKED
	addwfc	_XOFFSET1_H,W,BANKED
	movwf	XOFFSET1_H,BANKED
	movff	_YOFFSET1,YOFFSET1
	movff	_YOFFSET1_H,YOFFSET1_H
	movf	WTEMP,W,BANKED
	addwf	_XOFFSET2,W,BANKED
	movwf	XOFFSET2,BANKED
	movf	WTEMP_H,W,BANKED
	addwfc	_XOFFSET2_H,W,BANKED
	movwf	XOFFSET2_H,BANKED
	movff	_YOFFSET2,YOFFSET2
	movff	_YOFFSET2_H,YOFFSET2_H
	banksel	0
	rcall	LINE_LT7686
;wtemp++
	banksel	WTEMP
	incf	WTEMP,F,BANKED
	btfsc	STATUS,Z,ACCESS
	incf	WTEMP_H,F,BANKED
;Loop	
	bra	SysDoLoop_S7
SysDoLoop_E7
;End if
ENDIF20
	return

;********************************************************************************

;Source: GLCD_LT7686.H (2040)
LT7686_CHECK_BUSY_DRAW
;do while  ( ( LT7686_StatusRead() & 0x08 ) = 0x08 )
SysDoLoop_S2
	rcall	FN_LT7686_STATUSREAD
	movlw	8
	andwf	lt7686_statusread,W,ACCESS
	banksel	SYSTEMP1
	movwf	SysTemp1,BANKED
	movff	SysTemp1,SysBYTETempA
	movlw	8
	movwf	SysBYTETempB,ACCESS
	banksel	0
	call	SYSCOMPEQUAL
	btfss	SysByteTempX,0,ACCESS
	bra	SysDoLoop_E2
;wait 10 us
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS1
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS1
;loop
	bra	SysDoLoop_S2
SysDoLoop_E2
	return

;********************************************************************************

;Source: GLCD_LT7686.H (1721)
FN_LT7686_CHECK_INIT
;Reuse variables to save RAM
;Dim LT7686_Check_Init_Fail, LT7686_StatusReadResult, LT7686_Check_Init_Counter as Byte
;LT7686_Check_Init = False
	clrf	LT7686_CHECK_INIT,ACCESS
;LT7686_Check_Init_Counter = 0
	clrf	LT7686_CHECK_INIT_COUNTER,ACCESS
;LT7686_Check_Init_Fail = 0
	clrf	LT7686_CHECK_INIT_FAIL,ACCESS
;do
SysDoLoop_S8
;Increment the exit counters... to ensure this is NOT a deadlock
;LT7686_Check_Init_Counter++
	incf	LT7686_CHECK_INIT_COUNTER,F,ACCESS
;LT7686_Check_Init_Fail++
	incf	LT7686_CHECK_INIT_FAIL,F,ACCESS
;LT7686_StatusReadResult = LT7686_StatusRead
	banksel	0
	rcall	FN_LT7686_STATUSREAD
	movff	LT7686_STATUSREAD,LT7686_STATUSREADRESULT
;if ( LT7686_StatusReadResult & 0x02 ) = 0x00 and LT7686_Check_Init_Fail < LT7686_CHECKATTEMPTS Then
	movlw	2
	andwf	LT7686_STATUSREADRESULT,W,ACCESS
	banksel	SYSTEMP1
	movwf	SysTemp1,BANKED
	movff	SysTemp1,SysBYTETempA
	clrf	SysBYTETempB,ACCESS
	banksel	0
	call	SYSCOMPEQUAL
	movff	SysByteTempX,SysTemp2
	movff	LT7686_CHECK_INIT_FAIL,SysBYTETempA
	movlw	20
	movwf	SysBYTETempB,ACCESS
	call	SYSCOMPLESSTHAN
	banksel	SYSTEMP2
	movf	SysTemp2,W,BANKED
	andwf	SysByteTempX,W,ACCESS
	movwf	SysTemp1,BANKED
	btfss	SysTemp1,0,BANKED
	bra	ELSE21_1
;wait 100 us
	movlw	2
	movwf	DELAYTEMP2,ACCESS
DelayUSO2
	clrf	DELAYTEMP,ACCESS
DelayUS2
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS2
	decfsz	DELAYTEMP2,F,ACCESS
	bra	DelayUSO2
	movlw	19
	movwf	DELAYTEMP,ACCESS
DelayUS3
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS3
;LT7686_WriteCMD( 0x01 )
	movlw	1
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;Check if CCR register and PLL are ready
;if ( ( LT7686_DataRead() & 0x80 ) = 0x80 ) Then
	rcall	FN_LT7686_DATAREAD
	movlw	128
	andwf	LT7686_DATAREAD,W,ACCESS
	banksel	SYSTEMP1
	movwf	SysTemp1,BANKED
	movff	SysTemp1,SysBYTETempA
	movlw	128
	movwf	SysBYTETempB,ACCESS
	banksel	0
	call	SYSCOMPEQUAL
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF23
;LT7686_Check_Init = True
	setf	LT7686_CHECK_INIT,ACCESS
;exit Sub
	return
;end if
ENDIF23
;else
	bra	ENDIF21
ELSE21_1
;wait 100 us
	movlw	2
	movwf	DELAYTEMP2,ACCESS
DelayUSO4
	clrf	DELAYTEMP,ACCESS
DelayUS4
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS4
	decfsz	DELAYTEMP2,F,ACCESS
	bra	DelayUSO4
	movlw	19
	movwf	DELAYTEMP,ACCESS
DelayUS5
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS5
;LT7686_WriteCMD(0x01)
	movlw	1
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(0x80)
	movlw	128
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITEDATA
;end if
ENDIF21
;if LT7686_Check_Init = 0 & LT7686_Check_Init_Fail = 5 Then
	movff	LT7686_CHECK_INIT,SysBYTETempA
	clrf	SysBYTETempB,ACCESS
	call	SYSCOMPEQUAL
	movff	SysByteTempX,SysTemp1
	movff	LT7686_CHECK_INIT_FAIL,SysBYTETempA
	movlw	5
	movwf	SysBYTETempB,ACCESS
	call	SYSCOMPEQUAL
	banksel	SYSTEMP1
	movf	SysTemp1,W,BANKED
	andwf	SysByteTempX,W,ACCESS
	movwf	SysTemp2,BANKED
	btfss	SysTemp2,0,BANKED
	bra	ENDIF22
;LT7686_Hardware_Reset
	banksel	0
	rcall	LT7686_HARDWARE_RESET
;wait 10 ms
	movlw	10
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	call	Delay_MS
;LT7686_Software_Reset
	rcall	LT7686_SOFTWARE_RESET
;wait 10 ms
	movlw	10
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	call	Delay_MS
;LT7686_LoadDefaultRegisters
	rcall	LT7686_LOADDEFAULTREGISTERS
;LT7686_WriteCMD ( 0xE4 )
	movlw	228
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData ( 0x01 )
	movlw	1
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITEDATA
;wait 100 ms
	movlw	100
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	call	Delay_MS
;LT7686_Check_Init_Fail = 0
	clrf	LT7686_CHECK_INIT_FAIL,ACCESS
;End if
ENDIF22
;Loop while ( LT7686_Check_Init = 0 & LT7686_Check_Init_Counter <> LT7686_CHECKATTEMPTS )
	movff	lt7686_check_init,SysBYTETempA
	clrf	SysBYTETempB,ACCESS
	banksel	0
	call	SYSCOMPEQUAL
	movff	SysByteTempX,SysTemp1
	movff	lt7686_check_init_counter,SysBYTETempA
	movlw	20
	movwf	SysBYTETempB,ACCESS
	call	SYSCOMPEQUAL
	comf	SysByteTempX,F,ACCESS
	banksel	SYSTEMP1
	movf	SysTemp1,W,BANKED
	andwf	SysByteTempX,W,ACCESS
	movwf	SysTemp2,BANKED
	btfsc	SysTemp2,0,BANKED
	bra	SysDoLoop_S8
SysDoLoop_E8
;! But, this is failure to init
;LT7686_Check_Init = True
	setf	LT7686_CHECK_INIT,ACCESS
	banksel	0
	return

;********************************************************************************

;Source: GLCD_LT7686.H (1897)
FN_LT7686_DATAREAD
;dim __LT7686_outbuffer as Byte
;LT7686_CS = 0
	bcf	LATA,3,ACCESS
;Send via Hardware SPI
;FastHWSPITransfer( 0xC0 )
	movlw	192
	banksel	SPITXDATA
	movwf	SPITXDATA,BANKED
	banksel	0
	call	FASTHWSPITRANSFER
;HWSPITransfer( 0x00, LT7686_DataRead )
	banksel	SPITXDATA
	clrf	SPITXDATA,BANKED
	banksel	0
	rcall	HWSPITRANSFER
	movff	SPIRXDATA,LT7686_DATAREAD
;LT7686_CS = 1
	bsf	LATA,3,ACCESS
	return

;********************************************************************************

;Source: GLCD_LT7686.H (1702)
LT7686_HARDWARE_RESET
;LT7686_RST = 1
	bsf	LATB,5,ACCESS
;Wait 30 ms
	movlw	30
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	call	Delay_MS
;LT7686_RST = 0
	bcf	LATB,5,ACCESS
;Wait 200 ms
	movlw	200
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	call	Delay_MS
;LT7686_RST = 1
	bsf	LATB,5,ACCESS
;Wait 30 ms
	movlw	30
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	goto	Delay_MS

;********************************************************************************

LT7686_INITTFT_DATASET_1024_600
	movff	SYSSTRINGA,SysWORDTempA
	movff	SYSSTRINGA_H,SysWORDTempA_H
	movlw	98
	movwf	SysWORDTempB,ACCESS
	movlw	1
	movwf	SysWORDTempB_H,ACCESS
	call	SYSCOMPLESSTHAN16
	btfss	SysByteTempX,0,ACCESS
	retlw	0
	movf	SysStringA, W,ACCESS
	addlw	low TABLELT7686_INITTFT_DATASET_1024_600
	movwf	TBLPTRL,ACCESS
	movlw	high TABLELT7686_INITTFT_DATASET_1024_600
	addwfc	SysStringA_H, W,ACCESS
	movwf	TBLPTRH,ACCESS
	movlw	upper TABLELT7686_INITTFT_DATASET_1024_600
	btfsc	STATUS, C,ACCESS
	addlw	1
	movwf	TBLPTRU,ACCESS
	tblrd*
	movf	TABLAT, W,ACCESS
	return
TABLELT7686_INITTFT_DATASET_1024_600
	db	97,0,17,5,19,138,17,6,19,51,17,7,19,138,17,8,19,100,17,9,19,138,17,10,19,80,17,0
	db	19,128,170,170,170,170,17,1,19,146,17,1,18,146,17,2,19,64,170,170,170,170,17,224
	db	19,41,17,225,19,3,17,226,19,11,17,227,19,3,17,228,19,1,170,170,170,170,170,170
	db	170,170,170,170,170,170,17,16,19,4,17,18,19,128,17,19,19,0,17,20,19,127,17,21
	db	19,0,17,26,19,87,17,27,19,2,17,22,19,16,17,23,19,4,17,24,19,19,17,25,19,1,17,28
	db	19,19,17,29,19,0,17,30,19,11,17,31,19,2,17,187,19,1,17,32,19,0,17,33,19,0,17,34
	db	19,0,17,35,19,0,17,36,19,0,17,37,19,4,17,38,19,0,17,39,19,0,17,40,19,0,17,41,19,0
	db	170,170,170,170,17,80,19,0,17,81,19,0,17,82,19,0,17,83,19,0,17,84,19,0,17,85,19,4
	db	17,86,19,0,17,87,19,0,17,88,19,0,17,89,19,0,17,90,19,0,17,91,19,4,17,92,19,88
	db	17,93,19,2,17,94,19,1,17,188,19,0,17,189,19,2,17,190,19,0,17,191,19,0,17,192,19,0
	db	17,193,19,0,17,194,19,0,17,195,19,0,17,198,19,0,17,199,19,4,17,200,19,88,17,201
	db	19,2,17,202,19,0,17,203,19,4,17,183,19,192,170,170,170,170,17,18,19,192,170,170
	db	170,170,17,132,19,19,17,133,19,10,17,135,19,0,17,140,19,100,17,141,19,0,17,142
	db	19,70,17,143,19,0,17,134,19,48

;********************************************************************************

LT7686_INITTFT_DATASET_1024_600_H
	movff	SYSSTRINGA,SysWORDTempA
	movff	SYSSTRINGA_H,SysWORDTempA_H
	movlw	1
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPLESSTHAN16
	btfss	SysByteTempX,0,ACCESS
	retlw	0
	movf	SysStringA, W,ACCESS
	addlw	low TABLELT7686_INITTFT_DATASET_1024_600_H
	movwf	TBLPTRL,ACCESS
	movlw	high TABLELT7686_INITTFT_DATASET_1024_600_H
	addwfc	SysStringA_H, W,ACCESS
	movwf	TBLPTRH,ACCESS
	movlw	upper TABLELT7686_INITTFT_DATASET_1024_600_H
	btfsc	STATUS, C,ACCESS
	addlw	1
	movwf	TBLPTRU,ACCESS
	tblrd*
	movf	TABLAT, W,ACCESS
	return
TABLELT7686_INITTFT_DATASET_1024_600_H
	db	1

;********************************************************************************

;Source: GLCD_LT7686.H (114)
LT7686_LOADDEFAULTREGISTERS
;Reuse variables to reduce RAM
;Dim LT7686_pointer as Word
;Dim tableloop  as Word alias GLCDForeground_E, GLCDForeground_U
;Dim LT7686_initlength as Word alias GLCDForeground_H, GLCDForeground
;Dim LT7686_initdata as Byte alias GLCDDeviceHeight
;Dim oldLT7686_initdata as Byte alias GLCDDeviceHeight_H
;Dim lastLT7686_cmd as Byte alias GLCDDeviceWidth_H
;Dim LT7686_initverifycounter as Word
;Get init dataset, readtable to init LC
;oldLT7686_initdata = 0
	clrf	OLDLT7686_INITDATA,ACCESS
;LT7686_pointer = 0
	clrf	LT7686_POINTER,ACCESS
	clrf	LT7686_POINTER_H,ACCESS
;table name is set in GLCD.H
;readtable LT7686_INITTFT_DATASET, LT7686_pointer, LT7686_initlength
	movff	LT7686_POINTER,SYSSTRINGA
	movff	LT7686_POINTER_H,SYSSTRINGA_H
	rcall	LT7686_INITTFT_DATASET_1024_600
	movwf	LT7686_INITLENGTH,ACCESS
	movff	LT7686_POINTER,SYSSTRINGA
	movff	LT7686_POINTER_H,SYSSTRINGA_H
	rcall	LT7686_INITTFT_DATASET_1024_600_H
	movwf	LT7686_INITLENGTH_H,ACCESS
;LT7686_pointer++
	incf	LT7686_POINTER,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_POINTER_H,F,ACCESS
;Do Forever
SysDoLoop_S4
;wait 1 ms
	movlw	1
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	call	Delay_MS
;readtable LT7686_INITTFT_DATASET, LT7686_pointer, LT7686_initdata
	movff	LT7686_POINTER,SYSSTRINGA
	movff	LT7686_POINTER_H,SYSSTRINGA_H
	rcall	LT7686_INITTFT_DATASET_1024_600
	movwf	LT7686_INITDATA,ACCESS
;LT7686_pointer++
	incf	LT7686_POINTER,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_POINTER_H,F,ACCESS
;Select Case LT7686_initdata
;Case 0x11
SysSelect2Case1
	movlw	17
	subwf	LT7686_INITDATA,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect2Case2
;Wait 50ms to ensure no overrun at this initial stage of the process
;wait 50 ms
	movlw	50
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	call	Delay_MS
;readtable LT7686_INITTFT_DATASET, LT7686_pointer, LT7686_initdata
	movff	LT7686_POINTER,SYSSTRINGA
	movff	LT7686_POINTER_H,SYSSTRINGA_H
	rcall	LT7686_INITTFT_DATASET_1024_600
	movwf	LT7686_INITDATA,ACCESS
;oldLT7686_initdata = LT7686_initdata
	movff	LT7686_INITDATA,OLDLT7686_INITDATA
;LT7686_pointer++
	incf	LT7686_POINTER,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_POINTER_H,F,ACCESS
;LT7686_WriteCMD( LT7686_initdata)
	movff	LT7686_INITDATA,__OUTBYTE
	rcall	LT7686_WRITECMD
;lastLT7686_cmd = LT7686_initdata
	movff	LT7686_INITDATA,LASTLT7686_CMD
;Case 0x12
	bra	SysSelectEnd2
SysSelect2Case2
	movlw	18
	subwf	LT7686_INITDATA,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect2Case3
;
;Example:
;The command, 0x12, is to read back the content of register [01], and if the result is not [0x82],
;then it will keep reading the register until it reads [0x82].
;This code is to check if PLL is ready or not.
;
;0x11, 0x01, 0x13, 0x82 // REG_WR('h01, 'h82)
;0x11, 0x01, 0x12, 0x82 // REG_WR('h01, 'h82)
;
;readtable LT7686_INITTFT_DATASET, LT7686_pointer, LT7686_initdata
	movff	LT7686_POINTER,SYSSTRINGA
	movff	LT7686_POINTER_H,SYSSTRINGA_H
	rcall	LT7686_INITTFT_DATASET_1024_600
	movwf	LT7686_INITDATA,ACCESS
;LT7686_pointer++
	incf	LT7686_POINTER,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_POINTER_H,F,ACCESS
;! Danger.. this could be deadlock function!! if the GLCD does not reply... then, this is a lockup
;! To be safe we should use a Watchdog
;! add Watchdog when operational
;Read register and get the result
;wait 1 ms
	movlw	1
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	call	Delay_MS
;do while LT7686_DataRead() <> LT7686_initdata AND LT7686_initverifycounter < 500
SysDoLoop_S5
	rcall	FN_LT7686_DATAREAD
	movff	lt7686_dataread,SysBYTETempA
	movff	lt7686_initdata,SysBYTETempB
	call	SYSCOMPEQUAL
	comf	SysByteTempX,F,ACCESS
	movff	SysByteTempX,SysTemp1
	movff	lt7686_initverifycounter,SysWORDTempA
	movff	lt7686_initverifycounter_H,SysWORDTempA_H
	movlw	244
	movwf	SysWORDTempB,ACCESS
	movlw	1
	movwf	SysWORDTempB_H,ACCESS
	call	SYSCOMPLESSTHAN16
	banksel	SYSTEMP1
	movf	SysTemp1,W,BANKED
	andwf	SysByteTempX,W,ACCESS
	movwf	SysTemp2,BANKED
	btfss	SysTemp2,0,BANKED
	bra	SysDoLoop_E5
;LT7686_initverifycounter++
	incf	LT7686_INITVERIFYCOUNTER,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_INITVERIFYCOUNTER_H,F,ACCESS
;wait 1 ms
	movlw	1
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	banksel	0
	call	Delay_MS
;loop
	bra	SysDoLoop_S5
SysDoLoop_E5
;Case 0x13
	bra	SysSelectEnd2
SysSelect2Case3
	movlw	19
	subwf	LT7686_INITDATA,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect2Case4
;readtable LT7686_INITTFT_DATASET, LT7686_pointer, LT7686_initdata
	movff	LT7686_POINTER,SYSSTRINGA
	movff	LT7686_POINTER_H,SYSSTRINGA_H
	rcall	LT7686_INITTFT_DATASET_1024_600
	movwf	LT7686_INITDATA,ACCESS
;oldLT7686_initdata = LT7686_initdata
	movff	LT7686_INITDATA,OLDLT7686_INITDATA
;LT7686_initverifycounter = 0
	clrf	LT7686_INITVERIFYCOUNTER,ACCESS
	clrf	LT7686_INITVERIFYCOUNTER_H,ACCESS
;LT7686_pointer++
	incf	LT7686_POINTER,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_POINTER_H,F,ACCESS
;LT7686_WriteData( LT7686_initdata)
	movff	LT7686_INITDATA,__OUTBYTE
	rcall	LT7686_WRITEDATA
;Case 0xAA
	bra	SysSelectEnd2
SysSelect2Case4
	movlw	170
	subwf	LT7686_INITDATA,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelectEnd2
;readtable LT7686_INITTFT_DATASET, LT7686_pointer, LT7686_initdata
	movff	LT7686_POINTER,SYSSTRINGA
	movff	LT7686_POINTER_H,SYSSTRINGA_H
	rcall	LT7686_INITTFT_DATASET_1024_600
	movwf	LT7686_INITDATA,ACCESS
;LT7686_pointer++
	incf	LT7686_POINTER,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_POINTER_H,F,ACCESS
;If oldLT7686_initdata <>  LT7686_initdata Then
	movf	LT7686_INITDATA,W,ACCESS
	subwf	OLDLT7686_INITDATA,W,ACCESS
	btfsc	STATUS, Z,ACCESS
	bra	ENDIF17
;Only do this once
;LT7686_Wait10ms
	rcall	LT7686_WAIT10MS
;oldLT7686_initdata = LT7686_initdata
	movff	LT7686_INITDATA,OLDLT7686_INITDATA
;End if
ENDIF17
;End Select
SysSelectEnd2
;If LT7686_pointer > LT7686_initlength then Exit Do
	movff	LT7686_POINTER,SysWORDTempB
	movff	LT7686_POINTER_H,SysWORDTempB_H
	movff	LT7686_INITLENGTH,SysWORDTempA
	movff	LT7686_INITLENGTH_H,SysWORDTempA_H
	banksel	0
	call	SYSCOMPLESSTHAN16
	btfsc	SysByteTempX,0,ACCESS
;If LT7686_pointer > LT7686_initlength then Exit Do
	bra	SysDoLoop_E4
;If LT7686_pointer > LT7686_initlength then Exit Do
;Loop
	bra	SysDoLoop_S4
SysDoLoop_E4
	return

;********************************************************************************

;Source: GLCD_LT7686.H (236)
LT7686_PWM_DUTY
;If LT7686_Display_PWM > LT7686_PWM_PRESCALER_MAX then LT7686_Display_PWM = (LT7686_PWM_PRESCALER_MAX / 2 ) -1
	movf	LT7686_DISPLAY_PWM,W,ACCESS
	sublw	200
	btfsc	STATUS, C,ACCESS
	bra	ENDIF10
;If LT7686_Display_PWM > LT7686_PWM_PRESCALER_MAX then LT7686_Display_PWM = (LT7686_PWM_PRESCALER_MAX / 2 ) -1
	movlw	99
	movwf	LT7686_DISPLAY_PWM,ACCESS
;If LT7686_Display_PWM > LT7686_PWM_PRESCALER_MAX then LT7686_Display_PWM = (LT7686_PWM_PRESCALER_MAX / 2 ) -1
ENDIF10
;Dim temp_LT7686 as Byte
;Stop PWM
;LT7686_WriteCMD( LT7686_REG_PCFGR )
	movlw	134
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;temp_LT7686 = LT7686_DataRead()
	rcall	FN_LT7686_DATAREAD
	movff	LT7686_DATAREAD,TEMP_LT7686
;temp_LT7686.4 = 0
	banksel	TEMP_LT7686
	bcf	TEMP_LT7686,4,BANKED
;LT7686_WriteData ( temp_LT7686 )
	movff	TEMP_LT7686,__OUTBYTE
	banksel	0
	rcall	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	rcall	LT7686_CHECK_BUSY_DRAW
;Select MUX input for PWM Timer 1.
;LT7686_WriteCMD( LT7686_REG_PMUXR )
	movlw	133
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;temp_LT7686 = LT7686_DataRead()
	rcall	FN_LT7686_DATAREAD
	movff	LT7686_DATAREAD,TEMP_LT7686
;temp_LT7686.7 = 0
	banksel	TEMP_LT7686
	bcf	TEMP_LT7686,7,BANKED
;temp_LT7686.6 = 0
	bcf	TEMP_LT7686,6,BANKED
;LT7686_WriteData ( temp_LT7686 )
	movff	TEMP_LT7686,__OUTBYTE
	banksel	0
	rcall	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	rcall	LT7686_CHECK_BUSY_DRAW
;PWM Prescaler Register
;These 8 bits determine prescaler value for Timer 0 and 1.
;Time base is Core_Freq / (Prescaler + 1)
;LT7686_WriteCMD(LT7686_REG_PSCLR)
	movlw	132
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData( LT7686_PWM_PRESCALER_MAX )
	movlw	200
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	rcall	LT7686_CHECK_BUSY_DRAW
;
;Timer count buffer register
;Count buffer register total has 16 bits.
;When timer counter equal to 0 will cause PWM timer reload Count buffer register if the reload_en bit set as enable.
;It may be read back timer counter real time value when PWM timer start.
;
;LT7686_WriteCMD(LT7686_REG_TCNTB1L)
	movlw	142
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData( LT7686_PWM_PRESCALER_MAX /2 )
	movlw	100
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(LT7686_REG_TCNTB1H)
	movlw	143
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(0)
	banksel	__OUTBYTE
	clrf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	rcall	LT7686_CHECK_BUSY_DRAW
;
;Timer 0 compare buffer register
;Compare buffer register total has 16 bits.
;When timer counter equal or less than compare buffer register will cause PWM out
;high level if inv_on bit is off.
;
;LT7686_WriteCMD(LT7686_REG_TCMPB1L)
	movlw	140
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(LT7686_Display_PWM)
	movff	LT7686_DISPLAY_PWM,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(LT7686_REG_TCMPB1H)
	movlw	141
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(0)
	banksel	__OUTBYTE
	clrf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	rcall	LT7686_CHECK_BUSY_DRAW
;Start PWM
;LT7686_WriteCMD( LT7686_REG_PCFGR )
	movlw	134
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;temp_LT7686 = LT7686_DataRead()
	rcall	FN_LT7686_DATAREAD
	movff	LT7686_DATAREAD,TEMP_LT7686
;temp_LT7686.5 = 1
	banksel	TEMP_LT7686
	bsf	TEMP_LT7686,5,BANKED
;temp_LT7686.4 = 1
	bsf	TEMP_LT7686,4,BANKED
;LT7686_WriteData ( temp_LT7686 )
	movff	TEMP_LT7686,__OUTBYTE
	banksel	0
	rcall	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	bra	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

;Overloaded signature: LONG:, Source: GLCD_LT7686.H (1604)
LT7686_SETBACKGROUNDCOLOR584
;dim __Set_LT7686_BackgroundColour as Long
;GLCDBackground = __Set_LT7686_BackgroundColour
	movff	__SET_LT7686_BACKGROUNDCOLOUR,GLCDBACKGROUND
	movff	__SET_LT7686_BACKGROUNDCOLOUR_H,GLCDBACKGROUND_H
;blue component
;LT7686_WriteCMD(LT7686_REG_BGCB)
	movlw	215
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData( __Set_LT7686_BackgroundColour & 0x1F )
	movlw	31
	banksel	__SET_LT7686_BACKGROUNDCOLOUR
	andwf	__SET_LT7686_BACKGROUNDCOLOUR,W,BANKED
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITEDATA
;Rotate __Set_LT7686_BackgroundColour Right
	banksel	__SET_LT7686_BACKGROUNDCOLOUR_E
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR_E,F,BANKED
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR_U,F,BANKED
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR_H,F,BANKED
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR,F,BANKED
;Rotate __Set_LT7686_BackgroundColour Right
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR_E,F,BANKED
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR_U,F,BANKED
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR_H,F,BANKED
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR,F,BANKED
;Rotate __Set_LT7686_BackgroundColour Right
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR_E,F,BANKED
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR_U,F,BANKED
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR_H,F,BANKED
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR,F,BANKED
;Rotate __Set_LT7686_BackgroundColour Right
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR_E,F,BANKED
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR_U,F,BANKED
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR_H,F,BANKED
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR,F,BANKED
;Rotate __Set_LT7686_BackgroundColour Right
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR_E,F,BANKED
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR_U,F,BANKED
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR_H,F,BANKED
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR,F,BANKED
;green component
;LT7686_WriteCMD(LT7686_REG_BGCG)
	movlw	214
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData( __Set_LT7686_BackgroundColour &  0x3F )
	movlw	63
	banksel	__SET_LT7686_BACKGROUNDCOLOUR
	andwf	__SET_LT7686_BACKGROUNDCOLOUR,W,BANKED
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITEDATA
;Rotate __Set_LT7686_BackgroundColour Right
	banksel	__SET_LT7686_BACKGROUNDCOLOUR_E
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR_E,F,BANKED
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR_U,F,BANKED
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR_H,F,BANKED
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR,F,BANKED
;Rotate __Set_LT7686_BackgroundColour Right
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR_E,F,BANKED
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR_U,F,BANKED
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR_H,F,BANKED
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR,F,BANKED
;Rotate __Set_LT7686_BackgroundColour Right
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR_E,F,BANKED
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR_U,F,BANKED
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR_H,F,BANKED
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR,F,BANKED
;Rotate __Set_LT7686_BackgroundColour Right
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR_E,F,BANKED
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR_U,F,BANKED
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR_H,F,BANKED
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR,F,BANKED
;Rotate __Set_LT7686_BackgroundColour Right
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR_E,F,BANKED
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR_U,F,BANKED
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR_H,F,BANKED
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR,F,BANKED
;Rotate __Set_LT7686_BackgroundColour Right
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR_E,F,BANKED
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR_U,F,BANKED
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR_H,F,BANKED
	rrcf	__SET_LT7686_BACKGROUNDCOLOUR,F,BANKED
;red component
;LT7686_WriteCMD(LT7686_REG_BGCR)
	movlw	213
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData( __Set_LT7686_BackgroundColour  )
	movff	__SET_LT7686_BACKGROUNDCOLOUR,__OUTBYTE
	bra	LT7686_WRITEDATA

;********************************************************************************

;Source: GLCD_LT7686.H (1713)
LT7686_SOFTWARE_RESET
;LT7686_WriteCMD( LT7686_REG_SRR )
	banksel	__OUTBYTE
	clrf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData( 0x01 )
	movlw	1
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITEDATA
;wait 1 ms
	movlw	1
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	goto	Delay_MS

;********************************************************************************

;Source: GLCD_LT7686.H (1968)
FN_LT7686_STATUSREAD
;LT7686_StatusRead = 0x00
	clrf	LT7686_STATUSREAD,ACCESS
;dim __LT7686_outbuffer as Byte
;LT7686_CS = 0
	bcf	LATA,3,ACCESS
;Send via Hardware SPI
;FastHWSPITransfer( 0x40 )
	movlw	64
	banksel	SPITXDATA
	movwf	SPITXDATA,BANKED
	banksel	0
	call	FASTHWSPITRANSFER
;HWSPITransfer( 0x00, __LT7686_outbuffer )
	banksel	SPITXDATA
	clrf	SPITXDATA,BANKED
	banksel	0
	call	HWSPITRANSFER
	movff	SPIRXDATA,__LT7686_OUTBUFFER
;LT7686_StatusRead = __LT7686_outbuffer
	movff	__LT7686_OUTBUFFER,LT7686_STATUSREAD
;LT7686_CS = 1
	bsf	LATA,3,ACCESS
	return

;********************************************************************************

;Source: GLCD_LT7686.H (1828)
LT7686_WAIT10MS
;Wait 10 ms
	movlw	10
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	goto	Delay_MS

;********************************************************************************

;Source: GLCD_LT7686.H (1839)
LT7686_WRITECMD
;0x00
;dim __LT7686_fbuffer as Byte
;__LT7686_fbuffer = LT7686_REGISTER_ADDRESS
	banksel	__LT7686_FBUFFER
	clrf	__LT7686_FBUFFER,BANKED
;__LT7686_outbuffer = __outbyte
	movff	__OUTBYTE,__LT7686_OUTBUFFER
;LT7686_macro_WriteTwoBytes
;Macro Source: GLCD_LT7686.H (1774)
;LT7686_CS = 0
	bcf	LATA,3,ACCESS
;Send via Hardware SPI
;FastHWSPITransfer( __LT7686_fbuffer )
	movff	__LT7686_FBUFFER,SPITXDATA
	banksel	0
	call	FASTHWSPITRANSFER
;FastHWSPITransfer( __LT7686_outbuffer  )
	movff	__LT7686_OUTBUFFER,SPITXDATA
	call	FASTHWSPITRANSFER
;LT7686_CS = 1
	bsf	LATA,3,ACCESS
	return

;********************************************************************************

;Source: GLCD_LT7686.H (1854)
LT7686_WRITEDATA
;0x80
;dim __LT7686_fbuffer as Byte
;__LT7686_fbuffer = LT7686_WRITE_REGISTER_MEM
	movlw	128
	banksel	__LT7686_FBUFFER
	movwf	__LT7686_FBUFFER,BANKED
;__LT7686_outbuffer = __outbyte
	movff	__OUTBYTE,__LT7686_OUTBUFFER
;LT7686_macro_WriteTwoBytes
;Macro Source: GLCD_LT7686.H (1774)
;LT7686_CS = 0
	bcf	LATA,3,ACCESS
;Send via Hardware SPI
;FastHWSPITransfer( __LT7686_fbuffer )
	movff	__LT7686_FBUFFER,SPITXDATA
	banksel	0
	call	FASTHWSPITRANSFER
;FastHWSPITransfer( __LT7686_outbuffer  )
	movff	__LT7686_OUTBUFFER,SPITXDATA
	call	FASTHWSPITRANSFER
;LT7686_CS = 1
	bsf	LATA,3,ACCESS
	return

;********************************************************************************

;Source: GLCD_LT7686.H (1215)
MAKETABLE_LT7686
;Dim cache_LT7686_LineColour, cache_LT7686_FillColour as Long
;cache_LT7686_LineColour = LT7686_LineColour
	movff	LT7686_LINECOLOUR,CACHE_LT7686_LINECOLOUR
	clrf	CACHE_LT7686_LINECOLOUR_H,ACCESS
	clrf	CACHE_LT7686_LINECOLOUR_U,ACCESS
	clrf	CACHE_LT7686_LINECOLOUR_E,ACCESS
;cache_LT7686_FillColour = LT7686_FillColour
	movff	LT7686_FILLCOLOUR,CACHE_LT7686_FILLCOLOUR
	movff	LT7686_FILLCOLOUR_H,CACHE_LT7686_FILLCOLOUR_H
	movff	LT7686_FILLCOLOUR_U,CACHE_LT7686_FILLCOLOUR_U
	movff	LT7686_FILLCOLOUR_E,CACHE_LT7686_FILLCOLOUR_E
;dim __temp_LT7686 as word
;__temp_LT7686 = 0
	banksel	__TEMP_LT7686
	clrf	__TEMP_LT7686,BANKED
	clrf	__TEMP_LT7686_H,BANKED
;dim __x2,__y2  as Integer
;__x2 = __xoffset1 + ( __woffset * __tablecolumns )
	movff	__WOFFSET,SysWORDTempA
	movff	__WOFFSET_H,SysWORDTempA_H
	movff	__TABLECOLUMNS,SysWORDTempB
	movff	__TABLECOLUMNS_H,SysWORDTempB_H
	banksel	0
	call	SYSMULTSUB16
	movff	SysWORDTempX,SysTemp2
	movff	SysWORDTempX_H,SysTemp2_H
	banksel	SYSTEMP2
	movf	SysTemp2,W,BANKED
	addwf	__XOFFSET1,W,BANKED
	movwf	__X2,BANKED
	movf	SysTemp2_H,W,BANKED
	addwfc	__XOFFSET1_H,W,BANKED
	movwf	__X2_H,BANKED
;__y2 = __yoffset1 + ( __hoffset * __tablerows )
	movff	__HOFFSET,SysWORDTempA
	movff	__HOFFSET_H,SysWORDTempA_H
	movff	__TABLEROWS,SysWORDTempB
	movff	__TABLEROWS_H,SysWORDTempB_H
	banksel	0
	call	SYSMULTSUB16
	movff	SysWORDTempX,SysTemp2
	movff	SysWORDTempX_H,SysTemp2_H
	banksel	SYSTEMP2
	movf	SysTemp2,W,BANKED
	addwf	__YOFFSET1,W,BANKED
	movwf	__Y2,BANKED
	movf	SysTemp2_H,W,BANKED
	addwfc	__YOFFSET1_H,W,BANKED
	movwf	__Y2_H,BANKED
;Create the outline of the table
;FramedFilledbox_LT7686( __xoffset1, __yoffset1, __x2, __y2, __width2, LT7686_TableColour,cache_LT7686_FillColour)
	movff	__XOFFSET1,_XOFFSET1
	movff	__XOFFSET1_H,_XOFFSET1_H
	movff	__YOFFSET1,_YOFFSET1
	movff	__YOFFSET1_H,_YOFFSET1_H
	movff	__X2,_XOFFSET2
	movff	__X2_H,_XOFFSET2_H
	movff	__Y2,_YOFFSET2
	movff	__Y2_H,_YOFFSET2_H
	movff	__WIDTH2,_WOFFSET
	movff	__WIDTH2_H,_WOFFSET_H
	movff	LT7686_TABLECOLOUR,LT7686_LINECOLOUR
	movff	LT7686_TABLECOLOUR_H,LT7686_LINECOLOUR_H
	movff	LT7686_TABLECOLOUR_U,LT7686_LINECOLOUR_U
	movff	LT7686_TABLECOLOUR_E,LT7686_LINECOLOUR_E
	movff	CACHE_LT7686_FILLCOLOUR,LT7686_FILLCOLOUR
	movff	CACHE_LT7686_FILLCOLOUR_H,LT7686_FILLCOLOUR_H
	movff	CACHE_LT7686_FILLCOLOUR_U,LT7686_FILLCOLOUR_U
	movff	CACHE_LT7686_FILLCOLOUR_E,LT7686_FILLCOLOUR_E
	banksel	0
	call	FRAMEDFILLEDBOX_LT7686
;if ( __mode.0 = 1 ) Then
	banksel	__MODE
	btfss	__MODE,0,BANKED
	bra	ENDIF11
;Filledbox_LT7686( __xoffset1, __yoffset1,__xoffset1+__woffset,__y2, LT7686_ItemColour)
	movff	__XOFFSET1,XOFFSET1
	movff	__XOFFSET1_H,XOFFSET1_H
	movff	__YOFFSET1,YOFFSET1
	movff	__YOFFSET1_H,YOFFSET1_H
	movf	__WOFFSET,W,BANKED
	addwf	__XOFFSET1,W,BANKED
	movwf	XOFFSET2,BANKED
	movf	__WOFFSET_H,W,BANKED
	addwfc	__XOFFSET1_H,W,BANKED
	movwf	XOFFSET2_H,BANKED
	movff	__Y2,YOFFSET2
	movff	__Y2_H,YOFFSET2_H
	movff	LT7686_ITEMCOLOUR,LT7686_LINECOLOUR
	movff	LT7686_ITEMCOLOUR_H,LT7686_LINECOLOUR_H
	movff	LT7686_ITEMCOLOUR_U,LT7686_LINECOLOUR_U
	movff	LT7686_ITEMCOLOUR_E,LT7686_LINECOLOUR_E
	banksel	0
	call	FILLEDBOX_LT7686
;end if
ENDIF11
;if ( __mode.1 = 1 ) Then
	banksel	__MODE
	btfss	__MODE,1,BANKED
	bra	ENDIF12
;Filledbox_LT7686( __xoffset1, __yoffset1,__x2,__yoffset1+__hoffset, LT7686_ItemColour)
	movff	__XOFFSET1,XOFFSET1
	movff	__XOFFSET1_H,XOFFSET1_H
	movff	__YOFFSET1,YOFFSET1
	movff	__YOFFSET1_H,YOFFSET1_H
	movff	__X2,XOFFSET2
	movff	__X2_H,XOFFSET2_H
	movf	__HOFFSET,W,BANKED
	addwf	__YOFFSET1,W,BANKED
	movwf	YOFFSET2,BANKED
	movf	__HOFFSET_H,W,BANKED
	addwfc	__YOFFSET1_H,W,BANKED
	movwf	YOFFSET2_H,BANKED
	movff	LT7686_ITEMCOLOUR,LT7686_LINECOLOUR
	movff	LT7686_ITEMCOLOUR_H,LT7686_LINECOLOUR_H
	movff	LT7686_ITEMCOLOUR_U,LT7686_LINECOLOUR_U
	movff	LT7686_ITEMCOLOUR_E,LT7686_LINECOLOUR_E
	banksel	0
	call	FILLEDBOX_LT7686
;end if
ENDIF12
;draw the horizontal lines
;for __temp_LT7686 = 0 to __tablerows - 1
;Legacy method
	banksel	__TEMP_LT7686
	setf	__TEMP_LT7686,BANKED
	setf	__TEMP_LT7686_H,BANKED
	movlw	1
	subwf	__TABLEROWS,W,BANKED
	movwf	SysTemp2,BANKED
	movlw	0
	subwfb	__TABLEROWS_H,W,BANKED
	movwf	SysTemp2_H,BANKED
	clrf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	movff	SysTemp2,SysWORDTempA
	movff	SysTemp2_H,SysWORDTempA_H
	banksel	0
	rcall	SYSCOMPLESSTHAN16
	btfsc	SysByteTempX,0,ACCESS
	bra	SysForLoopEnd1
SysForLoop1
	banksel	__TEMP_LT7686
	incf	__TEMP_LT7686,F,BANKED
	btfsc	STATUS,Z,ACCESS
	incf	__TEMP_LT7686_H,F,BANKED
;LT768_DrawLine__width(X1,Y1+i*H,x2,Y1+i*H,TableColor,width1)
;LineWidth( __xoffset1, __yoffset1+(__temp_LT7686*__hoffset), __x2, __yoffset1+(__temp_LT7686*__hoffset), __width1, LT7686_TableColour)
	movff	__XOFFSET1,_XOFFSET1
	movff	__XOFFSET1_H,_XOFFSET1_H
	movff	__TEMP_LT7686,SysWORDTempA
	movff	__TEMP_LT7686_H,SysWORDTempA_H
	movff	__HOFFSET,SysWORDTempB
	movff	__HOFFSET_H,SysWORDTempB_H
	banksel	0
	rcall	SYSMULTSUB16
	movff	SysWORDTempX,SysTemp2
	movff	SysWORDTempX_H,SysTemp2_H
	banksel	SYSTEMP2
	movf	SysTemp2,W,BANKED
	addwf	__YOFFSET1,W,BANKED
	movwf	_YOFFSET1,BANKED
	movf	SysTemp2_H,W,BANKED
	addwfc	__YOFFSET1_H,W,BANKED
	movwf	_YOFFSET1_H,BANKED
	movff	__X2,_XOFFSET2
	movff	__X2_H,_XOFFSET2_H
	movff	__TEMP_LT7686,SysWORDTempA
	movff	__TEMP_LT7686_H,SysWORDTempA_H
	movff	__HOFFSET,SysWORDTempB
	movff	__HOFFSET_H,SysWORDTempB_H
	banksel	0
	rcall	SYSMULTSUB16
	movff	SysWORDTempX,SysTemp2
	movff	SysWORDTempX_H,SysTemp2_H
	banksel	SYSTEMP2
	movf	SysTemp2,W,BANKED
	addwf	__YOFFSET1,W,BANKED
	movwf	_YOFFSET2,BANKED
	movf	SysTemp2_H,W,BANKED
	addwfc	__YOFFSET1_H,W,BANKED
	movwf	_YOFFSET2_H,BANKED
	movff	__WIDTH1,_WOFFSET
	movff	__WIDTH1_H,_WOFFSET_H
	movff	LT7686_TABLECOLOUR,LT7686_LINECOLOUR
	movff	LT7686_TABLECOLOUR_H,LT7686_LINECOLOUR_H
	movff	LT7686_TABLECOLOUR_U,LT7686_LINECOLOUR_U
	movff	LT7686_TABLECOLOUR_E,LT7686_LINECOLOUR_E
	banksel	0
	call	LINE_WIDTH_LT7686
;next
	movlw	1
	banksel	__TABLEROWS
	subwf	__TABLEROWS,W,BANKED
	movwf	SysTemp2,BANKED
	movlw	0
	subwfb	__TABLEROWS_H,W,BANKED
	movwf	SysTemp2_H,BANKED
	movff	__TEMP_LT7686,SysWORDTempA
	movff	__TEMP_LT7686_H,SysWORDTempA_H
	movff	SysTemp2,SysWORDTempB
	movff	SysTemp2_H,SysWORDTempB_H
	banksel	0
	rcall	SYSCOMPLESSTHAN16
	btfsc	SysByteTempX,0,ACCESS
	bra	SysForLoop1
SysForLoopEnd1
;draw the vertical lines
;for __temp_LT7686 = 0 to __tablecolumns - 1
;Legacy method
	banksel	__TEMP_LT7686
	setf	__TEMP_LT7686,BANKED
	setf	__TEMP_LT7686_H,BANKED
	movlw	1
	subwf	__TABLECOLUMNS,W,BANKED
	movwf	SysTemp2,BANKED
	movlw	0
	subwfb	__TABLECOLUMNS_H,W,BANKED
	movwf	SysTemp2_H,BANKED
	clrf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	movff	SysTemp2,SysWORDTempA
	movff	SysTemp2_H,SysWORDTempA_H
	banksel	0
	rcall	SYSCOMPLESSTHAN16
	btfsc	SysByteTempX,0,ACCESS
	bra	SysForLoopEnd2
SysForLoop2
	banksel	__TEMP_LT7686
	incf	__TEMP_LT7686,F,BANKED
	btfsc	STATUS,Z,ACCESS
	incf	__TEMP_LT7686_H,F,BANKED
;LT768_DrawLine__width(X1+i*W,Y1,X1+i*W,y2,TableColor,width1)
;LineWidth(__xoffset1+(__temp_LT7686*__woffset),__yoffset1,__xoffset1+(__temp_LT7686*__woffset),__y2,__width1,LT7686_TableColour)
	movff	__TEMP_LT7686,SysWORDTempA
	movff	__TEMP_LT7686_H,SysWORDTempA_H
	movff	__WOFFSET,SysWORDTempB
	movff	__WOFFSET_H,SysWORDTempB_H
	banksel	0
	rcall	SYSMULTSUB16
	movff	SysWORDTempX,SysTemp2
	movff	SysWORDTempX_H,SysTemp2_H
	banksel	SYSTEMP2
	movf	SysTemp2,W,BANKED
	addwf	__XOFFSET1,W,BANKED
	movwf	_XOFFSET1,BANKED
	movf	SysTemp2_H,W,BANKED
	addwfc	__XOFFSET1_H,W,BANKED
	movwf	_XOFFSET1_H,BANKED
	movff	__YOFFSET1,_YOFFSET1
	movff	__YOFFSET1_H,_YOFFSET1_H
	movff	__TEMP_LT7686,SysWORDTempA
	movff	__TEMP_LT7686_H,SysWORDTempA_H
	movff	__WOFFSET,SysWORDTempB
	movff	__WOFFSET_H,SysWORDTempB_H
	banksel	0
	rcall	SYSMULTSUB16
	movff	SysWORDTempX,SysTemp2
	movff	SysWORDTempX_H,SysTemp2_H
	banksel	SYSTEMP2
	movf	SysTemp2,W,BANKED
	addwf	__XOFFSET1,W,BANKED
	movwf	_XOFFSET2,BANKED
	movf	SysTemp2_H,W,BANKED
	addwfc	__XOFFSET1_H,W,BANKED
	movwf	_XOFFSET2_H,BANKED
	movff	__Y2,_YOFFSET2
	movff	__Y2_H,_YOFFSET2_H
	movff	__WIDTH1,_WOFFSET
	movff	__WIDTH1_H,_WOFFSET_H
	movff	LT7686_TABLECOLOUR,LT7686_LINECOLOUR
	movff	LT7686_TABLECOLOUR_H,LT7686_LINECOLOUR_H
	movff	LT7686_TABLECOLOUR_U,LT7686_LINECOLOUR_U
	movff	LT7686_TABLECOLOUR_E,LT7686_LINECOLOUR_E
	banksel	0
	call	LINE_WIDTH_LT7686
;next
	movlw	1
	banksel	__TABLECOLUMNS
	subwf	__TABLECOLUMNS,W,BANKED
	movwf	SysTemp2,BANKED
	movlw	0
	subwfb	__TABLECOLUMNS_H,W,BANKED
	movwf	SysTemp2_H,BANKED
	movff	__TEMP_LT7686,SysWORDTempA
	movff	__TEMP_LT7686_H,SysWORDTempA_H
	movff	SysTemp2,SysWORDTempB
	movff	SysTemp2_H,SysWORDTempB_H
	banksel	0
	rcall	SYSCOMPLESSTHAN16
	btfsc	SysByteTempX,0,ACCESS
	bra	SysForLoop2
SysForLoopEnd2
	return

;********************************************************************************

;Source: random.h (41)
FN_RANDOM
;Repeat 7
	movlw	7
	banksel	SYSREPEATTEMP2
	movwf	SysRepeatTemp2,BANKED
SysRepeatLoop2
;Dim RandomTemp As Word
;Dim RandomSeed As Word
;RandomTemp = RandomSeed
	movff	RANDOMSEED,RANDOMTEMP
	movff	RANDOMSEED_H,RANDOMTEMP_H
;Rotate RandomTemp Left Simple
	rlcf	RANDOMTEMP_H,W,BANKED
	rlcf	RANDOMTEMP,F,BANKED
	rlcf	RANDOMTEMP_H,F,BANKED
;Taps at 16, 15, 13, 11, And with b'1101 0100 0000 0000' = D800
;Expanded below calculation to reduce complexity of calc
;RandomSeed = RandomTemp XOR (Not (RandomSeed And 1) + 1 And 0xB400)
	movlw	1
	andwf	RANDOMSEED,W,BANKED
	movwf	SysTemp2,BANKED
	clrf	SysTemp2_H,BANKED
	comf	SysTemp2,W,BANKED
	movwf	SysTemp1,BANKED
	comf	SysTemp2_H,W,BANKED
	movwf	SysTemp1_H,BANKED
	movlw	1
	addwf	SysTemp1,W,BANKED
	movwf	SysTemp2,BANKED
	movlw	0
	addwfc	SysTemp1_H,W,BANKED
	movwf	SysTemp2_H,BANKED
	clrf	SysTemp1,BANKED
	movlw	180
	andwf	SysTemp2_H,W,BANKED
	movwf	SysTemp1_H,BANKED
	movf	RANDOMTEMP,W,BANKED
	xorwf	SysTemp1,W,BANKED
	movwf	RANDOMSEED,BANKED
	movf	RANDOMTEMP_H,W,BANKED
	xorwf	SysTemp1_H,W,BANKED
	movwf	RANDOMSEED_H,BANKED
;Expanded below calculation to reduce complexity of calc
;RandomSeed = Not (RandomSeed And 1) + 1
;RandomSeed = RandomSeed And 0xB400
;RandomSeed = RandomTemp XOR RandomSeed
;Random = Random Xor RandomSeed_H
	movf	RANDOM,W,BANKED
	xorwf	RANDOMSEED_H,W,BANKED
	movwf	RANDOM,BANKED
;End Repeat
	decfsz	SysRepeatTemp2,F,BANKED
	bra	SysRepeatLoop2
SysRepeatLoopEnd2
	banksel	0
	return

;********************************************************************************

;Source: random.h (63)
RANDOMIZE
;Dim RandomSeed As Word
;RandomSeed += RandomTemp
	banksel	RANDOMTEMP
	movf	RANDOMTEMP,W,BANKED
	addwf	RANDOMSEED,F,BANKED
	movf	RANDOMTEMP_H,W,BANKED
	addwfc	RANDOMSEED_H,F,BANKED
;If random seed gets set to 0, Random will return nothing but 0
;If RandomSeed = 0 Then RandomSeed = 1
	movff	RANDOMSEED,SysWORDTempA
	movff	RANDOMSEED_H,SysWORDTempA_H
	clrf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	banksel	0
	rcall	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF9
;If RandomSeed = 0 Then RandomSeed = 1
	movlw	1
	banksel	RANDOMSEED
	movwf	RANDOMSEED,BANKED
	clrf	RANDOMSEED_H,BANKED
;If RandomSeed = 0 Then RandomSeed = 1
ENDIF9
	banksel	0
	return

;********************************************************************************

;Overloaded signature: BYTE:, Source: a-d.h (2101)
FN_READAD74
;ADFM should configured to ensure LEFT justified
;SET ADFM OFF
	banksel	ADCON0
	bcf	ADCON0,ADFM0,BANKED
;for 16F1885x and possibly future others
;ADPCH = ADReadPort
	movff	ADREADPORT,ADPCH
;***************************************
;Perform conversion
;LLReadAD 1
;Macro Source: a-d.h (577)
;Configure ANSELA/B/C/D @DebugADC_H
;Select Case ADReadPort
;Case 0: Set ANSELA.0 On
SysSelect1Case1
	movf	ADREADPORT,F,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect1Case2
;Case 0: Set ANSELA.0 On
	banksel	ANSELA
	bsf	ANSELA,0,BANKED
;Case 1: Set ANSELA.1 On
	bra	SysSelectEnd1
SysSelect1Case2
	decf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect1Case3
;Case 1: Set ANSELA.1 On
	banksel	ANSELA
	bsf	ANSELA,1,BANKED
;Case 2: Set ANSELA.2 On
	bra	SysSelectEnd1
SysSelect1Case3
	movlw	2
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect1Case4
;Case 2: Set ANSELA.2 On
	banksel	ANSELA
	bsf	ANSELA,2,BANKED
;Case 3: Set ANSELA.3 On
	bra	SysSelectEnd1
SysSelect1Case4
	movlw	3
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect1Case5
;Case 3: Set ANSELA.3 On
	banksel	ANSELA
	bsf	ANSELA,3,BANKED
;Case 4: Set ANSELA.4 ON
	bra	SysSelectEnd1
SysSelect1Case5
	movlw	4
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect1Case6
;Case 4: Set ANSELA.4 ON
	banksel	ANSELA
	bsf	ANSELA,4,BANKED
;Case 5: Set ANSELA.5 On
	bra	SysSelectEnd1
SysSelect1Case6
	movlw	5
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect1Case7
;Case 5: Set ANSELA.5 On
	banksel	ANSELA
	bsf	ANSELA,5,BANKED
;Case 6: Set ANSELA.6 On
	bra	SysSelectEnd1
SysSelect1Case7
	movlw	6
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect1Case8
;Case 6: Set ANSELA.6 On
	banksel	ANSELA
	bsf	ANSELA,6,BANKED
;Case 7: Set ANSELA.7 On
	bra	SysSelectEnd1
SysSelect1Case8
	movlw	7
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect1Case9
;Case 7: Set ANSELA.7 On
	banksel	ANSELA
	bsf	ANSELA,7,BANKED
;Case 8: Set ANSELB.0 On
	bra	SysSelectEnd1
SysSelect1Case9
	movlw	8
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect1Case10
;Case 8: Set ANSELB.0 On
	banksel	ANSELB
	bsf	ANSELB,0,BANKED
;Case 9: Set ANSELB.1 On
	bra	SysSelectEnd1
SysSelect1Case10
	movlw	9
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect1Case11
;Case 9: Set ANSELB.1 On
	banksel	ANSELB
	bsf	ANSELB,1,BANKED
;Case 10: Set ANSELB.2 On
	bra	SysSelectEnd1
SysSelect1Case11
	movlw	10
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect1Case12
;Case 10: Set ANSELB.2 On
	banksel	ANSELB
	bsf	ANSELB,2,BANKED
;Case 11: Set ANSELB.3 On
	bra	SysSelectEnd1
SysSelect1Case12
	movlw	11
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect1Case13
;Case 11: Set ANSELB.3 On
	banksel	ANSELB
	bsf	ANSELB,3,BANKED
;Case 12: Set ANSELB.4 On
	bra	SysSelectEnd1
SysSelect1Case13
	movlw	12
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect1Case14
;Case 12: Set ANSELB.4 On
	banksel	ANSELB
	bsf	ANSELB,4,BANKED
;Case 13: Set ANSELB.5 On
	bra	SysSelectEnd1
SysSelect1Case14
	movlw	13
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect1Case15
;Case 13: Set ANSELB.5 On
	banksel	ANSELB
	bsf	ANSELB,5,BANKED
;Case 14: Set ANSELB.6 On
	bra	SysSelectEnd1
SysSelect1Case15
	movlw	14
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect1Case16
;Case 14: Set ANSELB.6 On
	banksel	ANSELB
	bsf	ANSELB,6,BANKED
;Case 15: Set ANSELB.7 On
	bra	SysSelectEnd1
SysSelect1Case16
	movlw	15
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect1Case17
;Case 15: Set ANSELB.7 On
	banksel	ANSELB
	bsf	ANSELB,7,BANKED
;Case 16: Set ANSELC.0 On
	bra	SysSelectEnd1
SysSelect1Case17
	movlw	16
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect1Case18
;Case 16: Set ANSELC.0 On
	banksel	ANSELC
	bsf	ANSELC,0,BANKED
;Case 17: Set ANSELC.1 On
	bra	SysSelectEnd1
SysSelect1Case18
	movlw	17
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect1Case19
;Case 17: Set ANSELC.1 On
	banksel	ANSELC
	bsf	ANSELC,1,BANKED
;Case 18: Set ANSELC.2 On
	bra	SysSelectEnd1
SysSelect1Case19
	movlw	18
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect1Case20
;Case 18: Set ANSELC.2 On
	banksel	ANSELC
	bsf	ANSELC,2,BANKED
;Case 19: Set ANSELC.3 On
	bra	SysSelectEnd1
SysSelect1Case20
	movlw	19
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect1Case21
;Case 19: Set ANSELC.3 On
	banksel	ANSELC
	bsf	ANSELC,3,BANKED
;Case 20: Set ANSELC.4 On
	bra	SysSelectEnd1
SysSelect1Case21
	movlw	20
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect1Case22
;Case 20: Set ANSELC.4 On
	banksel	ANSELC
	bsf	ANSELC,4,BANKED
;Case 21: Set ANSELC.5 On
	bra	SysSelectEnd1
SysSelect1Case22
	movlw	21
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect1Case23
;Case 21: Set ANSELC.5 On
	banksel	ANSELC
	bsf	ANSELC,5,BANKED
;Case 22: Set ANSELC.6 On
	bra	SysSelectEnd1
SysSelect1Case23
	movlw	22
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect1Case24
;Case 22: Set ANSELC.6 On
	banksel	ANSELC
	bsf	ANSELC,6,BANKED
;Case 23: Set ANSELC.7 On
	bra	SysSelectEnd1
SysSelect1Case24
	movlw	23
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect1Case25
;Case 23: Set ANSELC.7 On
	banksel	ANSELC
	bsf	ANSELC,7,BANKED
;Case 32: Set ANSELE.0 On
	bra	SysSelectEnd1
SysSelect1Case25
	movlw	32
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect1Case26
;Case 32: Set ANSELE.0 On
	banksel	ANSELE
	bsf	ANSELE,0,BANKED
;Case 33: Set ANSELE.1 On
	bra	SysSelectEnd1
SysSelect1Case26
	movlw	33
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect1Case27
;Case 33: Set ANSELE.1 On
	banksel	ANSELE
	bsf	ANSELE,1,BANKED
;Case 34: Set ANSELE.2 On
	bra	SysSelectEnd1
SysSelect1Case27
	movlw	34
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelectEnd1
;Case 34: Set ANSELE.2 On
	banksel	ANSELE
	bsf	ANSELE,2,BANKED
;End Select  '*** ANSEL Bits should now be set ***
SysSelectEnd1
;*** ANSEL Bits are now set ***
;Set voltage reference
;ADREF = 0  'Default = 0 /Vref+ = Vdd/ Vref-  = Vss
;Configure AD clock defaults
;Set ADCS off 'Clock source = FOSC/ADCLK
	banksel	ADCON0
	bcf	ADCON0,ADCS,BANKED
;ADCLK = 1 ' default to FOSC/2
	movlw	1
	movwf	ADCLK,BANKED
;Conversion Clock Speed
;SET ADCS OFF  'ADCON0.4
	bcf	ADCON0,ADCS,BANKED
;ADCLK = 15    'FOSC/16
	movlw	15
	movwf	ADCLK,BANKED
;Configure AD clock defaults fpr older 18F that do not have ADCLK
;SET ADCS2 OFF
	bcf	ADCLK,ADCS2,BANKED
;SET ADCS1 OFF
	bcf	ADCLK,ADCS1,BANKED
;SET ADCS0 ON
	bsf	ADCLK,ADCS0,BANKED
;Result formatting
;if ADLeftadjust = 0 then
;Set ADCON.2 off     '8-bit
;Set ADFM OFF
	bcf	ADCON0,ADFM0,BANKED
;Set ADFM0 OFF
	bcf	ADCON0,ADFM0,BANKED
;End if
;Select Channel
;ADPCH = ADReadPort  'Configure AD read Channel
	movff	ADREADPORT,ADPCH
;Enable AD Operations
;SET ADON ON
	bsf	ADCON0,ADON,BANKED
;Acquisition Delay
;Wait AD_Delay
	movlw	2
	movwf	SysWaitTemp10US,ACCESS
	banksel	0
	call	Delay_10US
;Read A/D @1
;SET GO_NOT_DONE ON
	banksel	ADCON0
	bsf	ADCON0,GO_NOT_DONE,BANKED
;nop
	nop
;Wait While GO_NOT_DONE ON
SysWaitLoop1
	btfsc	ADCON0,GO_NOT_DONE,BANKED
	bra	SysWaitLoop1
;Switch off A/D
;SET ADCON0.ADON OFF
	bcf	ADCON0,ADON,BANKED
;ANSELA = 0
	banksel	ANSELA
	clrf	ANSELA,BANKED
;ANSELB = 0
	clrf	ANSELB,BANKED
;ANSELC = 0
	clrf	ANSELC,BANKED
;ANSELE = 0
	clrf	ANSELE,BANKED
;ReadAD = ADRESH
	movff	ADRESH,READAD
;SET ADFM OFF
	banksel	ADCON0
	bcf	ADCON0,ADFM0,BANKED
	banksel	0
	return

;********************************************************************************

;Overloaded signature: WORD:WORD:WORD:WORD:WORD:integer:, Source: stdbasic.h (266)
FN_SCALE145
;dim l_syscalc as word
;dim l_syscalcF as long
;l_syscalcf =  [long]( l_map - l_fromLow ) * [long](l_toHigh   - l_toLow)
	movf	L_FROMLOW,W,ACCESS
	subwf	L_MAP,W,ACCESS
	banksel	SYSTEMP1
	movwf	SysTemp1,BANKED
	movf	L_FROMLOW_H,W,ACCESS
	subwfb	L_MAP_H,W,ACCESS
	movwf	SysTemp1_H,BANKED
	movf	L_TOLOW,W,ACCESS
	subwf	L_TOHIGH,W,ACCESS
	movwf	SysTemp2,BANKED
	movf	L_TOLOW_H,W,ACCESS
	subwfb	L_TOHIGH_H,W,ACCESS
	movwf	SysTemp2_H,BANKED
	movff	SYSTEMP1,SysLONGTempA
	movff	SYSTEMP1_H,SysLONGTempA_H
	clrf	SysLONGTempA_U,ACCESS
	clrf	SysLONGTempA_E,ACCESS
	movff	SYSTEMP2,SysLONGTempB
	movff	SYSTEMP2_H,SysLONGTempB_H
	clrf	SysLONGTempB_U,ACCESS
	clrf	SysLONGTempB_E,ACCESS
	banksel	0
	rcall	SYSMULTSUB32
	movff	SysLONGTempX,L_SYSCALCF
	movff	SysLONGTempX_H,L_SYSCALCF_H
	movff	SysLONGTempX_U,L_SYSCALCF_U
	movff	SysLONGTempX_E,L_SYSCALCF_E
;l_syscalc = (  l_fromHigh - l_fromLow )
	movf	L_FROMLOW,W,ACCESS
	subwf	L_FROMHIGH,W,ACCESS
	movwf	L_SYSCALC,ACCESS
	movf	L_FROMLOW_H,W,ACCESS
	subwfb	L_FROMHIGH_H,W,ACCESS
	movwf	L_SYSCALC_H,ACCESS
;scale = (l_syscalcf / l_syscalc) + l_toLow + l_calibrate
	movff	L_SYSCALCF,SysLONGTempA
	movff	L_SYSCALCF_H,SysLONGTempA_H
	movff	L_SYSCALCF_U,SysLONGTempA_U
	movff	L_SYSCALCF_E,SysLONGTempA_E
	movff	L_SYSCALC,SysLONGTempB
	movff	L_SYSCALC_H,SysLONGTempB_H
	clrf	SysLONGTempB_U,ACCESS
	clrf	SysLONGTempB_E,ACCESS
	rcall	SYSDIVSUB32
	movff	SysLONGTempA,SysTemp1
	movff	SysLONGTempA_H,SysTemp1_H
	movff	SysLONGTempA_U,SysTemp1_U
	movff	SysLONGTempA_E,SysTemp1_E
	movf	L_TOLOW,W,ACCESS
	banksel	SYSTEMP1
	addwf	SysTemp1,W,BANKED
	movwf	SysTemp2,BANKED
	movf	L_TOLOW_H,W,ACCESS
	addwfc	SysTemp1_H,W,BANKED
	movwf	SysTemp2_H,BANKED
	movf	L_CALIBRATE,W,ACCESS
	addwf	SysTemp2,W,BANKED
	movwf	SCALE,BANKED
	movf	L_CALIBRATE_H,W,ACCESS
	addwfc	SysTemp2_H,W,BANKED
	movwf	SCALE_H,BANKED
	banksel	0
	return

;********************************************************************************

;Overloaded signature: BYTE:BYTE:, Source: hwspi.h (382)
SPIMODE345
;Supports K mode SPI using the specific SPI module
;Turn off SPI
;(Prevents any weird glitches during setup)
;SPI1CON0_EN = 0
	bcf	SPI1CON0,EN,BANKED
;Set clock pulse settings to middle
;SPI1CON1.SMP = 0
	bcf	SPI1CON1,SMP,BANKED
;Data write on rising (idle > active) clock (CPHA = 1)
;SPI1CON1.CKE = 0
	bcf	SPI1CON1,CKE,BANKED
;Clock idle low (CPOL = 0)
;SPI1CON1.CKP = 0
	bcf	SPI1CON1,CKP,BANKED
;If SPIClockMode.0 = Off Then
	banksel	SPICLOCKMODE
	btfsc	SPICLOCKMODE,0,BANKED
	bra	ENDIF34
;SPI1CON1.CKE = 1
	banksel	SPI1CON1
	bsf	SPI1CON1,CKE,BANKED
;End If
ENDIF34
;If SPIClockMode.1 = On Then
	banksel	SPICLOCKMODE
	btfss	SPICLOCKMODE,1,BANKED
	bra	ENDIF35
;SPI1CON1.CKP = 1
	banksel	SPI1CON1
	bsf	SPI1CON1,CKP,BANKED
;End If
ENDIF35
;SPI1CON1 = 0x40
	movlw	64
	banksel	SPI1CON1
	movwf	SPI1CON1,BANKED
;Transfer
;SPI1CON2 = SPI1CON2 or 3
	movlw	3
	iorwf	SPI1CON2,F,BANKED
;Select mode and clock
;SPI1CLK = SSP1_FOSC
	clrf	SPI1CLK,BANKED
;Select Case SPICurrentMode
;Case MasterFast or MasterUltraFast
SysSelect4Case1
	movff	SPICURRENTMODE,SysBYTETempA
	movlw	13
	movwf	SysBYTETempB,ACCESS
	rcall	SYSCOMPEQUAL
	movlw	14
	iorwf	SysByteTempX,W,ACCESS
	banksel	SYSTEMP1
	movwf	SysTemp1,BANKED
	btfss	SysTemp1,0,BANKED
	bra	SysSelect4Case2
;asm showdebug Script value is calculated as SPIBAUDRATE_SCRIPT
;SPI1BAUD = SPIBAUDRATE_SCRIPT
	movlw	3
	banksel	SPI1BAUD
	movwf	SPI1BAUD,BANKED
;SPI1CON0.MST = 1
	bsf	SPI1CON0,MST,BANKED
;Case Master
	bra	SysSelectEnd4
SysSelect4Case2
	movlw	12
	subwf	SPICURRENTMODE,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelect4Case3
;asm showdebug Script value is calculated as SPIBAUDRATE_SCRIPT_MASTER
;SPI1BAUD = SPIBAUDRATE_SCRIPT_MASTER
	movlw	9
	banksel	SPI1BAUD
	movwf	SPI1BAUD,BANKED
;SPI1CON0.MST = 1
	bsf	SPI1CON0,MST,BANKED
;Case MasterSlow
	bra	SysSelectEnd4
SysSelect4Case3
	movlw	11
	subwf	SPICURRENTMODE,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelect4Case4
;asm showdebug Script value is calculated as SPIBAUDRATE_SCRIPT_MASTERSLOW
;SPI1BAUD = SPIBAUDRATE_SCRIPT_MASTERSLOW
	movlw	33
	banksel	SPI1BAUD
	movwf	SPI1BAUD,BANKED
;SPI1CON0.MST = 1
	bsf	SPI1CON0,MST,BANKED
;Case Slave
	bra	SysSelectEnd4
SysSelect4Case4
	movf	SPICURRENTMODE,F,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelect4Case5
;SPI1CON0.MST = 0
	banksel	SPI1CON0
	bcf	SPI1CON0,MST,BANKED
;Case SlaveSS
	bra	SysSelectEnd4
SysSelect4Case5
	decf	SPICURRENTMODE,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelectEnd4
;SPI1CON0.MST = 0
	banksel	SPI1CON0
	bcf	SPI1CON0,MST,BANKED
;End Select
SysSelectEnd4
;Enable SPI
;SPI1CON0.EN = 1
	banksel	SPI1CON0
	bsf	SPI1CON0,EN,BANKED
	return

;********************************************************************************

;Source: system.h (3789)
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

;Source: system.h (3815)
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

;Source: system.h (3869)
SYSCOMPEQUAL32
;dim SysLongTempA as long
;dim SysLongTempB as long
;dim SysByteTempX as byte
;clrf SysByteTempX
	clrf	SYSBYTETEMPX,ACCESS
;Test low, exit if false
;movf SysLongTempB, W
	movf	SYSLONGTEMPB, W,ACCESS
;cpfseq SysLongTempA
	cpfseq	SYSLONGTEMPA,ACCESS
;return
	return
;Test high, exit if false
;movf SysLongTempB_H, W
	movf	SYSLONGTEMPB_H, W,ACCESS
;cpfseq SysLongTempA_H
	cpfseq	SYSLONGTEMPA_H,ACCESS
;return
	return
;Test upper, exit if false
;movf SysLongTempB_U, W
	movf	SYSLONGTEMPB_U, W,ACCESS
;cpfseq SysLongTempA_U
	cpfseq	SYSLONGTEMPA_U,ACCESS
;return
	return
;Test exp, exit if false
;movf SysLongTempB_E, W
	movf	SYSLONGTEMPB_E, W,ACCESS
;cpfseq SysLongTempA_E
	cpfseq	SYSLONGTEMPA_E,ACCESS
;return
	return
;setf SysByteTempX
	setf	SYSBYTETEMPX,ACCESS
	return

;********************************************************************************

;Source: system.h (4179)
SYSCOMPLESSTHAN
;Dim SysByteTempA, SysByteTempB, SysByteTempX as byte
;setf SysByteTempX
	setf	SYSBYTETEMPX,ACCESS
;movf SysByteTempB, W
	movf	SYSBYTETEMPB, W,ACCESS
;cpfslt SysByteTempA
	cpfslt	SYSBYTETEMPA,ACCESS
;clrf SysByteTempX
	clrf	SYSBYTETEMPX,ACCESS
	return

;********************************************************************************

;Source: system.h (4209)
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

;Source: system.h (4267)
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

;Source: system.h (4647)
SYSCOMPLESSTHANINT
;Dim SysIntegerTempA, SysIntegerTempB, SysDivMultA as Integer
;Clear result
;SysByteTempX = 0
	clrf	SYSBYTETEMPX,ACCESS
;Compare sign bits
;-A
;If SysIntegerTempA.15 = On Then
	btfss	SYSINTEGERTEMPA_H,7,ACCESS
	bra	ELSE31_1
;-A, +B, return true
;If SysIntegerTempB.15 = Off Then
	btfsc	SYSINTEGERTEMPB_H,7,ACCESS
	bra	ENDIF32
;Set SysByteTempX to 255
;SysByteTempX = Not SysByteTempX
	comf	SYSBYTETEMPX,F,ACCESS
;Exit Sub
	return
;End If
ENDIF32
;-A, -B, negate both and swap
;SysDivMultA = -SysIntegerTempA
	comf	SYSINTEGERTEMPA,W,ACCESS
	movwf	SYSDIVMULTA,ACCESS
	comf	SYSINTEGERTEMPA_H,W,ACCESS
	movwf	SYSDIVMULTA_H,ACCESS
	incf	SYSDIVMULTA,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	SYSDIVMULTA_H,F,ACCESS
;SysIntegerTempA = -SysIntegerTempB
	comf	SYSINTEGERTEMPB,W,ACCESS
	movwf	SYSINTEGERTEMPA,ACCESS
	comf	SYSINTEGERTEMPB_H,W,ACCESS
	movwf	SYSINTEGERTEMPA_H,ACCESS
	incf	SYSINTEGERTEMPA,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	SYSINTEGERTEMPA_H,F,ACCESS
;SysIntegerTempB = SysDivMultA
	movff	SYSDIVMULTA,SYSINTEGERTEMPB
	movff	SYSDIVMULTA_H,SYSINTEGERTEMPB_H
;+A
;Else
	bra	ENDIF31
ELSE31_1
;+A, -B, return false
;If SysIntegerTempB.15 = On Then
	btfsc	SYSINTEGERTEMPB_H,7,ACCESS
;Exit Sub
	return
;End If
;End If
ENDIF31
;Test High, exit if more
;movf SysIntegerTempA_H,W
	movf	SYSINTEGERTEMPA_H,W,ACCESS
;subwf SysIntegerTempB_H,W
	subwf	SYSINTEGERTEMPB_H,W,ACCESS
;btfss STATUS,C
	btfss	STATUS,C,ACCESS
;return
	return
;Test high, exit true if less
;movf SysIntegerTempB_H,W
	movf	SYSINTEGERTEMPB_H,W,ACCESS
;subwf SysIntegerTempA_H,W
	subwf	SYSINTEGERTEMPA_H,W,ACCESS
;bnc SCLTIntTrue
	bnc	SCLTINTTRUE
;Test Low, exit if more or equal
;movf SysIntegerTempB,W
	movf	SYSINTEGERTEMPB,W,ACCESS
;subwf SysIntegerTempA,W
	subwf	SYSINTEGERTEMPA,W,ACCESS
;btfsc STATUS,C
	btfsc	STATUS,C,ACCESS
;return
	return
SCLTINTTRUE
;comf SysByteTempX,F
	comf	SYSBYTETEMPX,F,ACCESS
	return

;********************************************************************************

;Source: system.h (3193)
SYSDIVSUB16
;dim SysWordTempA as word
;dim SysWordTempB as word
;dim SysWordTempX as word
;dim SysDivMultA as word
;dim SysDivMultB as word
;dim SysDivMultX as word
;SysDivMultA = SysWordTempA
	movff	SYSWORDTEMPA,SYSDIVMULTA
	movff	SYSWORDTEMPA_H,SYSDIVMULTA_H
;SysDivMultB = SysWordTempB
	movff	SYSWORDTEMPB,SYSDIVMULTB
	movff	SYSWORDTEMPB_H,SYSDIVMULTB_H
;SysDivMultX = 0
	clrf	SYSDIVMULTX,ACCESS
	clrf	SYSDIVMULTX_H,ACCESS
;Avoid division by zero
;if SysDivMultB = 0 then
	movff	SYSDIVMULTB,SysWORDTempA
	movff	SYSDIVMULTB_H,SysWORDTempA_H
	clrf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	rcall	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF5
;SysWordTempA = 0
	clrf	SYSWORDTEMPA,ACCESS
	clrf	SYSWORDTEMPA_H,ACCESS
;exit sub
	return
;end if
ENDIF5
;Main calc routine
;SysDivLoop = 16
	movlw	16
	movwf	SYSDIVLOOP,ACCESS
SYSDIV16START
;set C off
	bcf	STATUS,C,ACCESS
;Rotate SysDivMultA Left
	rlcf	SYSDIVMULTA,F,ACCESS
	rlcf	SYSDIVMULTA_H,F,ACCESS
;Rotate SysDivMultX Left
	rlcf	SYSDIVMULTX,F,ACCESS
	rlcf	SYSDIVMULTX_H,F,ACCESS
;SysDivMultX = SysDivMultX - SysDivMultB
	movf	SYSDIVMULTB,W,ACCESS
	subwf	SYSDIVMULTX,F,ACCESS
	movf	SYSDIVMULTB_H,W,ACCESS
	subwfb	SYSDIVMULTX_H,F,ACCESS
;Set SysDivMultA.0 On
	bsf	SYSDIVMULTA,0,ACCESS
;If C Off Then
	btfsc	STATUS,C,ACCESS
	bra	ENDIF6
;Set SysDivMultA.0 Off
	bcf	SYSDIVMULTA,0,ACCESS
;SysDivMultX = SysDivMultX + SysDivMultB
	movf	SYSDIVMULTB,W,ACCESS
	addwf	SYSDIVMULTX,F,ACCESS
	movf	SYSDIVMULTB_H,W,ACCESS
	addwfc	SYSDIVMULTX_H,F,ACCESS
;End If
ENDIF6
;decfsz SysDivLoop, F
	decfsz	SYSDIVLOOP, F,ACCESS
;goto SysDiv16Start
	bra	SYSDIV16START
;SysWordTempA = SysDivMultA
	movff	SYSDIVMULTA,SYSWORDTEMPA
	movff	SYSDIVMULTA_H,SYSWORDTEMPA_H
;SysWordTempX = SysDivMultX
	movff	SYSDIVMULTX,SYSWORDTEMPX
	movff	SYSDIVMULTX_H,SYSWORDTEMPX_H
	return

;********************************************************************************

;Source: system.h (3269)
SYSDIVSUB32
;dim SysLongTempA as long
;dim SysLongTempB as long
;dim SysLongTempX as long
;#ifdef PIC
;dim SysLongDivMultA as long
;dim SysLongDivMultB as long
;dim SysLongDivMultX as long
;#endif
;SysLongDivMultA = SysLongTempA
	movff	SYSLONGTEMPA,SYSLONGDIVMULTA
	movff	SYSLONGTEMPA_H,SYSLONGDIVMULTA_H
	movff	SYSLONGTEMPA_U,SYSLONGDIVMULTA_U
	movff	SYSLONGTEMPA_E,SYSLONGDIVMULTA_E
;SysLongDivMultB = SysLongTempB
	movff	SYSLONGTEMPB,SYSLONGDIVMULTB
	movff	SYSLONGTEMPB_H,SYSLONGDIVMULTB_H
	movff	SYSLONGTEMPB_U,SYSLONGDIVMULTB_U
	movff	SYSLONGTEMPB_E,SYSLONGDIVMULTB_E
;SysLongDivMultX = 0
	banksel	SYSLONGDIVMULTX
	clrf	SYSLONGDIVMULTX,BANKED
	clrf	SYSLONGDIVMULTX_H,BANKED
	clrf	SYSLONGDIVMULTX_U,BANKED
	clrf	SYSLONGDIVMULTX_E,BANKED
;Avoid division by zero
;if SysLongDivMultB = 0 then
	movff	SYSLONGDIVMULTB,SysLONGTempA
	movff	SYSLONGDIVMULTB_H,SysLONGTempA_H
	movff	SYSLONGDIVMULTB_U,SysLONGTempA_U
	movff	SYSLONGDIVMULTB_E,SysLONGTempA_E
	clrf	SysLONGTempB,ACCESS
	clrf	SysLONGTempB_H,ACCESS
	clrf	SysLONGTempB_U,ACCESS
	clrf	SysLONGTempB_E,ACCESS
	banksel	0
	rcall	SYSCOMPEQUAL32
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF7
;SysLongTempA = 0
	clrf	SYSLONGTEMPA,ACCESS
	clrf	SYSLONGTEMPA_H,ACCESS
	clrf	SYSLONGTEMPA_U,ACCESS
	clrf	SYSLONGTEMPA_E,ACCESS
;exit sub
	return
;end if
ENDIF7
;Main calc routine
;SysDivLoop = 32
	movlw	32
	movwf	SYSDIVLOOP,ACCESS
SYSDIV32START
;set C off
	bcf	STATUS,C,ACCESS
;Rotate SysLongDivMultA Left
	banksel	SYSLONGDIVMULTA
	rlcf	SYSLONGDIVMULTA,F,BANKED
	rlcf	SYSLONGDIVMULTA_H,F,BANKED
	rlcf	SYSLONGDIVMULTA_U,F,BANKED
	rlcf	SYSLONGDIVMULTA_E,F,BANKED
;Rotate SysLongDivMultX Left
	rlcf	SYSLONGDIVMULTX,F,BANKED
	rlcf	SYSLONGDIVMULTX_H,F,BANKED
	rlcf	SYSLONGDIVMULTX_U,F,BANKED
	rlcf	SYSLONGDIVMULTX_E,F,BANKED
;SysLongDivMultX = SysLongDivMultX - SysLongDivMultB
	movf	SYSLONGDIVMULTB,W,BANKED
	subwf	SYSLONGDIVMULTX,F,BANKED
	movf	SYSLONGDIVMULTB_H,W,BANKED
	subwfb	SYSLONGDIVMULTX_H,F,BANKED
	movf	SYSLONGDIVMULTB_U,W,BANKED
	subwfb	SYSLONGDIVMULTX_U,F,BANKED
	movf	SYSLONGDIVMULTB_E,W,BANKED
	subwfb	SYSLONGDIVMULTX_E,F,BANKED
;Set SysLongDivMultA.0 On
	bsf	SYSLONGDIVMULTA,0,BANKED
;If C Off Then
	btfsc	STATUS,C,ACCESS
	bra	ENDIF8
;Set SysLongDivMultA.0 Off
	bcf	SYSLONGDIVMULTA,0,BANKED
;SysLongDivMultX = SysLongDivMultX + SysLongDivMultB
	movf	SYSLONGDIVMULTB,W,BANKED
	addwf	SYSLONGDIVMULTX,F,BANKED
	movf	SYSLONGDIVMULTB_H,W,BANKED
	addwfc	SYSLONGDIVMULTX_H,F,BANKED
	movf	SYSLONGDIVMULTB_U,W,BANKED
	addwfc	SYSLONGDIVMULTX_U,F,BANKED
	movf	SYSLONGDIVMULTB_E,W,BANKED
	addwfc	SYSLONGDIVMULTX_E,F,BANKED
;End If
ENDIF8
;decfsz SysDivLoop, F
	decfsz	SYSDIVLOOP, F,ACCESS
;goto SysDiv32Start
	bra	SYSDIV32START
;SysLongTempA = SysLongDivMultA
	movff	SYSLONGDIVMULTA,SYSLONGTEMPA
	movff	SYSLONGDIVMULTA_H,SYSLONGTEMPA_H
	movff	SYSLONGDIVMULTA_U,SYSLONGTEMPA_U
	movff	SYSLONGDIVMULTA_E,SYSLONGTEMPA_E
;SysLongTempX = SysLongDivMultX
	movff	SYSLONGDIVMULTX,SYSLONGTEMPX
	movff	SYSLONGDIVMULTX_H,SYSLONGTEMPX_H
	movff	SYSLONGDIVMULTX_U,SYSLONGTEMPX_U
	movff	SYSLONGDIVMULTX_E,SYSLONGTEMPX_E
	banksel	0
	return

;********************************************************************************

;Source: system.h (3247)
SYSDIVSUBINT
;Dim SysIntegerTempA, SysIntegerTempB, SysIntegerTempX As Integer
;Dim SysSignByte As Byte
;Make both inputs positive, decide output type
;SysSignByte = SysIntegerTempA_H xor SysIntegerTempB_H
	movf	SYSINTEGERTEMPA_H,W,ACCESS
	xorwf	SYSINTEGERTEMPB_H,W,ACCESS
	movwf	SYSSIGNBYTE,ACCESS
;If SysIntegerTempA.15 Then SysIntegerTempA = -SysIntegerTempA
	btfss	SYSINTEGERTEMPA_H,7,ACCESS
	bra	ENDIF28
;If SysIntegerTempA.15 Then SysIntegerTempA = -SysIntegerTempA
	comf	SYSINTEGERTEMPA,F,ACCESS
	comf	SYSINTEGERTEMPA_H,F,ACCESS
	incf	SYSINTEGERTEMPA,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	SYSINTEGERTEMPA_H,F,ACCESS
;If SysIntegerTempA.15 Then SysIntegerTempA = -SysIntegerTempA
ENDIF28
;If SysIntegerTempB.15 Then SysIntegerTempB = -SysIntegerTempB
	btfss	SYSINTEGERTEMPB_H,7,ACCESS
	bra	ENDIF29
;If SysIntegerTempB.15 Then SysIntegerTempB = -SysIntegerTempB
	comf	SYSINTEGERTEMPB,F,ACCESS
	comf	SYSINTEGERTEMPB_H,F,ACCESS
	incf	SYSINTEGERTEMPB,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	SYSINTEGERTEMPB_H,F,ACCESS
;If SysIntegerTempB.15 Then SysIntegerTempB = -SysIntegerTempB
ENDIF29
;Call word divide routine
;SysDivSub16
	rcall	SYSDIVSUB16
;Negate result if necessary
;If SysSignByte.7 Then
	btfss	SYSSIGNBYTE,7,ACCESS
	bra	ENDIF30
;SysIntegerTempA = -SysIntegerTempA
	comf	SYSINTEGERTEMPA,F,ACCESS
	comf	SYSINTEGERTEMPA_H,F,ACCESS
	incf	SYSINTEGERTEMPA,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	SYSINTEGERTEMPA_H,F,ACCESS
;SysIntegerTempX = -SysIntegerTempX
	comf	SYSINTEGERTEMPX,F,ACCESS
	comf	SYSINTEGERTEMPX_H,F,ACCESS
	incf	SYSINTEGERTEMPX,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	SYSINTEGERTEMPX_H,F,ACCESS
;End If
ENDIF30
	return

;********************************************************************************

;Source: system.h (2663)
SYSMULTSUB16
;dim SysWordTempA as word
;dim SysWordTempB as word
;dim SysWordTempX as word
;X = LowA * LowB
;movf SysWordTempA, W
	movf	SYSWORDTEMPA, W,ACCESS
;mulwf SysWordTempB
	mulwf	SYSWORDTEMPB,ACCESS
;movff PRODL, SysWordTempX
	movff	PRODL, SYSWORDTEMPX
;movff PRODH, SysWordTempX_H
	movff	PRODH, SYSWORDTEMPX_H
;HighX += LowA * HighB
;movf SysWordTempA, W
	movf	SYSWORDTEMPA, W,ACCESS
;mulwf SysWordTempB_H
	mulwf	SYSWORDTEMPB_H,ACCESS
;movf PRODL, W
	movf	PRODL, W,ACCESS
;addwf SysWordTempX_H, F
	addwf	SYSWORDTEMPX_H, F,ACCESS
;HighX += HighA * LowB
;movf SysWordTempA_H, W
	movf	SYSWORDTEMPA_H, W,ACCESS
;mulwf SysWordTempB
	mulwf	SYSWORDTEMPB,ACCESS
;movf PRODL, W
	movf	PRODL, W,ACCESS
;addwf SysWordTempX_H, F
	addwf	SYSWORDTEMPX_H, F,ACCESS
;PRODL = HighA * HighB
;movf SysWordTempA_H, F
	movf	SYSWORDTEMPA_H, F,ACCESS
;mulwf SysWordTempB_H
	mulwf	SYSWORDTEMPB_H,ACCESS
	return

;********************************************************************************

;Source: system.h (2780)
SYSMULTSUB32
;dim SysLongTempA as long
;dim SysLongTempB as long
;dim SysLongTempX as long
;Can't use normal SysDivMult variables for 32 bit, they overlap with
;SysLongTemp variables
;dim SysLongDivMultA as long
;dim SysLongDivMultB as long
;dim SysLongDivMultX as long
;SysLongDivMultA = SysLongTempA
	movff	SYSLONGTEMPA,SYSLONGDIVMULTA
	movff	SYSLONGTEMPA_H,SYSLONGDIVMULTA_H
	movff	SYSLONGTEMPA_U,SYSLONGDIVMULTA_U
	movff	SYSLONGTEMPA_E,SYSLONGDIVMULTA_E
;SysLongDivMultB = SysLongTempB
	movff	SYSLONGTEMPB,SYSLONGDIVMULTB
	movff	SYSLONGTEMPB_H,SYSLONGDIVMULTB_H
	movff	SYSLONGTEMPB_U,SYSLONGDIVMULTB_U
	movff	SYSLONGTEMPB_E,SYSLONGDIVMULTB_E
;SysLongDivMultX = 0
	banksel	SYSLONGDIVMULTX
	clrf	SYSLONGDIVMULTX,BANKED
	clrf	SYSLONGDIVMULTX_H,BANKED
	clrf	SYSLONGDIVMULTX_U,BANKED
	clrf	SYSLONGDIVMULTX_E,BANKED
MUL32LOOP
;IF SysLongDivMultB.0 ON then SysLongDivMultX += SysLongDivMultA
	banksel	SYSLONGDIVMULTB
	btfss	SYSLONGDIVMULTB,0,BANKED
	bra	ENDIF3
;IF SysLongDivMultB.0 ON then SysLongDivMultX += SysLongDivMultA
	movf	SYSLONGDIVMULTA,W,BANKED
	addwf	SYSLONGDIVMULTX,F,BANKED
	movf	SYSLONGDIVMULTA_H,W,BANKED
	addwfc	SYSLONGDIVMULTX_H,F,BANKED
	movf	SYSLONGDIVMULTA_U,W,BANKED
	addwfc	SYSLONGDIVMULTX_U,F,BANKED
	movf	SYSLONGDIVMULTA_E,W,BANKED
	addwfc	SYSLONGDIVMULTX_E,F,BANKED
;IF SysLongDivMultB.0 ON then SysLongDivMultX += SysLongDivMultA
ENDIF3
;set STATUS.C OFF
	bcf	STATUS,C,ACCESS
;rotate SysLongDivMultB right
	rrcf	SYSLONGDIVMULTB_E,F,BANKED
	rrcf	SYSLONGDIVMULTB_U,F,BANKED
	rrcf	SYSLONGDIVMULTB_H,F,BANKED
	rrcf	SYSLONGDIVMULTB,F,BANKED
;set STATUS.C off
	bcf	STATUS,C,ACCESS
;rotate SysLongDivMultA left
	rlcf	SYSLONGDIVMULTA,F,BANKED
	rlcf	SYSLONGDIVMULTA_H,F,BANKED
	rlcf	SYSLONGDIVMULTA_U,F,BANKED
	rlcf	SYSLONGDIVMULTA_E,F,BANKED
;if SysLongDivMultB > 0 then goto MUL32LOOP
	movff	SYSLONGDIVMULTB,SysLONGTempB
	movff	SYSLONGDIVMULTB_H,SysLONGTempB_H
	movff	SYSLONGDIVMULTB_U,SysLONGTempB_U
	movff	SYSLONGDIVMULTB_E,SysLONGTempB_E
	clrf	SysLONGTempA,ACCESS
	clrf	SysLONGTempA_H,ACCESS
	clrf	SysLONGTempA_U,ACCESS
	clrf	SysLONGTempA_E,ACCESS
	banksel	0
	rcall	SYSCOMPLESSTHAN32
	btfsc	SysByteTempX,0,ACCESS
;if SysLongDivMultB > 0 then goto MUL32LOOP
	bra	MUL32LOOP
;if SysLongDivMultB > 0 then goto MUL32LOOP
;SysLongTempX = SysLongDivMultX
	movff	SYSLONGDIVMULTX,SYSLONGTEMPX
	movff	SYSLONGDIVMULTX_H,SYSLONGTEMPX_H
	movff	SYSLONGDIVMULTX_U,SYSLONGTEMPX_U
	movff	SYSLONGDIVMULTX_E,SYSLONGTEMPX_E
	return

;********************************************************************************

;Source: system.h (2761)
SYSMULTSUBINT
;Dim SysIntegerTempA, SysIntegerTempB, SysIntegerTempX As Integer
;Dim SysSignByte As Byte
;Make both inputs positive, decide output type
;SysSignByte = SysIntegerTempA_H xor SysIntegerTempB_H
	movf	SYSINTEGERTEMPA_H,W,ACCESS
	xorwf	SYSINTEGERTEMPB_H,W,ACCESS
	movwf	SYSSIGNBYTE,ACCESS
;if SysIntegerTempA.15 then SysIntegerTempA = -SysIntegerTempA
	btfss	SYSINTEGERTEMPA_H,7,ACCESS
	bra	ENDIF25
;if SysIntegerTempA.15 then SysIntegerTempA = -SysIntegerTempA
	comf	SYSINTEGERTEMPA,F,ACCESS
	comf	SYSINTEGERTEMPA_H,F,ACCESS
	incf	SYSINTEGERTEMPA,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	SYSINTEGERTEMPA_H,F,ACCESS
;if SysIntegerTempA.15 then SysIntegerTempA = -SysIntegerTempA
ENDIF25
;if SysIntegerTempB.15 then SysIntegerTempB = -SysIntegerTempB
	btfss	SYSINTEGERTEMPB_H,7,ACCESS
	bra	ENDIF26
;if SysIntegerTempB.15 then SysIntegerTempB = -SysIntegerTempB
	comf	SYSINTEGERTEMPB,F,ACCESS
	comf	SYSINTEGERTEMPB_H,F,ACCESS
	incf	SYSINTEGERTEMPB,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	SYSINTEGERTEMPB_H,F,ACCESS
;if SysIntegerTempB.15 then SysIntegerTempB = -SysIntegerTempB
ENDIF26
;Call word multiply routine
;SysMultSub16
	rcall	SYSMULTSUB16
;Negate result if necessary
;if SysSignByte.7 then SysIntegerTempX = -SysIntegerTempX
	btfss	SYSSIGNBYTE,7,ACCESS
	bra	ENDIF27
;if SysSignByte.7 then SysIntegerTempX = -SysIntegerTempX
	comf	SYSINTEGERTEMPX,F,ACCESS
	comf	SYSINTEGERTEMPX_H,F,ACCESS
	incf	SYSINTEGERTEMPX,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	SYSINTEGERTEMPX_H,F,ACCESS
;if SysSignByte.7 then SysIntegerTempX = -SysIntegerTempX
ENDIF27
	return

;********************************************************************************


 END
