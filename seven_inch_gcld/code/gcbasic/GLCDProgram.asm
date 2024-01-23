;Program compiled by GCBASIC (1.01.00 2024-01-03 (Windows 64 bit) : Build 1323) for Microchip MPASM/MPLAB-X Assembler using FreeBASIC 1.07.1/2024-01-03 CRC247
;Need help? 
;  See the GCBASIC forums at http://sourceforge.net/projects/gcbasic/forums,
;  Check the documentation and Help at http://gcbasic.sourceforge.net/help/,
;or, email us:
;   w_cholmondeley at users dot sourceforge dot net
;   evanvennn at users dot sourceforge dot net
;********************************************************************************
;   Source file    : D:\GreatCowBASICGits\Help.git\trunk\seven_inch_gcld\code\gcbasic\GLCDProgram.gcb
;   Setting file   : C:\GCstudio\gcbasic\use.ini
;   Preserve mode  : 0
;   Assembler      : GCASM
;   Programmer     : C:\GCstudio\gcbasic\..\PICKitPlus\PICKitCommandline.exe
;   Output file    : D:\GreatCowBASICGits\Help.git\trunk\seven_inch_gcld\code\gcbasic\GLCDProgram.asm
;********************************************************************************

;Set up the assembler options (Chip type, clock source, other bits and pieces)
 LIST p=18F27Q43, r=DEC
#include <P18F27Q43.inc>
 CONFIG CP = OFF, WRTSAF = OFF, WRTD = OFF, WRTB = OFF, WDTE = OFF, XINST = OFF, LVP = OFF, MVECEN = OFF, MCLRE = INTMCLR, FCMEN = ON, CLKOUTEN = OFF, RSTOSC = HFINTOSC_1MHZ, FEXTOSC = OFF

;********************************************************************************

;Set aside memory locations for variables
ABS                              EQU    1294          ; 0x50E
ABS_H                            EQU    1295          ; 0x50F
ADCVAL                           EQU    1296          ; 0x510
ADCVAL_H                         EQU    1297          ; 0x511
ADREADPORT                       EQU    1298          ; 0x512
ANGLE                            EQU    1299          ; 0x513
ANGLE_H                          EQU    1300          ; 0x514
BYTENUM                          EQU    1301          ; 0x515
BYTETOBIN                        EQU    9263          ; 0x242F
CACHE_LT7686_FILLCOLOUR          EQU    1302          ; 0x516
CACHE_LT7686_FILLCOLOUR_E        EQU    1305          ; 0x519
CACHE_LT7686_FILLCOLOUR_H        EQU    1303          ; 0x517
CACHE_LT7686_FILLCOLOUR_U        EQU    1304          ; 0x518
CACHE_LT7686_LINECOLOUR          EQU    1306          ; 0x51A
CACHE_LT7686_LINECOLOUR_E        EQU    1309          ; 0x51D
CACHE_LT7686_LINECOLOUR_H        EQU    1307          ; 0x51B
CACHE_LT7686_LINECOLOUR_U        EQU    1308          ; 0x51C
CHARCODE                         EQU    1310          ; 0x51E
CHARCOL                          EQU    1311          ; 0x51F
CHARCOLS                         EQU    1313          ; 0x521
CHARCOL_H                        EQU    1312          ; 0x520
CHARLOCX                         EQU    1314          ; 0x522
CHARLOCX_H                       EQU    1315          ; 0x523
CHARLOCY                         EQU    1316          ; 0x524
CHARLOCY_H                       EQU    1317          ; 0x525
CHARROW                          EQU    1318          ; 0x526
CHARROWS                         EQU    1320          ; 0x528
CHARROW_H                        EQU    1319          ; 0x527
COL                              EQU    1321          ; 0x529
COLORS                           EQU    1322          ; 0x52A
COLORS_H                         EQU    1323          ; 0x52B
COMPORT                          EQU    1324          ; 0x52C
COS                              EQU    1325          ; 0x52D
COS_H                            EQU    1326          ; 0x52E
CURRCHARCOL                      EQU    1327          ; 0x52F
CURRCHARROW                      EQU    1328          ; 0x530
CURRCHARVAL                      EQU    1329          ; 0x531
DELAYTEMP                        EQU    1280          ; 0x500
DELAYTEMP2                       EQU    1281          ; 0x501
DRAWCOUNT                        EQU    1330          ; 0x532
DRAWCOUNT_H                      EQU    1331          ; 0x533
FIRSTRUN                         EQU    1332          ; 0x534
GCBBUILDSTR                      EQU    9249          ; 0x2421
GCBBUILDTIMESTR                  EQU    9272          ; 0x2438
GLCDBACKGROUND                   EQU    1333          ; 0x535
GLCDBACKGROUND_E                 EQU    1336          ; 0x538
GLCDBACKGROUND_H                 EQU    1334          ; 0x536
GLCDBACKGROUND_U                 EQU    1335          ; 0x537
GLCDDEVICEHEIGHT                 EQU    1337          ; 0x539
GLCDDEVICEHEIGHT_H               EQU    1338          ; 0x53A
GLCDDEVICEWIDTH                  EQU    1339          ; 0x53B
GLCDDEVICEWIDTH_H                EQU    1340          ; 0x53C
GLCDFNTDEFAULT                   EQU    1341          ; 0x53D
GLCDFNTDEFAULTHEIGHT             EQU    1342          ; 0x53E
GLCDFNTDEFAULTSIZE               EQU    1343          ; 0x53F
GLCDFONTWIDTH                    EQU    1344          ; 0x540
GLCDFOREGROUND                   EQU    1345          ; 0x541
GLCDFOREGROUND_E                 EQU    1348          ; 0x544
GLCDFOREGROUND_H                 EQU    1346          ; 0x542
GLCDFOREGROUND_U                 EQU    1347          ; 0x543
GLCDPRINTLEN                     EQU    1349          ; 0x545
GLCDPRINTLEN_H                   EQU    1350          ; 0x546
GLCDPRINTLOC                     EQU    1351          ; 0x547
GLCDPRINTLOC_H                   EQU    1352          ; 0x548
GLCDPRINT_STRING_COUNTER         EQU    1353          ; 0x549
GLCDPRINT_STRING_COUNTER_H       EQU    1354          ; 0x54A
GLCDROTATESTATE                  EQU    1355          ; 0x54B
GLCD_INFO                        EQU    9255          ; 0x2427
GLCD_YORDINATE                   EQU    1356          ; 0x54C
GLCD_YORDINATE_H                 EQU    1357          ; 0x54D
HSERPRINTCRLFCOUNT               EQU    1358          ; 0x54E
INXRADIUS                        EQU    1359          ; 0x54F
INXRADIUS_H                      EQU    1360          ; 0x550
INYRADIUS                        EQU    1361          ; 0x551
INYRADIUS_H                      EQU    1362          ; 0x552
LCDVALUE                         EQU    1363          ; 0x553
LCDVALUE_E                       EQU    1366          ; 0x556
LCDVALUE_H                       EQU    1364          ; 0x554
LCDVALUE_U                       EQU    1365          ; 0x555
LEFT                             EQU    9374          ; 0x249E
LINECOLOUR                       EQU    1367          ; 0x557
LINECOLOUR_H                     EQU    1368          ; 0x558
LINESIZE                         EQU    1369          ; 0x559
LT7686_CHECK_INIT                EQU    1370          ; 0x55A
LT7686_CHECK_INIT_COUNTER        EQU    1371          ; 0x55B
LT7686_CHECK_INIT_FAIL           EQU    1372          ; 0x55C
LT7686_DATAREAD                  EQU    1373          ; 0x55D
LT7686_DISPLAY_COLORBAR_STATE    EQU    1374          ; 0x55E
LT7686_DISPLAY_PWM               EQU    1375          ; 0x55F
LT7686_FILLCOLOUR                EQU    1376          ; 0x560
LT7686_FILLCOLOUR_E              EQU    1379          ; 0x563
LT7686_FILLCOLOUR_H              EQU    1377          ; 0x561
LT7686_FILLCOLOUR_U              EQU    1378          ; 0x562
LT7686_INITVERIFYCOUNTER         EQU    1380          ; 0x564
LT7686_INITVERIFYCOUNTER_H       EQU    1381          ; 0x565
LT7686_LINECOLOUR                EQU    1382          ; 0x566
LT7686_LINECOLOUR_E              EQU    1385          ; 0x569
LT7686_LINECOLOUR_H              EQU    1383          ; 0x567
LT7686_LINECOLOUR_U              EQU    1384          ; 0x568
LT7686_POINTER                   EQU    1386          ; 0x56A
LT7686_POINTER_H                 EQU    1387          ; 0x56B
LT7686_STATUSREAD                EQU    1388          ; 0x56C
LT7686_STATUSREADRESULT          EQU    1389          ; 0x56D
L_CALIBRATE                      EQU    1390          ; 0x56E
L_CALIBRATE_H                    EQU    1391          ; 0x56F
L_FROMHIGH                       EQU    1392          ; 0x570
L_FROMHIGH_H                     EQU    1393          ; 0x571
L_FROMLOW                        EQU    1394          ; 0x572
L_FROMLOW_H                      EQU    1395          ; 0x573
L_MAP                            EQU    1396          ; 0x574
L_MAP_H                          EQU    1397          ; 0x575
L_SYSCALC                        EQU    1398          ; 0x576
L_SYSCALCF                       EQU    1400          ; 0x578
L_SYSCALCF_E                     EQU    1403          ; 0x57B
L_SYSCALCF_H                     EQU    1401          ; 0x579
L_SYSCALCF_U                     EQU    1402          ; 0x57A
L_SYSCALC_H                      EQU    1399          ; 0x577
L_TOHIGH                         EQU    1404          ; 0x57C
L_TOHIGH_H                       EQU    1405          ; 0x57D
L_TOLOW                          EQU    1406          ; 0x57E
L_TOLOW_H                        EQU    1407          ; 0x57F
MID                              EQU    9333          ; 0x2475
OLD_ANGLE                        EQU    1408          ; 0x580
OLD_ANGLE_H                      EQU    1409          ; 0x581
OLD_XEND                         EQU    1410          ; 0x582
OLD_XEND_H                       EQU    1411          ; 0x583
OLD_YEND                         EQU    1412          ; 0x584
OLD_YEND_H                       EQU    1413          ; 0x585
PRINTLEN                         EQU    1414          ; 0x586
PRINTLOCX                        EQU    1415          ; 0x587
PRINTLOCX_H                      EQU    1416          ; 0x588
PRINTLOCY                        EQU    1417          ; 0x589
PRINTLOCY_H                      EQU    1418          ; 0x58A
RADIUS                           EQU    1419          ; 0x58B
RADIUS_H                         EQU    1420          ; 0x58C
RANDOM                           EQU    1421          ; 0x58D
RANDOMSEED                       EQU    1422          ; 0x58E
RANDOMSEED_H                     EQU    1423          ; 0x58F
RANDOMTEMP                       EQU    1424          ; 0x590
RANDOMTEMP_H                     EQU    1425          ; 0x591
READAD                           EQU    1426          ; 0x592
REGVAL                           EQU    1427          ; 0x593
ROW                              EQU    1428          ; 0x594
RR                               EQU    1429          ; 0x595
RR2                              EQU    1431          ; 0x597
RR2_H                            EQU    1432          ; 0x598
RR_H                             EQU    1430          ; 0x596
SCALE                            EQU    1433          ; 0x599
SCALE_H                          EQU    1434          ; 0x59A
SERDATA                          EQU    1435          ; 0x59B
SIN                              EQU    1436          ; 0x59C
SIN_H                            EQU    1437          ; 0x59D
SPICLOCKMODE                     EQU    1438          ; 0x59E
SPICURRENTMODE                   EQU    1439          ; 0x59F
SPIRXDATA                        EQU    1440          ; 0x5A0
SPITXDATA                        EQU    1441          ; 0x5A1
STR                              EQU    9243          ; 0x241B
STRINGPOINTER                    EQU    1442          ; 0x5A2
STYLE                            EQU    1443          ; 0x5A3
STYLE_H                          EQU    1444          ; 0x5A4
SYSARRAYTEMP1                    EQU    1445          ; 0x5A5
SYSARRAYTEMP2                    EQU    1446          ; 0x5A6
SYSBYTETEMPA                     EQU    1285          ; 0x505
SYSBYTETEMPB                     EQU    1289          ; 0x509
SYSBYTETEMPX                     EQU    1280          ; 0x500
SYSCALCTEMPA                     EQU    1285          ; 0x505
SYSCALCTEMPA_H                   EQU    1286          ; 0x506
SYSCALCTEMPX                     EQU    1280          ; 0x500
SYSCALCTEMPX_H                   EQU    1281          ; 0x501
SYSCHARCOUNT                     EQU    1447          ; 0x5A7
SYSCHARSTART                     EQU    1448          ; 0x5A8
SYSDIVLOOP                       EQU    1284          ; 0x504
SYSDIVMULTA                      EQU    1287          ; 0x507
SYSDIVMULTA_H                    EQU    1288          ; 0x508
SYSDIVMULTB                      EQU    1291          ; 0x50B
SYSDIVMULTB_H                    EQU    1292          ; 0x50C
SYSDIVMULTX                      EQU    1282          ; 0x502
SYSDIVMULTX_H                    EQU    1283          ; 0x503
SYSFORLOOPABSVALUE2              EQU    1449          ; 0x5A9
SYSFORLOOPABSVALUE2_H            EQU    1450          ; 0x5AA
SYSFORLOOPABSVALUE4              EQU    1451          ; 0x5AB
SYSFORLOOPABSVALUE4_H            EQU    1452          ; 0x5AC
SYSFORLOOPABSVALUE5              EQU    1453          ; 0x5AD
SYSFORLOOPABSVALUE5_H            EQU    1454          ; 0x5AE
SYSFORLOOPSTEP1                  EQU    1455          ; 0x5AF
SYSFORLOOPSTEP1_H                EQU    1456          ; 0x5B0
SYSFORLOOPSTEP3                  EQU    1457          ; 0x5B1
SYSFORLOOPSTEP3_H                EQU    1458          ; 0x5B2
SYSFORLOOPSTEP4                  EQU    1459          ; 0x5B3
SYSFORLOOPSTEP4_H                EQU    1460          ; 0x5B4
SYSINTEGERTEMPA                  EQU    1285          ; 0x505
SYSINTEGERTEMPA_H                EQU    1286          ; 0x506
SYSINTEGERTEMPB                  EQU    1289          ; 0x509
SYSINTEGERTEMPB_H                EQU    1290          ; 0x50A
SYSINTEGERTEMPX                  EQU    1280          ; 0x500
SYSINTEGERTEMPX_H                EQU    1281          ; 0x501
SYSLCDPRINTDATAHANDLER           EQU    1461          ; 0x5B5
SYSLCDPRINTDATAHANDLER_H         EQU    1462          ; 0x5B6
SYSLONGDIVMULTA                  EQU    1463          ; 0x5B7
SYSLONGDIVMULTA_E                EQU    1466          ; 0x5BA
SYSLONGDIVMULTA_H                EQU    1464          ; 0x5B8
SYSLONGDIVMULTA_U                EQU    1465          ; 0x5B9
SYSLONGDIVMULTB                  EQU    1467          ; 0x5BB
SYSLONGDIVMULTB_E                EQU    1470          ; 0x5BE
SYSLONGDIVMULTB_H                EQU    1468          ; 0x5BC
SYSLONGDIVMULTB_U                EQU    1469          ; 0x5BD
SYSLONGDIVMULTX                  EQU    1471          ; 0x5BF
SYSLONGDIVMULTX_E                EQU    1474          ; 0x5C2
SYSLONGDIVMULTX_H                EQU    1472          ; 0x5C0
SYSLONGDIVMULTX_U                EQU    1473          ; 0x5C1
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
SYSPRINTDATAHANDLER              EQU    1475          ; 0x5C3
SYSPRINTDATAHANDLER_H            EQU    1476          ; 0x5C4
SYSPRINTTEMP                     EQU    1477          ; 0x5C5
SYSREPEATTEMP1                   EQU    1478          ; 0x5C6
SYSREPEATTEMP2                   EQU    1479          ; 0x5C7
SYSREPEATTEMP3                   EQU    1480          ; 0x5C8
SYSREPEATTEMP4                   EQU    1481          ; 0x5C9
SYSREPEATTEMP5                   EQU    1482          ; 0x5CA
SYSSIGNBYTE                      EQU    1293          ; 0x50D
SYSSTRDATA                       EQU    1483          ; 0x5CB
SYSSTRINGA                       EQU    1287          ; 0x507
SYSSTRINGA_H                     EQU    1288          ; 0x508
SYSSTRINGLENGTH                  EQU    1286          ; 0x506
SYSSTRINGPARAM1                  EQU    9415          ; 0x24C7
SYSSTRINGTEMP                    EQU    1484          ; 0x5CC
SYSSYSINSTRINGHANDLER            EQU    1485          ; 0x5CD
SYSSYSINSTRINGHANDLER_H          EQU    1486          ; 0x5CE
SYSTEMP1                         EQU    1487          ; 0x5CF
SYSTEMP1_E                       EQU    1490          ; 0x5D2
SYSTEMP1_H                       EQU    1488          ; 0x5D0
SYSTEMP1_U                       EQU    1489          ; 0x5D1
SYSTEMP2                         EQU    1491          ; 0x5D3
SYSTEMP2_H                       EQU    1492          ; 0x5D4
SYSTEMP3                         EQU    1493          ; 0x5D5
SYSVALTEMP                       EQU    1494          ; 0x5D6
SYSVALTEMP_H                     EQU    1495          ; 0x5D7
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
TABLELENGTH                      EQU    1496          ; 0x5D8
TABLELENGTH_H                    EQU    1497          ; 0x5D9
TABLEPOINTER                     EQU    1498          ; 0x5DA
TABLEPOINTER_H                   EQU    1499          ; 0x5DB
TEMP_LT7686                      EQU    1500          ; 0x5DC
TEMP_LT7686_H                    EQU    1501          ; 0x5DD
TRIG_ARG1                        EQU    1502          ; 0x5DE
TRIG_ARG1_H                      EQU    1503          ; 0x5DF
TRIG_ARG2                        EQU    1504          ; 0x5E0
TRIG_ARG2_H                      EQU    1505          ; 0x5E1
TRIG_I                           EQU    1506          ; 0x5E2
TRIG_REF                         EQU    1507          ; 0x5E3
TRIG_REF_H                       EQU    1508          ; 0x5E4
TRIG_SIGN                        EQU    1509          ; 0x5E5
TRIG_SIGN_H                      EQU    1510          ; 0x5E6
TRIG_VAL                         EQU    1511          ; 0x5E7
TRIG_VAL_H                       EQU    1512          ; 0x5E8
VALIDREG                         EQU    1513          ; 0x5E9
VERIFY                           EQU    1514          ; 0x5EA
VERSIONSTRING                    EQU    9292          ; 0x244C
VOLTS                            EQU    9237          ; 0x2415
WTEMP                            EQU    1515          ; 0x5EB
WTEMP_H                          EQU    1516          ; 0x5EC
XCENTRE                          EQU    1517          ; 0x5ED
XCENTRE_H                        EQU    1518          ; 0x5EE
XEND                             EQU    1519          ; 0x5EF
XEND_H                           EQU    1520          ; 0x5F0
XOFFSET1                         EQU    1521          ; 0x5F1
XOFFSET1_H                       EQU    1522          ; 0x5F2
XOFFSET2                         EQU    1523          ; 0x5F3
XOFFSET2_H                       EQU    1524          ; 0x5F4
XOFFSET3                         EQU    1525          ; 0x5F5
XOFFSET3_H                       EQU    1526          ; 0x5F6
XOFFSET4                         EQU    1527          ; 0x5F7
XOFFSET4_H                       EQU    1528          ; 0x5F8
XOFFSET5                         EQU    1529          ; 0x5F9
XOFFSET5_H                       EQU    1530          ; 0x5FA
XTEMP                            EQU    1531          ; 0x5FB
XTEMP_H                          EQU    1532          ; 0x5FC
XX                               EQU    1533          ; 0x5FD
XX1                              EQU    1535          ; 0x5FF
XX1_H                            EQU    1536          ; 0x600
XX3                              EQU    1537          ; 0x601
XX3_H                            EQU    1538          ; 0x602
XX4                              EQU    1539          ; 0x603
XX4_H                            EQU    1540          ; 0x604
XXLOOP                           EQU    1541          ; 0x605
XX_H                             EQU    1534          ; 0x5FE
YCENTRE                          EQU    1542          ; 0x606
YCENTRE_H                        EQU    1543          ; 0x607
YEND                             EQU    1544          ; 0x608
YEND_H                           EQU    1545          ; 0x609
YOFFSET1                         EQU    1546          ; 0x60A
YOFFSET1_H                       EQU    1547          ; 0x60B
YOFFSET2                         EQU    1548          ; 0x60C
YOFFSET2_H                       EQU    1549          ; 0x60D
YOFFSET3                         EQU    1550          ; 0x60E
YOFFSET3_H                       EQU    1551          ; 0x60F
YOFFSET4                         EQU    1552          ; 0x610
YOFFSET4_H                       EQU    1553          ; 0x611
YOFFSET5                         EQU    1554          ; 0x612
YOFFSET5_H                       EQU    1555          ; 0x613
YTEMP                            EQU    1556          ; 0x614
YTEMP_H                          EQU    1557          ; 0x615
YY                               EQU    1558          ; 0x616
YY1                              EQU    1560          ; 0x618
YY1OOP                           EQU    1562          ; 0x61A
YY1OOP_H                         EQU    1563          ; 0x61B
YY1_H                            EQU    1561          ; 0x619
YY3                              EQU    1564          ; 0x61C
YY3_H                            EQU    1565          ; 0x61D
YY4                              EQU    1566          ; 0x61E
YY4_H                            EQU    1567          ; 0x61F
YY_H                             EQU    1559          ; 0x617
ZL                               EQU    1568          ; 0x620
ZL_H                             EQU    1569          ; 0x621
ZZ                               EQU    1570          ; 0x622
ZZ_H                             EQU    1571          ; 0x623
_ALIGNMENT                       EQU    1572          ; 0x624
_CHROMAKEY                       EQU    1573          ; 0x625
_FONTSIZE                        EQU    1574          ; 0x626
_HEXPICAS                        EQU    9233          ; 0x2411
_INXRADIUS                       EQU    1575          ; 0x627
_INXRADIUS_H                     EQU    1576          ; 0x628
_INYRADIUS                       EQU    1577          ; 0x629
_INYRADIUS_H                     EQU    1578          ; 0x62A
_TEMP_LT7686                     EQU    1579          ; 0x62B
_WOFFSET                         EQU    1580          ; 0x62C
_WOFFSET_H                       EQU    1581          ; 0x62D
_XOFFSET1                        EQU    1582          ; 0x62E
_XOFFSET1_H                      EQU    1583          ; 0x62F
_XOFFSET2                        EQU    1584          ; 0x630
_XOFFSET2_H                      EQU    1585          ; 0x631
_XOFFSET3                        EQU    1586          ; 0x632
_XOFFSET3_H                      EQU    1587          ; 0x633
_XOFFSET4                        EQU    1588          ; 0x634
_XOFFSET4_H                      EQU    1589          ; 0x635
_XOFFSET5                        EQU    1590          ; 0x636
_XOFFSET5_H                      EQU    1591          ; 0x637
_XOFFSET6                        EQU    1592          ; 0x638
_XOFFSET6_H                      EQU    1593          ; 0x639
_XWIDTHMAG                       EQU    1594          ; 0x63A
_YHEIGHTMAG                      EQU    1595          ; 0x63B
_YOFFSET1                        EQU    1596          ; 0x63C
_YOFFSET1_H                      EQU    1597          ; 0x63D
_YOFFSET2                        EQU    1598          ; 0x63E
_YOFFSET2_H                      EQU    1599          ; 0x63F
_YOFFSET3                        EQU    1600          ; 0x640
_YOFFSET3_H                      EQU    1601          ; 0x641
_YOFFSET4                        EQU    1602          ; 0x642
_YOFFSET4_H                      EQU    1603          ; 0x643
_YOFFSET5                        EQU    1604          ; 0x644
_YOFFSET5_H                      EQU    1605          ; 0x645
_YOFFSET6                        EQU    1606          ; 0x646
_YOFFSET6_H                      EQU    1607          ; 0x647
_ZOFFSET                         EQU    1608          ; 0x648
_ZOFFSET_H                       EQU    1609          ; 0x649
__LT7686_FBUFFER                 EQU    1610          ; 0x64A
__LT7686_OUTBUFFER               EQU    1611          ; 0x64B
__OUTBYTE                        EQU    1612          ; 0x64C
__SET_LT7686_LINECOLOUR          EQU    1613          ; 0x64D
__SET_LT7686_LINECOLOUR_E        EQU    1616          ; 0x650
__SET_LT7686_LINECOLOUR_H        EQU    1614          ; 0x64E
__SET_LT7686_LINECOLOUR_U        EQU    1615          ; 0x64F
__TEMP_LT7686                    EQU    1617          ; 0x651

;********************************************************************************

;Alias variables
AFSR0 EQU 1257
AFSR0_H EQU 1258
LASTLT7686_CMD EQU 1340
LT7686_INITDATA EQU 1337
LT7686_INITLENGTH EQU 1345
LT7686_INITLENGTH_H EQU 1346
OLDLT7686_INITDATA EQU 1338
SYSLEFT_0 EQU 9374
SYSMID_0 EQU 9333
SYSREADADBYTE EQU 1426
SYSSCALEINTEGER EQU 1433
SYSSCALEINTEGER_H EQU 1434
SYSSCALEWORD EQU 1433
SYSSCALEWORD_H EQU 1434
SYSSTR_0 EQU 9243
SYS_HEXPICAS_0 EQU 9233
SYS_HEXPICAS_1 EQU 9234
SYS_HEXPICAS_2 EQU 9235
TIMER0 EQU 792

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
	call	INITSYS
	call	INITPPS
	call	INITUSART
	call	INITGLCD_ILI9341
	call	INITGLCD_LT7686
	call	INITRANDOM

;Start of the main program
;#insert "009_GLCDProgram.gcb"    // Tests lots of primitives
	call	FN_GCBBUILDSTR
	lfsr	1,VERSIONSTRING
	clrf	SysStringLength,ACCESS
	movlw	low StringTable3
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable3
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable3
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,GCBBUILDSTR
	call	SYSCOPYSTRINGPART
	lfsr	0,VERSIONSTRING
	movff	SysStringLength, INDF0
	call	FN_GCBBUILDTIMESTR
	lfsr	1,VERSIONSTRING
	clrf	SysStringLength,ACCESS
	lfsr	0,VERSIONSTRING
	call	SYSCOPYSTRINGPART
	movlw	low StringTable4
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable4
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable4
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,GCBBUILDTIMESTR
	call	SYSCOPYSTRINGPART
	lfsr	0,VERSIONSTRING
	movff	SysStringLength, INDF0
	movlw	1
	movwf	HSERPRINTCRLFCOUNT,ACCESS
	movlw	1
	movwf	COMPORT,ACCESS
	call	HSERPRINTCRLF
	lfsr	1,SYSSTRINGPARAM1
	clrf	SysStringLength,ACCESS
	movlw	low StringTable5
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable5
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable5
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,VERSIONSTRING
	call	SYSCOPYSTRINGPART
	lfsr	0,SYSSTRINGPARAM1
	movff	SysStringLength, INDF0
	movlw	low SYSSTRINGPARAM1
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
	banksel	0
	call	HSERPRINTSTRINGCRLF
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable6
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable6
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable6
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
	banksel	0
	call	HSERPRINT895
	movlw	1
	movwf	HSERPRINTCRLFCOUNT,ACCESS
	movlw	1
	movwf	COMPORT,ACCESS
	call	HSERPRINTCRLF
	movff	LT7686_STATUSREADRESULT,BYTENUM
	call	FN_BYTETOBIN
	lfsr	1,SYSSTRINGPARAM1
	clrf	SysStringLength,ACCESS
	movlw	low StringTable7
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable7
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable7
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,BYTETOBIN
	call	SYSCOPYSTRINGPART
	lfsr	0,SYSSTRINGPARAM1
	movff	SysStringLength, INDF0
	movlw	low SYSSTRINGPARAM1
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
	banksel	0
	call	HSERPRINT895
	movlw	1
	movwf	HSERPRINTCRLFCOUNT,ACCESS
	movlw	1
	movwf	COMPORT,ACCESS
	call	HSERPRINTCRLF
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable8
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable8
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable8
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
	banksel	0
	call	HSERPRINT895
	movlw	2
	movwf	HSERPRINTCRLFCOUNT,ACCESS
	movlw	1
	movwf	COMPORT,ACCESS
	call	HSERPRINTCRLF
	movff	LT7686_INITVERIFYCOUNTER,SYSVALTEMP
	banksel	SYSVALTEMP_H
	clrf	SYSVALTEMP_H,BANKED
	banksel	0
	call	FN_STR
	lfsr	1,SYSSTRINGPARAM1
	clrf	SysStringLength,ACCESS
	movlw	low StringTable9
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable9
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable9
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,STR
	call	SYSCOPYSTRINGPART
	lfsr	0,SYSSTRINGPARAM1
	movff	SysStringLength, INDF0
	movlw	low SYSSTRINGPARAM1
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
	banksel	0
	call	HSERPRINTSTRINGCRLF
	movlw	1
	movwf	HSERPRINTCRLFCOUNT,ACCESS
	movlw	1
	movwf	COMPORT,ACCESS
	call	HSERPRINTCRLF
	movff	SLRCONA,SYSVALTEMP
	call	FN__HEXPICAS
	lfsr	1,SYSSTRINGPARAM1
	clrf	SysStringLength,ACCESS
	movlw	low StringTable10
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable10
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable10
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,_HEXPICAS
	call	SYSCOPYSTRINGPART
	lfsr	0,SYSSTRINGPARAM1
	movff	SysStringLength, INDF0
	movlw	low SYSSTRINGPARAM1
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
	banksel	0
	call	HSERPRINT895
	movff	SLRCONB,SYSVALTEMP
	call	FN__HEXPICAS
	lfsr	1,SYSSTRINGPARAM1
	clrf	SysStringLength,ACCESS
	movlw	low StringTable11
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable11
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable11
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,_HEXPICAS
	call	SYSCOPYSTRINGPART
	lfsr	0,SYSSTRINGPARAM1
	movff	SysStringLength, INDF0
	movlw	low SYSSTRINGPARAM1
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
	banksel	0
	call	HSERPRINT895
	movff	SLRCONC,SYSVALTEMP
	call	FN__HEXPICAS
	lfsr	1,SYSSTRINGPARAM1
	clrf	SysStringLength,ACCESS
	movlw	low StringTable12
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable12
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable12
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,_HEXPICAS
	call	SYSCOPYSTRINGPART
	lfsr	0,SYSSTRINGPARAM1
	movff	SysStringLength, INDF0
	movlw	low SYSSTRINGPARAM1
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
	banksel	0
	call	HSERPRINT895
	movlw	2
	movwf	HSERPRINTCRLFCOUNT,ACCESS
	movlw	1
	movwf	COMPORT,ACCESS
	call	HSERPRINTCRLF
	movlw	1
	movwf	HSERPRINTCRLFCOUNT,ACCESS
	movlw	1
	movwf	COMPORT,ACCESS
	call	HSERPRINTCRLF
	banksel	XXLOOP
	clrf	XXLOOP,BANKED
SysForLoop1
	incf	XXLOOP,F,BANKED
	banksel	TABLEPOINTER
	clrf	TABLEPOINTER,BANKED
	clrf	TABLEPOINTER_H,BANKED
	clrf	VALIDREG,BANKED
	movlw	161
	movwf	TABLELENGTH,BANKED
	movlw	1
	movwf	TABLELENGTH_H,BANKED
	movlw	3
	banksel	YY1OOP
	movwf	YY1OOP,BANKED
	clrf	YY1OOP_H,BANKED
SysForLoop2
;Init SysForLoopStep1 :#0
	movlw	4
	banksel	SYSFORLOOPSTEP1
	movwf	SysForLoopStep1,BANKED
	clrf	SysForLoopStep1_H,BANKED
	movff	YY1OOP,SYSSTRINGA
	movff	YY1OOP_H,SYSSTRINGA_H
	banksel	0
	call	LT7686_INITTFT_DATASET_800_480
	banksel	VERIFY
	movwf	VERIFY,BANKED
	banksel	XXLOOP
	movf	XXLOOP,W,BANKED
	banksel	VERIFY
	subwf	VERIFY,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	ENDIF1
	movlw	2
	banksel	YY1OOP
	addwf	YY1OOP,W,BANKED
	movwf	SYSSTRINGA,ACCESS
	movlw	0
	addwfc	YY1OOP_H,W,BANKED
	movwf	SYSSTRINGA_H,ACCESS
	banksel	0
	call	LT7686_INITTFT_DATASET_800_480
	banksel	VERIFY
	movwf	VERIFY,BANKED
	movlw	1
	movwf	VALIDREG,BANKED
	bra	SysForLoopEnd2
ENDIF1
	btfss	SYSFORLOOPSTEP1_H,7,BANKED
	bra	ELSE2_1
	comf	SYSFORLOOPSTEP1,W,BANKED
	movwf	SysForLoopABsValue2,BANKED
	comf	SYSFORLOOPSTEP1_H,W,BANKED
	movwf	SysForLoopABsValue2_H,BANKED
	incf	SysForLoopABsValue2,F,BANKED
	btfsc	STATUS,Z,ACCESS
	incf	SysForLoopABsValue2_H,F,BANKED
	movf	TABLELENGTH,W,BANKED
	banksel	YY1OOP
	subwf	YY1OOP,W,BANKED
	banksel	SYSTEMP1
	movwf	SysTemp1,BANKED
	movf	TABLELENGTH_H,W,BANKED
	banksel	YY1OOP_H
	subwfb	YY1OOP_H,W,BANKED
	banksel	SYSTEMP1_H
	movwf	SysTemp1_H,BANKED
	movff	SysTemp1,SysWORDTempA
	movff	SysTemp1_H,SysWORDTempA_H
	movff	SYSFORLOOPABSVALUE2,SysWORDTempB
	movff	SYSFORLOOPABSVALUE2_H,SysWORDTempB_H
	banksel	0
	call	SYSCOMPLESSTHAN16
	comf	SysByteTempX,F,ACCESS
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF22
	banksel	SYSFORLOOPSTEP1
	movf	SysForLoopStep1,W,BANKED
	banksel	YY1OOP
	addwf	YY1OOP,F,BANKED
	banksel	SYSFORLOOPSTEP1_H
	movf	SysForLoopStep1_H,W,BANKED
	banksel	YY1OOP_H
	addwfc	YY1OOP_H,F,BANKED
	bra	SysForLoop2
ENDIF22
	bra	ENDIF2
ELSE2_1
	banksel	YY1OOP
	movf	YY1OOP,W,BANKED
	banksel	TABLELENGTH
	subwf	TABLELENGTH,W,BANKED
	movwf	SysTemp1,BANKED
	banksel	YY1OOP_H
	movf	YY1OOP_H,W,BANKED
	banksel	TABLELENGTH_H
	subwfb	TABLELENGTH_H,W,BANKED
	movwf	SysTemp1_H,BANKED
	movff	SysTemp1,SysWORDTempA
	movff	SysTemp1_H,SysWORDTempA_H
	movff	SYSFORLOOPSTEP1,SysWORDTempB
	movff	SYSFORLOOPSTEP1_H,SysWORDTempB_H
	banksel	0
	call	SYSCOMPLESSTHAN16
	comf	SysByteTempX,F,ACCESS
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF23
	banksel	SYSFORLOOPSTEP1
	movf	SysForLoopStep1,W,BANKED
	banksel	YY1OOP
	addwf	YY1OOP,F,BANKED
	banksel	SYSFORLOOPSTEP1_H
	movf	SysForLoopStep1_H,W,BANKED
	banksel	YY1OOP_H
	addwfc	YY1OOP_H,F,BANKED
	bra	SysForLoop2
ENDIF23
ENDIF2
SysForLoopEnd2
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable13
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable13
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable13
	movwf	TBLPTRU,ACCESS
	banksel	0
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
	banksel	0
	call	HSERPRINT895
	movff	XXLOOP,__OUTBYTE
	call	LT7686_WRITECMD
	movff	XXLOOP,SYSVALTEMP
	call	FN__HEXPICAS
	movlw	low _HEXPICAS
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high _HEXPICAS
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
	banksel	0
	call	HSERPRINT895
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable14
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable14
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable14
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
	banksel	0
	call	HSERPRINT895
	call	FN_LT7686_DATAREAD
	movff	LT7686_DATAREAD,REGVAL
	movff	REGVAL,SYSVALTEMP
	call	FN__HEXPICAS
	movlw	low _HEXPICAS
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high _HEXPICAS
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
	banksel	0
	call	HSERPRINT895
	movff	REGVAL,SysBYTETempA
	movff	VERIFY,SysBYTETempB
	call	SYSCOMPEQUAL
	comf	SysByteTempX,F,ACCESS
	movff	SysByteTempX,SysTemp1
	movff	VALIDREG,SysBYTETempA
	movlw	1
	movwf	SysBYTETempB,ACCESS
	call	SYSCOMPEQUAL
	banksel	SYSTEMP1
	movf	SysTemp1,W,BANKED
	andwf	SysByteTempX,W,ACCESS
	movwf	SysTemp2,BANKED
	btfss	SysTemp2,0,BANKED
	bra	ELSE3_1
SysSelect1Case1
	movlw	18
	banksel	XXLOOP
	subwf	XXLOOP,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelect1Case2
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable15
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable15
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable15
	movwf	TBLPTRU,ACCESS
	banksel	0
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
	banksel	0
	call	HSERPRINT895
	movff	VERIFY,SYSVALTEMP
	call	FN__HEXPICAS
	lfsr	1,SYSSTRINGPARAM1
	clrf	SysStringLength,ACCESS
	movlw	low StringTable16
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable16
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable16
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,_HEXPICAS
	call	SYSCOPYSTRINGPART
	lfsr	0,SYSSTRINGPARAM1
	movff	SysStringLength, INDF0
	movlw	low SYSSTRINGPARAM1
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
	banksel	0
	call	HSERPRINT895
	bra	SysSelectEnd1
SysSelect1Case2
	movlw	108
	subwf	XXLOOP,W,BANKED
	btfss	STATUS, C,ACCESS
	bra	SysSelect1Case3
	movf	XXLOOP,W,BANKED
	sublw	111
	btfss	STATUS, C,ACCESS
	bra	SysSelect1Case3
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable17
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable17
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable17
	movwf	TBLPTRU,ACCESS
	banksel	0
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
	banksel	0
	call	HSERPRINT895
	movff	VERIFY,SYSVALTEMP
	call	FN__HEXPICAS
	lfsr	1,SYSSTRINGPARAM1
	clrf	SysStringLength,ACCESS
	movlw	low StringTable16
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable16
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable16
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,_HEXPICAS
	call	SYSCOPYSTRINGPART
	lfsr	0,SYSSTRINGPARAM1
	movff	SysStringLength, INDF0
	movlw	low SYSSTRINGPARAM1
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
	banksel	0
	call	HSERPRINT895
	bra	SysSelectEnd1
SysSelect1Case3
	movlw	138
	subwf	XXLOOP,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelect1Case4
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable18
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable18
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable18
	movwf	TBLPTRU,ACCESS
	banksel	0
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
	banksel	0
	call	HSERPRINT895
	movff	VERIFY,SYSVALTEMP
	call	FN__HEXPICAS
	lfsr	1,SYSSTRINGPARAM1
	clrf	SysStringLength,ACCESS
	movlw	low StringTable16
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable16
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable16
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,_HEXPICAS
	call	SYSCOPYSTRINGPART
	lfsr	0,SYSSTRINGPARAM1
	movff	SysStringLength, INDF0
	movlw	low SYSSTRINGPARAM1
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
	banksel	0
	call	HSERPRINT895
	bra	SysSelectEnd1
SysSelect1Case4
	movlw	142
	subwf	XXLOOP,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelect1Case5
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable19
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable19
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable19
	movwf	TBLPTRU,ACCESS
	banksel	0
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
	banksel	0
	call	HSERPRINT895
	movff	VERIFY,SYSVALTEMP
	call	FN__HEXPICAS
	lfsr	1,SYSSTRINGPARAM1
	clrf	SysStringLength,ACCESS
	movlw	low StringTable16
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable16
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable16
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,_HEXPICAS
	call	SYSCOPYSTRINGPART
	lfsr	0,SYSSTRINGPARAM1
	movff	SysStringLength, INDF0
	movlw	low SYSSTRINGPARAM1
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
	banksel	0
	call	HSERPRINT895
	bra	SysSelectEnd1
SysSelect1Case5
	movlw	170
	subwf	XXLOOP,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelect1Case6
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable20
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable20
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable20
	movwf	TBLPTRU,ACCESS
	banksel	0
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
	banksel	0
	call	HSERPRINT895
	bra	SysSelectEnd1
SysSelect1Case6
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable21
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable21
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable21
	movwf	TBLPTRU,ACCESS
	banksel	0
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
	banksel	0
	call	HSERPRINT895
	movff	VERIFY,SYSVALTEMP
	call	FN__HEXPICAS
	lfsr	1,SYSSTRINGPARAM1
	clrf	SysStringLength,ACCESS
	movlw	low StringTable16
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable16
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable16
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,_HEXPICAS
	call	SYSCOPYSTRINGPART
	lfsr	0,SYSSTRINGPARAM1
	movff	SysStringLength, INDF0
	movlw	low SYSSTRINGPARAM1
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
	banksel	0
	call	HSERPRINT895
SysSelectEnd1
	bra	ENDIF3
ELSE3_1
	decf	VALIDREG,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	ENDIF3
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable22
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable22
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable22
	movwf	TBLPTRU,ACCESS
	banksel	0
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
	banksel	0
	call	HSERPRINT895
	movff	VERIFY,SYSVALTEMP
	call	FN__HEXPICAS
	movlw	low _HEXPICAS
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high _HEXPICAS
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
	banksel	0
	call	HSERPRINT895
ENDIF3
	banksel	VALIDREG
	movf	VALIDREG,F,BANKED
	btfss	STATUS, Z,ACCESS
	bra	ENDIF4
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable20
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable20
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable20
	movwf	TBLPTRU,ACCESS
	banksel	0
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
	banksel	0
	call	HSERPRINT895
ENDIF4
	movlw	1
	movwf	HSERPRINTCRLFCOUNT,ACCESS
	movlw	1
	movwf	COMPORT,ACCESS
	banksel	0
	call	HSERPRINTCRLF
	movlw	255
	banksel	XXLOOP
	subwf	XXLOOP,W,BANKED
	btfss	STATUS, C,ACCESS
	bra	SysForLoop1
SysForLoopEnd1
	movlw	25
	banksel	STYLE
	movwf	STYLE,BANKED
	clrf	STYLE_H,BANKED
	movff	GLCDDEVICEWIDTH,SYSVALTEMP
	movff	GLCDDEVICEWIDTH_H,SYSVALTEMP_H
	banksel	0
	call	FN_STR
	lfsr	1,GLCD_INFO
	clrf	SysStringLength,ACCESS
	lfsr	0,STR
	call	SYSCOPYSTRINGPART
	movlw	low StringTable23
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable23
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable23
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,GLCD_INFO
	movff	SysStringLength, INDF0
	movff	GLCDDEVICEHEIGHT,SYSVALTEMP
	movff	GLCDDEVICEHEIGHT_H,SYSVALTEMP_H
	call	FN_STR
	lfsr	1,GLCD_INFO
	clrf	SysStringLength,ACCESS
	lfsr	0,GLCD_INFO
	call	SYSCOPYSTRINGPART
	lfsr	0,STR
	call	SYSCOPYSTRINGPART
	lfsr	0,GLCD_INFO
	movff	SysStringLength, INDF0
	movlw	16
	banksel	_FONTSIZE
	movwf	_FONTSIZE,BANKED
	movlw	1
	movwf	_XWIDTHMAG,BANKED
	movlw	1
	movwf	_YHEIGHTMAG,BANKED
	movlw	1
	movwf	_CHROMAKEY,BANKED
	movlw	1
	movwf	_ALIGNMENT,BANKED
	banksel	0
	call	LT7686_SELECT_INTERNAL_FONT_INIT
	banksel	_XOFFSET1
	clrf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	clrf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable24
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable24
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable24
	movwf	TBLPTRU,ACCESS
	banksel	0
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSLCDPRINTDATAHANDLER
	movwf	SysLCDPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysLCDPRINTDATAHandler_H,BANKED
	setf	LT7686_LINECOLOUR,BANKED
	setf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LT7686_PRINT_INTERNAL_FONT556
	banksel	_XOFFSET1
	clrf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	movlw	16
	movwf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
	movlw	low GLCD_INFO
	banksel	SYSLCDPRINTDATAHANDLER
	movwf	SysLCDPRINTDATAHandler,BANKED
	movlw	high GLCD_INFO
	movwf	SysLCDPRINTDATAHandler_H,BANKED
	movlw	224
	movwf	LT7686_LINECOLOUR,BANKED
	setf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LT7686_PRINT_INTERNAL_FONT556
	movlw	32
	banksel	_FONTSIZE
	movwf	_FONTSIZE,BANKED
	movlw	4
	movwf	_XWIDTHMAG,BANKED
	movlw	4
	movwf	_YHEIGHTMAG,BANKED
	movlw	1
	movwf	_CHROMAKEY,BANKED
	movlw	1
	movwf	_ALIGNMENT,BANKED
	banksel	0
	call	LT7686_SELECT_INTERNAL_FONT_INIT
	movlw	200
	banksel	_XOFFSET1
	movwf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	movlw	200
	movwf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable25
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable25
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable25
	movwf	TBLPTRU,ACCESS
	banksel	0
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSLCDPRINTDATAHANDLER
	movwf	SysLCDPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysLCDPRINTDATAHandler_H,BANKED
	setf	LT7686_LINECOLOUR,BANKED
	setf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LT7686_PRINT_INTERNAL_FONT556
	movlw	16
	banksel	_FONTSIZE
	movwf	_FONTSIZE,BANKED
	movlw	1
	movwf	_XWIDTHMAG,BANKED
	movlw	1
	movwf	_YHEIGHTMAG,BANKED
	movlw	1
	movwf	_CHROMAKEY,BANKED
	movlw	1
	movwf	_ALIGNMENT,BANKED
	banksel	0
	call	LT7686_SELECT_INTERNAL_FONT_INIT
	movlw	200
	banksel	_XOFFSET1
	movwf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	movlw	84
	movwf	_YOFFSET1,BANKED
	movlw	1
	movwf	_YOFFSET1_H,BANKED
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable26
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable26
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable26
	movwf	TBLPTRU,ACCESS
	banksel	0
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSLCDPRINTDATAHANDLER
	movwf	SysLCDPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysLCDPRINTDATAHandler_H,BANKED
	setf	LT7686_LINECOLOUR,BANKED
	setf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LT7686_PRINT_INTERNAL_FONT556
	movlw	200
	banksel	_XOFFSET1
	movwf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	movlw	104
	movwf	_YOFFSET1,BANKED
	movlw	1
	movwf	_YOFFSET1_H,BANKED
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable191
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable191
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable191
	movwf	TBLPTRU,ACCESS
	banksel	0
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSLCDPRINTDATAHANDLER
	movwf	SysLCDPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysLCDPRINTDATAHandler_H,BANKED
	setf	LT7686_LINECOLOUR,BANKED
	setf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LT7686_PRINT_INTERNAL_FONT556
	movlw	200
	banksel	_XOFFSET1
	movwf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	movlw	124
	movwf	_YOFFSET1,BANKED
	movlw	1
	movwf	_YOFFSET1_H,BANKED
	movlw	229
	banksel	SYSVALTEMP
	movwf	SYSVALTEMP,BANKED
	movlw	62
	movwf	SYSVALTEMP_H,BANKED
	banksel	0
	call	FN_STR
	lfsr	1,SYSSTRINGPARAM1
	clrf	SysStringLength,ACCESS
	movlw	low StringTable28
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable28
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable28
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,STR
	call	SYSCOPYSTRINGPART
	lfsr	0,SYSSTRINGPARAM1
	movff	SysStringLength, INDF0
	movlw	low SYSSTRINGPARAM1
	banksel	SYSLCDPRINTDATAHANDLER
	movwf	SysLCDPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysLCDPRINTDATAHandler_H,BANKED
	setf	LT7686_LINECOLOUR,BANKED
	setf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LT7686_PRINT_INTERNAL_FONT556
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	clrf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	ELSE6_1
	movlw	120
	banksel	PRINTLOCX
	movwf	PRINTLOCX,BANKED
	movlw	2
	movwf	PRINTLOCX_H,BANKED
	clrf	PRINTLOCY,BANKED
	clrf	PRINTLOCY_H,BANKED
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable29
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable29
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable29
	movwf	TBLPTRU,ACCESS
	banksel	0
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSLCDPRINTDATAHANDLER
	movwf	SysLCDPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysLCDPRINTDATAHandler_H,BANKED
	movlw	224
	movwf	LINECOLOUR,ACCESS
	setf	LINECOLOUR_H,ACCESS
	banksel	0
	call	GLCDPRINT8
	movlw	5
	movwf	SysWaitTempS,ACCESS
	call	Delay_S
	bra	ENDIF6
ELSE6_1
	movlw	1
	movwf	SysWaitTempS,ACCESS
	call	Delay_S
ENDIF6
	call	GLCDCLS_LT7686
	clrf	DRAWCOUNT,ACCESS
	clrf	DRAWCOUNT_H,ACCESS
SysDoLoop_S1
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	15
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPLESSTHAN16
	btfss	SysByteTempX,0,ACCESS
	bra	ELSE7_1
	call	FN_RANDOM
	movff	RANDOM,L_MAP
	banksel	L_MAP_H
	clrf	L_MAP_H,BANKED
	clrf	L_FROMLOW,BANKED
	clrf	L_FROMLOW_H,BANKED
	setf	L_FROMHIGH,BANKED
	clrf	L_FROMHIGH_H,BANKED
	clrf	L_TOLOW,BANKED
	clrf	L_TOLOW_H,BANKED
	movlw	1
	subwf	GLCDDEVICEWIDTH,W,ACCESS
	movwf	L_TOHIGH,BANKED
	movlw	0
	subwfb	GLCDDEVICEWIDTH_H,W,ACCESS
	movwf	L_TOHIGH_H,BANKED
	clrf	L_CALIBRATE,BANKED
	clrf	L_CALIBRATE_H,BANKED
	banksel	0
	call	FN_SCALE658
	movff	SYSSCALEWORD,XX
	movff	SYSSCALEWORD_H,XX_H
	call	FN_RANDOM
	movff	RANDOM,L_MAP
	banksel	L_MAP_H
	clrf	L_MAP_H,BANKED
	clrf	L_FROMLOW,BANKED
	clrf	L_FROMLOW_H,BANKED
	setf	L_FROMHIGH,BANKED
	clrf	L_FROMHIGH_H,BANKED
	clrf	L_TOLOW,BANKED
	clrf	L_TOLOW_H,BANKED
	movlw	1
	subwf	GLCDDEVICEWIDTH,W,ACCESS
	movwf	SysTemp1,BANKED
	movlw	0
	subwfb	GLCDDEVICEWIDTH_H,W,ACCESS
	movwf	SysTemp1_H,BANKED
	movf	XX,W,BANKED
	subwf	SysTemp1,W,BANKED
	movwf	L_TOHIGH,BANKED
	movf	XX_H,W,BANKED
	subwfb	SysTemp1_H,W,BANKED
	movwf	L_TOHIGH_H,BANKED
	clrf	L_CALIBRATE,BANKED
	clrf	L_CALIBRATE_H,BANKED
	banksel	0
	call	FN_SCALE658
	movff	SYSSCALEWORD,XX1
	movff	SYSSCALEWORD_H,XX1_H
	banksel	XX1
	movf	XX1,W,BANKED
	addwf	XX,W,BANKED
	movwf	XX1,BANKED
	banksel	XX1_H
	movf	XX1_H,W,BANKED
	banksel	XX_H
	addwfc	XX_H,W,BANKED
	banksel	XX1_H
	movwf	XX1_H,BANKED
	banksel	0
	call	FN_RANDOM
	movff	RANDOM,L_MAP
	banksel	L_MAP_H
	clrf	L_MAP_H,BANKED
	clrf	L_FROMLOW,BANKED
	clrf	L_FROMLOW_H,BANKED
	setf	L_FROMHIGH,BANKED
	clrf	L_FROMHIGH_H,BANKED
	clrf	L_TOLOW,BANKED
	clrf	L_TOLOW_H,BANKED
	movlw	1
	subwf	GLCDDEVICEHEIGHT,W,ACCESS
	movwf	L_TOHIGH,BANKED
	movlw	0
	subwfb	GLCDDEVICEHEIGHT_H,W,ACCESS
	movwf	L_TOHIGH_H,BANKED
	clrf	L_CALIBRATE,BANKED
	clrf	L_CALIBRATE_H,BANKED
	banksel	0
	call	FN_SCALE658
	movff	SYSSCALEWORD,YY
	movff	SYSSCALEWORD_H,YY_H
	call	FN_RANDOM
	movff	RANDOM,L_MAP
	banksel	L_MAP_H
	clrf	L_MAP_H,BANKED
	clrf	L_FROMLOW,BANKED
	clrf	L_FROMLOW_H,BANKED
	setf	L_FROMHIGH,BANKED
	clrf	L_FROMHIGH_H,BANKED
	clrf	L_TOLOW,BANKED
	clrf	L_TOLOW_H,BANKED
	movlw	1
	subwf	GLCDDEVICEHEIGHT,W,ACCESS
	movwf	SysTemp1,BANKED
	movlw	0
	subwfb	GLCDDEVICEHEIGHT_H,W,ACCESS
	movwf	SysTemp1_H,BANKED
	banksel	YY
	movf	YY,W,BANKED
	banksel	SYSTEMP1
	subwf	SysTemp1,W,BANKED
	movwf	L_TOHIGH,BANKED
	banksel	YY_H
	movf	YY_H,W,BANKED
	banksel	SYSTEMP1_H
	subwfb	SysTemp1_H,W,BANKED
	movwf	L_TOHIGH_H,BANKED
	clrf	L_CALIBRATE,BANKED
	clrf	L_CALIBRATE_H,BANKED
	banksel	0
	call	FN_SCALE658
	movff	SYSSCALEWORD,YY1
	movff	SYSSCALEWORD_H,YY1_H
	banksel	YY1
	movf	YY1,W,BANKED
	addwf	YY,W,BANKED
	movwf	YY1,BANKED
	movf	YY1_H,W,BANKED
	addwfc	YY_H,W,BANKED
	movwf	YY1_H,BANKED
	banksel	0
	call	FN_RANDOM
	movff	RANDOM,L_MAP
	banksel	L_MAP_H
	clrf	L_MAP_H,BANKED
	clrf	L_FROMLOW,BANKED
	clrf	L_FROMLOW_H,BANKED
	setf	L_FROMHIGH,BANKED
	clrf	L_FROMHIGH_H,BANKED
	clrf	L_TOLOW,BANKED
	clrf	L_TOLOW_H,BANKED
	movlw	1
	subwf	GLCDDEVICEWIDTH,W,ACCESS
	movwf	L_TOHIGH,BANKED
	movlw	0
	subwfb	GLCDDEVICEWIDTH_H,W,ACCESS
	movwf	L_TOHIGH_H,BANKED
	clrf	L_CALIBRATE,BANKED
	clrf	L_CALIBRATE_H,BANKED
	banksel	0
	call	FN_SCALE658
	movff	SYSSCALEWORD,XX3
	movff	SYSSCALEWORD_H,XX3_H
	call	FN_RANDOM
	movff	RANDOM,L_MAP
	banksel	L_MAP_H
	clrf	L_MAP_H,BANKED
	clrf	L_FROMLOW,BANKED
	clrf	L_FROMLOW_H,BANKED
	setf	L_FROMHIGH,BANKED
	clrf	L_FROMHIGH_H,BANKED
	clrf	L_TOLOW,BANKED
	clrf	L_TOLOW_H,BANKED
	movlw	1
	subwf	GLCDDEVICEWIDTH,W,ACCESS
	movwf	SysTemp1,BANKED
	movlw	0
	subwfb	GLCDDEVICEWIDTH_H,W,ACCESS
	movwf	SysTemp1_H,BANKED
	banksel	XX3
	movf	XX3,W,BANKED
	banksel	SYSTEMP1
	subwf	SysTemp1,W,BANKED
	movwf	L_TOHIGH,BANKED
	banksel	XX3_H
	movf	XX3_H,W,BANKED
	banksel	SYSTEMP1_H
	subwfb	SysTemp1_H,W,BANKED
	movwf	L_TOHIGH_H,BANKED
	clrf	L_CALIBRATE,BANKED
	clrf	L_CALIBRATE_H,BANKED
	banksel	0
	call	FN_SCALE658
	movff	SYSSCALEWORD,XX4
	movff	SYSSCALEWORD_H,XX4_H
	banksel	XX4
	movf	XX4,W,BANKED
	addwf	XX3,W,BANKED
	movwf	XX4,BANKED
	movf	XX4_H,W,BANKED
	addwfc	XX3_H,W,BANKED
	movwf	XX4_H,BANKED
	banksel	0
	call	FN_RANDOM
	movff	RANDOM,L_MAP
	banksel	L_MAP_H
	clrf	L_MAP_H,BANKED
	clrf	L_FROMLOW,BANKED
	clrf	L_FROMLOW_H,BANKED
	setf	L_FROMHIGH,BANKED
	clrf	L_FROMHIGH_H,BANKED
	clrf	L_TOLOW,BANKED
	clrf	L_TOLOW_H,BANKED
	movlw	1
	subwf	GLCDDEVICEHEIGHT,W,ACCESS
	movwf	L_TOHIGH,BANKED
	movlw	0
	subwfb	GLCDDEVICEHEIGHT_H,W,ACCESS
	movwf	L_TOHIGH_H,BANKED
	clrf	L_CALIBRATE,BANKED
	clrf	L_CALIBRATE_H,BANKED
	banksel	0
	call	FN_SCALE658
	movff	SYSSCALEWORD,YY3
	movff	SYSSCALEWORD_H,YY3_H
	call	FN_RANDOM
	movff	RANDOM,L_MAP
	banksel	L_MAP_H
	clrf	L_MAP_H,BANKED
	clrf	L_FROMLOW,BANKED
	clrf	L_FROMLOW_H,BANKED
	setf	L_FROMHIGH,BANKED
	clrf	L_FROMHIGH_H,BANKED
	clrf	L_TOLOW,BANKED
	clrf	L_TOLOW_H,BANKED
	movlw	1
	subwf	GLCDDEVICEHEIGHT,W,ACCESS
	movwf	SysTemp1,BANKED
	movlw	0
	subwfb	GLCDDEVICEHEIGHT_H,W,ACCESS
	movwf	SysTemp1_H,BANKED
	banksel	YY3
	movf	YY3,W,BANKED
	banksel	SYSTEMP1
	subwf	SysTemp1,W,BANKED
	movwf	L_TOHIGH,BANKED
	banksel	YY3_H
	movf	YY3_H,W,BANKED
	banksel	SYSTEMP1_H
	subwfb	SysTemp1_H,W,BANKED
	movwf	L_TOHIGH_H,BANKED
	clrf	L_CALIBRATE,BANKED
	clrf	L_CALIBRATE_H,BANKED
	banksel	0
	call	FN_SCALE658
	movff	SYSSCALEWORD,YY4
	movff	SYSSCALEWORD_H,YY4_H
	banksel	YY4
	movf	YY4,W,BANKED
	addwf	YY3,W,BANKED
	movwf	YY4,BANKED
	movf	YY4_H,W,BANKED
	addwfc	YY3_H,W,BANKED
	movwf	YY4_H,BANKED
	banksel	0
	call	FN_RANDOM
	movff	RANDOM,L_MAP
	banksel	L_MAP_H
	clrf	L_MAP_H,BANKED
	clrf	L_FROMLOW,BANKED
	clrf	L_FROMLOW_H,BANKED
	setf	L_FROMHIGH,BANKED
	clrf	L_FROMHIGH_H,BANKED
	clrf	L_TOLOW,BANKED
	clrf	L_TOLOW_H,BANKED
	movlw	1
	subwf	GLCDDEVICEHEIGHT,W,ACCESS
	movwf	L_TOHIGH,BANKED
	movlw	0
	subwfb	GLCDDEVICEHEIGHT_H,W,ACCESS
	movwf	L_TOHIGH_H,BANKED
	clrf	L_CALIBRATE,BANKED
	clrf	L_CALIBRATE_H,BANKED
	banksel	0
	call	FN_SCALE658
	movff	SYSSCALEWORD,ZZ
	movff	SYSSCALEWORD_H,ZZ_H
	call	FN_RANDOM
	movff	RANDOM,L_MAP
	banksel	L_MAP_H
	clrf	L_MAP_H,BANKED
	clrf	L_FROMLOW,BANKED
	clrf	L_FROMLOW_H,BANKED
	setf	L_FROMHIGH,BANKED
	clrf	L_FROMHIGH_H,BANKED
	clrf	L_TOLOW,BANKED
	clrf	L_TOLOW_H,BANKED
	movlw	1
	subwf	GLCDDEVICEHEIGHT,W,ACCESS
	movwf	SysTemp1,BANKED
	movlw	0
	subwfb	GLCDDEVICEHEIGHT_H,W,ACCESS
	movwf	SysTemp1_H,BANKED
	banksel	ZZ
	movf	ZZ,W,BANKED
	banksel	SYSTEMP1
	subwf	SysTemp1,W,BANKED
	movwf	L_TOHIGH,BANKED
	banksel	ZZ_H
	movf	ZZ_H,W,BANKED
	banksel	SYSTEMP1_H
	subwfb	SysTemp1_H,W,BANKED
	movwf	L_TOHIGH_H,BANKED
	clrf	L_CALIBRATE,BANKED
	clrf	L_CALIBRATE_H,BANKED
	banksel	0
	call	FN_SCALE658
	movff	SYSSCALEWORD,ZL
	movff	SYSSCALEWORD_H,ZL_H
	banksel	ZL
	movf	ZL,W,BANKED
	addwf	YY,W,BANKED
	movwf	ZL,BANKED
	movf	ZL_H,W,BANKED
	addwfc	YY_H,W,BANKED
	movwf	ZL_H,BANKED
	banksel	0
	call	FN_RANDOM
	movff	RANDOM,L_MAP
	banksel	L_MAP_H
	clrf	L_MAP_H,BANKED
	clrf	L_FROMLOW,BANKED
	clrf	L_FROMLOW_H,BANKED
	setf	L_FROMHIGH,BANKED
	clrf	L_FROMHIGH_H,BANKED
	movlw	1
	movwf	L_TOLOW,BANKED
	clrf	L_TOLOW_H,BANKED
	movlw	20
	movwf	L_TOHIGH,BANKED
	clrf	L_TOHIGH_H,BANKED
	clrf	L_CALIBRATE,BANKED
	clrf	L_CALIBRATE_H,BANKED
	banksel	0
	call	FN_SCALE658
	movff	SYSSCALEWORD,RR
	movff	SYSSCALEWORD_H,RR_H
	call	FN_RANDOM
	movff	RANDOM,L_MAP
	banksel	L_MAP_H
	clrf	L_MAP_H,BANKED
	clrf	L_FROMLOW,BANKED
	clrf	L_FROMLOW_H,BANKED
	setf	L_FROMHIGH,BANKED
	clrf	L_FROMHIGH_H,BANKED
	movlw	1
	movwf	L_TOLOW,BANKED
	clrf	L_TOLOW_H,BANKED
	movlw	20
	movwf	L_TOHIGH,BANKED
	clrf	L_TOHIGH_H,BANKED
	clrf	L_CALIBRATE,BANKED
	clrf	L_CALIBRATE_H,BANKED
	banksel	0
	call	FN_SCALE658
	movff	SYSSCALEWORD,RR2
	movff	SYSSCALEWORD_H,RR2_H
	bra	ENDIF7
ELSE7_1
	call	FN_RANDOM
	movff	RANDOM,L_MAP
	banksel	L_MAP_H
	clrf	L_MAP_H,BANKED
	clrf	L_FROMLOW,BANKED
	clrf	L_FROMLOW_H,BANKED
	setf	L_FROMHIGH,BANKED
	clrf	L_FROMHIGH_H,BANKED
	movlw	1
	movwf	L_TOLOW,BANKED
	clrf	L_TOLOW_H,BANKED
	movlw	100
	movwf	L_TOHIGH,BANKED
	clrf	L_TOHIGH_H,BANKED
	clrf	L_CALIBRATE,BANKED
	clrf	L_CALIBRATE_H,BANKED
	banksel	0
	call	FN_SCALE658
	movff	SYSSCALEWORD,RR
	movff	SYSSCALEWORD_H,RR_H
	call	FN_RANDOM
	movff	RANDOM,L_MAP
	banksel	L_MAP_H
	clrf	L_MAP_H,BANKED
	clrf	L_FROMLOW,BANKED
	clrf	L_FROMLOW_H,BANKED
	setf	L_FROMHIGH,BANKED
	clrf	L_FROMHIGH_H,BANKED
	movlw	1
	movwf	L_TOLOW,BANKED
	clrf	L_TOLOW_H,BANKED
	movlw	100
	movwf	L_TOHIGH,BANKED
	clrf	L_TOHIGH_H,BANKED
	clrf	L_CALIBRATE,BANKED
	clrf	L_CALIBRATE_H,BANKED
	banksel	0
	call	FN_SCALE658
	movff	SYSSCALEWORD,RR2
	movff	SYSSCALEWORD_H,RR2_H
	call	FN_RANDOM
	movff	RANDOM,L_MAP
	banksel	L_MAP_H
	clrf	L_MAP_H,BANKED
	clrf	L_FROMLOW,BANKED
	clrf	L_FROMLOW_H,BANKED
	setf	L_FROMHIGH,BANKED
	clrf	L_FROMHIGH_H,BANKED
	movff	RR,L_TOLOW
	movff	RR_H,L_TOLOW_H
	movf	RR,W,BANKED
	subwf	GLCDDEVICEWIDTH,W,ACCESS
	movwf	L_TOHIGH,BANKED
	movf	RR_H,W,BANKED
	subwfb	GLCDDEVICEWIDTH_H,W,ACCESS
	movwf	L_TOHIGH_H,BANKED
	clrf	L_CALIBRATE,BANKED
	clrf	L_CALIBRATE_H,BANKED
	banksel	0
	call	FN_SCALE658
	movff	SYSSCALEWORD,XX
	movff	SYSSCALEWORD_H,XX_H
	call	FN_RANDOM
	movff	RANDOM,L_MAP
	banksel	L_MAP_H
	clrf	L_MAP_H,BANKED
	clrf	L_FROMLOW,BANKED
	clrf	L_FROMLOW_H,BANKED
	setf	L_FROMHIGH,BANKED
	clrf	L_FROMHIGH_H,BANKED
	movff	RR2,L_TOLOW
	movff	RR2_H,L_TOLOW_H
	movf	RR2,W,BANKED
	subwf	GLCDDEVICEHEIGHT,W,ACCESS
	movwf	L_TOHIGH,BANKED
	movf	RR2_H,W,BANKED
	subwfb	GLCDDEVICEHEIGHT_H,W,ACCESS
	movwf	L_TOHIGH_H,BANKED
	clrf	L_CALIBRATE,BANKED
	clrf	L_CALIBRATE_H,BANKED
	banksel	0
	call	FN_SCALE658
	movff	SYSSCALEWORD,YY
	movff	SYSSCALEWORD_H,YY_H
ENDIF7
	call	FN_RANDOM
	movff	RANDOM,L_MAP
	banksel	L_MAP_H
	clrf	L_MAP_H,BANKED
	clrf	L_FROMLOW,BANKED
	clrf	L_FROMLOW_H,BANKED
	setf	L_FROMHIGH,BANKED
	clrf	L_FROMHIGH_H,BANKED
	clrf	L_TOLOW,BANKED
	clrf	L_TOLOW_H,BANKED
	setf	L_TOHIGH,BANKED
	setf	L_TOHIGH_H,BANKED
	clrf	L_CALIBRATE,BANKED
	clrf	L_CALIBRATE_H,BANKED
	banksel	0
	call	FN_SCALE658
	movff	SYSSCALEWORD,COLORS
	movff	SYSSCALEWORD_H,COLORS_H
SysSelect2Case1
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	clrf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect2Case2
	setf	LT7686_DISPLAY_COLORBAR_STATE,ACCESS
	call	LT7686_DISPLAY_COLORBAR
	movlw	5
	movwf	SysWaitTempS,ACCESS
	call	Delay_S
	banksel	STYLE
	incf	STYLE,F,BANKED
	btfsc	STATUS,Z,ACCESS
	incf	STYLE_H,F,BANKED
	goto	SysSelectEnd2
SysSelect2Case2
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	1
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect2Case3
	clrf	LT7686_DISPLAY_COLORBAR_STATE,ACCESS
	call	LT7686_DISPLAY_COLORBAR
	banksel	STYLE
	incf	STYLE,F,BANKED
	btfsc	STATUS,Z,ACCESS
	incf	STYLE_H,F,BANKED
	banksel	0
	call	GLCDCLS_LT7686
	goto	SysSelectEnd2
SysSelect2Case3
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	2
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect2Case4
	incf	FIRSTRUN,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	ELSE8_1
	banksel	_XOFFSET1
	clrf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	clrf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable30
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable30
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable30
	movwf	TBLPTRU,ACCESS
	banksel	0
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSLCDPRINTDATAHANDLER
	movwf	SysLCDPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysLCDPRINTDATAHandler_H,BANKED
	setf	LT7686_LINECOLOUR,BANKED
	setf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LT7686_PRINT_INTERNAL_FONT556
	clrf	FIRSTRUN,ACCESS
	bra	ENDIF8
ELSE8_1
	movff	XX,XOFFSET1
	movff	XX_H,XOFFSET1_H
	movff	YY,YOFFSET1
	movff	YY_H,YOFFSET1_H
	movff	RR,INXRADIUS
	movff	RR_H,INXRADIUS_H
	movff	COLORS,LT7686_LINECOLOUR
	movff	COLORS_H,LT7686_LINECOLOUR_H
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	CIRCLE_LT7686
ENDIF8
	goto	SysSelectEnd2
SysSelect2Case4
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	3
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect2Case5
	movff	XX,XOFFSET1
	movff	XX_H,XOFFSET1_H
	movff	YY,YOFFSET1
	movff	YY_H,YOFFSET1_H
	movff	RR,INXRADIUS
	movff	RR_H,INXRADIUS_H
	movff	COLORS,LT7686_LINECOLOUR
	movff	COLORS_H,LT7686_LINECOLOUR_H
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	FILLEDCIRCLE_LT7686
	goto	SysSelectEnd2
SysSelect2Case5
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	4
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect2Case6
	movff	XX,XOFFSET1
	movff	XX_H,XOFFSET1_H
	movff	YY,YOFFSET1
	movff	YY_H,YOFFSET1_H
	movff	XX1,XOFFSET2
	movff	XX1_H,XOFFSET2_H
	movff	YY1,YOFFSET2
	movff	YY1_H,YOFFSET2_H
	movff	COLORS,LT7686_LINECOLOUR
	movff	COLORS_H,LT7686_LINECOLOUR_H
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_LT7686
	goto	SysSelectEnd2
SysSelect2Case6
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	5
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect2Case7
	movff	XX,XOFFSET1
	movff	XX_H,XOFFSET1_H
	movff	YY,YOFFSET1
	movff	YY_H,YOFFSET1_H
	movff	XX1,XOFFSET2
	movff	XX1_H,XOFFSET2_H
	movff	YY1,YOFFSET2
	movff	YY1_H,YOFFSET2_H
	movff	COLORS,LT7686_LINECOLOUR
	movff	COLORS_H,LT7686_LINECOLOUR_H
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	BOX_LT7686
	goto	SysSelectEnd2
SysSelect2Case7
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	6
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect2Case8
	movff	XX,XOFFSET1
	movff	XX_H,XOFFSET1_H
	movff	YY,YOFFSET1
	movff	YY_H,YOFFSET1_H
	movff	XX1,XOFFSET2
	movff	XX1_H,XOFFSET2_H
	movff	YY1,YOFFSET2
	movff	YY1_H,YOFFSET2_H
	movff	COLORS,LT7686_LINECOLOUR
	movff	COLORS_H,LT7686_LINECOLOUR_H
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	FILLEDBOX_LT7686
	goto	SysSelectEnd2
SysSelect2Case8
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	7
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect2Case9
	movff	XX,XOFFSET1
	movff	XX_H,XOFFSET1_H
	movff	YY,YOFFSET1
	movff	YY_H,YOFFSET1_H
	call	FN_RANDOM
	movff	RANDOM,SysWORDTempA
	clrf	SysWORDTempA_H,ACCESS
	movlw	2
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSDIVSUB16
	movff	SysWORDTempA,INXRADIUS
	movff	SysWORDTempA_H,INXRADIUS_H
	call	FN_RANDOM
	movff	RANDOM,SysWORDTempA
	clrf	SysWORDTempA_H,ACCESS
	movlw	2
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSDIVSUB16
	movff	SysWORDTempA,INYRADIUS
	movff	SysWORDTempA_H,INYRADIUS_H
	movff	COLORS,LT7686_LINECOLOUR
	movff	COLORS_H,LT7686_LINECOLOUR_H
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	ELLIPSE_LT7686
	goto	SysSelectEnd2
SysSelect2Case9
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	8
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect2Case10
	movff	XX,XOFFSET1
	movff	XX_H,XOFFSET1_H
	movff	YY,YOFFSET1
	movff	YY_H,YOFFSET1_H
	call	FN_RANDOM
	movff	RANDOM,SysWORDTempA
	clrf	SysWORDTempA_H,ACCESS
	movlw	2
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSDIVSUB16
	movff	SysWORDTempA,INXRADIUS
	movff	SysWORDTempA_H,INXRADIUS_H
	call	FN_RANDOM
	movff	RANDOM,SysWORDTempA
	clrf	SysWORDTempA_H,ACCESS
	movlw	2
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSDIVSUB16
	movff	SysWORDTempA,INYRADIUS
	movff	SysWORDTempA_H,INYRADIUS_H
	movff	COLORS,LT7686_LINECOLOUR
	movff	COLORS_H,LT7686_LINECOLOUR_H
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	FILLEDELLIPSE_LT7686
	goto	SysSelectEnd2
SysSelect2Case10
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	9
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect2Case11
	movff	XX,XOFFSET1
	movff	XX_H,XOFFSET1_H
	movff	YY,YOFFSET1
	movff	YY_H,YOFFSET1_H
	movff	XX1,XOFFSET2
	movff	XX1_H,XOFFSET2_H
	movff	YY1,YOFFSET2
	movff	YY1_H,YOFFSET2_H
	movff	RR,INXRADIUS
	movff	RR_H,INXRADIUS_H
	movff	RR,INYRADIUS
	movff	RR_H,INYRADIUS_H
	movff	COLORS,LT7686_LINECOLOUR
	movff	COLORS_H,LT7686_LINECOLOUR_H
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	ROUNDRECT_LT7686
	goto	SysSelectEnd2
SysSelect2Case11
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	10
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect2Case12
	movff	XX,XOFFSET1
	movff	XX_H,XOFFSET1_H
	movff	YY,YOFFSET1
	movff	YY_H,YOFFSET1_H
	movff	XX1,XOFFSET2
	movff	XX1_H,XOFFSET2_H
	movff	YY1,YOFFSET2
	movff	YY1_H,YOFFSET2_H
	movff	RR,INXRADIUS
	movff	RR_H,INXRADIUS_H
	movff	RR,INYRADIUS
	movff	RR_H,INYRADIUS_H
	movff	COLORS,LT7686_LINECOLOUR
	movff	COLORS_H,LT7686_LINECOLOUR_H
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	FILLEDROUNDRECT_LT7686
	goto	SysSelectEnd2
SysSelect2Case12
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	11
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect2Case13
	incf	FIRSTRUN,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	ELSE9_1
	banksel	_XOFFSET1
	clrf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	clrf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable31
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable31
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable31
	movwf	TBLPTRU,ACCESS
	banksel	0
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSLCDPRINTDATAHANDLER
	movwf	SysLCDPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysLCDPRINTDATAHandler_H,BANKED
	setf	LT7686_LINECOLOUR,BANKED
	setf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LT7686_PRINT_INTERNAL_FONT556
	clrf	FIRSTRUN,ACCESS
	bra	ENDIF9
ELSE9_1
	movff	XX,XOFFSET1
	movff	XX_H,XOFFSET1_H
	movff	YY,YOFFSET1
	movff	YY_H,YOFFSET1_H
	movff	XX1,XOFFSET2
	movff	XX1_H,XOFFSET2_H
	movff	YY1,YOFFSET2
	movff	YY1_H,YOFFSET2_H
	movff	ZZ,XOFFSET3
	movff	ZZ_H,XOFFSET3_H
	movff	ZL,YOFFSET3
	movff	ZL_H,YOFFSET3_H
	movff	COLORS,LT7686_LINECOLOUR
	movff	COLORS_H,LT7686_LINECOLOUR_H
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	TRIANGLE_LT7686
ENDIF9
	goto	SysSelectEnd2
SysSelect2Case13
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	12
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect2Case14
	incf	FIRSTRUN,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	ELSE10_1
	banksel	_XOFFSET1
	clrf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	clrf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable32
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable32
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable32
	movwf	TBLPTRU,ACCESS
	banksel	0
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSLCDPRINTDATAHANDLER
	movwf	SysLCDPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysLCDPRINTDATAHandler_H,BANKED
	setf	LT7686_LINECOLOUR,BANKED
	setf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LT7686_PRINT_INTERNAL_FONT556
	clrf	FIRSTRUN,ACCESS
	bra	ENDIF10
ELSE10_1
	movff	XX,XOFFSET1
	movff	XX_H,XOFFSET1_H
	movff	YY,YOFFSET1
	movff	YY_H,YOFFSET1_H
	movff	XX1,XOFFSET2
	movff	XX1_H,XOFFSET2_H
	movff	YY1,YOFFSET2
	movff	YY1_H,YOFFSET2_H
	movff	ZZ,XOFFSET3
	movff	ZZ_H,XOFFSET3_H
	movff	ZL,YOFFSET3
	movff	ZL_H,YOFFSET3_H
	movff	COLORS,LT7686_LINECOLOUR
	movff	COLORS_H,LT7686_LINECOLOUR_H
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	FILLEDTRIANGLE_LT7686
ENDIF10
	goto	SysSelectEnd2
SysSelect2Case14
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	13
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect2Case15
	incf	FIRSTRUN,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	ELSE11_1
	banksel	_XOFFSET1
	clrf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	clrf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable33
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable33
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable33
	movwf	TBLPTRU,ACCESS
	banksel	0
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSLCDPRINTDATAHANDLER
	movwf	SysLCDPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysLCDPRINTDATAHandler_H,BANKED
	setf	LT7686_LINECOLOUR,BANKED
	setf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LT7686_PRINT_INTERNAL_FONT556
	clrf	FIRSTRUN,ACCESS
	bra	ENDIF11
ELSE11_1
	movff	XX,XOFFSET1
	movff	XX_H,XOFFSET1_H
	movff	YY,YOFFSET1
	movff	YY_H,YOFFSET1_H
	movff	XX1,XOFFSET2
	movff	XX1_H,XOFFSET2_H
	movff	YY1,YOFFSET2
	movff	YY1_H,YOFFSET2_H
	movff	COLORS,LT7686_LINECOLOUR
	movff	COLORS_H,LT7686_LINECOLOUR_H
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	FILLEDBOX_LT7686
	banksel	XXLOOP
	setf	XXLOOP,BANKED
SysForLoop3
	incf	XXLOOP,F,BANKED
	movff	XXLOOP,L_MAP
	banksel	L_MAP_H
	clrf	L_MAP_H,BANKED
	clrf	L_FROMLOW,BANKED
	clrf	L_FROMLOW_H,BANKED
	setf	L_FROMHIGH,BANKED
	clrf	L_FROMHIGH_H,BANKED
	movlw	1
	movwf	L_TOLOW,BANKED
	clrf	L_TOLOW_H,BANKED
	movlw	200
	movwf	L_TOHIGH,BANKED
	clrf	L_TOHIGH_H,BANKED
	clrf	L_CALIBRATE,BANKED
	clrf	L_CALIBRATE_H,BANKED
	banksel	0
	call	FN_SCALE658
	movff	SYSSCALEWORD,LT7686_DISPLAY_PWM
	call	LT7686_PWM_DUTY
	movlw	25
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	call	Delay_MS
	movlw	255
	banksel	XXLOOP
	subwf	XXLOOP,W,BANKED
	btfss	STATUS, C,ACCESS
	bra	SysForLoop3
SysForLoopEnd3
	movlw	250
	movwf	DRAWCOUNT,ACCESS
	clrf	DRAWCOUNT_H,ACCESS
ENDIF11
	goto	SysSelectEnd2
SysSelect2Case15
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	14
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect2Case16
	incf	FIRSTRUN,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	ELSE12_1
	banksel	_XOFFSET1
	clrf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	clrf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable34
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable34
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable34
	movwf	TBLPTRU,ACCESS
	banksel	0
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSLCDPRINTDATAHANDLER
	movwf	SysLCDPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysLCDPRINTDATAHandler_H,BANKED
	setf	LT7686_LINECOLOUR,BANKED
	setf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LT7686_PRINT_INTERNAL_FONT556
	clrf	FIRSTRUN,ACCESS
	bra	ENDIF12
ELSE12_1
	movlw	4
	banksel	SYSREPEATTEMP1
	movwf	SysRepeatTemp1,BANKED
SysRepeatLoop1
	banksel	YY
	clrf	YY,BANKED
	clrf	YY_H,BANKED
SysForLoop4
;Init SysForLoopStep3 :#0
	movlw	5
	banksel	SYSFORLOOPSTEP3
	movwf	SysForLoopStep3,BANKED
	clrf	SysForLoopStep3_H,BANKED
	movlw	200
	banksel	_XOFFSET1
	movwf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	movlw	44
	movwf	_YOFFSET1,BANKED
	movlw	1
	movwf	_YOFFSET1_H,BANKED
	movlw	50
	movwf	_INXRADIUS,BANKED
	clrf	_INXRADIUS_H,BANKED
	movlw	5
	movwf	_INYRADIUS,BANKED
	clrf	_INYRADIUS_H,BANKED
	movlw	150
	movwf	_ZOFFSET,BANKED
	clrf	_ZOFFSET_H,BANKED
	movff	GLCDBACKGROUND,LT7686_LINECOLOUR
	movff	GLCDBACKGROUND_H,LT7686_LINECOLOUR_H
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	movff	GLCDBACKGROUND,LT7686_FILLCOLOUR
	movff	GLCDBACKGROUND_H,LT7686_FILLCOLOUR_H
	clrf	LT7686_FILLCOLOUR_U,BANKED
	clrf	LT7686_FILLCOLOUR_E,BANKED
	banksel	0
	call	CYLINDER_LT7686
	movlw	200
	banksel	_XOFFSET1
	movwf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	movlw	44
	movwf	_YOFFSET1,BANKED
	movlw	1
	movwf	_YOFFSET1_H,BANKED
	movlw	50
	movwf	_INXRADIUS,BANKED
	clrf	_INXRADIUS_H,BANKED
	movlw	5
	movwf	_INYRADIUS,BANKED
	clrf	_INYRADIUS_H,BANKED
	movff	YY,_ZOFFSET
	movff	YY_H,_ZOFFSET_H
	banksel	LT7686_LINECOLOUR
	clrf	LT7686_LINECOLOUR,BANKED
	movlw	248
	movwf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	movlw	31
	movwf	LT7686_FILLCOLOUR,BANKED
	clrf	LT7686_FILLCOLOUR_H,BANKED
	clrf	LT7686_FILLCOLOUR_U,BANKED
	clrf	LT7686_FILLCOLOUR_E,BANKED
	banksel	0
	call	CYLINDER_LT7686
	movlw	25
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	call	Delay_MS
	banksel	SYSFORLOOPSTEP3_H
	btfss	SYSFORLOOPSTEP3_H,7,BANKED
	bra	ELSE25_1
	comf	SYSFORLOOPSTEP3,W,BANKED
	movwf	SysForLoopABsValue4,BANKED
	comf	SYSFORLOOPSTEP3_H,W,BANKED
	movwf	SysForLoopABsValue4_H,BANKED
	incf	SysForLoopABsValue4,F,BANKED
	btfsc	STATUS,Z,ACCESS
	incf	SysForLoopABsValue4_H,F,BANKED
	movlw	150
	banksel	YY
	subwf	YY,W,BANKED
	banksel	SYSTEMP1
	movwf	SysTemp1,BANKED
	movlw	0
	banksel	YY_H
	subwfb	YY_H,W,BANKED
	banksel	SYSTEMP1_H
	movwf	SysTemp1_H,BANKED
	movff	SysTemp1,SysWORDTempA
	movff	SysTemp1_H,SysWORDTempA_H
	movff	SYSFORLOOPABSVALUE4,SysWORDTempB
	movff	SYSFORLOOPABSVALUE4_H,SysWORDTempB_H
	banksel	0
	call	SYSCOMPLESSTHAN16
	comf	SysByteTempX,F,ACCESS
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF28
	banksel	SYSFORLOOPSTEP3
	movf	SysForLoopStep3,W,BANKED
	banksel	YY
	addwf	YY,F,BANKED
	banksel	SYSFORLOOPSTEP3_H
	movf	SysForLoopStep3_H,W,BANKED
	banksel	YY_H
	addwfc	YY_H,F,BANKED
	bra	SysForLoop4
ENDIF28
	bra	ENDIF25
ELSE25_1
	banksel	YY
	movf	YY,W,BANKED
	sublw	150
	banksel	SYSTEMP1
	movwf	SysTemp1,BANKED
	clrf	SysTemp2,BANKED
	banksel	YY_H
	movf	YY_H,W,BANKED
	banksel	SYSTEMP2
	subwfb	SysTemp2,W,BANKED
	movwf	SysTemp1_H,BANKED
	movff	SysTemp1,SysWORDTempA
	movff	SysTemp1_H,SysWORDTempA_H
	movff	SYSFORLOOPSTEP3,SysWORDTempB
	movff	SYSFORLOOPSTEP3_H,SysWORDTempB_H
	banksel	0
	call	SYSCOMPLESSTHAN16
	comf	SysByteTempX,F,ACCESS
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF29
	banksel	SYSFORLOOPSTEP3
	movf	SysForLoopStep3,W,BANKED
	banksel	YY
	addwf	YY,F,BANKED
	banksel	SYSFORLOOPSTEP3_H
	movf	SysForLoopStep3_H,W,BANKED
	banksel	YY_H
	addwfc	YY_H,F,BANKED
	bra	SysForLoop4
ENDIF29
ENDIF25
SysForLoopEnd4
	movlw	149
	banksel	YY
	movwf	YY,BANKED
	clrf	YY_H,BANKED
SysForLoop5
;Init SysForLoopStep4 :#0
	movlw	251
	banksel	SYSFORLOOPSTEP4
	movwf	SysForLoopStep4,BANKED
	setf	SysForLoopStep4_H,BANKED
	movlw	200
	banksel	_XOFFSET1
	movwf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	movlw	44
	movwf	_YOFFSET1,BANKED
	movlw	1
	movwf	_YOFFSET1_H,BANKED
	movlw	50
	movwf	_INXRADIUS,BANKED
	clrf	_INXRADIUS_H,BANKED
	movlw	5
	movwf	_INYRADIUS,BANKED
	clrf	_INYRADIUS_H,BANKED
	movlw	150
	movwf	_ZOFFSET,BANKED
	clrf	_ZOFFSET_H,BANKED
	movff	GLCDBACKGROUND,LT7686_LINECOLOUR
	movff	GLCDBACKGROUND_H,LT7686_LINECOLOUR_H
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	movff	GLCDBACKGROUND,LT7686_FILLCOLOUR
	movff	GLCDBACKGROUND_H,LT7686_FILLCOLOUR_H
	clrf	LT7686_FILLCOLOUR_U,BANKED
	clrf	LT7686_FILLCOLOUR_E,BANKED
	banksel	0
	call	CYLINDER_LT7686
	movlw	200
	banksel	_XOFFSET1
	movwf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	movlw	44
	movwf	_YOFFSET1,BANKED
	movlw	1
	movwf	_YOFFSET1_H,BANKED
	movlw	50
	movwf	_INXRADIUS,BANKED
	clrf	_INXRADIUS_H,BANKED
	movlw	5
	movwf	_INYRADIUS,BANKED
	clrf	_INYRADIUS_H,BANKED
	movff	YY,_ZOFFSET
	movff	YY_H,_ZOFFSET_H
	banksel	LT7686_LINECOLOUR
	clrf	LT7686_LINECOLOUR,BANKED
	movlw	248
	movwf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	movlw	31
	movwf	LT7686_FILLCOLOUR,BANKED
	clrf	LT7686_FILLCOLOUR_H,BANKED
	clrf	LT7686_FILLCOLOUR_U,BANKED
	clrf	LT7686_FILLCOLOUR_E,BANKED
	banksel	0
	call	CYLINDER_LT7686
	movlw	25
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	call	Delay_MS
	banksel	SYSFORLOOPSTEP4_H
	btfss	SYSFORLOOPSTEP4_H,7,BANKED
	bra	ELSE26_1
	comf	SYSFORLOOPSTEP4,W,BANKED
	movwf	SysForLoopABsValue5,BANKED
	comf	SYSFORLOOPSTEP4_H,W,BANKED
	movwf	SysForLoopABsValue5_H,BANKED
	incf	SysForLoopABsValue5,F,BANKED
	btfsc	STATUS,Z,ACCESS
	incf	SysForLoopABsValue5_H,F,BANKED
	movlw	0
	banksel	YY
	subwf	YY,W,BANKED
	banksel	SYSTEMP1
	movwf	SysTemp1,BANKED
	movlw	0
	banksel	YY_H
	subwfb	YY_H,W,BANKED
	banksel	SYSTEMP1_H
	movwf	SysTemp1_H,BANKED
	movff	SysTemp1,SysWORDTempA
	movff	SysTemp1_H,SysWORDTempA_H
	movff	SYSFORLOOPABSVALUE5,SysWORDTempB
	movff	SYSFORLOOPABSVALUE5_H,SysWORDTempB_H
	banksel	0
	call	SYSCOMPLESSTHAN16
	comf	SysByteTempX,F,ACCESS
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF30
	banksel	SYSFORLOOPSTEP4
	movf	SysForLoopStep4,W,BANKED
	banksel	YY
	addwf	YY,F,BANKED
	banksel	SYSFORLOOPSTEP4_H
	movf	SysForLoopStep4_H,W,BANKED
	banksel	YY_H
	addwfc	YY_H,F,BANKED
	bra	SysForLoop5
ENDIF30
	bra	ENDIF26
ELSE26_1
	banksel	YY
	movf	YY,W,BANKED
	sublw	0
	banksel	SYSTEMP1
	movwf	SysTemp1,BANKED
	clrf	SysTemp2,BANKED
	banksel	YY_H
	movf	YY_H,W,BANKED
	banksel	SYSTEMP2
	subwfb	SysTemp2,W,BANKED
	movwf	SysTemp1_H,BANKED
	movff	SysTemp1,SysWORDTempA
	movff	SysTemp1_H,SysWORDTempA_H
	movff	SYSFORLOOPSTEP4,SysWORDTempB
	movff	SYSFORLOOPSTEP4_H,SysWORDTempB_H
	banksel	0
	call	SYSCOMPLESSTHAN16
	comf	SysByteTempX,F,ACCESS
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF31
	banksel	SYSFORLOOPSTEP4
	movf	SysForLoopStep4,W,BANKED
	banksel	YY
	addwf	YY,F,BANKED
	banksel	SYSFORLOOPSTEP4_H
	movf	SysForLoopStep4_H,W,BANKED
	banksel	YY_H
	addwfc	YY_H,F,BANKED
	bra	SysForLoop5
ENDIF31
ENDIF26
SysForLoopEnd5
	banksel	SYSREPEATTEMP1
	decfsz	SysRepeatTemp1,F,BANKED
	bra	SysRepeatLoop1
SysRepeatLoopEnd1
	movlw	250
	movwf	DRAWCOUNT,ACCESS
	clrf	DRAWCOUNT_H,ACCESS
ENDIF12
	goto	SysSelectEnd2
SysSelect2Case16
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	15
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect2Case17
	movff	XX,XOFFSET1
	movff	XX_H,XOFFSET1_H
	movff	YY,YOFFSET1
	movff	YY_H,YOFFSET1_H
	movff	RR,INXRADIUS
	movff	RR_H,INXRADIUS_H
	movff	RR2,INYRADIUS
	movff	RR2_H,INYRADIUS_H
	movff	COLORS,LT7686_LINECOLOUR
	movff	COLORS_H,LT7686_LINECOLOUR_H
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LEFTUPCURVE_LT7686
	goto	SysSelectEnd2
SysSelect2Case17
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	16
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect2Case18
	movff	XX,XOFFSET1
	movff	XX_H,XOFFSET1_H
	movff	YY,YOFFSET1
	movff	YY_H,YOFFSET1_H
	movff	RR,INXRADIUS
	movff	RR_H,INXRADIUS_H
	movff	RR2,INYRADIUS
	movff	RR2_H,INYRADIUS_H
	movff	COLORS,LT7686_LINECOLOUR
	movff	COLORS_H,LT7686_LINECOLOUR_H
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LEFTDOWNCURVE_LT7686
	goto	SysSelectEnd2
SysSelect2Case18
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	17
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect2Case19
	movff	XX,XOFFSET1
	movff	XX_H,XOFFSET1_H
	movff	YY,YOFFSET1
	movff	YY_H,YOFFSET1_H
	movff	RR,INXRADIUS
	movff	RR_H,INXRADIUS_H
	movff	RR2,INYRADIUS
	movff	RR2_H,INYRADIUS_H
	movff	COLORS,LT7686_LINECOLOUR
	movff	COLORS_H,LT7686_LINECOLOUR_H
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	RIGHTUPCURVE_LT7686
	goto	SysSelectEnd2
SysSelect2Case19
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	18
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect2Case20
	movff	XX,XOFFSET1
	movff	XX_H,XOFFSET1_H
	movff	YY,YOFFSET1
	movff	YY_H,YOFFSET1_H
	movff	RR,INXRADIUS
	movff	RR_H,INXRADIUS_H
	movff	RR2,INYRADIUS
	movff	RR2_H,INYRADIUS_H
	movff	COLORS,LT7686_LINECOLOUR
	movff	COLORS_H,LT7686_LINECOLOUR_H
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	RIGHTDOWNCURVE_LT7686
	goto	SysSelectEnd2
SysSelect2Case20
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	19
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect2Case21
	movff	XX,XOFFSET1
	movff	XX_H,XOFFSET1_H
	movff	YY,YOFFSET1
	movff	YY_H,YOFFSET1_H
	movff	RR,INXRADIUS
	movff	RR_H,INXRADIUS_H
	movff	RR2,INYRADIUS
	movff	RR2_H,INYRADIUS_H
	movff	COLORS,LT7686_LINECOLOUR
	movff	COLORS_H,LT7686_LINECOLOUR_H
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	FILLEDLEFTUPCURVE_LT7686
	goto	SysSelectEnd2
SysSelect2Case21
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	20
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect2Case22
	movff	XX,XOFFSET1
	movff	XX_H,XOFFSET1_H
	movff	YY,YOFFSET1
	movff	YY_H,YOFFSET1_H
	movff	RR,INXRADIUS
	movff	RR_H,INXRADIUS_H
	movff	RR2,INYRADIUS
	movff	RR2_H,INYRADIUS_H
	movff	COLORS,LT7686_LINECOLOUR
	movff	COLORS_H,LT7686_LINECOLOUR_H
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	FILLEDLEFTDOWNCURVE_LT7686
	goto	SysSelectEnd2
SysSelect2Case22
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	21
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect2Case23
	movff	XX,XOFFSET1
	movff	XX_H,XOFFSET1_H
	movff	YY,YOFFSET1
	movff	YY_H,YOFFSET1_H
	movff	RR,INXRADIUS
	movff	RR_H,INXRADIUS_H
	movff	RR2,INYRADIUS
	movff	RR2_H,INYRADIUS_H
	movff	COLORS,LT7686_LINECOLOUR
	movff	COLORS_H,LT7686_LINECOLOUR_H
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	FILLEDRIGHTUPCURVE_LT7686
	goto	SysSelectEnd2
SysSelect2Case23
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	22
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect2Case24
	movff	XX,XOFFSET1
	movff	XX_H,XOFFSET1_H
	movff	YY,YOFFSET1
	movff	YY_H,YOFFSET1_H
	movff	RR,INXRADIUS
	movff	RR_H,INXRADIUS_H
	movff	RR2,INYRADIUS
	movff	RR2_H,INYRADIUS_H
	movff	COLORS,LT7686_LINECOLOUR
	movff	COLORS_H,LT7686_LINECOLOUR_H
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	FILLEDRIGHTDOWNCURVE_LT7686
	goto	SysSelectEnd2
SysSelect2Case24
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	23
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect2Case25
	incf	FIRSTRUN,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	ENDIF13
	banksel	_XOFFSET1
	clrf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	clrf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable35
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable35
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable35
	movwf	TBLPTRU,ACCESS
	banksel	0
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSLCDPRINTDATAHANDLER
	movwf	SysLCDPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysLCDPRINTDATAHandler_H,BANKED
	setf	LT7686_LINECOLOUR,BANKED
	setf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LT7686_PRINT_INTERNAL_FONT556
	clrf	FIRSTRUN,ACCESS
ENDIF13
	movlw	50
	banksel	XOFFSET1
	movwf	XOFFSET1,BANKED
	clrf	XOFFSET1_H,BANKED
	movlw	50
	banksel	YOFFSET1
	movwf	YOFFSET1,BANKED
	clrf	YOFFSET1_H,BANKED
	movlw	200
	banksel	XOFFSET2
	movwf	XOFFSET2,BANKED
	clrf	XOFFSET2_H,BANKED
	movlw	80
	banksel	YOFFSET2
	movwf	YOFFSET2,BANKED
	clrf	YOFFSET2_H,BANKED
	movlw	150
	banksel	XOFFSET3
	movwf	XOFFSET3,BANKED
	clrf	XOFFSET3_H,BANKED
	movlw	130
	banksel	YOFFSET3
	movwf	YOFFSET3,BANKED
	clrf	YOFFSET3_H,BANKED
	movlw	60
	banksel	XOFFSET4
	movwf	XOFFSET4,BANKED
	clrf	XOFFSET4_H,BANKED
	movlw	100
	banksel	YOFFSET4
	movwf	YOFFSET4,BANKED
	clrf	YOFFSET4_H,BANKED
	movff	COLORS,LT7686_LINECOLOUR
	movff	COLORS_H,LT7686_LINECOLOUR_H
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	QUADRILATERAL_LT7686
	movlw	5
	movwf	SysWaitTempS,ACCESS
	call	Delay_S
	movlw	250
	movwf	DRAWCOUNT,ACCESS
	clrf	DRAWCOUNT_H,ACCESS
	goto	SysSelectEnd2
SysSelect2Case25
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	24
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect2Case26
	incf	FIRSTRUN,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	ENDIF14
	banksel	_XOFFSET1
	clrf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	clrf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable36
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable36
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable36
	movwf	TBLPTRU,ACCESS
	banksel	0
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSLCDPRINTDATAHANDLER
	movwf	SysLCDPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysLCDPRINTDATAHandler_H,BANKED
	setf	LT7686_LINECOLOUR,BANKED
	setf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LT7686_PRINT_INTERNAL_FONT556
	clrf	FIRSTRUN,ACCESS
ENDIF14
	movlw	150
	banksel	XOFFSET1
	movwf	XOFFSET1,BANKED
	clrf	XOFFSET1_H,BANKED
	movlw	50
	banksel	YOFFSET1
	movwf	YOFFSET1,BANKED
	clrf	YOFFSET1_H,BANKED
	movlw	44
	banksel	XOFFSET2
	movwf	XOFFSET2,BANKED
	movlw	1
	movwf	XOFFSET2_H,BANKED
	movlw	80
	banksel	YOFFSET2
	movwf	YOFFSET2,BANKED
	clrf	YOFFSET2_H,BANKED
	movlw	250
	banksel	XOFFSET3
	movwf	XOFFSET3,BANKED
	clrf	XOFFSET3_H,BANKED
	movlw	130
	banksel	YOFFSET3
	movwf	YOFFSET3,BANKED
	clrf	YOFFSET3_H,BANKED
	movlw	160
	banksel	XOFFSET4
	movwf	XOFFSET4,BANKED
	clrf	XOFFSET4_H,BANKED
	movlw	100
	banksel	YOFFSET4
	movwf	YOFFSET4,BANKED
	clrf	YOFFSET4_H,BANKED
	movff	COLORS,LT7686_LINECOLOUR
	movff	COLORS_H,LT7686_LINECOLOUR_H
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	FILLEDQUADRILATERAL_LT7686
	movlw	2
	movwf	SysWaitTempS,ACCESS
	call	Delay_S
	movlw	250
	movwf	DRAWCOUNT,ACCESS
	clrf	DRAWCOUNT_H,ACCESS
	goto	SysSelectEnd2
SysSelect2Case26
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	25
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect2Case27
	incf	FIRSTRUN,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	ELSE15_1
	movlw	22
	banksel	XOFFSET1
	movwf	XOFFSET1,BANKED
	clrf	XOFFSET1_H,BANKED
	movlw	53
	banksel	YOFFSET1
	movwf	YOFFSET1,BANKED
	clrf	YOFFSET1_H,BANKED
	movlw	75
	banksel	XOFFSET2
	movwf	XOFFSET2,BANKED
	clrf	XOFFSET2_H,BANKED
	movlw	92
	banksel	YOFFSET2
	movwf	YOFFSET2,BANKED
	clrf	YOFFSET2_H,BANKED
	movlw	43
	banksel	XOFFSET3
	movwf	XOFFSET3,BANKED
	clrf	XOFFSET3_H,BANKED
	movlw	96
	banksel	YOFFSET3
	movwf	YOFFSET3,BANKED
	clrf	YOFFSET3_H,BANKED
	movlw	31
	banksel	LT7686_LINECOLOUR
	movwf	LT7686_LINECOLOUR,BANKED
	clrf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	FILLEDTRIANGLE_LT7686
	movlw	93
	banksel	XOFFSET1
	movwf	XOFFSET1,BANKED
	clrf	XOFFSET1_H,BANKED
	movlw	99
	banksel	YOFFSET1
	movwf	YOFFSET1,BANKED
	clrf	YOFFSET1_H,BANKED
	movlw	170
	banksel	XOFFSET2
	movwf	XOFFSET2,BANKED
	clrf	XOFFSET2_H,BANKED
	movlw	66
	banksel	YOFFSET2
	movwf	YOFFSET2,BANKED
	clrf	YOFFSET2_H,BANKED
	movlw	11
	banksel	XOFFSET3
	movwf	XOFFSET3,BANKED
	movlw	1
	movwf	XOFFSET3_H,BANKED
	movlw	219
	banksel	YOFFSET3
	movwf	YOFFSET3,BANKED
	clrf	YOFFSET3_H,BANKED
	movlw	239
	banksel	LT7686_LINECOLOUR
	movwf	LT7686_LINECOLOUR,BANKED
	movlw	123
	movwf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	FILLEDTRIANGLE_LT7686
	movlw	94
	banksel	XOFFSET1
	movwf	XOFFSET1,BANKED
	clrf	XOFFSET1_H,BANKED
	movlw	111
	banksel	YOFFSET1
	movwf	YOFFSET1,BANKED
	clrf	YOFFSET1_H,BANKED
	movlw	231
	banksel	XOFFSET2
	movwf	XOFFSET2,BANKED
	clrf	XOFFSET2_H,BANKED
	movlw	206
	banksel	YOFFSET2
	movwf	YOFFSET2,BANKED
	clrf	YOFFSET2_H,BANKED
	movlw	159
	banksel	XOFFSET3
	movwf	XOFFSET3,BANKED
	clrf	XOFFSET3_H,BANKED
	movlw	74
	banksel	YOFFSET3
	movwf	YOFFSET3,BANKED
	movlw	1
	movwf	YOFFSET3_H,BANKED
	movlw	239
	banksel	LT7686_LINECOLOUR
	movwf	LT7686_LINECOLOUR,BANKED
	movlw	123
	movwf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	FILLEDTRIANGLE_LT7686
	movlw	196
	banksel	XOFFSET1
	movwf	XOFFSET1,BANKED
	clrf	XOFFSET1_H,BANKED
	movlw	91
	banksel	YOFFSET1
	movwf	YOFFSET1,BANKED
	clrf	YOFFSET1_H,BANKED
	movlw	109
	banksel	XOFFSET2
	movwf	XOFFSET2,BANKED
	movlw	1
	movwf	XOFFSET2_H,BANKED
	movlw	106
	banksel	YOFFSET2
	movwf	YOFFSET2,BANKED
	clrf	YOFFSET2_H,BANKED
	movlw	90
	banksel	XOFFSET3
	movwf	XOFFSET3,BANKED
	movlw	1
	movwf	XOFFSET3_H,BANKED
	movlw	72
	banksel	YOFFSET3
	movwf	YOFFSET3,BANKED
	movlw	1
	movwf	YOFFSET3_H,BANKED
	movlw	31
	banksel	LT7686_LINECOLOUR
	movwf	LT7686_LINECOLOUR,BANKED
	clrf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	FILLEDTRIANGLE_LT7686
	movlw	112
	banksel	XOFFSET1
	movwf	XOFFSET1,BANKED
	movlw	1
	movwf	XOFFSET1_H,BANKED
	movlw	127
	banksel	YOFFSET1
	movwf	YOFFSET1,BANKED
	clrf	YOFFSET1_H,BANKED
	movlw	117
	banksel	XOFFSET2
	movwf	XOFFSET2,BANKED
	movlw	1
	movwf	XOFFSET2_H,BANKED
	movlw	187
	banksel	YOFFSET2
	movwf	YOFFSET2,BANKED
	clrf	YOFFSET2_H,BANKED
	movlw	141
	banksel	XOFFSET3
	movwf	XOFFSET3,BANKED
	movlw	1
	movwf	XOFFSET3_H,BANKED
	movlw	211
	banksel	YOFFSET3
	movwf	YOFFSET3,BANKED
	clrf	YOFFSET3_H,BANKED
	movlw	239
	banksel	LT7686_LINECOLOUR
	movwf	LT7686_LINECOLOUR,BANKED
	movlw	123
	movwf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	FILLEDTRIANGLE_LT7686
	movlw	46
	banksel	XOFFSET1
	movwf	XOFFSET1,BANKED
	clrf	XOFFSET1_H,BANKED
	movlw	102
	banksel	YOFFSET1
	movwf	YOFFSET1,BANKED
	clrf	YOFFSET1_H,BANKED
	movlw	79
	banksel	XOFFSET2
	movwf	XOFFSET2,BANKED
	clrf	XOFFSET2_H,BANKED
	movlw	101
	banksel	YOFFSET2
	movwf	YOFFSET2,BANKED
	clrf	YOFFSET2_H,BANKED
	movlw	107
	banksel	XOFFSET3
	movwf	XOFFSET3,BANKED
	clrf	XOFFSET3_H,BANKED
	movlw	186
	banksel	YOFFSET3
	movwf	YOFFSET3,BANKED
	clrf	YOFFSET3_H,BANKED
	movlw	12
	banksel	XOFFSET4
	movwf	XOFFSET4,BANKED
	clrf	XOFFSET4_H,BANKED
	movlw	186
	banksel	YOFFSET4
	movwf	YOFFSET4,BANKED
	clrf	YOFFSET4_H,BANKED
	movlw	2
	banksel	XOFFSET5
	movwf	XOFFSET5,BANKED
	clrf	XOFFSET5_H,BANKED
	movlw	155
	banksel	YOFFSET5
	movwf	YOFFSET5,BANKED
	clrf	YOFFSET5_H,BANKED
	movlw	31
	banksel	LT7686_LINECOLOUR
	movwf	LT7686_LINECOLOUR,BANKED
	clrf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	FILLEDPENTAGON_LT7686
	movlw	32
	banksel	_FONTSIZE
	movwf	_FONTSIZE,BANKED
	movlw	4
	movwf	_XWIDTHMAG,BANKED
	movlw	4
	movwf	_YHEIGHTMAG,BANKED
	movlw	1
	movwf	_CHROMAKEY,BANKED
	movlw	1
	movwf	_ALIGNMENT,BANKED
	banksel	0
	call	LT7686_SELECT_INTERNAL_FONT_INIT
	movlw	44
	banksel	_XOFFSET1
	movwf	_XOFFSET1,BANKED
	movlw	1
	movwf	_XOFFSET1_H,BANKED
	movlw	94
	movwf	_YOFFSET1,BANKED
	movlw	1
	movwf	_YOFFSET1_H,BANKED
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable25
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable25
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable25
	movwf	TBLPTRU,ACCESS
	banksel	0
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSLCDPRINTDATAHANDLER
	movwf	SysLCDPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysLCDPRINTDATAHandler_H,BANKED
	setf	LT7686_LINECOLOUR,BANKED
	setf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LT7686_PRINT_INTERNAL_FONT556
	movlw	16
	banksel	_FONTSIZE
	movwf	_FONTSIZE,BANKED
	movlw	1
	movwf	_XWIDTHMAG,BANKED
	movlw	1
	movwf	_YHEIGHTMAG,BANKED
	movlw	1
	movwf	_CHROMAKEY,BANKED
	movlw	1
	movwf	_ALIGNMENT,BANKED
	banksel	0
	call	LT7686_SELECT_INTERNAL_FONT_INIT
	movlw	178
	banksel	_XOFFSET1
	movwf	_XOFFSET1,BANKED
	movlw	2
	movwf	_XOFFSET1_H,BANKED
	movlw	214
	movwf	_YOFFSET1,BANKED
	movlw	1
	movwf	_YOFFSET1_H,BANKED
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable37
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable37
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable37
	movwf	TBLPTRU,ACCESS
	banksel	0
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSLCDPRINTDATAHANDLER
	movwf	SysLCDPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysLCDPRINTDATAHandler_H,BANKED
	setf	LT7686_LINECOLOUR,BANKED
	setf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LT7686_PRINT_INTERNAL_FONT556
	clrf	FIRSTRUN,ACCESS
	bra	ENDIF15
ELSE15_1
	movlw	10
	banksel	_XOFFSET1
	movwf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	movlw	194
	movwf	_YOFFSET1,BANKED
	movlw	1
	movwf	_YOFFSET1_H,BANKED
	movff	STYLE,LCDVALUE
	movff	STYLE_H,LCDVALUE_H
	clrf	LCDVALUE_U,ACCESS
	clrf	LCDVALUE_E,ACCESS
	movff	GLCDFOREGROUND,LT7686_LINECOLOUR
	movff	GLCDFOREGROUND_H,LT7686_LINECOLOUR_H
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LT7686_PRINT_INTERNAL_FONT557
	movlw	10
	banksel	_XOFFSET1
	movwf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	movlw	206
	movwf	_YOFFSET1,BANKED
	movlw	1
	movwf	_YOFFSET1_H,BANKED
	movff	DRAWCOUNT,LCDVALUE
	movff	DRAWCOUNT_H,LCDVALUE_H
	clrf	LCDVALUE_U,ACCESS
	clrf	LCDVALUE_E,ACCESS
	movff	GLCDFOREGROUND,LT7686_LINECOLOUR
	movff	GLCDFOREGROUND_H,LT7686_LINECOLOUR_H
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LT7686_PRINT_INTERNAL_FONT557
	movlw	10
	addwf	DRAWCOUNT,F,ACCESS
	movlw	0
	addwfc	DRAWCOUNT_H,F,ACCESS
	movlw	25
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	call	Delay_MS
ENDIF15
	bra	SysSelectEnd2
SysSelect2Case27
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	26
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect2Case28
	banksel	_XOFFSET1
	clrf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	movlw	100
	movwf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
	movlw	1
	subwf	GLCDDEVICEWIDTH,W,ACCESS
	movwf	_XOFFSET2,BANKED
	movlw	0
	subwfb	GLCDDEVICEWIDTH_H,W,ACCESS
	movwf	_XOFFSET2_H,BANKED
	movlw	100
	movwf	_YOFFSET2,BANKED
	clrf	_YOFFSET2_H,BANKED
	clrf	_WOFFSET,BANKED
	clrf	_WOFFSET_H,BANKED
	banksel	LT7686_LINECOLOUR
	setf	LT7686_LINECOLOUR,BANKED
	setf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_WIDTH_LT7686
	banksel	_XOFFSET1
	clrf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	movlw	150
	movwf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
	movlw	1
	subwf	GLCDDEVICEWIDTH,W,ACCESS
	movwf	_XOFFSET2,BANKED
	movlw	0
	subwfb	GLCDDEVICEWIDTH_H,W,ACCESS
	movwf	_XOFFSET2_H,BANKED
	movlw	150
	movwf	_YOFFSET2,BANKED
	clrf	_YOFFSET2_H,BANKED
	movlw	1
	movwf	_WOFFSET,BANKED
	clrf	_WOFFSET_H,BANKED
	banksel	LT7686_LINECOLOUR
	setf	LT7686_LINECOLOUR,BANKED
	setf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_WIDTH_LT7686
	banksel	_XOFFSET1
	clrf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	movlw	200
	movwf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
	movlw	1
	subwf	GLCDDEVICEWIDTH,W,ACCESS
	movwf	_XOFFSET2,BANKED
	movlw	0
	subwfb	GLCDDEVICEWIDTH_H,W,ACCESS
	movwf	_XOFFSET2_H,BANKED
	movlw	200
	movwf	_YOFFSET2,BANKED
	clrf	_YOFFSET2_H,BANKED
	movlw	2
	movwf	_WOFFSET,BANKED
	clrf	_WOFFSET_H,BANKED
	banksel	LT7686_LINECOLOUR
	setf	LT7686_LINECOLOUR,BANKED
	setf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_WIDTH_LT7686
	banksel	_XOFFSET1
	clrf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	movlw	250
	movwf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
	movlw	1
	subwf	GLCDDEVICEWIDTH,W,ACCESS
	movwf	_XOFFSET2,BANKED
	movlw	0
	subwfb	GLCDDEVICEWIDTH_H,W,ACCESS
	movwf	_XOFFSET2_H,BANKED
	movlw	250
	movwf	_YOFFSET2,BANKED
	clrf	_YOFFSET2_H,BANKED
	movlw	4
	movwf	_WOFFSET,BANKED
	clrf	_WOFFSET_H,BANKED
	banksel	LT7686_LINECOLOUR
	setf	LT7686_LINECOLOUR,BANKED
	setf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_WIDTH_LT7686
	banksel	_XOFFSET1
	clrf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	movlw	44
	movwf	_YOFFSET1,BANKED
	movlw	1
	movwf	_YOFFSET1_H,BANKED
	movlw	1
	subwf	GLCDDEVICEWIDTH,W,ACCESS
	movwf	_XOFFSET2,BANKED
	movlw	0
	subwfb	GLCDDEVICEWIDTH_H,W,ACCESS
	movwf	_XOFFSET2_H,BANKED
	movlw	44
	movwf	_YOFFSET2,BANKED
	movlw	1
	movwf	_YOFFSET2_H,BANKED
	movlw	5
	movwf	_WOFFSET,BANKED
	clrf	_WOFFSET_H,BANKED
	banksel	LT7686_LINECOLOUR
	setf	LT7686_LINECOLOUR,BANKED
	setf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_WIDTH_LT7686
	banksel	_XOFFSET1
	clrf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	clrf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
	movlw	1
	subwf	GLCDDEVICEWIDTH,W,ACCESS
	movwf	_XOFFSET2,BANKED
	movlw	0
	subwfb	GLCDDEVICEWIDTH_H,W,ACCESS
	movwf	_XOFFSET2_H,BANKED
	movlw	100
	movwf	_YOFFSET2,BANKED
	clrf	_YOFFSET2_H,BANKED
	clrf	_WOFFSET,BANKED
	clrf	_WOFFSET_H,BANKED
	banksel	LT7686_LINECOLOUR
	setf	LT7686_LINECOLOUR,BANKED
	setf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_WIDTH_LT7686
	banksel	_XOFFSET1
	clrf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	clrf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
	movlw	1
	subwf	GLCDDEVICEWIDTH,W,ACCESS
	movwf	_XOFFSET2,BANKED
	movlw	0
	subwfb	GLCDDEVICEWIDTH_H,W,ACCESS
	movwf	_XOFFSET2_H,BANKED
	movlw	150
	movwf	_YOFFSET2,BANKED
	clrf	_YOFFSET2_H,BANKED
	movlw	1
	movwf	_WOFFSET,BANKED
	clrf	_WOFFSET_H,BANKED
	banksel	LT7686_LINECOLOUR
	setf	LT7686_LINECOLOUR,BANKED
	setf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_WIDTH_LT7686
	banksel	_XOFFSET1
	clrf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	clrf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
	movlw	1
	subwf	GLCDDEVICEWIDTH,W,ACCESS
	movwf	_XOFFSET2,BANKED
	movlw	0
	subwfb	GLCDDEVICEWIDTH_H,W,ACCESS
	movwf	_XOFFSET2_H,BANKED
	movlw	200
	movwf	_YOFFSET2,BANKED
	clrf	_YOFFSET2_H,BANKED
	movlw	2
	movwf	_WOFFSET,BANKED
	clrf	_WOFFSET_H,BANKED
	banksel	LT7686_LINECOLOUR
	setf	LT7686_LINECOLOUR,BANKED
	setf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_WIDTH_LT7686
	banksel	_XOFFSET1
	clrf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	clrf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
	movlw	1
	subwf	GLCDDEVICEWIDTH,W,ACCESS
	movwf	_XOFFSET2,BANKED
	movlw	0
	subwfb	GLCDDEVICEWIDTH_H,W,ACCESS
	movwf	_XOFFSET2_H,BANKED
	movlw	250
	movwf	_YOFFSET2,BANKED
	clrf	_YOFFSET2_H,BANKED
	movlw	4
	movwf	_WOFFSET,BANKED
	clrf	_WOFFSET_H,BANKED
	banksel	LT7686_LINECOLOUR
	setf	LT7686_LINECOLOUR,BANKED
	setf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_WIDTH_LT7686
	banksel	_XOFFSET1
	clrf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	clrf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
	movlw	1
	subwf	GLCDDEVICEWIDTH,W,ACCESS
	movwf	_XOFFSET2,BANKED
	movlw	0
	subwfb	GLCDDEVICEWIDTH_H,W,ACCESS
	movwf	_XOFFSET2_H,BANKED
	movlw	44
	movwf	_YOFFSET2,BANKED
	movlw	1
	movwf	_YOFFSET2_H,BANKED
	movlw	5
	movwf	_WOFFSET,BANKED
	clrf	_WOFFSET_H,BANKED
	banksel	LT7686_LINECOLOUR
	setf	LT7686_LINECOLOUR,BANKED
	setf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_WIDTH_LT7686
	movlw	1
	subwf	GLCDDEVICEWIDTH,W,ACCESS
	banksel	_XOFFSET1
	movwf	_XOFFSET1,BANKED
	movlw	0
	subwfb	GLCDDEVICEWIDTH_H,W,ACCESS
	movwf	_XOFFSET1_H,BANKED
	clrf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
	clrf	_XOFFSET2,BANKED
	clrf	_XOFFSET2_H,BANKED
	movlw	100
	movwf	_YOFFSET2,BANKED
	clrf	_YOFFSET2_H,BANKED
	clrf	_WOFFSET,BANKED
	clrf	_WOFFSET_H,BANKED
	banksel	LT7686_LINECOLOUR
	setf	LT7686_LINECOLOUR,BANKED
	setf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_WIDTH_LT7686
	movlw	1
	subwf	GLCDDEVICEWIDTH,W,ACCESS
	banksel	_XOFFSET1
	movwf	_XOFFSET1,BANKED
	movlw	0
	subwfb	GLCDDEVICEWIDTH_H,W,ACCESS
	movwf	_XOFFSET1_H,BANKED
	clrf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
	clrf	_XOFFSET2,BANKED
	clrf	_XOFFSET2_H,BANKED
	movlw	150
	movwf	_YOFFSET2,BANKED
	clrf	_YOFFSET2_H,BANKED
	movlw	1
	movwf	_WOFFSET,BANKED
	clrf	_WOFFSET_H,BANKED
	banksel	LT7686_LINECOLOUR
	setf	LT7686_LINECOLOUR,BANKED
	setf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_WIDTH_LT7686
	movlw	1
	subwf	GLCDDEVICEWIDTH,W,ACCESS
	banksel	_XOFFSET1
	movwf	_XOFFSET1,BANKED
	movlw	0
	subwfb	GLCDDEVICEWIDTH_H,W,ACCESS
	movwf	_XOFFSET1_H,BANKED
	clrf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
	clrf	_XOFFSET2,BANKED
	clrf	_XOFFSET2_H,BANKED
	movlw	200
	movwf	_YOFFSET2,BANKED
	clrf	_YOFFSET2_H,BANKED
	movlw	2
	movwf	_WOFFSET,BANKED
	clrf	_WOFFSET_H,BANKED
	banksel	LT7686_LINECOLOUR
	setf	LT7686_LINECOLOUR,BANKED
	setf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_WIDTH_LT7686
	movlw	1
	subwf	GLCDDEVICEWIDTH,W,ACCESS
	banksel	_XOFFSET1
	movwf	_XOFFSET1,BANKED
	movlw	0
	subwfb	GLCDDEVICEWIDTH_H,W,ACCESS
	movwf	_XOFFSET1_H,BANKED
	clrf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
	clrf	_XOFFSET2,BANKED
	clrf	_XOFFSET2_H,BANKED
	movlw	250
	movwf	_YOFFSET2,BANKED
	clrf	_YOFFSET2_H,BANKED
	movlw	4
	movwf	_WOFFSET,BANKED
	clrf	_WOFFSET_H,BANKED
	banksel	LT7686_LINECOLOUR
	setf	LT7686_LINECOLOUR,BANKED
	setf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_WIDTH_LT7686
	movlw	1
	subwf	GLCDDEVICEWIDTH,W,ACCESS
	banksel	_XOFFSET1
	movwf	_XOFFSET1,BANKED
	movlw	0
	subwfb	GLCDDEVICEWIDTH_H,W,ACCESS
	movwf	_XOFFSET1_H,BANKED
	clrf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
	clrf	_XOFFSET2,BANKED
	clrf	_XOFFSET2_H,BANKED
	movlw	44
	movwf	_YOFFSET2,BANKED
	movlw	1
	movwf	_YOFFSET2_H,BANKED
	movlw	5
	movwf	_WOFFSET,BANKED
	clrf	_WOFFSET_H,BANKED
	banksel	LT7686_LINECOLOUR
	setf	LT7686_LINECOLOUR,BANKED
	setf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_WIDTH_LT7686
	banksel	_XOFFSET1
	clrf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	movlw	144
	movwf	_YOFFSET1,BANKED
	movlw	1
	movwf	_YOFFSET1_H,BANKED
	movlw	1
	subwf	GLCDDEVICEWIDTH,W,ACCESS
	movwf	_XOFFSET2,BANKED
	movlw	0
	subwfb	GLCDDEVICEWIDTH_H,W,ACCESS
	movwf	_XOFFSET2_H,BANKED
	movlw	144
	movwf	_YOFFSET2,BANKED
	movlw	1
	movwf	_YOFFSET2_H,BANKED
	movlw	80
	movwf	_WOFFSET,BANKED
	clrf	_WOFFSET_H,BANKED
	movlw	31
	banksel	LT7686_LINECOLOUR
	movwf	LT7686_LINECOLOUR,BANKED
	clrf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_WIDTH_LT7686
	incf	FIRSTRUN,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	ENDIF16
	movlw	10
	movwf	SysWaitTempS,ACCESS
	call	Delay_S
	movlw	250
	movwf	DRAWCOUNT,ACCESS
	clrf	DRAWCOUNT_H,ACCESS
ENDIF16
	bra	SysSelectEnd2
SysSelect2Case28
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	27
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelectEnd2
	movff	XX,XOFFSET1
	movff	XX_H,XOFFSET1_H
	movff	YY,YOFFSET1
	movff	YY_H,YOFFSET1_H
	movff	RR,_INXRADIUS
	movff	RR_H,_INXRADIUS_H
	movff	RR,SysWORDTempA
	movff	RR_H,SysWORDTempA_H
	movlw	20
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSDIVSUB16
	movff	SysWORDTempA,_WOFFSET
	movff	SysWORDTempA_H,_WOFFSET_H
	banksel	LT7686_LINECOLOUR
	setf	LT7686_LINECOLOUR,BANKED
	setf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	movff	COLORS,LT7686_FILLCOLOUR
	movff	COLORS_H,LT7686_FILLCOLOUR_H
	clrf	LT7686_FILLCOLOUR_U,BANKED
	clrf	LT7686_FILLCOLOUR_E,BANKED
	banksel	0
	call	FRAMEDFILLEDCIRCLE_LT7686
	movlw	200
	banksel	_XOFFSET1
	movwf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	movlw	60
	movwf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
	movlw	144
	movwf	_XOFFSET2,BANKED
	movlw	1
	movwf	_XOFFSET2_H,BANKED
	movlw	150
	movwf	_YOFFSET2,BANKED
	clrf	_YOFFSET2_H,BANKED
	movlw	5
	movwf	_WOFFSET,BANKED
	clrf	_WOFFSET_H,BANKED
	banksel	LT7686_LINECOLOUR
	clrf	LT7686_LINECOLOUR,BANKED
	movlw	248
	movwf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	setf	LT7686_FILLCOLOUR,BANKED
	setf	LT7686_FILLCOLOUR_H,BANKED
	clrf	LT7686_FILLCOLOUR_U,BANKED
	clrf	LT7686_FILLCOLOUR_E,BANKED
	banksel	0
	call	FRAMEDFILLEDBOX_LT7686
	movlw	38
	banksel	_XOFFSET1
	movwf	_XOFFSET1,BANKED
	movlw	2
	movwf	_XOFFSET1_H,BANKED
	movlw	60
	movwf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
	movlw	244
	movwf	_XOFFSET2,BANKED
	movlw	1
	movwf	_XOFFSET2_H,BANKED
	movlw	94
	movwf	_YOFFSET2,BANKED
	movlw	1
	movwf	_YOFFSET2_H,BANKED
	movlw	30
	movwf	INXRADIUS,ACCESS
	clrf	INXRADIUS_H,ACCESS
	movlw	20
	movwf	INYRADIUS,ACCESS
	clrf	INYRADIUS_H,ACCESS
	movlw	5
	movwf	_WOFFSET,BANKED
	clrf	_WOFFSET_H,BANKED
	banksel	LT7686_LINECOLOUR
	clrf	LT7686_LINECOLOUR,BANKED
	movlw	248
	movwf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	setf	LT7686_FILLCOLOUR,BANKED
	setf	LT7686_FILLCOLOUR_H,BANKED
	clrf	LT7686_FILLCOLOUR_U,BANKED
	clrf	LT7686_FILLCOLOUR_E,BANKED
	banksel	0
	call	FRAMEDFILLEDROUNDRECT_LT7686
	movlw	100
	banksel	_XOFFSET1
	movwf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	movlw	100
	movwf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
	movlw	50
	movwf	_XOFFSET2,BANKED
	clrf	_XOFFSET2_H,BANKED
	movlw	200
	movwf	_YOFFSET2,BANKED
	clrf	_YOFFSET2_H,BANKED
	movlw	150
	movwf	_XOFFSET3,BANKED
	clrf	_XOFFSET3_H,BANKED
	movlw	150
	movwf	_YOFFSET3,BANKED
	clrf	_YOFFSET3_H,BANKED
	banksel	LT7686_LINECOLOUR
	clrf	LT7686_LINECOLOUR,BANKED
	movlw	248
	movwf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	setf	LT7686_FILLCOLOUR,BANKED
	setf	LT7686_FILLCOLOUR_H,BANKED
	clrf	LT7686_FILLCOLOUR_U,BANKED
	clrf	LT7686_FILLCOLOUR_E,BANKED
	banksel	0
	call	FRAMEDFILLEDTRIANGLE_LT7686
	movlw	44
	banksel	_XOFFSET1
	movwf	_XOFFSET1,BANKED
	movlw	1
	movwf	_XOFFSET1_H,BANKED
	movlw	44
	movwf	_YOFFSET1,BANKED
	movlw	1
	movwf	_YOFFSET1_H,BANKED
	movlw	94
	movwf	_XOFFSET2,BANKED
	movlw	1
	movwf	_XOFFSET2_H,BANKED
	movlw	250
	movwf	_YOFFSET2,BANKED
	clrf	_YOFFSET2_H,BANKED
	movlw	144
	movwf	_XOFFSET3,BANKED
	movlw	1
	movwf	_XOFFSET3_H,BANKED
	movlw	250
	movwf	_YOFFSET3,BANKED
	clrf	_YOFFSET3_H,BANKED
	movlw	94
	movwf	_XOFFSET4,BANKED
	movlw	1
	movwf	_XOFFSET4_H,BANKED
	movlw	44
	movwf	_YOFFSET4,BANKED
	movlw	1
	movwf	_YOFFSET4_H,BANKED
	movlw	94
	movwf	_XOFFSET5,BANKED
	movlw	1
	movwf	_XOFFSET5_H,BANKED
	movlw	94
	movwf	_YOFFSET5,BANKED
	movlw	1
	movwf	_YOFFSET5_H,BANKED
	movlw	144
	movwf	_XOFFSET6,BANKED
	movlw	1
	movwf	_XOFFSET6_H,BANKED
	movlw	44
	movwf	_YOFFSET6,BANKED
	movlw	1
	movwf	_YOFFSET6_H,BANKED
	banksel	LT7686_LINECOLOUR
	clrf	LT7686_LINECOLOUR,BANKED
	movlw	248
	movwf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	setf	LT7686_FILLCOLOUR,BANKED
	setf	LT7686_FILLCOLOUR_H,BANKED
	clrf	LT7686_FILLCOLOUR_U,BANKED
	clrf	LT7686_FILLCOLOUR_E,BANKED
	banksel	0
	call	FILLEDCUBE_LT7686
	incf	FIRSTRUN,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	ENDIF17
	movlw	10
	movwf	SysWaitTempS,ACCESS
	call	Delay_S
	movlw	250
	movwf	DRAWCOUNT,ACCESS
	clrf	DRAWCOUNT_H,ACCESS
ENDIF17
SysSelectEnd2
	movff	DRAWCOUNT,SysWORDTempA
	movff	DRAWCOUNT_H,SysWORDTempA_H
	movlw	250
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	banksel	0
	call	SYSCOMPLESSTHAN16
	comf	SysByteTempX,F,ACCESS
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF18
	clrf	GLCDBACKGROUND,ACCESS
	clrf	GLCDBACKGROUND_H,ACCESS
	clrf	GLCDBACKGROUND_U,ACCESS
	clrf	GLCDBACKGROUND_E,ACCESS
	call	GLCDCLS_LT7686
	setf	FIRSTRUN,ACCESS
	movlw	250
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	call	Delay_MS
	clrf	DRAWCOUNT,ACCESS
	clrf	DRAWCOUNT_H,ACCESS
	movff	TIMER0,RANDOMTEMP
	banksel	RANDOMTEMP_H
	clrf	RANDOMTEMP_H,BANKED
	banksel	0
	call	RANDOMIZE
	banksel	STYLE
	incf	STYLE,F,BANKED
	btfsc	STATUS,Z,ACCESS
	incf	STYLE_H,F,BANKED
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	30
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	banksel	0
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF27
	banksel	STYLE
	clrf	STYLE,BANKED
	clrf	STYLE_H,BANKED
ENDIF27
ENDIF18
	incf	DRAWCOUNT,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	DRAWCOUNT_H,F,ACCESS
	movlw	10
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	banksel	0
	call	Delay_MS
	goto	SysDoLoop_S1
SysDoLoop_E1
	bra	BASPROGRAMEND
;#insert "020_GLCDProgram.gcb"      //Meter for Steve
	banksel	XCENTRE
	clrf	XCENTRE,BANKED
	movlw	2
	movwf	XCENTRE_H,BANKED
	movlw	38
	banksel	YCENTRE
	movwf	YCENTRE,BANKED
	movlw	2
	movwf	YCENTRE_H,BANKED
	movlw	4
	movwf	LINESIZE,ACCESS
	banksel	0
	call	GLCDCLS_LT7686
	movlw	69
	banksel	RADIUS
	movwf	RADIUS,BANKED
	movlw	1
	movwf	RADIUS_H,BANKED
	clrf	ANGLE,ACCESS
	clrf	ANGLE_H,ACCESS
	movlw	104
	movwf	OLD_ANGLE,BANKED
	movlw	1
	movwf	OLD_ANGLE_H,BANKED
	movlw	32
	banksel	_FONTSIZE
	movwf	_FONTSIZE,BANKED
	movlw	4
	movwf	_XWIDTHMAG,BANKED
	movlw	4
	movwf	_YHEIGHTMAG,BANKED
	clrf	_CHROMAKEY,BANKED
	clrf	_ALIGNMENT,BANKED
	banksel	0
	call	LT7686_SELECT_INTERNAL_FONT_INIT
	clrf	GLCDBACKGROUND,ACCESS
	clrf	GLCDBACKGROUND_H,ACCESS
	movff	XCENTRE,XOFFSET1
	movff	XCENTRE_H,XOFFSET1_H
	movff	YCENTRE,YOFFSET1
	movff	YCENTRE_H,YOFFSET1_H
	movlw	1
	banksel	RADIUS
	addwf	RADIUS,W,BANKED
	movwf	INXRADIUS,ACCESS
	movlw	0
	addwfc	RADIUS_H,W,BANKED
	movwf	INXRADIUS_H,ACCESS
	movlw	1
	addwf	RADIUS,W,BANKED
	movwf	INYRADIUS,ACCESS
	movlw	0
	addwfc	RADIUS_H,W,BANKED
	movwf	INYRADIUS_H,ACCESS
	clrf	LT7686_LINECOLOUR,BANKED
	movlw	248
	movwf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LEFTUPCURVE_LT7686
	movff	XCENTRE,XOFFSET1
	movff	XCENTRE_H,XOFFSET1_H
	movff	YCENTRE,YOFFSET1
	movff	YCENTRE_H,YOFFSET1_H
	movlw	1
	banksel	RADIUS
	addwf	RADIUS,W,BANKED
	movwf	INXRADIUS,ACCESS
	movlw	0
	addwfc	RADIUS_H,W,BANKED
	movwf	INXRADIUS_H,ACCESS
	movlw	1
	addwf	RADIUS,W,BANKED
	movwf	INYRADIUS,ACCESS
	movlw	0
	addwfc	RADIUS_H,W,BANKED
	movwf	INYRADIUS_H,ACCESS
	clrf	LT7686_LINECOLOUR,BANKED
	movlw	248
	movwf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	RIGHTUPCURVE_LT7686
SysDoLoop_S2
	clrf	ADREADPORT,ACCESS
	call	FN_READAD587
	movff	SYSREADADBYTE,ADCVAL
	clrf	ADCVAL_H,ACCESS
	movff	ADCVAL,L_MAP
	movff	ADCVAL_H,L_MAP_H
	banksel	L_FROMLOW
	clrf	L_FROMLOW,BANKED
	clrf	L_FROMLOW_H,BANKED
	setf	L_FROMHIGH,BANKED
	clrf	L_FROMHIGH_H,BANKED
	movlw	176
	movwf	L_TOLOW,BANKED
	setf	L_TOLOW_H,BANKED
	movlw	80
	movwf	L_TOHIGH,BANKED
	clrf	L_TOHIGH_H,BANKED
	clrf	L_CALIBRATE,BANKED
	clrf	L_CALIBRATE_H,BANKED
	banksel	0
	call	FN_SCALE657
	movff	SYSSCALEINTEGER,ANGLE
	movff	SYSSCALEINTEGER_H,ANGLE_H
	movff	ADCVAL,L_MAP
	movff	ADCVAL_H,L_MAP_H
	banksel	L_FROMLOW
	clrf	L_FROMLOW,BANKED
	clrf	L_FROMLOW_H,BANKED
	setf	L_FROMHIGH,BANKED
	clrf	L_FROMHIGH_H,BANKED
	clrf	L_TOLOW,BANKED
	clrf	L_TOLOW_H,BANKED
	movlw	244
	movwf	L_TOHIGH,BANKED
	movlw	1
	movwf	L_TOHIGH_H,BANKED
	clrf	L_CALIBRATE,BANKED
	clrf	L_CALIBRATE_H,BANKED
	banksel	0
	call	FN_SCALE657
	movff	SYSSCALEINTEGER,ADCVAL
	movff	SYSSCALEINTEGER_H,ADCVAL_H
	movff	ADCVAL,SYSVALTEMP
	movff	ADCVAL_H,SYSVALTEMP_H
	call	FN_STR
	lfsr	1,VOLTS
	lfsr	0,STR
	call	SYSCOPYSTRING
	movff	ADCVAL,SysINTEGERTempA
	movff	ADCVAL_H,SysINTEGERTempA_H
	movlw	10
	movwf	SysINTEGERTempB,ACCESS
	clrf	SysINTEGERTempB_H,ACCESS
	call	SYSCOMPLESSTHANINT
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF19
	movlw	low VOLTS
	banksel	SYSSYSINSTRINGHANDLER
	movwf	SysSYSINSTRINGHandler,BANKED
	movlw	high VOLTS
	movwf	SysSYSINSTRINGHandler_H,BANKED
	movlw	1
	movwf	SYSCHARCOUNT,BANKED
	banksel	0
	call	FN_LEFT
	lfsr	1,VOLTS
	clrf	SysStringLength,ACCESS
	movlw	low StringTable39
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable39
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable39
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,LEFT
	call	SYSCOPYSTRINGPART
	lfsr	0,VOLTS
	movff	SysStringLength, INDF0
	bra	VOLT_FORMAT_DONE
ENDIF19
	movff	ADCVAL,SysINTEGERTempA
	movff	ADCVAL_H,SysINTEGERTempA_H
	movlw	100
	movwf	SysINTEGERTempB,ACCESS
	clrf	SysINTEGERTempB_H,ACCESS
	call	SYSCOMPLESSTHANINT
	btfss	SysByteTempX,0,ACCESS
	bra	ELSE20_1
	movlw	low VOLTS
	banksel	SYSSYSINSTRINGHANDLER
	movwf	SysSYSINSTRINGHandler,BANKED
	movlw	high VOLTS
	movwf	SysSYSINSTRINGHandler_H,BANKED
	movlw	1
	movwf	SYSCHARSTART,BANKED
	movlw	2
	movwf	SYSCHARCOUNT,BANKED
	banksel	0
	call	FN_MID
	lfsr	1,VOLTS
	clrf	SysStringLength,ACCESS
	movlw	low StringTable40
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable40
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable40
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,MID
	call	SYSCOPYSTRINGPART
	lfsr	0,VOLTS
	movff	SysStringLength, INDF0
	bra	ENDIF20
ELSE20_1
	movlw	low VOLTS
	banksel	SYSSYSINSTRINGHANDLER
	movwf	SysSYSINSTRINGHandler,BANKED
	movlw	high VOLTS
	movwf	SysSYSINSTRINGHandler_H,BANKED
	movlw	1
	movwf	SYSCHARCOUNT,BANKED
	banksel	0
	call	FN_LEFT
	movlw	low VOLTS
	banksel	SYSSYSINSTRINGHANDLER
	movwf	SysSYSINSTRINGHandler,BANKED
	movlw	high VOLTS
	movwf	SysSYSINSTRINGHandler_H,BANKED
	movlw	2
	movwf	SYSCHARSTART,BANKED
	movlw	2
	movwf	SYSCHARCOUNT,BANKED
	banksel	0
	call	FN_MID
	lfsr	1,VOLTS
	clrf	SysStringLength,ACCESS
	lfsr	0,LEFT
	call	SYSCOPYSTRINGPART
	movlw	low StringTable41
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable41
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable41
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,MID
	call	SYSCOPYSTRINGPART
	lfsr	0,VOLTS
	movff	SysStringLength, INDF0
ENDIF20
VOLT_FORMAT_DONE
	movff	ANGLE,TRIG_ARG2
	movff	ANGLE_H,TRIG_ARG2_H
	call	FN_SIN
	movff	RADIUS,SysINTEGERTempA
	movff	RADIUS_H,SysINTEGERTempA_H
	movff	SIN,SysINTEGERTempB
	movff	SIN_H,SysINTEGERTempB_H
	call	SYSMULTSUBINT
	movff	SysINTEGERTempX,SysTemp1
	movff	SysINTEGERTempX_H,SysTemp1_H
	movff	SYSTEMP1,SysINTEGERTempA
	movff	SYSTEMP1_H,SysINTEGERTempA_H
	movlw	100
	movwf	SysINTEGERTempB,ACCESS
	clrf	SysINTEGERTempB_H,ACCESS
	call	SYSDIVSUBINT
	movf	SysINTEGERTempA,W,ACCESS
	banksel	XCENTRE
	addwf	XCENTRE,W,BANKED
	movwf	XEND,BANKED
	movf	SysINTEGERTempA_H,W,ACCESS
	addwfc	XCENTRE_H,W,BANKED
	movwf	XEND_H,BANKED
	movff	ANGLE,TRIG_ARG2
	movff	ANGLE_H,TRIG_ARG2_H
	banksel	0
	rcall	FN_COS
	movff	RADIUS,SysINTEGERTempA
	movff	RADIUS_H,SysINTEGERTempA_H
	movff	COS,SysINTEGERTempB
	movff	COS_H,SysINTEGERTempB_H
	call	SYSMULTSUBINT
	movff	SysINTEGERTempX,SysTemp1
	movff	SysINTEGERTempX_H,SysTemp1_H
	movff	SYSTEMP1,SysINTEGERTempA
	movff	SYSTEMP1_H,SysINTEGERTempA_H
	movlw	100
	movwf	SysINTEGERTempB,ACCESS
	clrf	SysINTEGERTempB_H,ACCESS
	call	SYSDIVSUBINT
	movf	SysINTEGERTempA,W,ACCESS
	banksel	YCENTRE
	subwf	YCENTRE,W,BANKED
	movwf	YEND,BANKED
	movf	SysINTEGERTempA_H,W,ACCESS
	subwfb	YCENTRE_H,W,BANKED
	movwf	YEND_H,BANKED
	movff	OLD_ANGLE,SysINTEGERTempA
	movff	OLD_ANGLE_H,SysINTEGERTempA_H
	movff	ANGLE,SysINTEGERTempB
	movff	ANGLE_H,SysINTEGERTempB_H
	banksel	0
	call	SYSCOMPEQUAL16
	comf	SysByteTempX,F,ACCESS
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF21
	banksel	_XOFFSET1
	clrf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	clrf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
	movlw	low VOLTS
	banksel	SYSLCDPRINTDATAHANDLER
	movwf	SysLCDPRINTDATAHandler,BANKED
	movlw	high VOLTS
	movwf	SysLCDPRINTDATAHandler_H,BANKED
	setf	LT7686_LINECOLOUR,BANKED
	setf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LT7686_PRINT_INTERNAL_FONT556
	movff	XCENTRE,_XOFFSET1
	movff	XCENTRE_H,_XOFFSET1_H
	movff	YCENTRE,_YOFFSET1
	movff	YCENTRE_H,_YOFFSET1_H
	movff	OLD_XEND,_XOFFSET2
	movff	OLD_XEND_H,_XOFFSET2_H
	movff	OLD_YEND,_YOFFSET2
	movff	OLD_YEND_H,_YOFFSET2_H
	movff	LINESIZE,_WOFFSET
	banksel	_WOFFSET_H
	clrf	_WOFFSET_H,BANKED
	banksel	LT7686_LINECOLOUR
	clrf	LT7686_LINECOLOUR,BANKED
	clrf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_WIDTH_LT7686
	movff	XCENTRE,XOFFSET1
	movff	XCENTRE_H,XOFFSET1_H
	movff	YCENTRE,YOFFSET1
	movff	YCENTRE_H,YOFFSET1_H
	movff	LINESIZE,SysWORDTempA
	clrf	SysWORDTempA_H,ACCESS
	movlw	3
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSMULTSUB16
	movff	SysWORDTempX,INXRADIUS
	movff	SysWORDTempX_H,INXRADIUS_H
	banksel	LT7686_LINECOLOUR
	clrf	LT7686_LINECOLOUR,BANKED
	movlw	248
	movwf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	FILLEDCIRCLE_LT7686
	movff	XCENTRE,_XOFFSET1
	movff	XCENTRE_H,_XOFFSET1_H
	movff	YCENTRE,_YOFFSET1
	movff	YCENTRE_H,_YOFFSET1_H
	movff	XEND,_XOFFSET2
	movff	XEND_H,_XOFFSET2_H
	movff	YEND,_YOFFSET2
	movff	YEND_H,_YOFFSET2_H
	movff	LINESIZE,_WOFFSET
	banksel	_WOFFSET_H
	clrf	_WOFFSET_H,BANKED
	banksel	LT7686_LINECOLOUR
	clrf	LT7686_LINECOLOUR,BANKED
	movlw	248
	movwf	LT7686_LINECOLOUR_H,BANKED
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_WIDTH_LT7686
	movff	ANGLE,OLD_ANGLE
	movff	ANGLE_H,OLD_ANGLE_H
	movff	XEND,OLD_XEND
	movff	XEND_H,OLD_XEND_H
	movff	YEND,OLD_YEND
	movff	YEND_H,OLD_YEND_H
ENDIF21
	bra	SysDoLoop_S2
SysDoLoop_E2
BASPROGRAMEND
	sleep
	bra	BASPROGRAMEND

;********************************************************************************

FN_ABS
	btfss	SYSCALCTEMPA_H,7,ACCESS
	bra	ELSE55_1
	comf	SYSCALCTEMPA,W,ACCESS
	movwf	ABS,ACCESS
	comf	SYSCALCTEMPA_H,W,ACCESS
	movwf	ABS_H,ACCESS
	incf	ABS,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	ABS_H,F,ACCESS
	bra	ENDIF55
ELSE55_1
	movff	SYSCALCTEMPA,ABS
	movff	SYSCALCTEMPA_H,ABS_H
ENDIF55
	return

;********************************************************************************

BOX_LT7686
	movlw	104
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	105
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	106
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	107
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	108
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET2,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	109
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET2_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	110
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET2,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	111
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET2_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movff	LT7686_LINECOLOUR,__SET_LT7686_LINECOLOUR
	movff	LT7686_LINECOLOUR_H,__SET_LT7686_LINECOLOUR_H
	movff	LT7686_LINECOLOUR_U,__SET_LT7686_LINECOLOUR_U
	movff	LT7686_LINECOLOUR_E,__SET_LT7686_LINECOLOUR_E
	movlw	210
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	212
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	211
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	118
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movlw	160
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

FN_BYTETOBIN
	lfsr	1,BYTETOBIN
	movlw	low StringTable147
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable147
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable147
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRING
	movlw	8
	banksel	SYSREPEATTEMP3
	movwf	SysRepeatTemp3,BANKED
SysRepeatLoop3
	btfss	BYTENUM,7,ACCESS
	bra	ELSE84_1
	lfsr	1,BYTETOBIN
	clrf	SysStringLength,ACCESS
	lfsr	0,BYTETOBIN
	banksel	0
	call	SYSCOPYSTRINGPART
	movlw	low StringTable148
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable148
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable148
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,BYTETOBIN
	movff	SysStringLength, INDF0
	bra	ENDIF84
ELSE84_1
	lfsr	1,BYTETOBIN
	clrf	SysStringLength,ACCESS
	lfsr	0,BYTETOBIN
	banksel	0
	call	SYSCOPYSTRINGPART
	movlw	low StringTable101
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable101
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable101
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,BYTETOBIN
	movff	SysStringLength, INDF0
ENDIF84
	rlcf	BYTENUM,F,ACCESS
	banksel	SYSREPEATTEMP3
	decfsz	SysRepeatTemp3,F,BANKED
	bra	SysRepeatLoop3
SysRepeatLoopEnd3
	banksel	0
	return

;********************************************************************************

CIRCLE_LT7686
	movlw	123
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	124
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	125
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	126
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	119
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INXRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	120
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INXRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	121
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INXRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	122
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INXRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movff	LT7686_LINECOLOUR,__SET_LT7686_LINECOLOUR
	movff	LT7686_LINECOLOUR_H,__SET_LT7686_LINECOLOUR_H
	movff	LT7686_LINECOLOUR_U,__SET_LT7686_LINECOLOUR_U
	movff	LT7686_LINECOLOUR_E,__SET_LT7686_LINECOLOUR_E
	movlw	210
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	212
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	211
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	118
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movlw	128
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

FN_COS
	movff	TRIG_ARG2,SysINTEGERTempA
	movff	TRIG_ARG2_H,SysINTEGERTempA_H
	clrf	SysINTEGERTempB,ACCESS
	clrf	SysINTEGERTempB_H,ACCESS
	call	SYSCOMPLESSTHANINT
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF36
	movff	TRIG_ARG2,SysINTEGERTempA
	movff	TRIG_ARG2_H,SysINTEGERTempA_H
	setf	SysINTEGERTempB,ACCESS
	setf	SysINTEGERTempB_H,ACCESS
	call	SYSMULTSUBINT
	movff	SysINTEGERTempX,TRIG_ARG2
	movff	SysINTEGERTempX_H,TRIG_ARG2_H
ENDIF36
	movff	TRIG_ARG2,SysINTEGERTempA
	movff	TRIG_ARG2_H,SysINTEGERTempA_H
	movlw	104
	movwf	SysINTEGERTempB,ACCESS
	movlw	1
	movwf	SysINTEGERTempB_H,ACCESS
	call	SYSDIVSUBINT
	movff	SysINTEGERTempX,TRIG_ARG2
	movff	SysINTEGERTempX_H,TRIG_ARG2_H
	movlw	1
	banksel	TRIG_SIGN
	movwf	TRIG_SIGN,BANKED
	clrf	TRIG_SIGN_H,BANKED
	movff	TRIG_ARG2,SysINTEGERTempB
	movff	TRIG_ARG2_H,SysINTEGERTempB_H
	movlw	90
	movwf	SysINTEGERTempA,ACCESS
	clrf	SysINTEGERTempA_H,ACCESS
	banksel	0
	call	SYSCOMPLESSTHANINT
	movff	SysByteTempX,SysTemp3
	movff	TRIG_ARG2,SysINTEGERTempA
	movff	TRIG_ARG2_H,SysINTEGERTempA_H
	movlw	14
	movwf	SysINTEGERTempB,ACCESS
	movlw	1
	movwf	SysINTEGERTempB_H,ACCESS
	call	SYSCOMPLESSTHANINT
	banksel	SYSTEMP3
	movf	SysTemp3,W,BANKED
	andwf	SysByteTempX,W,ACCESS
	movwf	SysTemp1,BANKED
	btfss	SysTemp1,0,BANKED
	bra	ENDIF37
	setf	TRIG_SIGN,BANKED
	setf	TRIG_SIGN_H,BANKED
ENDIF37
	movff	TRIG_ARG2,TRIG_ARG1
	movff	TRIG_ARG2_H,TRIG_ARG1_H
	banksel	0
	call	FN_TRIG_REF
	movff	TRIG_REF,TRIG_ARG2
	movff	TRIG_REF_H,TRIG_ARG2_H
	banksel	TRIG_ARG2
	movf	TRIG_ARG2,W,BANKED
	sublw	90
	movwf	TRIG_ARG2,BANKED
	clrf	SysTemp3,BANKED
	movf	TRIG_ARG2_H,W,BANKED
	subwfb	SysTemp3,W,BANKED
	movwf	TRIG_ARG2_H,BANKED
	incf	TRIG_ARG2,W,BANKED
	movwf	TRIG_I,BANKED
	movff	TRIG_I,SYSSTRINGA
	banksel	0
	call	SINETAB
	banksel	TRIG_VAL
	movwf	TRIG_VAL,BANKED
	clrf	TRIG_VAL_H,BANKED
	movff	TRIG_SIGN,SysINTEGERTempA
	movff	TRIG_SIGN_H,SysINTEGERTempA_H
	movff	TRIG_VAL,SysINTEGERTempB
	movff	TRIG_VAL_H,SysINTEGERTempB_H
	banksel	0
	call	SYSMULTSUBINT
	movff	SysINTEGERTempX,COS
	movff	SysINTEGERTempX_H,COS_H
	return

;********************************************************************************

CYLINDER_LT7686
	movff	_YOFFSET1,SysWORDTempA
	movff	_YOFFSET1_H,SysWORDTempA_H
	movff	_ZOFFSET,SysWORDTempB
	movff	_ZOFFSET_H,SysWORDTempB_H
	call	SYSCOMPLESSTHAN16
	btfsc	SysByteTempX,0,ACCESS
	return
	movff	LT7686_LINECOLOUR,CACHE_LT7686_LINECOLOUR
	movff	LT7686_LINECOLOUR_H,CACHE_LT7686_LINECOLOUR_H
	movff	LT7686_LINECOLOUR_U,CACHE_LT7686_LINECOLOUR_U
	movff	LT7686_LINECOLOUR_E,CACHE_LT7686_LINECOLOUR_E
	movff	LT7686_FILLCOLOUR,CACHE_LT7686_FILLCOLOUR
	movff	LT7686_FILLCOLOUR_H,CACHE_LT7686_FILLCOLOUR_H
	movff	LT7686_FILLCOLOUR_U,CACHE_LT7686_FILLCOLOUR_U
	movff	LT7686_FILLCOLOUR_E,CACHE_LT7686_FILLCOLOUR_E
	movff	_XOFFSET1,XOFFSET1
	movff	_XOFFSET1_H,XOFFSET1_H
	movff	_YOFFSET1,YOFFSET1
	movff	_YOFFSET1_H,YOFFSET1_H
	movff	_INXRADIUS,INXRADIUS
	movff	_INXRADIUS_H,INXRADIUS_H
	movff	_INYRADIUS,INYRADIUS
	movff	_INYRADIUS_H,INYRADIUS_H
	movff	CACHE_LT7686_FILLCOLOUR,LT7686_LINECOLOUR
	movff	CACHE_LT7686_FILLCOLOUR_H,LT7686_LINECOLOUR_H
	movff	CACHE_LT7686_FILLCOLOUR_U,LT7686_LINECOLOUR_U
	movff	CACHE_LT7686_FILLCOLOUR_E,LT7686_LINECOLOUR_E
	rcall	FILLEDELLIPSE_LT7686
	movff	_XOFFSET1,XOFFSET1
	movff	_XOFFSET1_H,XOFFSET1_H
	movff	_YOFFSET1,YOFFSET1
	movff	_YOFFSET1_H,YOFFSET1_H
	movff	_INXRADIUS,INXRADIUS
	movff	_INXRADIUS_H,INXRADIUS_H
	movff	_INYRADIUS,INYRADIUS
	movff	_INYRADIUS_H,INYRADIUS_H
	movff	CACHE_LT7686_LINECOLOUR,LT7686_LINECOLOUR
	movff	CACHE_LT7686_LINECOLOUR_H,LT7686_LINECOLOUR_H
	movff	CACHE_LT7686_LINECOLOUR_U,LT7686_LINECOLOUR_U
	movff	CACHE_LT7686_LINECOLOUR_E,LT7686_LINECOLOUR_E
	rcall	ELLIPSE_LT7686
	movf	INXRADIUS,W,ACCESS
	banksel	_XOFFSET1
	subwf	_XOFFSET1,W,BANKED
	banksel	XOFFSET1
	movwf	XOFFSET1,BANKED
	movlw	0
	banksel	_XOFFSET1_H
	subwfb	_XOFFSET1_H,W,BANKED
	banksel	XOFFSET1_H
	movwf	XOFFSET1_H,BANKED
	banksel	_ZOFFSET
	movf	_ZOFFSET,W,BANKED
	subwf	_YOFFSET1,W,BANKED
	movwf	YOFFSET1,BANKED
	movf	_ZOFFSET_H,W,BANKED
	subwfb	_YOFFSET1_H,W,BANKED
	movwf	YOFFSET1_H,BANKED
	movf	_INXRADIUS,W,BANKED
	addwf	_XOFFSET1,W,BANKED
	banksel	XOFFSET2
	movwf	XOFFSET2,BANKED
	banksel	_INXRADIUS_H
	movf	_INXRADIUS_H,W,BANKED
	addwfc	_XOFFSET1_H,W,BANKED
	banksel	XOFFSET2_H
	movwf	XOFFSET2_H,BANKED
	movff	_YOFFSET1,YOFFSET2
	movff	_YOFFSET1_H,YOFFSET2_H
	movff	CACHE_LT7686_FILLCOLOUR,LT7686_LINECOLOUR
	movff	CACHE_LT7686_FILLCOLOUR_H,LT7686_LINECOLOUR_H
	movff	CACHE_LT7686_FILLCOLOUR_U,LT7686_LINECOLOUR_U
	movff	CACHE_LT7686_FILLCOLOUR_E,LT7686_LINECOLOUR_E
	banksel	0
	rcall	FILLEDBOX_LT7686
	movff	_XOFFSET1,XOFFSET1
	movff	_XOFFSET1_H,XOFFSET1_H
	banksel	_ZOFFSET
	movf	_ZOFFSET,W,BANKED
	subwf	_YOFFSET1,W,BANKED
	movwf	YOFFSET1,BANKED
	movf	_ZOFFSET_H,W,BANKED
	subwfb	_YOFFSET1_H,W,BANKED
	movwf	YOFFSET1_H,BANKED
	movff	_INXRADIUS,INXRADIUS
	movff	_INXRADIUS_H,INXRADIUS_H
	movff	_INYRADIUS,INYRADIUS
	movff	_INYRADIUS_H,INYRADIUS_H
	movff	CACHE_LT7686_FILLCOLOUR,LT7686_LINECOLOUR
	movff	CACHE_LT7686_FILLCOLOUR_H,LT7686_LINECOLOUR_H
	movff	CACHE_LT7686_FILLCOLOUR_U,LT7686_LINECOLOUR_U
	movff	CACHE_LT7686_FILLCOLOUR_E,LT7686_LINECOLOUR_E
	banksel	0
	rcall	FILLEDELLIPSE_LT7686
	movff	_XOFFSET1,XOFFSET1
	movff	_XOFFSET1_H,XOFFSET1_H
	banksel	_ZOFFSET
	movf	_ZOFFSET,W,BANKED
	subwf	_YOFFSET1,W,BANKED
	movwf	YOFFSET1,BANKED
	movf	_ZOFFSET_H,W,BANKED
	subwfb	_YOFFSET1_H,W,BANKED
	movwf	YOFFSET1_H,BANKED
	movff	_INXRADIUS,INXRADIUS
	movff	_INXRADIUS_H,INXRADIUS_H
	movff	_INYRADIUS,INYRADIUS
	movff	_INYRADIUS_H,INYRADIUS_H
	movff	CACHE_LT7686_LINECOLOUR,LT7686_LINECOLOUR
	movff	CACHE_LT7686_LINECOLOUR_H,LT7686_LINECOLOUR_H
	movff	CACHE_LT7686_LINECOLOUR_U,LT7686_LINECOLOUR_U
	movff	CACHE_LT7686_LINECOLOUR_E,LT7686_LINECOLOUR_E
	banksel	0
	rcall	ELLIPSE_LT7686
	banksel	_INXRADIUS
	movf	_INXRADIUS,W,BANKED
	subwf	_XOFFSET1,W,BANKED
	banksel	XOFFSET1
	movwf	XOFFSET1,BANKED
	banksel	_INXRADIUS_H
	movf	_INXRADIUS_H,W,BANKED
	subwfb	_XOFFSET1_H,W,BANKED
	banksel	XOFFSET1_H
	movwf	XOFFSET1_H,BANKED
	movff	_YOFFSET1,YOFFSET1
	movff	_YOFFSET1_H,YOFFSET1_H
	banksel	_INXRADIUS
	movf	_INXRADIUS,W,BANKED
	subwf	_XOFFSET1,W,BANKED
	banksel	XOFFSET2
	movwf	XOFFSET2,BANKED
	banksel	_INXRADIUS_H
	movf	_INXRADIUS_H,W,BANKED
	subwfb	_XOFFSET1_H,W,BANKED
	banksel	XOFFSET2_H
	movwf	XOFFSET2_H,BANKED
	banksel	_ZOFFSET
	movf	_ZOFFSET,W,BANKED
	subwf	_YOFFSET1,W,BANKED
	movwf	YOFFSET2,BANKED
	movf	_ZOFFSET_H,W,BANKED
	subwfb	_YOFFSET1_H,W,BANKED
	movwf	YOFFSET2_H,BANKED
	movff	CACHE_LT7686_LINECOLOUR,LT7686_LINECOLOUR
	movff	CACHE_LT7686_LINECOLOUR_H,LT7686_LINECOLOUR_H
	movff	CACHE_LT7686_LINECOLOUR_U,LT7686_LINECOLOUR_U
	movff	CACHE_LT7686_LINECOLOUR_E,LT7686_LINECOLOUR_E
	banksel	0
	call	LINE_LT7686
	banksel	_INXRADIUS
	movf	_INXRADIUS,W,BANKED
	addwf	_XOFFSET1,W,BANKED
	banksel	XOFFSET1
	movwf	XOFFSET1,BANKED
	banksel	_INXRADIUS_H
	movf	_INXRADIUS_H,W,BANKED
	addwfc	_XOFFSET1_H,W,BANKED
	banksel	XOFFSET1_H
	movwf	XOFFSET1_H,BANKED
	movff	_YOFFSET1,YOFFSET1
	movff	_YOFFSET1_H,YOFFSET1_H
	banksel	_INXRADIUS
	movf	_INXRADIUS,W,BANKED
	addwf	_XOFFSET1,W,BANKED
	banksel	XOFFSET2
	movwf	XOFFSET2,BANKED
	banksel	_INXRADIUS_H
	movf	_INXRADIUS_H,W,BANKED
	addwfc	_XOFFSET1_H,W,BANKED
	banksel	XOFFSET2_H
	movwf	XOFFSET2_H,BANKED
	banksel	_ZOFFSET
	movf	_ZOFFSET,W,BANKED
	subwf	_YOFFSET1,W,BANKED
	movwf	YOFFSET2,BANKED
	movf	_ZOFFSET_H,W,BANKED
	subwfb	_YOFFSET1_H,W,BANKED
	movwf	YOFFSET2_H,BANKED
	movff	CACHE_LT7686_LINECOLOUR,LT7686_LINECOLOUR
	movff	CACHE_LT7686_LINECOLOUR_H,LT7686_LINECOLOUR_H
	movff	CACHE_LT7686_LINECOLOUR_U,LT7686_LINECOLOUR_U
	movff	CACHE_LT7686_LINECOLOUR_E,LT7686_LINECOLOUR_E
	banksel	0
	call	LINE_LT7686
	movff	CACHE_LT7686_LINECOLOUR,LT7686_LINECOLOUR
	movff	CACHE_LT7686_LINECOLOUR_H,LT7686_LINECOLOUR_H
	movff	CACHE_LT7686_LINECOLOUR_U,LT7686_LINECOLOUR_U
	movff	CACHE_LT7686_LINECOLOUR_E,LT7686_LINECOLOUR_E
	movff	CACHE_LT7686_FILLCOLOUR,LT7686_FILLCOLOUR
	movff	CACHE_LT7686_FILLCOLOUR_H,LT7686_FILLCOLOUR_H
	movff	CACHE_LT7686_FILLCOLOUR_U,LT7686_FILLCOLOUR_U
	movff	CACHE_LT7686_FILLCOLOUR_E,LT7686_FILLCOLOUR_E
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

ELLIPSE_LT7686
	movlw	123
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	124
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	125
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	126
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	119
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INXRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	120
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INXRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	121
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INYRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	122
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INYRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movff	LT7686_LINECOLOUR,__SET_LT7686_LINECOLOUR
	movff	LT7686_LINECOLOUR_H,__SET_LT7686_LINECOLOUR_H
	movff	LT7686_LINECOLOUR_U,__SET_LT7686_LINECOLOUR_U
	movff	LT7686_LINECOLOUR_E,__SET_LT7686_LINECOLOUR_E
	movlw	210
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	212
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	211
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	118
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movlw	128
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

FASTHWSPITRANSFER
	movlw	1
	movwf	SPI1TCNTL,BANKED
	movff	SPITXDATA,SPI1TXB
SysWaitLoop3
	btfss	PIR3,SPI1RXIF,ACCESS
	bra	SysWaitLoop3
	movff	SPI1RXB,SPIRXDATA
	return

;********************************************************************************

FILLEDBOX_LT7686
	movlw	104
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	105
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	106
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	107
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	108
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET2,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	109
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET2_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	110
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET2,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	111
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET2_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movff	LT7686_LINECOLOUR,__SET_LT7686_LINECOLOUR
	movff	LT7686_LINECOLOUR_H,__SET_LT7686_LINECOLOUR_H
	movff	LT7686_LINECOLOUR_U,__SET_LT7686_LINECOLOUR_U
	movff	LT7686_LINECOLOUR_E,__SET_LT7686_LINECOLOUR_E
	movlw	210
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	212
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	211
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	118
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movlw	224
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

FILLEDCIRCLE_LT7686
	movlw	123
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	124
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	125
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	126
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	119
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INXRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	120
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INXRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	121
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INXRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	122
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INXRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movff	LT7686_LINECOLOUR,__SET_LT7686_LINECOLOUR
	movff	LT7686_LINECOLOUR_H,__SET_LT7686_LINECOLOUR_H
	movff	LT7686_LINECOLOUR_U,__SET_LT7686_LINECOLOUR_U
	movff	LT7686_LINECOLOUR_E,__SET_LT7686_LINECOLOUR_E
	movlw	210
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	212
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	211
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	118
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movlw	192
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

FILLEDCUBE_LT7686
	movff	LT7686_LINECOLOUR,CACHE_LT7686_LINECOLOUR
	movff	LT7686_LINECOLOUR_H,CACHE_LT7686_LINECOLOUR_H
	movff	LT7686_LINECOLOUR_U,CACHE_LT7686_LINECOLOUR_U
	movff	LT7686_LINECOLOUR_E,CACHE_LT7686_LINECOLOUR_E
	movff	LT7686_FILLCOLOUR,CACHE_LT7686_FILLCOLOUR
	movff	LT7686_FILLCOLOUR_H,CACHE_LT7686_FILLCOLOUR_H
	movff	LT7686_FILLCOLOUR_U,CACHE_LT7686_FILLCOLOUR_U
	movff	LT7686_FILLCOLOUR_E,CACHE_LT7686_FILLCOLOUR_E
	movff	_XOFFSET1,XOFFSET1
	movff	_XOFFSET1_H,XOFFSET1_H
	movff	_YOFFSET1,YOFFSET1
	movff	_YOFFSET1_H,YOFFSET1_H
	movff	_XOFFSET5,XOFFSET2
	movff	_XOFFSET5_H,XOFFSET2_H
	movff	_YOFFSET5,YOFFSET2
	movff	_YOFFSET5_H,YOFFSET2_H
	movff	CACHE_LT7686_FILLCOLOUR,LT7686_LINECOLOUR
	movff	CACHE_LT7686_FILLCOLOUR_H,LT7686_LINECOLOUR_H
	movff	CACHE_LT7686_FILLCOLOUR_U,LT7686_LINECOLOUR_U
	movff	CACHE_LT7686_FILLCOLOUR_E,LT7686_LINECOLOUR_E
	rcall	FILLEDBOX_LT7686
	movff	_XOFFSET1,XOFFSET1
	movff	_XOFFSET1_H,XOFFSET1_H
	movff	_YOFFSET1,YOFFSET1
	movff	_YOFFSET1_H,YOFFSET1_H
	movff	_XOFFSET5,XOFFSET2
	movff	_XOFFSET5_H,XOFFSET2_H
	movff	_YOFFSET5,YOFFSET2
	movff	_YOFFSET5_H,YOFFSET2_H
	movff	CACHE_LT7686_LINECOLOUR,LT7686_LINECOLOUR
	movff	CACHE_LT7686_LINECOLOUR_H,LT7686_LINECOLOUR_H
	movff	CACHE_LT7686_LINECOLOUR_U,LT7686_LINECOLOUR_U
	movff	CACHE_LT7686_LINECOLOUR_E,LT7686_LINECOLOUR_E
	call	BOX_LT7686
	movff	_XOFFSET1,XOFFSET1
	movff	_XOFFSET1_H,XOFFSET1_H
	movff	_YOFFSET1,YOFFSET1
	movff	_YOFFSET1_H,YOFFSET1_H
	movff	_XOFFSET2,XOFFSET2
	movff	_XOFFSET2_H,XOFFSET2_H
	movff	_YOFFSET2,YOFFSET2
	movff	_YOFFSET2_H,YOFFSET2_H
	movff	_XOFFSET3,XOFFSET3
	movff	_XOFFSET3_H,XOFFSET3_H
	movff	_YOFFSET3,YOFFSET3
	movff	_YOFFSET3_H,YOFFSET3_H
	movff	_XOFFSET4,XOFFSET4
	movff	_XOFFSET4_H,XOFFSET4_H
	movff	_YOFFSET4,YOFFSET4
	movff	_YOFFSET4_H,YOFFSET4_H
	movff	CACHE_LT7686_FILLCOLOUR,LT7686_LINECOLOUR
	movff	CACHE_LT7686_FILLCOLOUR_H,LT7686_LINECOLOUR_H
	movff	CACHE_LT7686_FILLCOLOUR_U,LT7686_LINECOLOUR_U
	movff	CACHE_LT7686_FILLCOLOUR_E,LT7686_LINECOLOUR_E
	rcall	FILLEDQUADRILATERAL_LT7686
	movff	_XOFFSET1,XOFFSET1
	movff	_XOFFSET1_H,XOFFSET1_H
	movff	_YOFFSET1,YOFFSET1
	movff	_YOFFSET1_H,YOFFSET1_H
	movff	_XOFFSET2,XOFFSET2
	movff	_XOFFSET2_H,XOFFSET2_H
	movff	_YOFFSET2,YOFFSET2
	movff	_YOFFSET2_H,YOFFSET2_H
	movff	_XOFFSET3,XOFFSET3
	movff	_XOFFSET3_H,XOFFSET3_H
	movff	_YOFFSET3,YOFFSET3
	movff	_YOFFSET3_H,YOFFSET3_H
	movff	_XOFFSET4,XOFFSET4
	movff	_XOFFSET4_H,XOFFSET4_H
	movff	_YOFFSET4,YOFFSET4
	movff	_YOFFSET4_H,YOFFSET4_H
	movff	CACHE_LT7686_LINECOLOUR,LT7686_LINECOLOUR
	movff	CACHE_LT7686_LINECOLOUR_H,LT7686_LINECOLOUR_H
	movff	CACHE_LT7686_LINECOLOUR_U,LT7686_LINECOLOUR_U
	movff	CACHE_LT7686_LINECOLOUR_E,LT7686_LINECOLOUR_E
	call	QUADRILATERAL_LT7686
	movff	_XOFFSET3,XOFFSET1
	movff	_XOFFSET3_H,XOFFSET1_H
	movff	_YOFFSET3,YOFFSET1
	movff	_YOFFSET3_H,YOFFSET1_H
	movff	_XOFFSET4,XOFFSET2
	movff	_XOFFSET4_H,XOFFSET2_H
	movff	_YOFFSET4,YOFFSET2
	movff	_YOFFSET4_H,YOFFSET2_H
	movff	_XOFFSET5,XOFFSET3
	movff	_XOFFSET5_H,XOFFSET3_H
	movff	_YOFFSET5,YOFFSET3
	movff	_YOFFSET5_H,YOFFSET3_H
	movff	_XOFFSET6,XOFFSET4
	movff	_XOFFSET6_H,XOFFSET4_H
	movff	_YOFFSET6,YOFFSET4
	movff	_YOFFSET6_H,YOFFSET4_H
	movff	CACHE_LT7686_FILLCOLOUR,LT7686_LINECOLOUR
	movff	CACHE_LT7686_FILLCOLOUR_H,LT7686_LINECOLOUR_H
	movff	CACHE_LT7686_FILLCOLOUR_U,LT7686_LINECOLOUR_U
	movff	CACHE_LT7686_FILLCOLOUR_E,LT7686_LINECOLOUR_E
	rcall	FILLEDQUADRILATERAL_LT7686
	movff	_XOFFSET3,XOFFSET1
	movff	_XOFFSET3_H,XOFFSET1_H
	movff	_YOFFSET3,YOFFSET1
	movff	_YOFFSET3_H,YOFFSET1_H
	movff	_XOFFSET4,XOFFSET2
	movff	_XOFFSET4_H,XOFFSET2_H
	movff	_YOFFSET4,YOFFSET2
	movff	_YOFFSET4_H,YOFFSET2_H
	movff	_XOFFSET5,XOFFSET3
	movff	_XOFFSET5_H,XOFFSET3_H
	movff	_YOFFSET5,YOFFSET3
	movff	_YOFFSET5_H,YOFFSET3_H
	movff	_XOFFSET6,XOFFSET4
	movff	_XOFFSET6_H,XOFFSET4_H
	movff	_YOFFSET6,YOFFSET4
	movff	_YOFFSET6_H,YOFFSET4_H
	movff	CACHE_LT7686_LINECOLOUR,LT7686_LINECOLOUR
	movff	CACHE_LT7686_LINECOLOUR_H,LT7686_LINECOLOUR_H
	movff	CACHE_LT7686_LINECOLOUR_U,LT7686_LINECOLOUR_U
	movff	CACHE_LT7686_LINECOLOUR_E,LT7686_LINECOLOUR_E
	call	QUADRILATERAL_LT7686
	movff	CACHE_LT7686_LINECOLOUR,LT7686_LINECOLOUR
	movff	CACHE_LT7686_LINECOLOUR_H,LT7686_LINECOLOUR_H
	movff	CACHE_LT7686_LINECOLOUR_U,LT7686_LINECOLOUR_U
	movff	CACHE_LT7686_LINECOLOUR_E,LT7686_LINECOLOUR_E
	movff	CACHE_LT7686_FILLCOLOUR,LT7686_FILLCOLOUR
	movff	CACHE_LT7686_FILLCOLOUR_H,LT7686_FILLCOLOUR_H
	movff	CACHE_LT7686_FILLCOLOUR_U,LT7686_FILLCOLOUR_U
	movff	CACHE_LT7686_FILLCOLOUR_E,LT7686_FILLCOLOUR_E
	return

;********************************************************************************

FILLEDELLIPSE_LT7686
	movlw	123
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	124
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	125
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	126
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	119
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INXRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	120
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INXRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	121
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INYRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	122
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INYRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movff	LT7686_LINECOLOUR,__SET_LT7686_LINECOLOUR
	movff	LT7686_LINECOLOUR_H,__SET_LT7686_LINECOLOUR_H
	movff	LT7686_LINECOLOUR_U,__SET_LT7686_LINECOLOUR_U
	movff	LT7686_LINECOLOUR_E,__SET_LT7686_LINECOLOUR_E
	movlw	210
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	212
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	211
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	118
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movlw	192
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

FILLEDLEFTDOWNCURVE_LT7686
	movlw	123
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	124
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	125
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	126
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	119
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INXRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	120
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INXRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	121
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INYRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	122
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INYRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movff	LT7686_LINECOLOUR,__SET_LT7686_LINECOLOUR
	movff	LT7686_LINECOLOUR_H,__SET_LT7686_LINECOLOUR_H
	movff	LT7686_LINECOLOUR_U,__SET_LT7686_LINECOLOUR_U
	movff	LT7686_LINECOLOUR_E,__SET_LT7686_LINECOLOUR_E
	movlw	210
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	212
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	211
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	118
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movlw	208
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

FILLEDLEFTUPCURVE_LT7686
	movlw	123
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	124
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	125
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	126
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	119
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INXRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	120
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INXRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	121
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INYRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	122
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INYRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movff	LT7686_LINECOLOUR,__SET_LT7686_LINECOLOUR
	movff	LT7686_LINECOLOUR_H,__SET_LT7686_LINECOLOUR_H
	movff	LT7686_LINECOLOUR_U,__SET_LT7686_LINECOLOUR_U
	movff	LT7686_LINECOLOUR_E,__SET_LT7686_LINECOLOUR_E
	movlw	210
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	212
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	211
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	118
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movlw	209
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

FILLEDPENTAGON_LT7686
	movlw	104
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	105
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	106
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	107
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	108
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET2,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	109
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET2_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	110
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET2,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	111
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET2_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	112
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET3,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	113
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET3_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	114
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET3,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	115
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET3_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	119
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET4,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	120
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET4_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	121
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET4,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	122
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET4_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	123
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET5,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	124
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET5_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	125
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET5,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	126
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET5_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movff	LT7686_LINECOLOUR,__SET_LT7686_LINECOLOUR
	movff	LT7686_LINECOLOUR_H,__SET_LT7686_LINECOLOUR_H
	movff	LT7686_LINECOLOUR_U,__SET_LT7686_LINECOLOUR_U
	movff	LT7686_LINECOLOUR_E,__SET_LT7686_LINECOLOUR_E
	movlw	210
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	212
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	211
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	103
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movlw	169
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

FILLEDQUADRILATERAL_LT7686
	movlw	104
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	105
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	106
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	107
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	108
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET2,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	109
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET2_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	110
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET2,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	111
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET2_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	112
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET3,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	113
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET3_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	114
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET3,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	115
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET3_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	119
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET4,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	120
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET4_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	121
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET4,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	122
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET4_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movff	LT7686_LINECOLOUR,__SET_LT7686_LINECOLOUR
	movff	LT7686_LINECOLOUR_H,__SET_LT7686_LINECOLOUR_H
	movff	LT7686_LINECOLOUR_U,__SET_LT7686_LINECOLOUR_U
	movff	LT7686_LINECOLOUR_E,__SET_LT7686_LINECOLOUR_E
	movlw	210
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	212
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	211
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	103
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movlw	166
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

FILLEDRIGHTDOWNCURVE_LT7686
	movlw	123
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	124
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	125
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	126
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	119
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INXRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	120
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INXRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	121
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INYRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	122
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INYRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movff	LT7686_LINECOLOUR,__SET_LT7686_LINECOLOUR
	movff	LT7686_LINECOLOUR_H,__SET_LT7686_LINECOLOUR_H
	movff	LT7686_LINECOLOUR_U,__SET_LT7686_LINECOLOUR_U
	movff	LT7686_LINECOLOUR_E,__SET_LT7686_LINECOLOUR_E
	movlw	210
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	212
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	211
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	118
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movlw	211
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

FILLEDRIGHTUPCURVE_LT7686
	movlw	123
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	124
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	125
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	126
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	119
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INXRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	120
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INXRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	121
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INYRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	122
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INYRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movff	LT7686_LINECOLOUR,__SET_LT7686_LINECOLOUR
	movff	LT7686_LINECOLOUR_H,__SET_LT7686_LINECOLOUR_H
	movff	LT7686_LINECOLOUR_U,__SET_LT7686_LINECOLOUR_U
	movff	LT7686_LINECOLOUR_E,__SET_LT7686_LINECOLOUR_E
	movlw	210
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	212
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	211
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	118
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movlw	210
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

FILLEDROUNDRECT_LT7686
	movlw	104
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	105
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	106
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	107
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	108
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET2,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	109
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET2_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	110
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET2,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	111
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET2_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	119
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INXRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	120
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INXRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	121
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INYRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	122
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INYRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movff	LT7686_LINECOLOUR,__SET_LT7686_LINECOLOUR
	movff	LT7686_LINECOLOUR_H,__SET_LT7686_LINECOLOUR_H
	movff	LT7686_LINECOLOUR_U,__SET_LT7686_LINECOLOUR_U
	movff	LT7686_LINECOLOUR_E,__SET_LT7686_LINECOLOUR_E
	movlw	210
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	212
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	211
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	118
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movlw	240
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

FILLEDTRIANGLE_LT7686
	movlw	104
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	105
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	106
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	107
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	108
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET2,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	109
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET2_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	110
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET2,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	111
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET2_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	112
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET3,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	113
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET3_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	114
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET3,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	115
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET3_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movff	LT7686_LINECOLOUR,__SET_LT7686_LINECOLOUR
	movff	LT7686_LINECOLOUR_H,__SET_LT7686_LINECOLOUR_H
	movff	LT7686_LINECOLOUR_U,__SET_LT7686_LINECOLOUR_U
	movff	LT7686_LINECOLOUR_E,__SET_LT7686_LINECOLOUR_E
	movlw	210
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	212
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	211
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	103
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movlw	162
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

FRAMEDFILLEDBOX_LT7686
	movff	LT7686_LINECOLOUR,CACHE_LT7686_LINECOLOUR
	movff	LT7686_LINECOLOUR_H,CACHE_LT7686_LINECOLOUR_H
	movff	LT7686_LINECOLOUR_U,CACHE_LT7686_LINECOLOUR_U
	movff	LT7686_LINECOLOUR_E,CACHE_LT7686_LINECOLOUR_E
	movff	LT7686_FILLCOLOUR,CACHE_LT7686_FILLCOLOUR
	movff	LT7686_FILLCOLOUR_H,CACHE_LT7686_FILLCOLOUR_H
	movff	LT7686_FILLCOLOUR_U,CACHE_LT7686_FILLCOLOUR_U
	movff	LT7686_FILLCOLOUR_E,CACHE_LT7686_FILLCOLOUR_E
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
	call	FILLEDBOX_LT7686
	banksel	_WOFFSET
	movf	_WOFFSET,W,BANKED
	addwf	_XOFFSET1,W,BANKED
	banksel	XOFFSET1
	movwf	XOFFSET1,BANKED
	banksel	_WOFFSET_H
	movf	_WOFFSET_H,W,BANKED
	addwfc	_XOFFSET1_H,W,BANKED
	banksel	XOFFSET1_H
	movwf	XOFFSET1_H,BANKED
	banksel	_WOFFSET
	movf	_WOFFSET,W,BANKED
	addwf	_YOFFSET1,W,BANKED
	movwf	YOFFSET1,BANKED
	movf	_WOFFSET_H,W,BANKED
	addwfc	_YOFFSET1_H,W,BANKED
	movwf	YOFFSET1_H,BANKED
	movf	_WOFFSET,W,BANKED
	subwf	_XOFFSET2,W,BANKED
	banksel	XOFFSET2
	movwf	XOFFSET2,BANKED
	banksel	_WOFFSET_H
	movf	_WOFFSET_H,W,BANKED
	subwfb	_XOFFSET2_H,W,BANKED
	banksel	XOFFSET2_H
	movwf	XOFFSET2_H,BANKED
	banksel	_WOFFSET
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
	call	FILLEDBOX_LT7686
	movff	CACHE_LT7686_LINECOLOUR,LT7686_LINECOLOUR
	movff	CACHE_LT7686_LINECOLOUR_H,LT7686_LINECOLOUR_H
	movff	CACHE_LT7686_LINECOLOUR_U,LT7686_LINECOLOUR_U
	movff	CACHE_LT7686_LINECOLOUR_E,LT7686_LINECOLOUR_E
	movff	CACHE_LT7686_FILLCOLOUR,LT7686_FILLCOLOUR
	movff	CACHE_LT7686_FILLCOLOUR_H,LT7686_FILLCOLOUR_H
	movff	CACHE_LT7686_FILLCOLOUR_U,LT7686_FILLCOLOUR_U
	movff	CACHE_LT7686_FILLCOLOUR_E,LT7686_FILLCOLOUR_E
	return

;********************************************************************************

FRAMEDFILLEDCIRCLE_LT7686
	movff	LT7686_LINECOLOUR,CACHE_LT7686_LINECOLOUR
	movff	LT7686_LINECOLOUR_H,CACHE_LT7686_LINECOLOUR_H
	movff	LT7686_LINECOLOUR_U,CACHE_LT7686_LINECOLOUR_U
	movff	LT7686_LINECOLOUR_E,CACHE_LT7686_LINECOLOUR_E
	movff	LT7686_FILLCOLOUR,CACHE_LT7686_FILLCOLOUR
	movff	LT7686_FILLCOLOUR_H,CACHE_LT7686_FILLCOLOUR_H
	movff	LT7686_FILLCOLOUR_U,CACHE_LT7686_FILLCOLOUR_U
	movff	LT7686_FILLCOLOUR_E,CACHE_LT7686_FILLCOLOUR_E
	movff	_INXRADIUS,INXRADIUS
	movff	_INXRADIUS_H,INXRADIUS_H
	movff	CACHE_LT7686_LINECOLOUR,LT7686_LINECOLOUR
	movff	CACHE_LT7686_LINECOLOUR_H,LT7686_LINECOLOUR_H
	movff	CACHE_LT7686_LINECOLOUR_U,LT7686_LINECOLOUR_U
	movff	CACHE_LT7686_LINECOLOUR_E,LT7686_LINECOLOUR_E
	call	FILLEDCIRCLE_LT7686
	banksel	_WOFFSET
	movf	_WOFFSET,W,BANKED
	subwf	_INXRADIUS,W,BANKED
	movwf	INXRADIUS,ACCESS
	movf	_WOFFSET_H,W,BANKED
	subwfb	_INXRADIUS_H,W,BANKED
	movwf	INXRADIUS_H,ACCESS
	movff	CACHE_LT7686_FILLCOLOUR,LT7686_LINECOLOUR
	movff	CACHE_LT7686_FILLCOLOUR_H,LT7686_LINECOLOUR_H
	movff	CACHE_LT7686_FILLCOLOUR_U,LT7686_LINECOLOUR_U
	movff	CACHE_LT7686_FILLCOLOUR_E,LT7686_LINECOLOUR_E
	banksel	0
	call	FILLEDCIRCLE_LT7686
	movff	CACHE_LT7686_LINECOLOUR,LT7686_LINECOLOUR
	movff	CACHE_LT7686_LINECOLOUR_H,LT7686_LINECOLOUR_H
	movff	CACHE_LT7686_LINECOLOUR_U,LT7686_LINECOLOUR_U
	movff	CACHE_LT7686_LINECOLOUR_E,LT7686_LINECOLOUR_E
	movff	CACHE_LT7686_FILLCOLOUR,LT7686_FILLCOLOUR
	movff	CACHE_LT7686_FILLCOLOUR_H,LT7686_FILLCOLOUR_H
	movff	CACHE_LT7686_FILLCOLOUR_U,LT7686_FILLCOLOUR_U
	movff	CACHE_LT7686_FILLCOLOUR_E,LT7686_FILLCOLOUR_E
	return

;********************************************************************************

FRAMEDFILLEDROUNDRECT_LT7686
	movff	LT7686_LINECOLOUR,CACHE_LT7686_LINECOLOUR
	movff	LT7686_LINECOLOUR_H,CACHE_LT7686_LINECOLOUR_H
	movff	LT7686_LINECOLOUR_U,CACHE_LT7686_LINECOLOUR_U
	movff	LT7686_LINECOLOUR_E,CACHE_LT7686_LINECOLOUR_E
	movff	LT7686_FILLCOLOUR,CACHE_LT7686_FILLCOLOUR
	movff	LT7686_FILLCOLOUR_H,CACHE_LT7686_FILLCOLOUR_H
	movff	LT7686_FILLCOLOUR_U,CACHE_LT7686_FILLCOLOUR_U
	movff	LT7686_FILLCOLOUR_E,CACHE_LT7686_FILLCOLOUR_E
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
	rcall	FILLEDROUNDRECT_LT7686
	banksel	_WOFFSET
	movf	_WOFFSET,W,BANKED
	addwf	_XOFFSET1,W,BANKED
	banksel	XOFFSET1
	movwf	XOFFSET1,BANKED
	banksel	_WOFFSET_H
	movf	_WOFFSET_H,W,BANKED
	addwfc	_XOFFSET1_H,W,BANKED
	banksel	XOFFSET1_H
	movwf	XOFFSET1_H,BANKED
	banksel	_WOFFSET
	movf	_WOFFSET,W,BANKED
	addwf	_YOFFSET1,W,BANKED
	movwf	YOFFSET1,BANKED
	movf	_WOFFSET_H,W,BANKED
	addwfc	_YOFFSET1_H,W,BANKED
	movwf	YOFFSET1_H,BANKED
	movf	_WOFFSET,W,BANKED
	subwf	_XOFFSET2,W,BANKED
	banksel	XOFFSET2
	movwf	XOFFSET2,BANKED
	banksel	_WOFFSET_H
	movf	_WOFFSET_H,W,BANKED
	subwfb	_XOFFSET2_H,W,BANKED
	banksel	XOFFSET2_H
	movwf	XOFFSET2_H,BANKED
	banksel	_WOFFSET
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
	rcall	FILLEDROUNDRECT_LT7686
	movff	CACHE_LT7686_LINECOLOUR,LT7686_LINECOLOUR
	movff	CACHE_LT7686_LINECOLOUR_H,LT7686_LINECOLOUR_H
	movff	CACHE_LT7686_LINECOLOUR_U,LT7686_LINECOLOUR_U
	movff	CACHE_LT7686_LINECOLOUR_E,LT7686_LINECOLOUR_E
	movff	CACHE_LT7686_FILLCOLOUR,LT7686_FILLCOLOUR
	movff	CACHE_LT7686_FILLCOLOUR_H,LT7686_FILLCOLOUR_H
	movff	CACHE_LT7686_FILLCOLOUR_U,LT7686_FILLCOLOUR_U
	movff	CACHE_LT7686_FILLCOLOUR_E,LT7686_FILLCOLOUR_E
	return

;********************************************************************************

FRAMEDFILLEDTRIANGLE_LT7686
	movff	LT7686_LINECOLOUR,CACHE_LT7686_LINECOLOUR
	movff	LT7686_LINECOLOUR_H,CACHE_LT7686_LINECOLOUR_H
	movff	LT7686_LINECOLOUR_U,CACHE_LT7686_LINECOLOUR_U
	movff	LT7686_LINECOLOUR_E,CACHE_LT7686_LINECOLOUR_E
	movff	LT7686_FILLCOLOUR,CACHE_LT7686_FILLCOLOUR
	movff	LT7686_FILLCOLOUR_H,CACHE_LT7686_FILLCOLOUR_H
	movff	LT7686_FILLCOLOUR_U,CACHE_LT7686_FILLCOLOUR_U
	movff	LT7686_FILLCOLOUR_E,CACHE_LT7686_FILLCOLOUR_E
	movff	_XOFFSET1,XOFFSET1
	movff	_XOFFSET1_H,XOFFSET1_H
	movff	_YOFFSET1,YOFFSET1
	movff	_YOFFSET1_H,YOFFSET1_H
	movff	_XOFFSET2,XOFFSET2
	movff	_XOFFSET2_H,XOFFSET2_H
	movff	_YOFFSET2,YOFFSET2
	movff	_YOFFSET2_H,YOFFSET2_H
	movff	_XOFFSET3,XOFFSET3
	movff	_XOFFSET3_H,XOFFSET3_H
	movff	_YOFFSET3,YOFFSET3
	movff	_YOFFSET3_H,YOFFSET3_H
	movff	CACHE_LT7686_FILLCOLOUR,LT7686_LINECOLOUR
	movff	CACHE_LT7686_FILLCOLOUR_H,LT7686_LINECOLOUR_H
	movff	CACHE_LT7686_FILLCOLOUR_U,LT7686_LINECOLOUR_U
	movff	CACHE_LT7686_FILLCOLOUR_E,LT7686_LINECOLOUR_E
	rcall	FILLEDTRIANGLE_LT7686
	movff	_XOFFSET1,XOFFSET1
	movff	_XOFFSET1_H,XOFFSET1_H
	movff	_YOFFSET1,YOFFSET1
	movff	_YOFFSET1_H,YOFFSET1_H
	movff	_XOFFSET2,XOFFSET2
	movff	_XOFFSET2_H,XOFFSET2_H
	movff	_YOFFSET2,YOFFSET2
	movff	_YOFFSET2_H,YOFFSET2_H
	movff	_XOFFSET3,XOFFSET3
	movff	_XOFFSET3_H,XOFFSET3_H
	movff	_YOFFSET3,YOFFSET3
	movff	_YOFFSET3_H,YOFFSET3_H
	movff	CACHE_LT7686_LINECOLOUR,LT7686_LINECOLOUR
	movff	CACHE_LT7686_LINECOLOUR_H,LT7686_LINECOLOUR_H
	movff	CACHE_LT7686_LINECOLOUR_U,LT7686_LINECOLOUR_U
	movff	CACHE_LT7686_LINECOLOUR_E,LT7686_LINECOLOUR_E
	call	TRIANGLE_LT7686
	movff	CACHE_LT7686_LINECOLOUR,LT7686_LINECOLOUR
	movff	CACHE_LT7686_LINECOLOUR_H,LT7686_LINECOLOUR_H
	movff	CACHE_LT7686_LINECOLOUR_U,LT7686_LINECOLOUR_U
	movff	CACHE_LT7686_LINECOLOUR_E,LT7686_LINECOLOUR_E
	movff	CACHE_LT7686_FILLCOLOUR,LT7686_FILLCOLOUR
	movff	CACHE_LT7686_FILLCOLOUR_H,LT7686_FILLCOLOUR_H
	movff	CACHE_LT7686_FILLCOLOUR_U,LT7686_FILLCOLOUR_U
	movff	CACHE_LT7686_FILLCOLOUR_E,LT7686_FILLCOLOUR_E
	return

;********************************************************************************

FN_GCBBUILDSTR
	lfsr	1,GCBBUILDSTR
	movlw	low StringTable42
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable42
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable42
	movwf	TBLPTRU,ACCESS
	goto	SYSREADSTRING

;********************************************************************************

FN_GCBBUILDTIMESTR
	lfsr	1,GCBBUILDTIMESTR
	movlw	low StringTable43
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable43
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable43
	movwf	TBLPTRU,ACCESS
	goto	SYSREADSTRING

;********************************************************************************

GLCDCHARCOL3
	movlw	113
	cpfslt	SysStringA,ACCESS
	retlw	0
	movf	SysStringA, W,ACCESS
	addlw	low TABLEGLCDCHARCOL3
	movwf	TBLPTRL,ACCESS
	movlw	high TABLEGLCDCHARCOL3
	btfsc	STATUS, C,ACCESS
	addlw	1
	movwf	TBLPTRH,ACCESS
	movlw	upper TABLEGLCDCHARCOL3
	btfsc	STATUS, C,ACCESS
	addlw	1
	movwf	TBLPTRU,ACCESS
	tblrd*
	movf	TABLAT, W,ACCESS
	return
TABLEGLCDCHARCOL3
	db	112,0,16,12,10,136,34,56,32,8,32,16,16,128,128,64,4,0,0,0,40,72,70,108,0,0,0,40
	db	16,0,16,0,64,124,0,132,130,48,78,120,6,108,12,0,0,16,40,0,4,100,248,254,124,254
	db	254,254,124,254,0,64,254,254,254,254,124,254,124,254,76,2,126,62,126,198,14,194
	db	0,4,0,8,128,0,64,254,112,112,112,16,16,254,0,64,254,0,248,248,112,248,16,248
	db	144,16,120,56,120,136,24,136,0,0,0,32,120

;********************************************************************************

GLCDCHARCOL4
	movlw	113
	cpfslt	SysStringA,ACCESS
	retlw	0
	movf	SysStringA, W,ACCESS
	addlw	low TABLEGLCDCHARCOL4
	movwf	TBLPTRL,ACCESS
	movlw	high TABLEGLCDCHARCOL4
	btfsc	STATUS, C,ACCESS
	addlw	1
	movwf	TBLPTRH,ACCESS
	movlw	upper TABLEGLCDCHARCOL4
	btfsc	STATUS, C,ACCESS
	addlw	1
	movwf	TBLPTRU,ACCESS
	tblrd*
	movf	TABLAT, W,ACCESS
	return
TABLEGLCDCHARCOL4
	db	112,254,56,10,6,204,102,124,112,4,64,16,56,136,162,112,28,0,0,14,254,84,38,146
	db	10,56,130,16,16,160,16,192,32,162,132,194,130,40,138,148,2,146,146,108,172,40
	db	40,130,2,146,36,146,130,130,146,18,130,16,130,128,16,128,4,8,130,18,130,18,146,2
	db	128,64,128,40,16,162,254,8,130,4,128,2,168,144,136,136,168,252,168,16,144,128
	db	32,130,8,16,136,40,40,16,168,124,128,64,128,80,160,200,16,0,130,16,68

;********************************************************************************

GLCDCHARCOL5
	movlw	113
	cpfslt	SysStringA,ACCESS
	retlw	0
	movf	SysStringA, W,ACCESS
	addlw	low TABLEGLCDCHARCOL5
	movwf	TBLPTRL,ACCESS
	movlw	high TABLEGLCDCHARCOL5
	btfsc	STATUS, C,ACCESS
	addlw	1
	movwf	TBLPTRH,ACCESS
	movlw	upper TABLEGLCDCHARCOL5
	btfsc	STATUS, C,ACCESS
	addlw	1
	movwf	TBLPTRU,ACCESS
	tblrd*
	movf	TABLAT, W,ACCESS
	return
TABLEGLCDCHARCOL5
	db	112,124,124,0,0,238,238,124,168,254,254,84,84,148,148,124,124,0,158,0,40,254,16,170
	db	6,68,68,124,124,96,16,192,16,146,254,162,138,36,138,146,226,146,146,108,108,68
	db	40,68,162,242,34,146,130,130,146,18,146,16,254,130,40,128,24,16,130,18,162,50
	db	146,254,128,128,112,16,224,146,130,16,130,2,128,4,168,136,136,136,168,18,168,8
	db	250,136,80,254,240,8,136,40,40,8,168,144,128,128,96,32,160,168,108,254,108,16
	db	66

;********************************************************************************

GLCDCHARCOL6
	movlw	113
	cpfslt	SysStringA,ACCESS
	retlw	0
	movf	SysStringA, W,ACCESS
	addlw	low TABLEGLCDCHARCOL6
	movwf	TBLPTRL,ACCESS
	movlw	high TABLEGLCDCHARCOL6
	btfsc	STATUS, C,ACCESS
	addlw	1
	movwf	TBLPTRH,ACCESS
	movlw	upper TABLEGLCDCHARCOL6
	btfsc	STATUS, C,ACCESS
	addlw	1
	movwf	TBLPTRU,ACCESS
	tblrd*
	movf	TABLAT, W,ACCESS
	return
TABLEGLCDCHARCOL6
	db	112,56,254,12,10,204,102,124,32,4,64,56,16,162,136,112,28,0,0,14,254,84,200,68
	db	0,130,56,16,16,0,16,0,8,138,128,146,150,254,138,146,18,146,82,0,0,130,40,40,18,130
	db	36,146,130,68,146,18,146,16,130,126,68,128,4,32,130,18,66,82,146,2,128,64,128,40
	db	16,138,130,32,254,4,128,8,168,136,136,144,168,2,168,8,128,122,136,128,8,8,136,40
	db	48,8,168,128,64,64,128,80,160,152,130,0,16,32,68

;********************************************************************************

GLCDCHARCOL7
	movlw	113
	cpfslt	SysStringA,ACCESS
	retlw	0
	movf	SysStringA, W,ACCESS
	addlw	low TABLEGLCDCHARCOL7
	movwf	TBLPTRL,ACCESS
	movlw	high TABLEGLCDCHARCOL7
	btfsc	STATUS, C,ACCESS
	addlw	1
	movwf	TBLPTRH,ACCESS
	movlw	upper TABLEGLCDCHARCOL7
	btfsc	STATUS, C,ACCESS
	addlw	1
	movwf	TBLPTRU,ACCESS
	tblrd*
	movf	TABLAT, W,ACCESS
	return
TABLEGLCDCHARCOL7
	db	112,16,0,10,6,136,34,56,62,8,32,16,16,128,128,64,4,0,0,0,40,36,196,160,0,0,0,40
	db	16,0,16,0,4,124,0,140,98,32,114,96,14,108,60,0,0,0,40,16,12,124,248,108,68,56
	db	130,2,244,254,0,2,130,128,254,254,124,12,188,140,100,2,126,62,126,198,14,134,0,64
	db	0,8,128,0,240,112,64,254,48,4,120,240,0,0,0,0,240,240,112,16,248,16,64,64,248,56
	db	120,136,120,136,0,0,0,16,120

;********************************************************************************

GLCDCLS_LT7686
	clrf	GLCD_YORDINATE,ACCESS
	clrf	GLCD_YORDINATE_H,ACCESS
	call	LT7686_CHECK_BUSY_DRAW
	movlw	104
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	banksel	__OUTBYTE
	clrf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
	movlw	105
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	banksel	__OUTBYTE
	clrf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
	movlw	106
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	banksel	__OUTBYTE
	clrf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
	movlw	107
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	banksel	__OUTBYTE
	clrf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
	movlw	108
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	GLCDDEVICEWIDTH,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	109
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	GLCDDEVICEWIDTH_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	110
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	GLCDDEVICEHEIGHT,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	111
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	GLCDDEVICEHEIGHT_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movff	GLCDBACKGROUND,LT7686_LINECOLOUR
	movff	GLCDBACKGROUND_H,LT7686_LINECOLOUR_H
	movff	GLCDBACKGROUND_U,LT7686_LINECOLOUR_U
	movff	GLCDBACKGROUND_E,LT7686_LINECOLOUR_E
	movff	LT7686_LINECOLOUR,__SET_LT7686_LINECOLOUR
	movff	LT7686_LINECOLOUR_H,__SET_LT7686_LINECOLOUR_H
	movff	LT7686_LINECOLOUR_U,__SET_LT7686_LINECOLOUR_U
	movff	LT7686_LINECOLOUR_E,__SET_LT7686_LINECOLOUR_E
	movlw	210
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	212
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	211
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	call	LT7686_CHECK_BUSY_DRAW
	movlw	118
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movlw	224
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

GLCDDRAWCHAR_ILI9341
	movlw	15
	subwf	CHARCODE,F,ACCESS
	clrf	CHARCOL,ACCESS
	clrf	CHARCOL_H,ACCESS
	movff	CHARCODE,SysBYTETempA
	movlw	178
	movwf	SysBYTETempB,ACCESS
	call	SYSCOMPLESSTHAN
	comf	SysByteTempX,F,ACCESS
	movff	SysByteTempX,SysTemp3
	movff	CHARCODE,SysBYTETempB
	movlw	202
	movwf	SysBYTETempA,ACCESS
	call	SYSCOMPLESSTHAN
	comf	SysByteTempX,F,ACCESS
	banksel	SYSTEMP3
	movf	SysTemp3,W,BANKED
	andwf	SysByteTempX,W,ACCESS
	movwf	SysTemp1,BANKED
	btfss	SysTemp1,0,BANKED
	bra	ENDIF38
	movlw	1
	subwf	CHARLOCY,F,ACCESS
	movlw	0
	subwfb	CHARLOCY_H,F,ACCESS
ENDIF38
	clrf	CURRCHARCOL,ACCESS
SysForLoop7
	incf	CURRCHARCOL,F,ACCESS
SysSelect3Case1
	decf	CURRCHARCOL,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect3Case2
	movff	CHARCODE,SYSSTRINGA
	banksel	0
	rcall	GLCDCHARCOL3
	movwf	CURRCHARVAL,ACCESS
	bra	SysSelectEnd3
SysSelect3Case2
	movlw	2
	subwf	CURRCHARCOL,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect3Case3
	movff	CHARCODE,SYSSTRINGA
	banksel	0
	rcall	GLCDCHARCOL4
	movwf	CURRCHARVAL,ACCESS
	bra	SysSelectEnd3
SysSelect3Case3
	movlw	3
	subwf	CURRCHARCOL,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect3Case4
	movff	CHARCODE,SYSSTRINGA
	banksel	0
	rcall	GLCDCHARCOL5
	movwf	CURRCHARVAL,ACCESS
	bra	SysSelectEnd3
SysSelect3Case4
	movlw	4
	subwf	CURRCHARCOL,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect3Case5
	movff	CHARCODE,SYSSTRINGA
	banksel	0
	rcall	GLCDCHARCOL6
	movwf	CURRCHARVAL,ACCESS
	bra	SysSelectEnd3
SysSelect3Case5
	movlw	5
	subwf	CURRCHARCOL,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelectEnd3
	movff	CHARCODE,SYSSTRINGA
	banksel	0
	rcall	GLCDCHARCOL7
	movwf	CURRCHARVAL,ACCESS
SysSelectEnd3
	clrf	CHARROW,ACCESS
	clrf	CHARROW_H,ACCESS
	clrf	CURRCHARROW,ACCESS
SysForLoop8
	incf	CURRCHARROW,F,ACCESS
	clrf	CHARCOLS,ACCESS
	movlw	1
	movwf	COL,ACCESS
SysForLoop9
	incf	CHARCOLS,F,ACCESS
	clrf	CHARROWS,ACCESS
	movlw	1
	banksel	ROW
	movwf	ROW,BANKED
SysForLoop10
	incf	CHARROWS,F,ACCESS
	btfss	CURRCHARVAL,0,ACCESS
	bra	ELSE39_1
	movf	CHARCOL,W,ACCESS
	addwf	CHARLOCX,W,ACCESS
	movwf	SysTemp1,BANKED
	movf	CHARCOL_H,W,ACCESS
	addwfc	CHARLOCX_H,W,ACCESS
	movwf	SysTemp1_H,BANKED
	movf	CHARCOLS,W,ACCESS
	addwf	SysTemp1,W,BANKED
	movwf	XOFFSET1,BANKED
	movlw	0
	addwfc	SysTemp1_H,W,BANKED
	movwf	XOFFSET1_H,BANKED
	movf	CHARROW,W,ACCESS
	addwf	CHARLOCY,W,ACCESS
	movwf	SysTemp1,BANKED
	movf	CHARROW_H,W,ACCESS
	addwfc	CHARLOCY_H,W,ACCESS
	movwf	SysTemp1_H,BANKED
	movf	CHARROWS,W,ACCESS
	addwf	SysTemp1,W,BANKED
	banksel	YOFFSET1
	movwf	YOFFSET1,BANKED
	movlw	0
	banksel	SYSTEMP1_H
	addwfc	SysTemp1_H,W,BANKED
	banksel	YOFFSET1_H
	movwf	YOFFSET1_H,BANKED
	movff	LINECOLOUR,LT7686_LINECOLOUR
	movff	LINECOLOUR_H,LT7686_LINECOLOUR_H
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	PSET_LT7686
	bra	ENDIF39
ELSE39_1
	movf	CHARCOL,W,ACCESS
	addwf	CHARLOCX,W,ACCESS
	movwf	SysTemp1,BANKED
	movf	CHARCOL_H,W,ACCESS
	addwfc	CHARLOCX_H,W,ACCESS
	movwf	SysTemp1_H,BANKED
	movf	CHARCOLS,W,ACCESS
	addwf	SysTemp1,W,BANKED
	movwf	XOFFSET1,BANKED
	movlw	0
	addwfc	SysTemp1_H,W,BANKED
	movwf	XOFFSET1_H,BANKED
	movf	CHARROW,W,ACCESS
	addwf	CHARLOCY,W,ACCESS
	movwf	SysTemp1,BANKED
	movf	CHARROW_H,W,ACCESS
	addwfc	CHARLOCY_H,W,ACCESS
	movwf	SysTemp1_H,BANKED
	movf	CHARROWS,W,ACCESS
	addwf	SysTemp1,W,BANKED
	banksel	YOFFSET1
	movwf	YOFFSET1,BANKED
	movlw	0
	banksel	SYSTEMP1_H
	addwfc	SysTemp1_H,W,BANKED
	banksel	YOFFSET1_H
	movwf	YOFFSET1_H,BANKED
	movff	GLCDBACKGROUND,LT7686_LINECOLOUR
	movff	GLCDBACKGROUND_H,LT7686_LINECOLOUR_H
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	PSET_LT7686
ENDIF39
	banksel	ROW
	movf	ROW,W,BANKED
	subwf	GLCDFNTDEFAULTSIZE,W,ACCESS
	movwf	SysTemp3,BANKED
	movff	SysTemp3,SysBYTETempA
	clrf	SysBYTETempB,ACCESS
	banksel	0
	call	SYSCOMPEQUAL
	comf	SysByteTempX,F,ACCESS
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF40
	banksel	ROW
	incf	ROW,F,BANKED
	bra	SysForLoop10
ENDIF40
SysForLoopEnd10
	movf	COL,W,ACCESS
	subwf	GLCDFNTDEFAULTSIZE,W,ACCESS
	banksel	SYSTEMP3
	movwf	SysTemp3,BANKED
	movff	SysTemp3,SysBYTETempA
	clrf	SysBYTETempB,ACCESS
	banksel	0
	call	SYSCOMPEQUAL
	comf	SysByteTempX,F,ACCESS
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF41
	incf	COL,F,ACCESS
	bra	SysForLoop9
ENDIF41
SysForLoopEnd9
	rrcf	CURRCHARVAL,F,ACCESS
	movf	GLCDFNTDEFAULTSIZE,W,ACCESS
	addwf	CHARROW,F,ACCESS
	movlw	0
	addwfc	CHARROW_H,F,ACCESS
	movlw	8
	subwf	CURRCHARROW,W,ACCESS
	btfss	STATUS, C,ACCESS
	bra	SysForLoop8
SysForLoopEnd8
	movf	GLCDFNTDEFAULTSIZE,W,ACCESS
	addwf	CHARCOL,F,ACCESS
	movlw	0
	addwfc	CHARCOL_H,F,ACCESS
	movlw	5
	subwf	CURRCHARCOL,W,ACCESS
	btfss	STATUS, C,ACCESS
	bra	SysForLoop7
SysForLoopEnd7
	return

;********************************************************************************

GLCDPRINT8
	movff	SysLCDPRINTDATAHandler,AFSR0
	movff	SysLCDPRINTDATAHandler_H,AFSR0_H
	movff	INDF0,GLCDPRINTLEN
	movf	GLCDPRINTLEN,F,ACCESS
	btfsc	STATUS, Z,ACCESS
	return
	movff	PRINTLOCX,GLCDPRINTLOC
	movff	PRINTLOCX_H,GLCDPRINTLOC_H
	movlw	1
	movwf	GLCDPRINT_STRING_COUNTER,ACCESS
SysForLoop6
	movff	GLCDPRINTLOC,CHARLOCX
	movff	GLCDPRINTLOC_H,CHARLOCX_H
	movff	PRINTLOCY,CHARLOCY
	movff	PRINTLOCY_H,CHARLOCY_H
	movf	GLCDPRINT_STRING_COUNTER,W,ACCESS
	banksel	SYSLCDPRINTDATAHANDLER
	addwf	SysLCDPRINTDATAHandler,W,BANKED
	movwf	AFSR0,ACCESS
	movlw	0
	addwfc	SysLCDPRINTDATAHandler_H,W,BANKED
	movwf	AFSR0_H,ACCESS
	movff	INDF0,CHARCODE
	banksel	0
	rcall	GLCDDRAWCHAR_ILI9341
	movf	GLCDFONTWIDTH,W,ACCESS
	mulwf	GLCDFNTDEFAULTSIZE,ACCESS
	movff	PRODL,SysTemp3
	banksel	SYSTEMP3
	movf	SysTemp3,W,BANKED
	addwf	GLCDPRINTLOC,W,ACCESS
	movwf	SysTemp1,BANKED
	movlw	0
	addwfc	GLCDPRINTLOC_H,W,ACCESS
	movwf	SysTemp1_H,BANKED
	movlw	1
	addwf	SysTemp1,W,BANKED
	movwf	GLCDPRINTLOC,ACCESS
	movlw	0
	addwfc	SysTemp1_H,W,BANKED
	movwf	GLCDPRINTLOC_H,ACCESS
	movf	GLCDPRINT_STRING_COUNTER,W,ACCESS
	subwf	GLCDPRINTLEN,W,ACCESS
	movwf	SysTemp3,BANKED
	movff	SysTemp3,SysBYTETempA
	clrf	SysBYTETempB,ACCESS
	banksel	0
	call	SYSCOMPEQUAL
	comf	SysByteTempX,F,ACCESS
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF33
	incf	GLCDPRINT_STRING_COUNTER,F,ACCESS
	bra	SysForLoop6
ENDIF33
SysForLoopEnd6
	movff	GLCDPRINTLOC,PRINTLOCX
	movff	GLCDPRINTLOC_H,PRINTLOCX_H
	return

;********************************************************************************

GLCDROTATE_LT7686
	movlw	2
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	call	FN_LT7686_DATAREAD
	movff	LT7686_DATAREAD,__TEMP_LT7686
	movlw	18
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	call	FN_LT7686_DATAREAD
	movff	LT7686_DATAREAD,_TEMP_LT7686
SysSelect11Case1
	movlw	4
	subwf	GLCDROTATESTATE,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect11Case2
	clrf	GLCDDEVICEWIDTH,ACCESS
	movlw	4
	movwf	GLCDDEVICEWIDTH_H,ACCESS
	movlw	88
	movwf	GLCDDEVICEHEIGHT,ACCESS
	movlw	2
	movwf	GLCDDEVICEHEIGHT_H,ACCESS
	bra	SysSelectEnd11
SysSelect11Case2
	decf	GLCDROTATESTATE,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect11Case3
	clrf	GLCDDEVICEWIDTH,ACCESS
	movlw	4
	movwf	GLCDDEVICEWIDTH_H,ACCESS
	movlw	88
	movwf	GLCDDEVICEHEIGHT,ACCESS
	movlw	2
	movwf	GLCDDEVICEHEIGHT_H,ACCESS
	banksel	_TEMP_LT7686
	bcf	_TEMP_LT7686,3,BANKED
	bcf	__TEMP_LT7686,2,BANKED
	bcf	__TEMP_LT7686,1,BANKED
	bra	SysSelectEnd11
SysSelect11Case3
	movlw	2
	subwf	GLCDROTATESTATE,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect11Case4
	clrf	GLCDDEVICEWIDTH,ACCESS
	movlw	4
	movwf	GLCDDEVICEWIDTH_H,ACCESS
	movlw	88
	movwf	GLCDDEVICEHEIGHT,ACCESS
	movlw	2
	movwf	GLCDDEVICEHEIGHT_H,ACCESS
	bra	SysSelectEnd11
SysSelect11Case4
	movlw	3
	subwf	GLCDROTATESTATE,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect11Case5
	clrf	GLCDDEVICEWIDTH,ACCESS
	movlw	4
	movwf	GLCDDEVICEWIDTH_H,ACCESS
	movlw	88
	movwf	GLCDDEVICEHEIGHT,ACCESS
	movlw	2
	movwf	GLCDDEVICEHEIGHT_H,ACCESS
	banksel	_TEMP_LT7686
	bsf	_TEMP_LT7686,3,BANKED
	bcf	__TEMP_LT7686,2,BANKED
	bsf	__TEMP_LT7686,1,BANKED
	bra	SysSelectEnd11
SysSelect11Case5
	clrf	GLCDDEVICEWIDTH,ACCESS
	movlw	4
	movwf	GLCDDEVICEWIDTH_H,ACCESS
	movlw	88
	movwf	GLCDDEVICEHEIGHT,ACCESS
	movlw	2
	movwf	GLCDDEVICEHEIGHT_H,ACCESS
	banksel	_TEMP_LT7686
	bcf	_TEMP_LT7686,3,BANKED
	bcf	__TEMP_LT7686,2,BANKED
	bcf	__TEMP_LT7686,1,BANKED
SysSelectEnd11
	movlw	2
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__TEMP_LT7686,__OUTBYTE
	call	LT7686_WRITEDATA
	rcall	LT7686_CHECK_BUSY_DRAW
	movlw	18
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	_TEMP_LT7686,__OUTBYTE
	call	LT7686_WRITEDATA
	bra	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

HSERPRINT895
	movff	SysPRINTDATAHandler,AFSR0
	movff	SysPRINTDATAHandler_H,AFSR0_H
	movff	INDF0,PRINTLEN
	banksel	PRINTLEN
	movf	PRINTLEN,F,BANKED
	btfsc	STATUS, Z,ACCESS
	bra	ENDIF87
	movlw	1
	movwf	SYSPRINTTEMP,BANKED
SysForLoop16
	movf	SYSPRINTTEMP,W,BANKED
	addwf	SysPRINTDATAHandler,W,BANKED
	movwf	AFSR0,ACCESS
	movlw	0
	addwfc	SysPRINTDATAHandler_H,W,BANKED
	movwf	AFSR0_H,ACCESS
	movff	INDF0,SERDATA
	banksel	0
	rcall	HSERSEND885
	banksel	SYSPRINTTEMP
	movf	SYSPRINTTEMP,W,BANKED
	subwf	PRINTLEN,W,BANKED
	movwf	SysTemp3,BANKED
	movff	SysTemp3,SysBYTETempA
	clrf	SysBYTETempB,ACCESS
	banksel	0
	call	SYSCOMPEQUAL
	comf	SysByteTempX,F,ACCESS
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF88
	banksel	SYSPRINTTEMP
	incf	SYSPRINTTEMP,F,BANKED
	bra	SysForLoop16
ENDIF88
SysForLoopEnd16
ENDIF87
	banksel	0
	return

;********************************************************************************

HSERPRINTCRLF
	movff	HSERPRINTCRLFCOUNT,SysRepeatTemp4
	banksel	SYSREPEATTEMP4
	movf	SYSREPEATTEMP4,F,BANKED
	btfsc	STATUS, Z,ACCESS
	bra	SysRepeatLoopEnd4
SysRepeatLoop4
	movlw	13
	movwf	SERDATA,BANKED
	banksel	0
	rcall	HSERSEND885
	movlw	10
	banksel	SERDATA
	movwf	SERDATA,BANKED
	banksel	0
	rcall	HSERSEND885
	banksel	SYSREPEATTEMP4
	decfsz	SysRepeatTemp4,F,BANKED
	bra	SysRepeatLoop4
SysRepeatLoopEnd4
	banksel	0
	return

;********************************************************************************

HSERPRINTSTRINGCRLF
	movff	SysPRINTDATAHandler,AFSR0
	movff	SysPRINTDATAHandler_H,AFSR0_H
	movff	INDF0,PRINTLEN
	banksel	PRINTLEN
	movf	PRINTLEN,F,BANKED
	btfsc	STATUS, Z,ACCESS
	bra	ENDIF85
	movlw	1
	movwf	SYSPRINTTEMP,BANKED
SysForLoop15
	movf	SYSPRINTTEMP,W,BANKED
	addwf	SysPRINTDATAHandler,W,BANKED
	movwf	AFSR0,ACCESS
	movlw	0
	addwfc	SysPRINTDATAHandler_H,W,BANKED
	movwf	AFSR0_H,ACCESS
	movff	INDF0,SERDATA
	banksel	0
	rcall	HSERSEND885
	banksel	SYSPRINTTEMP
	movf	SYSPRINTTEMP,W,BANKED
	subwf	PRINTLEN,W,BANKED
	movwf	SysTemp3,BANKED
	movff	SysTemp3,SysBYTETempA
	clrf	SysBYTETempB,ACCESS
	banksel	0
	call	SYSCOMPEQUAL
	comf	SysByteTempX,F,ACCESS
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF86
	banksel	SYSPRINTTEMP
	incf	SYSPRINTTEMP,F,BANKED
	bra	SysForLoop15
ENDIF86
SysForLoopEnd15
ENDIF85
	movlw	13
	banksel	SERDATA
	movwf	SERDATA,BANKED
	banksel	0
	rcall	HSERSEND885
	movlw	10
	banksel	SERDATA
	movwf	SERDATA,BANKED
	banksel	0
	bra	HSERSEND885

;********************************************************************************

HSERSEND885
HSERSENDUSART1HANDLER
SysWaitLoop4
	btfss	PIR4,U1TXIF,ACCESS
	bra	SysWaitLoop4
	movff	SERDATA,U1TXB
	return

;********************************************************************************

HWSPITRANSFER
	movlw	1
	movwf	SPI1TCNTL,BANKED
	movff	SPITXDATA,SPI1TXB
SysWaitLoop2
	btfss	PIR3,SPI1RXIF,ACCESS
	bra	SysWaitLoop2
	movff	SPI1RXB,SPIRXDATA
	return

;********************************************************************************

INITGLCD_ILI9341
	return

;********************************************************************************

INITGLCD_LT7686
	bsf	TRISC,4,ACCESS
	bcf	TRISB,0,ACCESS
	bcf	TRISC,3,ACCESS
	bcf	TRISA,3,ACCESS
	bcf	TRISB,5,ACCESS
	bcf	LATB,0,ACCESS
	bsf	LATC,4,ACCESS
	bsf	LATA,3,ACCESS
	movlw	12
	banksel	SPICURRENTMODE
	movwf	SPICURRENTMODE,BANKED
	movlw	3
	movwf	SPICLOCKMODE,BANKED
	banksel	0
	call	SPIMODE844
	movlw	3
	banksel	SYSREPEATTEMP5
	movwf	SysRepeatTemp5,BANKED
SysRepeatLoop5
	bsf	LATB,5,ACCESS
	movlw	50
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	banksel	0
	call	Delay_MS
	bcf	LATB,5,ACCESS
	movlw	100
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	call	Delay_MS
	bsf	LATB,5,ACCESS
	movlw	50
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	call	Delay_MS
	banksel	SYSREPEATTEMP5
	decfsz	SysRepeatTemp5,F,BANKED
	bra	SysRepeatLoop5
SysRepeatLoopEnd5
	banksel	0
	call	LT7686_SOFTWARE_RESET
	movlw	10
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	call	Delay_MS
	call	LT7686_LOADDEFAULTREGISTERS
SysDoLoop_S6
	rcall	FN_LT7686_CHECK_INIT
	movf	LT7686_CHECK_INIT,F,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysDoLoop_E6
	bra	SysDoLoop_S6
SysDoLoop_E6
	setf	GLCDFOREGROUND,ACCESS
	setf	GLCDFOREGROUND_H,ACCESS
	clrf	GLCDFOREGROUND_U,ACCESS
	clrf	GLCDFOREGROUND_E,ACCESS
	clrf	GLCDBACKGROUND,ACCESS
	clrf	GLCDBACKGROUND_H,ACCESS
	clrf	GLCDBACKGROUND_U,ACCESS
	clrf	GLCDBACKGROUND_E,ACCESS
	clrf	GLCDDEVICEWIDTH,ACCESS
	movlw	4
	movwf	GLCDDEVICEWIDTH_H,ACCESS
	movlw	88
	movwf	GLCDDEVICEHEIGHT,ACCESS
	movlw	2
	movwf	GLCDDEVICEHEIGHT_H,ACCESS
	clrf	GLCDFNTDEFAULT,ACCESS
	movlw	2
	movwf	GLCDFNTDEFAULTSIZE,ACCESS
	movlw	7
	movwf	GLCDFNTDEFAULTHEIGHT,ACCESS
	movlw	1
	movwf	GLCDROTATESTATE,ACCESS
	rcall	GLCDROTATE_LT7686
	movlw	6
	movwf	GLCDFONTWIDTH,ACCESS
	bra	GLCDCLS_LT7686

;********************************************************************************

INITPPS
	banksel	SLRCONC
	bcf	SLRCONC,3,BANKED
	bcf	TRISC,6,ACCESS
	movlw	32
	banksel	RC6PPS
	movwf	RC6PPS,BANKED
	movlw	20
	movwf	SPI1SDIPPS,BANKED
	movlw	50
	movwf	RB0PPS,BANKED
	movlw	49
	movwf	RC3PPS,BANKED
	movlw	19
	movwf	SPI1SCKPPS,BANKED
	banksel	0
	return

;********************************************************************************

INITRANDOM
	movlw	13
	banksel	RANDOMSEED
	movwf	RANDOMSEED,BANKED
	movlw	16
	movwf	RANDOMSEED_H,BANKED
	banksel	0
	return

;********************************************************************************

INITSYS
	movlb	0
;asm showdebug Default settings for microcontrollers with _OSCCON1_
	movlw	96
	movwf	OSCCON1,BANKED
	clrf	OSCCON3,BANKED
	clrf	OSCEN,BANKED
	clrf	OSCTUNE,BANKED
;asm showdebug The MCU is a chip family 16
;asm showdebug OSCCON type is 101
	movlw	96
	movwf	OSCCON1,BANKED
	movlw	8
	movwf	OSCFRQ,BANKED
;asm showdebug _Complete_the_chip_setup_of_BSR_ADCs_ANSEL_and_other_key_setup_registers_or_register_bits
	clrf	TBLPTRU,ACCESS
	banksel	ADCON0
	bcf	ADCON0,ADFM0,BANKED
	bcf	ADCON0,ADON,BANKED
	banksel	ANSELA
	clrf	ANSELA,BANKED
	clrf	ANSELB,BANKED
	clrf	ANSELC,BANKED
	clrf	ANSELE,BANKED
	banksel	CM2CON0
	bcf	CM2CON0,C2EN,BANKED
	bcf	CM1CON0,C1EN,BANKED
	clrf	PORTA,ACCESS
	clrf	PORTB,ACCESS
	clrf	PORTC,ACCESS
	clrf	PORTD,ACCESS
	clrf	PORTE,ACCESS
	return

;********************************************************************************

INITUSART
	movlw	1
	movwf	COMPORT,ACCESS
	movlw	6
	banksel	U1BRGH
	movwf	U1BRGH,BANKED
	movlw	129
	movwf	U1BRGL,BANKED
	bsf	U1CON0,U1BRGS,BANKED
	bsf	U1CON0,U1TXEN,BANKED
	bsf	U1CON0,U1RXEN,BANKED
	bsf	U1CON1,ON_U1CON1,BANKED
	banksel	0
	return

;********************************************************************************

FN_LEFT
	movff	SysSYSINSTRINGHandler,AFSR0
	movff	SysSYSINSTRINGHandler_H,AFSR0_H
	movf	INDF0,F,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	ENDIF76
	banksel	SYSLEFT_0
	clrf	SYSLEFT_0,BANKED
	banksel	0
	return
ENDIF76
	movff	SysSYSINSTRINGHandler,AFSR0
	movff	SysSYSINSTRINGHandler_H,AFSR0_H
	banksel	SYSCHARCOUNT
	movf	SYSCHARCOUNT,W,BANKED
	subwf	INDF0,W,ACCESS
	btfsc	STATUS, C,ACCESS
	bra	ENDIF77
	movff	SysSYSINSTRINGHandler,AFSR0
	movff	SysSYSINSTRINGHandler_H,AFSR0_H
	movff	INDF0,SYSCHARCOUNT
ENDIF77
	movlw	1
	movwf	SYSSTRINGTEMP,BANKED
SysForLoop13
	movf	SYSSTRINGTEMP,W,BANKED
	addwf	SysSYSINSTRINGHandler,W,BANKED
	movwf	AFSR0,ACCESS
	movlw	0
	addwfc	SysSYSINSTRINGHandler_H,W,BANKED
	movwf	AFSR0_H,ACCESS
	movff	POSTINC0,SysArrayTemp2
	movff	SysArrayTemp2,SysArrayTemp1
	lfsr	0,LEFT
	movf	SYSSTRINGTEMP,W,BANKED
	addwf	AFSR0,F,ACCESS
	movlw	0
	addwfc	AFSR0_H,F,ACCESS
	movff	SysArrayTemp1,POSTINC0
	movf	SYSSTRINGTEMP,W,BANKED
	subwf	SYSCHARCOUNT,W,BANKED
	movwf	SysTemp3,BANKED
	movff	SysTemp3,SysBYTETempA
	clrf	SysBYTETempB,ACCESS
	banksel	0
	call	SYSCOMPEQUAL
	comf	SysByteTempX,F,ACCESS
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF78
	banksel	SYSSTRINGTEMP
	incf	SYSSTRINGTEMP,F,BANKED
	bra	SysForLoop13
ENDIF78
SysForLoopEnd13
	movffl	SYSCHARCOUNT,SYSLEFT_0
	return

;********************************************************************************

LEFTDOWNCURVE_LT7686
	movlw	123
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	124
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	125
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	126
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	119
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INXRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	120
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INXRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	121
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INYRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	122
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INYRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movff	LT7686_LINECOLOUR,__SET_LT7686_LINECOLOUR
	movff	LT7686_LINECOLOUR_H,__SET_LT7686_LINECOLOUR_H
	movff	LT7686_LINECOLOUR_U,__SET_LT7686_LINECOLOUR_U
	movff	LT7686_LINECOLOUR_E,__SET_LT7686_LINECOLOUR_E
	movlw	210
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	212
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	211
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	118
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movlw	144
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
	bra	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

LEFTUPCURVE_LT7686
	movlw	123
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	124
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	125
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	126
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	119
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INXRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	120
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INXRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	121
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INYRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	122
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	INYRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movff	LT7686_LINECOLOUR,__SET_LT7686_LINECOLOUR
	movff	LT7686_LINECOLOUR_H,__SET_LT7686_LINECOLOUR_H
	movff	LT7686_LINECOLOUR_U,__SET_LT7686_LINECOLOUR_U
	movff	LT7686_LINECOLOUR_E,__SET_LT7686_LINECOLOUR_E
	movlw	210
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	212
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	211
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	118
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movlw	145
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
	bra	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

LINE_LT7686
	movlw	104
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	105
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	106
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	107
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	108
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET2,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	109
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET2_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	110
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET2,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	111
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET2_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movff	LT7686_LINECOLOUR,__SET_LT7686_LINECOLOUR
	movff	LT7686_LINECOLOUR_H,__SET_LT7686_LINECOLOUR_H
	movff	LT7686_LINECOLOUR_U,__SET_LT7686_LINECOLOUR_U
	movff	LT7686_LINECOLOUR_E,__SET_LT7686_LINECOLOUR_E
	movlw	210
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	212
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	211
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	103
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movlw	128
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
	bra	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

LINE_WIDTH_LT7686
	banksel	_XOFFSET1
	movf	_XOFFSET1,W,BANKED
	subwf	_XOFFSET2,W,BANKED
	banksel	XTEMP
	movwf	XTEMP,BANKED
	banksel	_XOFFSET1_H
	movf	_XOFFSET1_H,W,BANKED
	subwfb	_XOFFSET2_H,W,BANKED
	banksel	XTEMP_H
	movwf	XTEMP_H,BANKED
	banksel	_YOFFSET1
	movf	_YOFFSET1,W,BANKED
	subwf	_YOFFSET2,W,BANKED
	banksel	SYSTEMP1
	movwf	SysTemp1,BANKED
	banksel	_YOFFSET1_H
	movf	_YOFFSET1_H,W,BANKED
	subwfb	_YOFFSET2_H,W,BANKED
	banksel	SYSTEMP1_H
	movwf	SysTemp1_H,BANKED
	movff	SysTemp1,SysINTEGERTempA
	movff	SysTemp1_H,SysINTEGERTempA_H
	movlw	10
	movwf	SysINTEGERTempB,ACCESS
	clrf	SysINTEGERTempB_H,ACCESS
	banksel	0
	call	SYSMULTSUBINT
	movff	SysINTEGERTempX,YTEMP
	movff	SysINTEGERTempX_H,YTEMP_H
	banksel	WTEMP
	clrf	WTEMP,BANKED
	clrf	WTEMP_H,BANKED
	movff	XTEMP,SysINTEGERTempA
	movff	XTEMP_H,SysINTEGERTempA_H
	clrf	SysINTEGERTempB,ACCESS
	clrf	SysINTEGERTempB_H,ACCESS
	banksel	0
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	ELSE46_1
	movlw	20
	banksel	TEMP_LT7686
	movwf	TEMP_LT7686,BANKED
	clrf	TEMP_LT7686_H,BANKED
	bra	ENDIF46
ELSE46_1
	movff	YTEMP,SysINTEGERTempA
	movff	YTEMP_H,SysINTEGERTempA_H
	movff	XTEMP,SysINTEGERTempB
	movff	XTEMP_H,SysINTEGERTempB_H
	call	SYSDIVSUBINT
	movff	SysINTEGERTempA,TEMP_LT7686
	movff	SysINTEGERTempA_H,TEMP_LT7686_H
ENDIF46
	movff	TEMP_LT7686,SYSCALCTEMPA
	movff	TEMP_LT7686_H,SYSCALCTEMPA_H
	banksel	0
	call	FN_ABS
	movff	ABS,SysINTEGERTempB
	movff	ABS_H,SysINTEGERTempB_H
	movlw	10
	movwf	SysINTEGERTempA,ACCESS
	clrf	SysINTEGERTempA_H,ACCESS
	call	SYSCOMPLESSTHANINT
	comf	SysByteTempX,F,ACCESS
	btfss	SysByteTempX,0,ACCESS
	bra	ELSE47_1
SysDoLoop_S3
	movff	_woffset,SysWORDTempB
	movff	_woffset_H,SysWORDTempB_H
	clrf	SysWORDTempA,ACCESS
	clrf	SysWORDTempA_H,ACCESS
	banksel	0
	call	SYSCOMPLESSTHAN16
	btfss	SysByteTempX,0,ACCESS
	bra	SysDoLoop_E3
	movlw	1
	banksel	_WOFFSET
	subwf	_WOFFSET,F,BANKED
	movlw	0
	subwfb	_WOFFSET_H,F,BANKED
	movff	_XOFFSET1,XOFFSET1
	movff	_XOFFSET1_H,XOFFSET1_H
	banksel	WTEMP
	movf	WTEMP,W,BANKED
	banksel	_YOFFSET1
	addwf	_YOFFSET1,W,BANKED
	movwf	YOFFSET1,BANKED
	banksel	WTEMP_H
	movf	WTEMP_H,W,BANKED
	banksel	_YOFFSET1_H
	addwfc	_YOFFSET1_H,W,BANKED
	movwf	YOFFSET1_H,BANKED
	movff	_XOFFSET2,XOFFSET2
	movff	_XOFFSET2_H,XOFFSET2_H
	banksel	WTEMP
	movf	WTEMP,W,BANKED
	banksel	_YOFFSET2
	addwf	_YOFFSET2,W,BANKED
	movwf	YOFFSET2,BANKED
	banksel	WTEMP_H
	movf	WTEMP_H,W,BANKED
	banksel	_YOFFSET2_H
	addwfc	_YOFFSET2_H,W,BANKED
	movwf	YOFFSET2_H,BANKED
	banksel	0
	rcall	LINE_LT7686
	banksel	WTEMP
	incf	WTEMP,F,BANKED
	btfsc	STATUS,Z,ACCESS
	incf	WTEMP_H,F,BANKED
	bra	SysDoLoop_S3
SysDoLoop_E3
	bra	ENDIF47
ELSE47_1
SysDoLoop_S4
	movff	_woffset,SysWORDTempB
	movff	_woffset_H,SysWORDTempB_H
	clrf	SysWORDTempA,ACCESS
	clrf	SysWORDTempA_H,ACCESS
	banksel	0
	call	SYSCOMPLESSTHAN16
	btfss	SysByteTempX,0,ACCESS
	bra	SysDoLoop_E4
	movlw	1
	banksel	_WOFFSET
	subwf	_WOFFSET,F,BANKED
	movlw	0
	subwfb	_WOFFSET_H,F,BANKED
	banksel	WTEMP
	movf	WTEMP,W,BANKED
	banksel	_XOFFSET1
	addwf	_XOFFSET1,W,BANKED
	banksel	XOFFSET1
	movwf	XOFFSET1,BANKED
	movf	WTEMP_H,W,BANKED
	banksel	_XOFFSET1_H
	addwfc	_XOFFSET1_H,W,BANKED
	banksel	XOFFSET1_H
	movwf	XOFFSET1_H,BANKED
	movff	_YOFFSET1,YOFFSET1
	movff	_YOFFSET1_H,YOFFSET1_H
	movf	WTEMP,W,BANKED
	banksel	_XOFFSET2
	addwf	_XOFFSET2,W,BANKED
	banksel	XOFFSET2
	movwf	XOFFSET2,BANKED
	movf	WTEMP_H,W,BANKED
	banksel	_XOFFSET2_H
	addwfc	_XOFFSET2_H,W,BANKED
	banksel	XOFFSET2_H
	movwf	XOFFSET2_H,BANKED
	movff	_YOFFSET2,YOFFSET2
	movff	_YOFFSET2_H,YOFFSET2_H
	banksel	0
	rcall	LINE_LT7686
	banksel	WTEMP
	incf	WTEMP,F,BANKED
	btfsc	STATUS,Z,ACCESS
	incf	WTEMP_H,F,BANKED
	bra	SysDoLoop_S4
SysDoLoop_E4
ENDIF47
	return

;********************************************************************************

LT7686_CHECK_BUSY_DRAW
SysDoLoop_S5
	call	FN_LT7686_STATUSREAD
	movlw	8
	banksel	LT7686_STATUSREAD
	andwf	lt7686_statusread,W,BANKED
	movwf	SysTemp3,BANKED
	movff	SysTemp3,SysBYTETempA
	movlw	8
	movwf	SysBYTETempB,ACCESS
	banksel	0
	call	SYSCOMPEQUAL
	btfss	SysByteTempX,0,ACCESS
	bra	SysDoLoop_E5
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS5
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS5
	bra	SysDoLoop_S5
SysDoLoop_E5
	return

;********************************************************************************

FN_LT7686_CHECK_INIT
	clrf	LT7686_CHECK_INIT,ACCESS
	clrf	LT7686_CHECK_INIT_COUNTER,ACCESS
	clrf	LT7686_CHECK_INIT_FAIL,ACCESS
SysDoLoop_S9
	incf	LT7686_CHECK_INIT_COUNTER,F,ACCESS
	incf	LT7686_CHECK_INIT_FAIL,F,ACCESS
	banksel	0
	call	FN_LT7686_STATUSREAD
	movff	LT7686_STATUSREAD,LT7686_STATUSREADRESULT
	movlw	2
	banksel	LT7686_STATUSREADRESULT
	andwf	LT7686_STATUSREADRESULT,W,BANKED
	movwf	SysTemp3,BANKED
	movff	SysTemp3,SysBYTETempA
	clrf	SysBYTETempB,ACCESS
	banksel	0
	call	SYSCOMPEQUAL
	movff	SysByteTempX,SysTemp1
	movff	LT7686_CHECK_INIT_FAIL,SysBYTETempA
	movlw	20
	movwf	SysBYTETempB,ACCESS
	call	SYSCOMPLESSTHAN
	banksel	SYSTEMP1
	movf	SysTemp1,W,BANKED
	andwf	SysByteTempX,W,ACCESS
	movwf	SysTemp3,BANKED
	btfss	SysTemp3,0,BANKED
	bra	ELSE94_1
	movlw	2
	movwf	DELAYTEMP2,ACCESS
DelayUSO6
	clrf	DELAYTEMP,ACCESS
DelayUS6
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS6
	decfsz	DELAYTEMP2,F,ACCESS
	bra	DelayUSO6
	movlw	19
	movwf	DELAYTEMP,ACCESS
DelayUS7
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS7
	movlw	1
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	rcall	FN_LT7686_DATAREAD
	movlw	128
	andwf	LT7686_DATAREAD,W,ACCESS
	banksel	SYSTEMP3
	movwf	SysTemp3,BANKED
	movff	SysTemp3,SysBYTETempA
	movlw	128
	movwf	SysBYTETempB,ACCESS
	banksel	0
	call	SYSCOMPEQUAL
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF96
	setf	LT7686_CHECK_INIT,ACCESS
	return
ENDIF96
	bra	ENDIF94
ELSE94_1
	movlw	2
	movwf	DELAYTEMP2,ACCESS
DelayUSO8
	clrf	DELAYTEMP,ACCESS
DelayUS8
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS8
	decfsz	DELAYTEMP2,F,ACCESS
	bra	DelayUSO8
	movlw	19
	movwf	DELAYTEMP,ACCESS
DelayUS9
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS9
	movlw	1
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movlw	128
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
ENDIF94
	movff	LT7686_CHECK_INIT,SysBYTETempA
	clrf	SysBYTETempB,ACCESS
	call	SYSCOMPEQUAL
	movff	SysByteTempX,SysTemp3
	movff	LT7686_CHECK_INIT_FAIL,SysBYTETempA
	movlw	5
	movwf	SysBYTETempB,ACCESS
	call	SYSCOMPEQUAL
	banksel	SYSTEMP3
	movf	SysTemp3,W,BANKED
	andwf	SysByteTempX,W,ACCESS
	movwf	SysTemp1,BANKED
	btfss	SysTemp1,0,BANKED
	bra	ENDIF95
	banksel	0
	rcall	LT7686_HARDWARE_RESET
	movlw	10
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	call	Delay_MS
	call	LT7686_SOFTWARE_RESET
	movlw	10
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	call	Delay_MS
	rcall	LT7686_LOADDEFAULTREGISTERS
	movlw	228
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movlw	1
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
	movlw	100
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	call	Delay_MS
	clrf	LT7686_CHECK_INIT_FAIL,ACCESS
ENDIF95
	movff	lt7686_check_init,SysBYTETempA
	clrf	SysBYTETempB,ACCESS
	banksel	0
	call	SYSCOMPEQUAL
	movff	SysByteTempX,SysTemp3
	movff	lt7686_check_init_counter,SysBYTETempA
	movlw	20
	movwf	SysBYTETempB,ACCESS
	call	SYSCOMPEQUAL
	comf	SysByteTempX,F,ACCESS
	banksel	SYSTEMP3
	movf	SysTemp3,W,BANKED
	andwf	SysByteTempX,W,ACCESS
	movwf	SysTemp1,BANKED
	btfsc	SysTemp1,0,BANKED
	bra	SysDoLoop_S9
SysDoLoop_E9
	setf	LT7686_CHECK_INIT,ACCESS
	banksel	0
	return

;********************************************************************************

FN_LT7686_DATAREAD
	bcf	LATA,3,ACCESS
	movlw	192
	banksel	SPITXDATA
	movwf	SPITXDATA,BANKED
	banksel	0
	call	FASTHWSPITRANSFER
	banksel	SPITXDATA
	clrf	SPITXDATA,BANKED
	banksel	0
	call	HWSPITRANSFER
	movff	SPIRXDATA,LT7686_DATAREAD
	bsf	LATA,3,ACCESS
	return

;********************************************************************************

LT7686_DISPLAY_COLORBAR
	movlw	18
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	incf	LT7686_DISPLAY_COLORBAR_STATE,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	ELSE44_1
	rcall	FN_LT7686_DATAREAD
	movff	LT7686_DATAREAD,LT7686_DISPLAY_COLORBAR_STATE
	movlw	32
	iorwf	LT7686_DISPLAY_COLORBAR_STATE,F,ACCESS
	bra	ENDIF44
ELSE44_1
	rcall	FN_LT7686_DATAREAD
	movff	LT7686_DATAREAD,LT7686_DISPLAY_COLORBAR_STATE
	movlw	223
	andwf	LT7686_DISPLAY_COLORBAR_STATE,F,ACCESS
ENDIF44
	movlw	18
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	LT7686_DISPLAY_COLORBAR_STATE,__OUTBYTE
	call	LT7686_WRITEDATA
	bra	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

LT7686_HARDWARE_RESET
	bsf	LATB,5,ACCESS
	movlw	30
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	call	Delay_MS
	bcf	LATB,5,ACCESS
	movlw	200
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	call	Delay_MS
	bsf	LATB,5,ACCESS
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

LT7686_INITTFT_DATASET_800_480
	movff	SYSSTRINGA,SysWORDTempA
	movff	SYSSTRINGA_H,SysWORDTempA_H
	movlw	162
	movwf	SysWORDTempB,ACCESS
	movlw	1
	movwf	SysWORDTempB_H,ACCESS
	call	SYSCOMPLESSTHAN16
	btfss	SysByteTempX,0,ACCESS
	retlw	0
	movf	SysStringA, W,ACCESS
	addlw	low TABLELT7686_INITTFT_DATASET_800_480
	movwf	TBLPTRL,ACCESS
	movlw	high TABLELT7686_INITTFT_DATASET_800_480
	addwfc	SysStringA_H, W,ACCESS
	movwf	TBLPTRH,ACCESS
	movlw	upper TABLELT7686_INITTFT_DATASET_800_480
	btfsc	STATUS, C,ACCESS
	addlw	1
	movwf	TBLPTRU,ACCESS
	tblrd*
	movf	TABLAT, W,ACCESS
	return
TABLELT7686_INITTFT_DATASET_800_480
	db	161,0,17,5,19,138,17,6,19,33,17,7,19,138,17,8,19,100,17,9,19,138,17,10,19,80,17,0
	db	19,128,170,170,170,170,17,1,19,146,17,1,18,146,17,2,19,64,170,170,170,170,17,224
	db	19,41,17,225,19,3,17,226,19,11,17,227,19,3,17,228,19,1,170,170,170,170,170,170
	db	170,170,170,170,170,170,17,16,19,5,17,18,19,0,17,19,19,192,17,20,19,99,17,21,19,0
	db	17,26,19,223,17,27,19,1,17,22,19,4,17,23,19,6,17,24,19,25,17,25,19,0,17,28,19,22
	db	17,29,19,0,17,30,19,21,17,31,19,0,17,187,19,1,17,32,19,0,17,33,19,0,17,34,19,0
	db	17,35,19,0,17,36,19,32,17,37,19,3,17,38,19,0,17,39,19,0,17,40,19,0,17,41,19,0
	db	170,170,170,170,17,80,19,0,17,81,19,0,17,82,19,0,17,83,19,0,17,84,19,32,17,85
	db	19,3,17,86,19,0,17,87,19,0,17,88,19,0,17,89,19,0,17,90,19,32,17,91,19,3,17,92
	db	19,224,17,93,19,1,17,94,19,1,17,188,19,0,17,189,19,2,17,190,19,0,17,191,19,0,17,192
	db	19,0,17,193,19,0,17,194,19,0,17,195,19,0,17,198,19,32,17,199,19,3,17,200,19,224
	db	17,201,19,1,17,202,19,32,17,203,19,3,17,183,19,192,170,170,170,170,17,18,19,64
	db	170,170,170,170,17,132,19,19,17,133,19,10,17,135,19,0,17,140,19,100,17,141,19,0
	db	17,136,19,100,17,137,19,0,17,142,19,50,17,143,19,0,17,138,19,50,17,139,19,0,17,134
	db	19,51,170,170,170,170,17,104,19,0,17,105,19,0,17,106,19,0,17,107,19,0,17,108,19,31
	db	170,170,170,170,17,109,19,3,17,110,19,223,170,170,170,170,17,111,19,1,170,170
	db	170,170

;********************************************************************************

LT7686_INITTFT_DATASET_800_480_H
	movff	SYSSTRINGA,SysWORDTempA
	movff	SYSSTRINGA_H,SysWORDTempA_H
	movlw	1
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPLESSTHAN16
	btfss	SysByteTempX,0,ACCESS
	retlw	0
	movf	SysStringA, W,ACCESS
	addlw	low TABLELT7686_INITTFT_DATASET_800_480_H
	movwf	TBLPTRL,ACCESS
	movlw	high TABLELT7686_INITTFT_DATASET_800_480_H
	addwfc	SysStringA_H, W,ACCESS
	movwf	TBLPTRH,ACCESS
	movlw	upper TABLELT7686_INITTFT_DATASET_800_480_H
	btfsc	STATUS, C,ACCESS
	addlw	1
	movwf	TBLPTRU,ACCESS
	tblrd*
	movf	TABLAT, W,ACCESS
	return
TABLELT7686_INITTFT_DATASET_800_480_H
	db	1

;********************************************************************************

LT7686_LOADDEFAULTREGISTERS
	clrf	OLDLT7686_INITDATA,ACCESS
	banksel	LT7686_POINTER
	clrf	LT7686_POINTER,BANKED
	clrf	LT7686_POINTER_H,BANKED
	movff	LT7686_POINTER,SYSSTRINGA
	movff	LT7686_POINTER_H,SYSSTRINGA_H
	banksel	0
	rcall	LT7686_INITTFT_DATASET_1024_600
	movwf	LT7686_INITLENGTH,ACCESS
	movff	LT7686_POINTER,SYSSTRINGA
	movff	LT7686_POINTER_H,SYSSTRINGA_H
	rcall	LT7686_INITTFT_DATASET_1024_600_H
	movwf	LT7686_INITLENGTH_H,ACCESS
	banksel	LT7686_POINTER
	incf	LT7686_POINTER,F,BANKED
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_POINTER_H,F,BANKED
SysDoLoop_S7
	movlw	1
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	banksel	0
	call	Delay_MS
	movff	LT7686_POINTER,SYSSTRINGA
	movff	LT7686_POINTER_H,SYSSTRINGA_H
	rcall	LT7686_INITTFT_DATASET_1024_600
	movwf	LT7686_INITDATA,ACCESS
	banksel	LT7686_POINTER
	incf	LT7686_POINTER,F,BANKED
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_POINTER_H,F,BANKED
SysSelect10Case1
	movlw	17
	subwf	LT7686_INITDATA,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect10Case2
	movlw	50
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	banksel	0
	call	Delay_MS
	movff	LT7686_POINTER,SYSSTRINGA
	movff	LT7686_POINTER_H,SYSSTRINGA_H
	rcall	LT7686_INITTFT_DATASET_1024_600
	movwf	LT7686_INITDATA,ACCESS
	movff	LT7686_INITDATA,OLDLT7686_INITDATA
	banksel	LT7686_POINTER
	incf	LT7686_POINTER,F,BANKED
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_POINTER_H,F,BANKED
	movff	LT7686_INITDATA,__OUTBYTE
	banksel	0
	rcall	LT7686_WRITECMD
	movff	LT7686_INITDATA,LASTLT7686_CMD
	bra	SysSelectEnd10
SysSelect10Case2
	movlw	18
	subwf	LT7686_INITDATA,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect10Case3
	movff	LT7686_POINTER,SYSSTRINGA
	movff	LT7686_POINTER_H,SYSSTRINGA_H
	banksel	0
	rcall	LT7686_INITTFT_DATASET_1024_600
	movwf	LT7686_INITDATA,ACCESS
	banksel	LT7686_POINTER
	incf	LT7686_POINTER,F,BANKED
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_POINTER_H,F,BANKED
	movlw	1
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	banksel	0
	call	Delay_MS
SysDoLoop_S8
	rcall	FN_LT7686_DATAREAD
	movff	lt7686_dataread,SysBYTETempA
	movff	lt7686_initdata,SysBYTETempB
	call	SYSCOMPEQUAL
	comf	SysByteTempX,F,ACCESS
	movff	SysByteTempX,SysTemp3
	movff	lt7686_initverifycounter,SysWORDTempA
	movff	lt7686_initverifycounter_H,SysWORDTempA_H
	movlw	244
	movwf	SysWORDTempB,ACCESS
	movlw	1
	movwf	SysWORDTempB_H,ACCESS
	call	SYSCOMPLESSTHAN16
	banksel	SYSTEMP3
	movf	SysTemp3,W,BANKED
	andwf	SysByteTempX,W,ACCESS
	movwf	SysTemp1,BANKED
	btfss	SysTemp1,0,BANKED
	bra	SysDoLoop_E8
	incf	LT7686_INITVERIFYCOUNTER,F,BANKED
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_INITVERIFYCOUNTER_H,F,BANKED
	movlw	1
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	banksel	0
	call	Delay_MS
	bra	SysDoLoop_S8
SysDoLoop_E8
	bra	SysSelectEnd10
SysSelect10Case3
	movlw	19
	subwf	LT7686_INITDATA,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect10Case4
	movff	LT7686_POINTER,SYSSTRINGA
	movff	LT7686_POINTER_H,SYSSTRINGA_H
	banksel	0
	rcall	LT7686_INITTFT_DATASET_1024_600
	movwf	LT7686_INITDATA,ACCESS
	movff	LT7686_INITDATA,OLDLT7686_INITDATA
	banksel	LT7686_INITVERIFYCOUNTER
	clrf	LT7686_INITVERIFYCOUNTER,BANKED
	clrf	LT7686_INITVERIFYCOUNTER_H,BANKED
	incf	LT7686_POINTER,F,BANKED
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_POINTER_H,F,BANKED
	movff	LT7686_INITDATA,__OUTBYTE
	banksel	0
	rcall	LT7686_WRITEDATA
	bra	SysSelectEnd10
SysSelect10Case4
	movlw	170
	subwf	LT7686_INITDATA,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelectEnd10
	movff	LT7686_POINTER,SYSSTRINGA
	movff	LT7686_POINTER_H,SYSSTRINGA_H
	banksel	0
	rcall	LT7686_INITTFT_DATASET_1024_600
	movwf	LT7686_INITDATA,ACCESS
	banksel	LT7686_POINTER
	incf	LT7686_POINTER,F,BANKED
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_POINTER_H,F,BANKED
	movf	LT7686_INITDATA,W,ACCESS
	subwf	OLDLT7686_INITDATA,W,ACCESS
	btfsc	STATUS, Z,ACCESS
	bra	ENDIF92
	banksel	0
	rcall	LT7686_WAIT10MS
	movff	LT7686_INITDATA,OLDLT7686_INITDATA
ENDIF92
SysSelectEnd10
	movff	LT7686_POINTER,SysWORDTempB
	movff	LT7686_POINTER_H,SysWORDTempB_H
	movff	LT7686_INITLENGTH,SysWORDTempA
	movff	LT7686_INITLENGTH_H,SysWORDTempA_H
	banksel	0
	call	SYSCOMPLESSTHAN16
	btfsc	SysByteTempX,0,ACCESS
	bra	SysDoLoop_E7
	bra	SysDoLoop_S7
SysDoLoop_E7
	return

;********************************************************************************

LT7686_PRINT_INTERNAL_FONT556
	movff	SysLCDPRINTDATAHandler,AFSR0
	movff	SysLCDPRINTDATAHandler_H,AFSR0_H
	movff	INDF0,GLCDPRINTLEN
	clrf	GLCDPRINTLEN_H,ACCESS
	movff	GLCDPRINTLEN,SysWORDTempA
	movff	GLCDPRINTLEN_H,SysWORDTempA_H
	clrf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfsc	SysByteTempX,0,ACCESS
	return
	movlw	99
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	_XOFFSET1,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	100
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	_XOFFSET1_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
	rcall	LT7686_CHECK_BUSY_DRAW
	movlw	101
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	_YOFFSET1,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	102
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	_YOFFSET1_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
	rcall	LT7686_CHECK_BUSY_DRAW
	movlw	204
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	rcall	FN_LT7686_DATAREAD
	movff	LT7686_DATAREAD,TEMP_LT7686
	banksel	TEMP_LT7686
	bcf	TEMP_LT7686,7,BANKED
	bcf	TEMP_LT7686,6,BANKED
	movff	TEMP_LT7686,__OUTBYTE
	banksel	0
	rcall	LT7686_WRITEDATA
	rcall	LT7686_CHECK_BUSY_DRAW
	movff	LT7686_LINECOLOUR,__SET_LT7686_LINECOLOUR
	movff	LT7686_LINECOLOUR_H,__SET_LT7686_LINECOLOUR_H
	movff	LT7686_LINECOLOUR_U,__SET_LT7686_LINECOLOUR_U
	movff	LT7686_LINECOLOUR_E,__SET_LT7686_LINECOLOUR_E
	movlw	210
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	212
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR,__OUTBYTE
	rcall	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	211
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	3
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	rcall	FN_LT7686_DATAREAD
	movff	LT7686_DATAREAD,TEMP_LT7686
	banksel	TEMP_LT7686
	bsf	TEMP_LT7686,2,BANKED
	bcf	TEMP_LT7686,1,BANKED
	bcf	TEMP_LT7686,0,BANKED
	movff	TEMP_LT7686,__OUTBYTE
	banksel	0
	rcall	LT7686_WRITEDATA
	call	LT7686_CHECK_BUSY_DRAW
	movlw	1
	movwf	DELAYTEMP2,ACCESS
DelayUSO1
	clrf	DELAYTEMP,ACCESS
DelayUS1
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS1
	decfsz	DELAYTEMP2,F,ACCESS
	bra	DelayUSO1
	movlw	9
	movwf	DELAYTEMP,ACCESS
DelayUS2
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS2
	movlw	1
	movwf	GLCDPRINT_STRING_COUNTER,ACCESS
	clrf	GLCDPRINT_STRING_COUNTER_H,ACCESS
SysForLoop11
	movlw	4
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movf	GLCDPRINT_STRING_COUNTER,W,ACCESS
	banksel	SYSLCDPRINTDATAHANDLER
	addwf	SysLCDPRINTDATAHandler,W,BANKED
	movwf	AFSR0,ACCESS
	movf	GLCDPRINT_STRING_COUNTER_H,W,ACCESS
	addwfc	SysLCDPRINTDATAHandler_H,W,BANKED
	movwf	AFSR0_H,ACCESS
	movff	INDF0,__OUTBYTE
	banksel	0
	rcall	LT7686_WRITEDATA
	call	LT7686_CHECK_BUSY_DRAW
	movf	GLCDPRINT_STRING_COUNTER,W,ACCESS
	subwf	GLCDPRINTLEN,W,ACCESS
	banksel	SYSTEMP1
	movwf	SysTemp1,BANKED
	movf	GLCDPRINT_STRING_COUNTER_H,W,ACCESS
	subwfb	GLCDPRINTLEN_H,W,ACCESS
	movwf	SysTemp1_H,BANKED
	movff	SysTemp1,SysWORDTempA
	movff	SysTemp1_H,SysWORDTempA_H
	clrf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	banksel	0
	call	SYSCOMPEQUAL16
	comf	SysByteTempX,F,ACCESS
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF50
	incf	GLCDPRINT_STRING_COUNTER,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	GLCDPRINT_STRING_COUNTER_H,F,ACCESS
	bra	SysForLoop11
ENDIF50
SysForLoopEnd11
	movlw	3
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	rcall	FN_LT7686_DATAREAD
	movff	LT7686_DATAREAD,TEMP_LT7686
	banksel	TEMP_LT7686
	bcf	TEMP_LT7686,2,BANKED
	movff	TEMP_LT7686,__OUTBYTE
	banksel	0
	rcall	LT7686_WRITEDATA
	movlw	1
	movwf	DELAYTEMP2,ACCESS
DelayUSO3
	clrf	DELAYTEMP,ACCESS
DelayUS3
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS3
	decfsz	DELAYTEMP2,F,ACCESS
	bra	DelayUSO3
	movlw	9
	movwf	DELAYTEMP,ACCESS
DelayUS4
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS4
	return

;********************************************************************************

LT7686_PRINT_INTERNAL_FONT557
	movff	LCDVALUE,SYSVALTEMP
	movff	LCDVALUE_H,SYSVALTEMP_H
	call	FN_STR
	movlw	low STR
	banksel	SYSLCDPRINTDATAHANDLER
	movwf	SysLCDPRINTDATAHandler,BANKED
	movlw	high STR
	movwf	SysLCDPRINTDATAHandler_H,BANKED
	banksel	0
	bra	LT7686_PRINT_INTERNAL_FONT556

;********************************************************************************

LT7686_PWM_DUTY
	movf	LT7686_DISPLAY_PWM,W,ACCESS
	sublw	200
	btfsc	STATUS, C,ACCESS
	bra	ENDIF45
	movlw	99
	movwf	LT7686_DISPLAY_PWM,ACCESS
ENDIF45
	movlw	134
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	rcall	FN_LT7686_DATAREAD
	movff	LT7686_DATAREAD,TEMP_LT7686
	banksel	TEMP_LT7686
	bcf	TEMP_LT7686,4,BANKED
	movff	TEMP_LT7686,__OUTBYTE
	banksel	0
	rcall	LT7686_WRITEDATA
	call	LT7686_CHECK_BUSY_DRAW
	movlw	133
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	rcall	FN_LT7686_DATAREAD
	movff	LT7686_DATAREAD,TEMP_LT7686
	banksel	TEMP_LT7686
	bcf	TEMP_LT7686,7,BANKED
	bcf	TEMP_LT7686,6,BANKED
	movff	TEMP_LT7686,__OUTBYTE
	banksel	0
	rcall	LT7686_WRITEDATA
	call	LT7686_CHECK_BUSY_DRAW
	movlw	132
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movlw	200
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITEDATA
	call	LT7686_CHECK_BUSY_DRAW
	movlw	142
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movlw	100
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITEDATA
	movlw	143
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	banksel	__OUTBYTE
	clrf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITEDATA
	call	LT7686_CHECK_BUSY_DRAW
	movlw	140
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	LT7686_DISPLAY_PWM,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	141
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	banksel	__OUTBYTE
	clrf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITEDATA
	call	LT7686_CHECK_BUSY_DRAW
	movlw	134
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	call	FN_LT7686_DATAREAD
	movff	LT7686_DATAREAD,TEMP_LT7686
	banksel	TEMP_LT7686
	bsf	TEMP_LT7686,5,BANKED
	bsf	TEMP_LT7686,4,BANKED
	movff	TEMP_LT7686,__OUTBYTE
	banksel	0
	rcall	LT7686_WRITEDATA
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

LT7686_SELECT_INTERNAL_FONT_INIT
	movlw	204
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	banksel	TEMP_LT7686
	clrf	TEMP_LT7686,BANKED
SysSelect4Case1
	movlw	24
	banksel	_FONTSIZE
	subwf	_FONTSIZE,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelect4Case2
	banksel	TEMP_LT7686
	bsf	TEMP_LT7686,4,BANKED
	bra	SysSelectEnd4
SysSelect4Case2
	movlw	32
	subwf	_FONTSIZE,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelectEnd4
	banksel	TEMP_LT7686
	bsf	TEMP_LT7686,5,BANKED
SysSelectEnd4
	movff	TEMP_LT7686,__OUTBYTE
	banksel	0
	rcall	LT7686_WRITEDATA
	call	LT7686_CHECK_BUSY_DRAW
	movlw	205
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	banksel	TEMP_LT7686
	clrf	TEMP_LT7686,BANKED
SysSelect5Case1
	movlw	2
	banksel	_XWIDTHMAG
	subwf	_XWIDTHMAG,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelect5Case2
	banksel	TEMP_LT7686
	bsf	TEMP_LT7686,2,BANKED
	bra	SysSelectEnd5
SysSelect5Case2
	movlw	3
	subwf	_XWIDTHMAG,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelect5Case3
	banksel	TEMP_LT7686
	bsf	TEMP_LT7686,3,BANKED
	bra	SysSelectEnd5
SysSelect5Case3
	movlw	4
	subwf	_XWIDTHMAG,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelectEnd5
	banksel	TEMP_LT7686
	bsf	TEMP_LT7686,3,BANKED
	bsf	TEMP_LT7686,2,BANKED
SysSelectEnd5
SysSelect6Case1
	movlw	2
	banksel	_YHEIGHTMAG
	subwf	_YHEIGHTMAG,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelect6Case2
	banksel	TEMP_LT7686
	bsf	TEMP_LT7686,0,BANKED
	bra	SysSelectEnd6
SysSelect6Case2
	movlw	3
	subwf	_YHEIGHTMAG,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelect6Case3
	banksel	TEMP_LT7686
	bsf	TEMP_LT7686,1,BANKED
	bra	SysSelectEnd6
SysSelect6Case3
	movlw	4
	subwf	_YHEIGHTMAG,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelectEnd6
	banksel	TEMP_LT7686
	bsf	TEMP_LT7686,1,BANKED
	bsf	TEMP_LT7686,0,BANKED
SysSelectEnd6
SysSelect7Case1
	banksel	_CHROMAKEY
	decf	_CHROMAKEY,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelectEnd7
	banksel	TEMP_LT7686
	bsf	TEMP_LT7686,6,BANKED
SysSelectEnd7
SysSelect8Case1
	banksel	_ALIGNMENT
	decf	_ALIGNMENT,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelectEnd8
	banksel	TEMP_LT7686
	bsf	TEMP_LT7686,7,BANKED
SysSelectEnd8
	movff	TEMP_LT7686,__OUTBYTE
	banksel	0
	rcall	LT7686_WRITEDATA
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

LT7686_SOFTWARE_RESET
	banksel	__OUTBYTE
	clrf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movlw	1
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITEDATA
	movlw	1
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	goto	Delay_MS

;********************************************************************************

FN_LT7686_STATUSREAD
	banksel	LT7686_STATUSREAD
	clrf	LT7686_STATUSREAD,BANKED
	bcf	LATA,3,ACCESS
	movlw	64
	movwf	SPITXDATA,BANKED
	banksel	0
	call	FASTHWSPITRANSFER
	banksel	SPITXDATA
	clrf	SPITXDATA,BANKED
	banksel	0
	call	HWSPITRANSFER
	movff	SPIRXDATA,__LT7686_OUTBUFFER
	movff	__LT7686_OUTBUFFER,LT7686_STATUSREAD
	bsf	LATA,3,ACCESS
	return

;********************************************************************************

LT7686_WAIT10MS
	movlw	10
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	goto	Delay_MS

;********************************************************************************

LT7686_WRITECMD
	banksel	__LT7686_FBUFFER
	clrf	__LT7686_FBUFFER,BANKED
	movff	__OUTBYTE,__LT7686_OUTBUFFER
	bcf	LATA,3,ACCESS
	movff	__LT7686_FBUFFER,SPITXDATA
	banksel	0
	call	FASTHWSPITRANSFER
	movff	__LT7686_OUTBUFFER,SPITXDATA
	call	FASTHWSPITRANSFER
	bsf	LATA,3,ACCESS
	return

;********************************************************************************

LT7686_WRITEDATA
	movlw	128
	banksel	__LT7686_FBUFFER
	movwf	__LT7686_FBUFFER,BANKED
	movff	__OUTBYTE,__LT7686_OUTBUFFER
	bcf	LATA,3,ACCESS
	movff	__LT7686_FBUFFER,SPITXDATA
	banksel	0
	call	FASTHWSPITRANSFER
	movff	__LT7686_OUTBUFFER,SPITXDATA
	call	FASTHWSPITRANSFER
	bsf	LATA,3,ACCESS
	return

;********************************************************************************

FN_MID
	movff	SysSYSINSTRINGHandler,AFSR0
	movff	SysSYSINSTRINGHandler_H,AFSR0_H
	movf	INDF0,F,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	ENDIF79
	banksel	SYSMID_0
	clrf	SYSMID_0,BANKED
	banksel	0
	return
ENDIF79
	movlw	1
	banksel	SYSCHARSTART
	subwf	SYSCHARSTART,W,BANKED
	btfsc	STATUS, C,ACCESS
	bra	ENDIF80
	movlw	1
	movwf	SYSCHARSTART,BANKED
ENDIF80
	movff	SysSYSINSTRINGHandler,AFSR0
	movff	SysSYSINSTRINGHandler_H,AFSR0_H
	movf	SYSCHARSTART,W,BANKED
	subwf	INDF0,W,ACCESS
	btfsc	STATUS, C,ACCESS
	bra	ENDIF81
	banksel	SYSMID_0
	clrf	SYSMID_0,BANKED
	banksel	0
	return
ENDIF81
	decf	SYSCHARSTART,F,BANKED
	movff	SysSYSINSTRINGHandler,AFSR0
	movff	SysSYSINSTRINGHandler_H,AFSR0_H
	movf	SYSCHARSTART,W,BANKED
	subwf	INDF0,W,ACCESS
	movwf	SYSSTRINGTEMP,BANKED
	movf	SYSCHARCOUNT,W,BANKED
	subwf	SYSSTRINGTEMP,W,BANKED
	btfss	STATUS, C,ACCESS
	movff	SYSSTRINGTEMP,SYSCHARCOUNT
	movlw	1
	movwf	SYSSTRINGTEMP,BANKED
SysForLoop14
	movf	SYSSTRINGTEMP,W,BANKED
	addwf	SYSCHARSTART,W,BANKED
	movwf	SysTemp3,BANKED
	addwf	SysSYSINSTRINGHandler,W,BANKED
	movwf	AFSR0,ACCESS
	movlw	0
	addwfc	SysSYSINSTRINGHandler_H,W,BANKED
	movwf	AFSR0_H,ACCESS
	movff	POSTINC0,SysArrayTemp1
	movff	SysArrayTemp1,SysArrayTemp2
	lfsr	0,MID
	movf	SYSSTRINGTEMP,W,BANKED
	addwf	AFSR0,F,ACCESS
	movlw	0
	addwfc	AFSR0_H,F,ACCESS
	movff	SysArrayTemp2,POSTINC0
	movf	SYSSTRINGTEMP,W,BANKED
	subwf	SYSCHARCOUNT,W,BANKED
	movwf	SysTemp3,BANKED
	movff	SysTemp3,SysBYTETempA
	clrf	SysBYTETempB,ACCESS
	banksel	0
	call	SYSCOMPEQUAL
	comf	SysByteTempX,F,ACCESS
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF83
	banksel	SYSSTRINGTEMP
	incf	SYSSTRINGTEMP,F,BANKED
	bra	SysForLoop14
ENDIF83
SysForLoopEnd14
	movffl	SYSCHARCOUNT,SYSMID_0
	return

;********************************************************************************

PSET_LT7686
	movff	XOFFSET1,XOFFSET2
	movff	XOFFSET1_H,XOFFSET2_H
	movff	YOFFSET1,YOFFSET2
	movff	YOFFSET1_H,YOFFSET2_H
	call	BOX_LT7686
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

QUADRILATERAL_LT7686
	movlw	104
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	XOFFSET1,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	105
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	XOFFSET1_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	106
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	YOFFSET1,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	107
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	YOFFSET1_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	108
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	XOFFSET2,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	109
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	XOFFSET2_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	110
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	YOFFSET2,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	111
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	YOFFSET2_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	112
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	XOFFSET3,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	113
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	XOFFSET3_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	114
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	YOFFSET3,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	115
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	YOFFSET3_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	119
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	XOFFSET4,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	120
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	XOFFSET4_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	121
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	YOFFSET4,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	122
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	YOFFSET4_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movff	LT7686_LINECOLOUR,__SET_LT7686_LINECOLOUR
	movff	LT7686_LINECOLOUR_H,__SET_LT7686_LINECOLOUR_H
	movff	LT7686_LINECOLOUR_U,__SET_LT7686_LINECOLOUR_U
	movff	LT7686_LINECOLOUR_E,__SET_LT7686_LINECOLOUR_E
	movlw	210
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	212
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR,__OUTBYTE
	rcall	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	211
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	103
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movlw	141
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITEDATA
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

FN_RANDOM
	movlw	7
	banksel	SYSREPEATTEMP2
	movwf	SysRepeatTemp2,BANKED
SysRepeatLoop2
	movff	RANDOMSEED,RANDOMTEMP
	movff	RANDOMSEED_H,RANDOMTEMP_H
	rlcf	RANDOMTEMP_H,W,BANKED
	rlcf	RANDOMTEMP,F,BANKED
	rlcf	RANDOMTEMP_H,F,BANKED
	movlw	1
	andwf	RANDOMSEED,W,BANKED
	movwf	SysTemp1,BANKED
	clrf	SysTemp1_H,BANKED
	comf	SysTemp1,W,BANKED
	movwf	SysTemp2,BANKED
	comf	SysTemp1_H,W,BANKED
	movwf	SysTemp2_H,BANKED
	movlw	1
	addwf	SysTemp2,W,BANKED
	movwf	SysTemp1,BANKED
	movlw	0
	addwfc	SysTemp2_H,W,BANKED
	movwf	SysTemp1_H,BANKED
	clrf	SysTemp2,BANKED
	movlw	180
	andwf	SysTemp1_H,W,BANKED
	movwf	SysTemp2_H,BANKED
	movf	RANDOMTEMP,W,BANKED
	xorwf	SysTemp2,W,BANKED
	movwf	RANDOMSEED,BANKED
	movf	RANDOMTEMP_H,W,BANKED
	xorwf	SysTemp2_H,W,BANKED
	movwf	RANDOMSEED_H,BANKED
	movf	RANDOM,W,BANKED
	xorwf	RANDOMSEED_H,W,BANKED
	movwf	RANDOM,BANKED
	decfsz	SysRepeatTemp2,F,BANKED
	bra	SysRepeatLoop2
SysRepeatLoopEnd2
	banksel	0
	return

;********************************************************************************

RANDOMIZE
	banksel	RANDOMTEMP
	movf	RANDOMTEMP,W,BANKED
	addwf	RANDOMSEED,F,BANKED
	movf	RANDOMTEMP_H,W,BANKED
	addwfc	RANDOMSEED_H,F,BANKED
	movff	RANDOMSEED,SysWORDTempA
	movff	RANDOMSEED_H,SysWORDTempA_H
	clrf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	banksel	0
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF71
	movlw	1
	banksel	RANDOMSEED
	movwf	RANDOMSEED,BANKED
	clrf	RANDOMSEED_H,BANKED
ENDIF71
	banksel	0
	return

;********************************************************************************

FN_READAD587
	banksel	ADCON0
	bcf	ADCON0,ADFM0,BANKED
	movff	ADREADPORT,ADPCH
SysSelect9Case1
	movf	ADREADPORT,F,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect9Case2
	banksel	ANSELA
	bsf	ANSELA,0,BANKED
	bra	SysSelectEnd9
SysSelect9Case2
	decf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect9Case3
	banksel	ANSELA
	bsf	ANSELA,1,BANKED
	bra	SysSelectEnd9
SysSelect9Case3
	movlw	2
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect9Case4
	banksel	ANSELA
	bsf	ANSELA,2,BANKED
	bra	SysSelectEnd9
SysSelect9Case4
	movlw	3
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect9Case5
	banksel	ANSELA
	bsf	ANSELA,3,BANKED
	bra	SysSelectEnd9
SysSelect9Case5
	movlw	4
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect9Case6
	banksel	ANSELA
	bsf	ANSELA,4,BANKED
	bra	SysSelectEnd9
SysSelect9Case6
	movlw	5
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect9Case7
	banksel	ANSELA
	bsf	ANSELA,5,BANKED
	bra	SysSelectEnd9
SysSelect9Case7
	movlw	6
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect9Case8
	banksel	ANSELA
	bsf	ANSELA,6,BANKED
	bra	SysSelectEnd9
SysSelect9Case8
	movlw	7
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect9Case9
	banksel	ANSELA
	bsf	ANSELA,7,BANKED
	bra	SysSelectEnd9
SysSelect9Case9
	movlw	8
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect9Case10
	banksel	ANSELB
	bsf	ANSELB,0,BANKED
	bra	SysSelectEnd9
SysSelect9Case10
	movlw	9
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect9Case11
	banksel	ANSELB
	bsf	ANSELB,1,BANKED
	bra	SysSelectEnd9
SysSelect9Case11
	movlw	10
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect9Case12
	banksel	ANSELB
	bsf	ANSELB,2,BANKED
	bra	SysSelectEnd9
SysSelect9Case12
	movlw	11
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect9Case13
	banksel	ANSELB
	bsf	ANSELB,3,BANKED
	bra	SysSelectEnd9
SysSelect9Case13
	movlw	12
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect9Case14
	banksel	ANSELB
	bsf	ANSELB,4,BANKED
	bra	SysSelectEnd9
SysSelect9Case14
	movlw	13
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect9Case15
	banksel	ANSELB
	bsf	ANSELB,5,BANKED
	bra	SysSelectEnd9
SysSelect9Case15
	movlw	14
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect9Case16
	banksel	ANSELB
	bsf	ANSELB,6,BANKED
	bra	SysSelectEnd9
SysSelect9Case16
	movlw	15
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect9Case17
	banksel	ANSELB
	bsf	ANSELB,7,BANKED
	bra	SysSelectEnd9
SysSelect9Case17
	movlw	16
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect9Case18
	banksel	ANSELC
	bsf	ANSELC,0,BANKED
	bra	SysSelectEnd9
SysSelect9Case18
	movlw	17
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect9Case19
	banksel	ANSELC
	bsf	ANSELC,1,BANKED
	bra	SysSelectEnd9
SysSelect9Case19
	movlw	18
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect9Case20
	banksel	ANSELC
	bsf	ANSELC,2,BANKED
	bra	SysSelectEnd9
SysSelect9Case20
	movlw	19
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect9Case21
	banksel	ANSELC
	bsf	ANSELC,3,BANKED
	bra	SysSelectEnd9
SysSelect9Case21
	movlw	20
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect9Case22
	banksel	ANSELC
	bsf	ANSELC,4,BANKED
	bra	SysSelectEnd9
SysSelect9Case22
	movlw	21
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect9Case23
	banksel	ANSELC
	bsf	ANSELC,5,BANKED
	bra	SysSelectEnd9
SysSelect9Case23
	movlw	22
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect9Case24
	banksel	ANSELC
	bsf	ANSELC,6,BANKED
	bra	SysSelectEnd9
SysSelect9Case24
	movlw	23
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect9Case25
	banksel	ANSELC
	bsf	ANSELC,7,BANKED
	bra	SysSelectEnd9
SysSelect9Case25
	movlw	32
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect9Case26
	banksel	ANSELE
	bsf	ANSELE,0,BANKED
	bra	SysSelectEnd9
SysSelect9Case26
	movlw	33
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect9Case27
	banksel	ANSELE
	bsf	ANSELE,1,BANKED
	bra	SysSelectEnd9
SysSelect9Case27
	movlw	34
	subwf	ADREADPORT,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelectEnd9
	banksel	ANSELE
	bsf	ANSELE,2,BANKED
SysSelectEnd9
	banksel	ADCON0
	bcf	ADCON0,ADCS,BANKED
	movlw	1
	movwf	ADCLK,BANKED
	bcf	ADCON0,ADCS,BANKED
	movlw	15
	movwf	ADCLK,BANKED
	bcf	ADCLK,ADCS2,BANKED
	bcf	ADCLK,ADCS1,BANKED
	bsf	ADCLK,ADCS0,BANKED
	bcf	ADCON0,ADFM0,BANKED
	bcf	ADCON0,ADFM0,BANKED
	movff	ADREADPORT,ADPCH
	bsf	ADCON0,ADON,BANKED
	movlw	2
	movwf	SysWaitTemp10US,ACCESS
	banksel	0
	call	Delay_10US
	banksel	ADCON0
	bsf	ADCON0,GO_NOT_DONE,BANKED
	nop
SysWaitLoop1
	btfsc	ADCON0,GO_NOT_DONE,BANKED
	bra	SysWaitLoop1
	bcf	ADCON0,ADON,BANKED
	banksel	ANSELA
	clrf	ANSELA,BANKED
	clrf	ANSELB,BANKED
	clrf	ANSELC,BANKED
	clrf	ANSELE,BANKED
	movff	ADRESH,READAD
	banksel	ADCON0
	bcf	ADCON0,ADFM0,BANKED
	banksel	0
	return

;********************************************************************************

RIGHTDOWNCURVE_LT7686
	movlw	123
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	XOFFSET1,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	124
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	XOFFSET1_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	125
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	YOFFSET1,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	126
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	YOFFSET1_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	119
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	INXRADIUS,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	120
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	INXRADIUS_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	121
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	INYRADIUS,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	122
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	INYRADIUS_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movff	LT7686_LINECOLOUR,__SET_LT7686_LINECOLOUR
	movff	LT7686_LINECOLOUR_H,__SET_LT7686_LINECOLOUR_H
	movff	LT7686_LINECOLOUR_U,__SET_LT7686_LINECOLOUR_U
	movff	LT7686_LINECOLOUR_E,__SET_LT7686_LINECOLOUR_E
	movlw	210
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	212
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR,__OUTBYTE
	rcall	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	211
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	118
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movlw	147
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITEDATA
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

RIGHTUPCURVE_LT7686
	movlw	123
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	XOFFSET1,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	124
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	XOFFSET1_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	125
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	YOFFSET1,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	126
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	YOFFSET1_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	119
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	INXRADIUS,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	120
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	INXRADIUS_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	121
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	INYRADIUS,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	122
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	INYRADIUS_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movff	LT7686_LINECOLOUR,__SET_LT7686_LINECOLOUR
	movff	LT7686_LINECOLOUR_H,__SET_LT7686_LINECOLOUR_H
	movff	LT7686_LINECOLOUR_U,__SET_LT7686_LINECOLOUR_U
	movff	LT7686_LINECOLOUR_E,__SET_LT7686_LINECOLOUR_E
	movlw	210
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	212
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR,__OUTBYTE
	rcall	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	211
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	118
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movlw	146
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITEDATA
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

ROUNDRECT_LT7686
	movlw	104
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	XOFFSET1,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	105
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	XOFFSET1_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	106
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	YOFFSET1,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	107
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	YOFFSET1_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	108
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	XOFFSET2,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	109
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	XOFFSET2_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	110
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	YOFFSET2,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	111
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	YOFFSET2_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	119
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	INXRADIUS,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	120
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	INXRADIUS_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	121
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	INYRADIUS,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	122
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	INYRADIUS_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movff	LT7686_LINECOLOUR,__SET_LT7686_LINECOLOUR
	movff	LT7686_LINECOLOUR_H,__SET_LT7686_LINECOLOUR_H
	movff	LT7686_LINECOLOUR_U,__SET_LT7686_LINECOLOUR_U
	movff	LT7686_LINECOLOUR_E,__SET_LT7686_LINECOLOUR_E
	movlw	210
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	212
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR,__OUTBYTE
	rcall	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	211
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
	movlw	118
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movlw	176
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITEDATA
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

FN_SCALE657
	banksel	L_FROMLOW
	movf	L_FROMLOW,W,BANKED
	subwf	L_MAP,W,BANKED
	movwf	SysTemp1,BANKED
	movf	L_FROMLOW_H,W,BANKED
	subwfb	L_MAP_H,W,BANKED
	movwf	SysTemp1_H,BANKED
	movf	L_TOLOW,W,BANKED
	subwf	L_TOHIGH,W,BANKED
	movwf	SysTemp2,BANKED
	movf	L_TOLOW_H,W,BANKED
	subwfb	L_TOHIGH_H,W,BANKED
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
	banksel	L_FROMLOW
	movf	L_FROMLOW,W,BANKED
	subwf	L_FROMHIGH,W,BANKED
	movwf	L_SYSCALC,BANKED
	movf	L_FROMLOW_H,W,BANKED
	subwfb	L_FROMHIGH_H,W,BANKED
	movwf	L_SYSCALC_H,BANKED
	movff	L_SYSCALCF,SysLONGTempA
	movff	L_SYSCALCF_H,SysLONGTempA_H
	movff	L_SYSCALCF_U,SysLONGTempA_U
	movff	L_SYSCALCF_E,SysLONGTempA_E
	movff	L_SYSCALC,SysLONGTempB
	movff	L_SYSCALC_H,SysLONGTempB_H
	clrf	SysLONGTempB_U,ACCESS
	clrf	SysLONGTempB_E,ACCESS
	banksel	0
	rcall	SYSDIVSUB32
	movff	SysLONGTempA,SysTemp1
	movff	SysLONGTempA_H,SysTemp1_H
	movff	SysLONGTempA_U,SysTemp1_U
	movff	SysLONGTempA_E,SysTemp1_E
	banksel	L_TOLOW
	movf	L_TOLOW,W,BANKED
	addwf	SysTemp1,W,BANKED
	movwf	SysTemp2,BANKED
	movf	L_TOLOW_H,W,BANKED
	addwfc	SysTemp1_H,W,BANKED
	movwf	SysTemp2_H,BANKED
	movf	L_CALIBRATE,W,BANKED
	addwf	SysTemp2,W,BANKED
	movwf	SCALE,BANKED
	movf	L_CALIBRATE_H,W,BANKED
	addwfc	SysTemp2_H,W,BANKED
	movwf	SCALE_H,BANKED
	banksel	0
	return

;********************************************************************************

FN_SCALE658
	banksel	L_FROMLOW
	movf	L_FROMLOW,W,BANKED
	subwf	L_MAP,W,BANKED
	movwf	SysTemp1,BANKED
	movf	L_FROMLOW_H,W,BANKED
	subwfb	L_MAP_H,W,BANKED
	movwf	SysTemp1_H,BANKED
	movf	L_TOLOW,W,BANKED
	subwf	L_TOHIGH,W,BANKED
	movwf	SysTemp2,BANKED
	movf	L_TOLOW_H,W,BANKED
	subwfb	L_TOHIGH_H,W,BANKED
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
	banksel	L_FROMLOW
	movf	L_FROMLOW,W,BANKED
	subwf	L_FROMHIGH,W,BANKED
	movwf	L_SYSCALC,BANKED
	movf	L_FROMLOW_H,W,BANKED
	subwfb	L_FROMHIGH_H,W,BANKED
	movwf	L_SYSCALC_H,BANKED
	movff	L_SYSCALCF,SysLONGTempA
	movff	L_SYSCALCF_H,SysLONGTempA_H
	movff	L_SYSCALCF_U,SysLONGTempA_U
	movff	L_SYSCALCF_E,SysLONGTempA_E
	movff	L_SYSCALC,SysLONGTempB
	movff	L_SYSCALC_H,SysLONGTempB_H
	clrf	SysLONGTempB_U,ACCESS
	clrf	SysLONGTempB_E,ACCESS
	banksel	0
	rcall	SYSDIVSUB32
	movff	SysLONGTempA,SysTemp1
	movff	SysLONGTempA_H,SysTemp1_H
	movff	SysLONGTempA_U,SysTemp1_U
	movff	SysLONGTempA_E,SysTemp1_E
	banksel	L_TOLOW
	movf	L_TOLOW,W,BANKED
	addwf	SysTemp1,W,BANKED
	movwf	SysTemp2,BANKED
	movf	L_TOLOW_H,W,BANKED
	addwfc	SysTemp1_H,W,BANKED
	movwf	SysTemp2_H,BANKED
	movf	L_CALIBRATE,W,BANKED
	addwf	SysTemp2,W,BANKED
	movwf	SCALE,BANKED
	movf	L_CALIBRATE_H,W,BANKED
	addwfc	SysTemp2_H,W,BANKED
	movwf	SCALE_H,BANKED
	banksel	0
	return

;********************************************************************************

FN_SIN
	movff	TRIG_ARG2,SysINTEGERTempA
	movff	TRIG_ARG2_H,SysINTEGERTempA_H
	clrf	SysINTEGERTempB,ACCESS
	clrf	SysINTEGERTempB_H,ACCESS
	rcall	SYSCOMPLESSTHANINT
	btfss	SysByteTempX,0,ACCESS
	bra	ELSE34_1
	banksel	TRIG_SIGN
	setf	TRIG_SIGN,BANKED
	setf	TRIG_SIGN_H,BANKED
	movff	TRIG_ARG2,SysINTEGERTempA
	movff	TRIG_ARG2_H,SysINTEGERTempA_H
	setf	SysINTEGERTempB,ACCESS
	setf	SysINTEGERTempB_H,ACCESS
	banksel	0
	rcall	SYSMULTSUBINT
	movff	SysINTEGERTempX,TRIG_ARG2
	movff	SysINTEGERTempX_H,TRIG_ARG2_H
	bra	ENDIF34
ELSE34_1
	movlw	1
	banksel	TRIG_SIGN
	movwf	TRIG_SIGN,BANKED
	clrf	TRIG_SIGN_H,BANKED
ENDIF34
	movff	TRIG_ARG2,SysINTEGERTempA
	movff	TRIG_ARG2_H,SysINTEGERTempA_H
	movlw	104
	movwf	SysINTEGERTempB,ACCESS
	movlw	1
	movwf	SysINTEGERTempB_H,ACCESS
	banksel	0
	rcall	SYSDIVSUBINT
	movff	SysINTEGERTempX,TRIG_ARG2
	movff	SysINTEGERTempX_H,TRIG_ARG2_H
	movff	TRIG_ARG2,SysINTEGERTempB
	movff	TRIG_ARG2_H,SysINTEGERTempB_H
	movlw	180
	movwf	SysINTEGERTempA,ACCESS
	clrf	SysINTEGERTempA_H,ACCESS
	rcall	SYSCOMPLESSTHANINT
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF35
	movff	TRIG_SIGN,SysINTEGERTempA
	movff	TRIG_SIGN_H,SysINTEGERTempA_H
	setf	SysINTEGERTempB,ACCESS
	setf	SysINTEGERTempB_H,ACCESS
	rcall	SYSMULTSUBINT
	movff	SysINTEGERTempX,TRIG_SIGN
	movff	SysINTEGERTempX_H,TRIG_SIGN_H
ENDIF35
	movff	TRIG_ARG2,TRIG_ARG1
	movff	TRIG_ARG2_H,TRIG_ARG1_H
	call	FN_TRIG_REF
	movff	TRIG_REF,TRIG_ARG2
	movff	TRIG_REF_H,TRIG_ARG2_H
	banksel	TRIG_ARG2
	incf	TRIG_ARG2,W,BANKED
	movwf	TRIG_I,BANKED
	movff	TRIG_I,SYSSTRINGA
	banksel	0
	rcall	SINETAB
	banksel	TRIG_VAL
	movwf	TRIG_VAL,BANKED
	clrf	TRIG_VAL_H,BANKED
	movff	TRIG_SIGN,SysINTEGERTempA
	movff	TRIG_SIGN_H,SysINTEGERTempA_H
	movff	TRIG_VAL,SysINTEGERTempB
	movff	TRIG_VAL_H,SysINTEGERTempB_H
	banksel	0
	rcall	SYSMULTSUBINT
	movff	SysINTEGERTempX,SIN
	movff	SysINTEGERTempX_H,SIN_H
	return

;********************************************************************************

SINETAB
	movlw	92
	cpfslt	SysStringA,ACCESS
	retlw	0
	movf	SysStringA, W,ACCESS
	addlw	low TABLESINETAB
	movwf	TBLPTRL,ACCESS
	movlw	high TABLESINETAB
	btfsc	STATUS, C,ACCESS
	addlw	1
	movwf	TBLPTRH,ACCESS
	movlw	upper TABLESINETAB
	btfsc	STATUS, C,ACCESS
	addlw	1
	movwf	TBLPTRU,ACCESS
	tblrd*
	movf	TABLAT, W,ACCESS
	return
TABLESINETAB
	db	91,0,2,3,5,7,9,10,12,14,16,17,19,21,22,24,26,28,29,31,33,34,36,37,39,41,42,44
	db	45,47,48,50,52,53,54,56,57,59,60,62,63,64,66,67,68,69,71,72,73,74,75,77,78,79
	db	80,81,82,83,84,85,86,87,87,88,89,90,91,91,92,93,93,94,95,95,96,96,97,97,97,98
	db	98,98,99,99,99,99,100,100,100,100,100,100

;********************************************************************************

SPIMODE844
	bcf	SPI1CON0,EN,BANKED
	bcf	SPI1CON1,SMP,BANKED
	bcf	SPI1CON1,CKE,BANKED
	bcf	SPI1CON1,CKP,BANKED
	banksel	SPICLOCKMODE
	btfsc	SPICLOCKMODE,0,BANKED
	bra	ENDIF97
	banksel	SPI1CON1
	bsf	SPI1CON1,CKE,BANKED
ENDIF97
	banksel	SPICLOCKMODE
	btfss	SPICLOCKMODE,1,BANKED
	bra	ENDIF98
	banksel	SPI1CON1
	bsf	SPI1CON1,CKP,BANKED
ENDIF98
	movlw	64
	banksel	SPI1CON1
	movwf	SPI1CON1,BANKED
	movlw	3
	iorwf	SPI1CON2,F,BANKED
	clrf	SPI1CLK,BANKED
SysSelect12Case1
	movff	SPICURRENTMODE,SysBYTETempA
	movlw	13
	movwf	SysBYTETempB,ACCESS
	rcall	SYSCOMPEQUAL
	movlw	14
	iorwf	SysByteTempX,W,ACCESS
	banksel	SYSTEMP3
	movwf	SysTemp3,BANKED
	btfss	SysTemp3,0,BANKED
	bra	SysSelect12Case2
;asm showdebug Script value is calculated as SPIBAUDRATE_SCRIPT
	movlw	3
	banksel	SPI1BAUD
	movwf	SPI1BAUD,BANKED
	bsf	SPI1CON0,MST,BANKED
	bra	SysSelectEnd12
SysSelect12Case2
	movlw	12
	subwf	SPICURRENTMODE,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelect12Case3
;asm showdebug Script value is calculated as SPIBAUDRATE_SCRIPT_MASTER
	movlw	9
	banksel	SPI1BAUD
	movwf	SPI1BAUD,BANKED
	bsf	SPI1CON0,MST,BANKED
	bra	SysSelectEnd12
SysSelect12Case3
	movlw	11
	subwf	SPICURRENTMODE,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelect12Case4
;asm showdebug Script value is calculated as SPIBAUDRATE_SCRIPT_MASTERSLOW
	movlw	33
	banksel	SPI1BAUD
	movwf	SPI1BAUD,BANKED
	bsf	SPI1CON0,MST,BANKED
	bra	SysSelectEnd12
SysSelect12Case4
	movf	SPICURRENTMODE,F,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelect12Case5
	banksel	SPI1CON0
	bcf	SPI1CON0,MST,BANKED
	bra	SysSelectEnd12
SysSelect12Case5
	decf	SPICURRENTMODE,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelectEnd12
	banksel	SPI1CON0
	bcf	SPI1CON0,MST,BANKED
SysSelectEnd12
	banksel	SPI1CON0
	bsf	SPI1CON0,EN,BANKED
	return

;********************************************************************************

FN_STR
	banksel	SYSCHARCOUNT
	clrf	SYSCHARCOUNT,BANKED
	movff	SYSVALTEMP,SysWORDTempA
	movff	SYSVALTEMP_H,SysWORDTempA_H
	movlw	16
	movwf	SysWORDTempB,ACCESS
	movlw	39
	movwf	SysWORDTempB_H,ACCESS
	banksel	0
	rcall	SYSCOMPLESSTHAN16
	comf	SysByteTempX,F,ACCESS
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF72
	movff	SYSVALTEMP,SysWORDTempA
	movff	SYSVALTEMP_H,SysWORDTempA_H
	movlw	16
	movwf	SysWORDTempB,ACCESS
	movlw	39
	movwf	SysWORDTempB_H,ACCESS
	rcall	SYSDIVSUB16
	movff	SysWORDTempA,SYSSTRDATA
	movff	SYSCALCTEMPX,SYSVALTEMP
	movff	SYSCALCTEMPX_H,SYSVALTEMP_H
	banksel	SYSCHARCOUNT
	incf	SYSCHARCOUNT,F,BANKED
	lfsr	0,STR
	movf	SYSCHARCOUNT,W,BANKED
	addwf	AFSR0,F,ACCESS
	movlw	0
	addwfc	AFSR0_H,F,ACCESS
	movlw	48
	addwf	SYSSTRDATA,W,BANKED
	movwf	INDF0,ACCESS
	bra	SYSVALTHOUSANDS
ENDIF72
	movff	SYSVALTEMP,SysWORDTempA
	movff	SYSVALTEMP_H,SysWORDTempA_H
	movlw	232
	movwf	SysWORDTempB,ACCESS
	movlw	3
	movwf	SysWORDTempB_H,ACCESS
	rcall	SYSCOMPLESSTHAN16
	comf	SysByteTempX,F,ACCESS
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF73
SYSVALTHOUSANDS
	movff	SYSVALTEMP,SysWORDTempA
	movff	SYSVALTEMP_H,SysWORDTempA_H
	movlw	232
	movwf	SysWORDTempB,ACCESS
	movlw	3
	movwf	SysWORDTempB_H,ACCESS
	banksel	0
	rcall	SYSDIVSUB16
	movff	SysWORDTempA,SYSSTRDATA
	movff	SYSCALCTEMPX,SYSVALTEMP
	movff	SYSCALCTEMPX_H,SYSVALTEMP_H
	banksel	SYSCHARCOUNT
	incf	SYSCHARCOUNT,F,BANKED
	lfsr	0,STR
	movf	SYSCHARCOUNT,W,BANKED
	addwf	AFSR0,F,ACCESS
	movlw	0
	addwfc	AFSR0_H,F,ACCESS
	movlw	48
	addwf	SYSSTRDATA,W,BANKED
	movwf	INDF0,ACCESS
	bra	SYSVALHUNDREDS
ENDIF73
	movff	SYSVALTEMP,SysWORDTempA
	movff	SYSVALTEMP_H,SysWORDTempA_H
	movlw	100
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	rcall	SYSCOMPLESSTHAN16
	comf	SysByteTempX,F,ACCESS
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF74
SYSVALHUNDREDS
	movff	SYSVALTEMP,SysWORDTempA
	movff	SYSVALTEMP_H,SysWORDTempA_H
	movlw	100
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	banksel	0
	rcall	SYSDIVSUB16
	movff	SysWORDTempA,SYSSTRDATA
	movff	SYSCALCTEMPX,SYSVALTEMP
	movff	SYSCALCTEMPX_H,SYSVALTEMP_H
	banksel	SYSCHARCOUNT
	incf	SYSCHARCOUNT,F,BANKED
	lfsr	0,STR
	movf	SYSCHARCOUNT,W,BANKED
	addwf	AFSR0,F,ACCESS
	movlw	0
	addwfc	AFSR0_H,F,ACCESS
	movlw	48
	addwf	SYSSTRDATA,W,BANKED
	movwf	INDF0,ACCESS
	bra	SYSVALTENS
ENDIF74
	movff	SYSVALTEMP,SysWORDTempA
	movff	SYSVALTEMP_H,SysWORDTempA_H
	movlw	10
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	rcall	SYSCOMPLESSTHAN16
	comf	SysByteTempX,F,ACCESS
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF75
SYSVALTENS
	movff	SYSVALTEMP,SysWORDTempA
	movff	SYSVALTEMP_H,SysWORDTempA_H
	movlw	10
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	banksel	0
	rcall	SYSDIVSUB16
	movff	SysWORDTempA,SYSSTRDATA
	movff	SYSCALCTEMPX,SYSVALTEMP
	movff	SYSCALCTEMPX_H,SYSVALTEMP_H
	banksel	SYSCHARCOUNT
	incf	SYSCHARCOUNT,F,BANKED
	lfsr	0,STR
	movf	SYSCHARCOUNT,W,BANKED
	addwf	AFSR0,F,ACCESS
	movlw	0
	addwfc	AFSR0_H,F,ACCESS
	movlw	48
	addwf	SYSSTRDATA,W,BANKED
	movwf	INDF0,ACCESS
ENDIF75
	banksel	SYSCHARCOUNT
	incf	SYSCHARCOUNT,F,BANKED
	lfsr	0,STR
	movf	SYSCHARCOUNT,W,BANKED
	addwf	AFSR0,F,ACCESS
	movlw	0
	addwfc	AFSR0_H,F,ACCESS
	movlw	48
	addwf	SYSVALTEMP,W,BANKED
	movwf	INDF0,ACCESS
	movff	SYSCALCTEMPX,SYSVALTEMP
	movff	SYSCALCTEMPX_H,SYSVALTEMP_H
	movffl	SYSCHARCOUNT,SYSSTR_0
	banksel	0
	return

;********************************************************************************

SYSCOMPEQUAL
	setf	SYSBYTETEMPX,ACCESS
	movf	SYSBYTETEMPB, W,ACCESS
	cpfseq	SYSBYTETEMPA,ACCESS
	clrf	SYSBYTETEMPX,ACCESS
	return

;********************************************************************************

SYSCOMPEQUAL16
	clrf	SYSBYTETEMPX,ACCESS
	movf	SYSWORDTEMPB, W,ACCESS
	cpfseq	SYSWORDTEMPA,ACCESS
	return
	movf	SYSWORDTEMPB_H, W,ACCESS
	cpfseq	SYSWORDTEMPA_H,ACCESS
	return
	setf	SYSBYTETEMPX,ACCESS
	return

;********************************************************************************

SYSCOMPEQUAL32
	clrf	SYSBYTETEMPX,ACCESS
	movf	SYSLONGTEMPB, W,ACCESS
	cpfseq	SYSLONGTEMPA,ACCESS
	return
	movf	SYSLONGTEMPB_H, W,ACCESS
	cpfseq	SYSLONGTEMPA_H,ACCESS
	return
	movf	SYSLONGTEMPB_U, W,ACCESS
	cpfseq	SYSLONGTEMPA_U,ACCESS
	return
	movf	SYSLONGTEMPB_E, W,ACCESS
	cpfseq	SYSLONGTEMPA_E,ACCESS
	return
	setf	SYSBYTETEMPX,ACCESS
	return

;********************************************************************************

SYSCOMPLESSTHAN
	setf	SYSBYTETEMPX,ACCESS
	movf	SYSBYTETEMPB, W,ACCESS
	cpfslt	SYSBYTETEMPA,ACCESS
	clrf	SYSBYTETEMPX,ACCESS
	return

;********************************************************************************

SYSCOMPLESSTHAN16
	clrf	SYSBYTETEMPX,ACCESS
	movf	SYSWORDTEMPA_H,W,ACCESS
	subwf	SYSWORDTEMPB_H,W,ACCESS
	btfss	STATUS,C,ACCESS
	return
	movf	SYSWORDTEMPB_H,W,ACCESS
	subwf	SYSWORDTEMPA_H,W,ACCESS
	bnc	SCLT16TRUE
	movf	SYSWORDTEMPB,W,ACCESS
	subwf	SYSWORDTEMPA,W,ACCESS
	btfsc	STATUS,C,ACCESS
	return
SCLT16TRUE
	comf	SYSBYTETEMPX,F,ACCESS
	return

;********************************************************************************

SYSCOMPLESSTHAN32
	clrf	SYSBYTETEMPX,ACCESS
	movf	SYSLONGTEMPA_E,W,ACCESS
	subwf	SYSLONGTEMPB_E,W,ACCESS
	btfss	STATUS,C,ACCESS
	return
	bnz	SCLT32TRUE
	movf	SYSLONGTEMPA_U,W,ACCESS
	subwf	SYSLONGTEMPB_U,W,ACCESS
	btfss	STATUS,C,ACCESS
	return
	bnz	SCLT32TRUE
	movf	SYSLONGTEMPA_H,W,ACCESS
	subwf	SYSLONGTEMPB_H,W,ACCESS
	btfss	STATUS,C,ACCESS
	return
	bnz	SCLT32TRUE
	movf	SYSLONGTEMPB,W,ACCESS
	subwf	SYSLONGTEMPA,W,ACCESS
	btfsc	STATUS,C,ACCESS
	return
SCLT32TRUE
	comf	SYSBYTETEMPX,F,ACCESS
	return

;********************************************************************************

SYSCOMPLESSTHANINT
	clrf	SYSBYTETEMPX,ACCESS
	btfss	SYSINTEGERTEMPA_H,7,ACCESS
	bra	ELSE68_1
	btfsc	SYSINTEGERTEMPB_H,7,ACCESS
	bra	ENDIF69
	comf	SYSBYTETEMPX,F,ACCESS
	return
ENDIF69
	comf	SYSINTEGERTEMPA,W,ACCESS
	movwf	SYSDIVMULTA,ACCESS
	comf	SYSINTEGERTEMPA_H,W,ACCESS
	movwf	SYSDIVMULTA_H,ACCESS
	incf	SYSDIVMULTA,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	SYSDIVMULTA_H,F,ACCESS
	comf	SYSINTEGERTEMPB,W,ACCESS
	movwf	SYSINTEGERTEMPA,ACCESS
	comf	SYSINTEGERTEMPB_H,W,ACCESS
	movwf	SYSINTEGERTEMPA_H,ACCESS
	incf	SYSINTEGERTEMPA,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	SYSINTEGERTEMPA_H,F,ACCESS
	movff	SYSDIVMULTA,SYSINTEGERTEMPB
	movff	SYSDIVMULTA_H,SYSINTEGERTEMPB_H
	bra	ENDIF68
ELSE68_1
	btfsc	SYSINTEGERTEMPB_H,7,ACCESS
	return
ENDIF68
	movf	SYSINTEGERTEMPA_H,W,ACCESS
	subwf	SYSINTEGERTEMPB_H,W,ACCESS
	btfss	STATUS,C,ACCESS
	return
	movf	SYSINTEGERTEMPB_H,W,ACCESS
	subwf	SYSINTEGERTEMPA_H,W,ACCESS
	bnc	SCLTINTTRUE
	movf	SYSINTEGERTEMPB,W,ACCESS
	subwf	SYSINTEGERTEMPA,W,ACCESS
	btfsc	STATUS,C,ACCESS
	return
SCLTINTTRUE
	comf	SYSBYTETEMPX,F,ACCESS
	return

;********************************************************************************

SYSCOPYSTRING
	movff	INDF0, SYSCALCTEMPA
	movff	SYSCALCTEMPA, INDF1
	bra	SYSCOPYSTRINGCHECK
SYSCOPYSTRINGPART
	movf	INDF0, W,ACCESS
	movwf	SYSCALCTEMPA,ACCESS
	addwf	SYSSTRINGLENGTH, F,ACCESS
SYSCOPYSTRINGCHECK
	movf	SYSCALCTEMPA,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	return
SYSSTRINGCOPY
	movff	PREINC0, PREINC1
	decfsz	SYSCALCTEMPA, F,ACCESS
	bra	SYSSTRINGCOPY
	return

;********************************************************************************

SYSDIVSUB16
	movff	SYSWORDTEMPA,SYSDIVMULTA
	movff	SYSWORDTEMPA_H,SYSDIVMULTA_H
	movff	SYSWORDTEMPB,SYSDIVMULTB
	movff	SYSWORDTEMPB_H,SYSDIVMULTB_H
	clrf	SYSDIVMULTX,ACCESS
	clrf	SYSDIVMULTX_H,ACCESS
	movff	SYSDIVMULTB,SysWORDTempA
	movff	SYSDIVMULTB_H,SysWORDTempA_H
	clrf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	rcall	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF61
	clrf	SYSWORDTEMPA,ACCESS
	clrf	SYSWORDTEMPA_H,ACCESS
	return
ENDIF61
	movlw	16
	movwf	SYSDIVLOOP,ACCESS
SYSDIV16START
	bcf	STATUS,C,ACCESS
	rlcf	SYSDIVMULTA,F,ACCESS
	rlcf	SYSDIVMULTA_H,F,ACCESS
	rlcf	SYSDIVMULTX,F,ACCESS
	rlcf	SYSDIVMULTX_H,F,ACCESS
	movf	SYSDIVMULTB,W,ACCESS
	subwf	SYSDIVMULTX,F,ACCESS
	movf	SYSDIVMULTB_H,W,ACCESS
	subwfb	SYSDIVMULTX_H,F,ACCESS
	bsf	SYSDIVMULTA,0,ACCESS
	btfsc	STATUS,C,ACCESS
	bra	ENDIF62
	bcf	SYSDIVMULTA,0,ACCESS
	movf	SYSDIVMULTB,W,ACCESS
	addwf	SYSDIVMULTX,F,ACCESS
	movf	SYSDIVMULTB_H,W,ACCESS
	addwfc	SYSDIVMULTX_H,F,ACCESS
ENDIF62
	decfsz	SYSDIVLOOP, F,ACCESS
	bra	SYSDIV16START
	movff	SYSDIVMULTA,SYSWORDTEMPA
	movff	SYSDIVMULTA_H,SYSWORDTEMPA_H
	movff	SYSDIVMULTX,SYSWORDTEMPX
	movff	SYSDIVMULTX_H,SYSWORDTEMPX_H
	return

;********************************************************************************

SYSDIVSUB32
	movff	SYSLONGTEMPA,SYSLONGDIVMULTA
	movff	SYSLONGTEMPA_H,SYSLONGDIVMULTA_H
	movff	SYSLONGTEMPA_U,SYSLONGDIVMULTA_U
	movff	SYSLONGTEMPA_E,SYSLONGDIVMULTA_E
	movff	SYSLONGTEMPB,SYSLONGDIVMULTB
	movff	SYSLONGTEMPB_H,SYSLONGDIVMULTB_H
	movff	SYSLONGTEMPB_U,SYSLONGDIVMULTB_U
	movff	SYSLONGTEMPB_E,SYSLONGDIVMULTB_E
	banksel	SYSLONGDIVMULTX
	clrf	SYSLONGDIVMULTX,BANKED
	clrf	SYSLONGDIVMULTX_H,BANKED
	clrf	SYSLONGDIVMULTX_U,BANKED
	clrf	SYSLONGDIVMULTX_E,BANKED
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
	bra	ENDIF66
	clrf	SYSLONGTEMPA,ACCESS
	clrf	SYSLONGTEMPA_H,ACCESS
	clrf	SYSLONGTEMPA_U,ACCESS
	clrf	SYSLONGTEMPA_E,ACCESS
	return
ENDIF66
	movlw	32
	movwf	SYSDIVLOOP,ACCESS
SYSDIV32START
	bcf	STATUS,C,ACCESS
	banksel	SYSLONGDIVMULTA
	rlcf	SYSLONGDIVMULTA,F,BANKED
	rlcf	SYSLONGDIVMULTA_H,F,BANKED
	rlcf	SYSLONGDIVMULTA_U,F,BANKED
	rlcf	SYSLONGDIVMULTA_E,F,BANKED
	rlcf	SYSLONGDIVMULTX,F,BANKED
	rlcf	SYSLONGDIVMULTX_H,F,BANKED
	rlcf	SYSLONGDIVMULTX_U,F,BANKED
	rlcf	SYSLONGDIVMULTX_E,F,BANKED
	movf	SYSLONGDIVMULTB,W,BANKED
	subwf	SYSLONGDIVMULTX,F,BANKED
	movf	SYSLONGDIVMULTB_H,W,BANKED
	subwfb	SYSLONGDIVMULTX_H,F,BANKED
	movf	SYSLONGDIVMULTB_U,W,BANKED
	subwfb	SYSLONGDIVMULTX_U,F,BANKED
	movf	SYSLONGDIVMULTB_E,W,BANKED
	subwfb	SYSLONGDIVMULTX_E,F,BANKED
	bsf	SYSLONGDIVMULTA,0,BANKED
	btfsc	STATUS,C,ACCESS
	bra	ENDIF67
	bcf	SYSLONGDIVMULTA,0,BANKED
	movf	SYSLONGDIVMULTB,W,BANKED
	addwf	SYSLONGDIVMULTX,F,BANKED
	movf	SYSLONGDIVMULTB_H,W,BANKED
	addwfc	SYSLONGDIVMULTX_H,F,BANKED
	movf	SYSLONGDIVMULTB_U,W,BANKED
	addwfc	SYSLONGDIVMULTX_U,F,BANKED
	movf	SYSLONGDIVMULTB_E,W,BANKED
	addwfc	SYSLONGDIVMULTX_E,F,BANKED
ENDIF67
	decfsz	SYSDIVLOOP, F,ACCESS
	bra	SYSDIV32START
	movff	SYSLONGDIVMULTA,SYSLONGTEMPA
	movff	SYSLONGDIVMULTA_H,SYSLONGTEMPA_H
	movff	SYSLONGDIVMULTA_U,SYSLONGTEMPA_U
	movff	SYSLONGDIVMULTA_E,SYSLONGTEMPA_E
	movff	SYSLONGDIVMULTX,SYSLONGTEMPX
	movff	SYSLONGDIVMULTX_H,SYSLONGTEMPX_H
	movff	SYSLONGDIVMULTX_U,SYSLONGTEMPX_U
	movff	SYSLONGDIVMULTX_E,SYSLONGTEMPX_E
	banksel	0
	return

;********************************************************************************

SYSDIVSUBINT
	movf	SYSINTEGERTEMPA_H,W,ACCESS
	xorwf	SYSINTEGERTEMPB_H,W,ACCESS
	movwf	SYSSIGNBYTE,ACCESS
	btfss	SYSINTEGERTEMPA_H,7,ACCESS
	bra	ENDIF63
	comf	SYSINTEGERTEMPA,F,ACCESS
	comf	SYSINTEGERTEMPA_H,F,ACCESS
	incf	SYSINTEGERTEMPA,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	SYSINTEGERTEMPA_H,F,ACCESS
ENDIF63
	btfss	SYSINTEGERTEMPB_H,7,ACCESS
	bra	ENDIF64
	comf	SYSINTEGERTEMPB,F,ACCESS
	comf	SYSINTEGERTEMPB_H,F,ACCESS
	incf	SYSINTEGERTEMPB,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	SYSINTEGERTEMPB_H,F,ACCESS
ENDIF64
	rcall	SYSDIVSUB16
	btfss	SYSSIGNBYTE,7,ACCESS
	bra	ENDIF65
	comf	SYSINTEGERTEMPA,F,ACCESS
	comf	SYSINTEGERTEMPA_H,F,ACCESS
	incf	SYSINTEGERTEMPA,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	SYSINTEGERTEMPA_H,F,ACCESS
	comf	SYSINTEGERTEMPX,F,ACCESS
	comf	SYSINTEGERTEMPX_H,F,ACCESS
	incf	SYSINTEGERTEMPX,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	SYSINTEGERTEMPX_H,F,ACCESS
ENDIF65
	return

;********************************************************************************

SYSMULTSUB16
	movf	SYSWORDTEMPA, W,ACCESS
	mulwf	SYSWORDTEMPB,ACCESS
	movff	PRODL, SYSWORDTEMPX
	movff	PRODH, SYSWORDTEMPX_H
	movf	SYSWORDTEMPA, W,ACCESS
	mulwf	SYSWORDTEMPB_H,ACCESS
	movf	PRODL, W,ACCESS
	addwf	SYSWORDTEMPX_H, F,ACCESS
	movf	SYSWORDTEMPA_H, W,ACCESS
	mulwf	SYSWORDTEMPB,ACCESS
	movf	PRODL, W,ACCESS
	addwf	SYSWORDTEMPX_H, F,ACCESS
	movf	SYSWORDTEMPA_H, F,ACCESS
	mulwf	SYSWORDTEMPB_H,ACCESS
	return

;********************************************************************************

SYSMULTSUB32
	movff	SYSLONGTEMPA,SYSLONGDIVMULTA
	movff	SYSLONGTEMPA_H,SYSLONGDIVMULTA_H
	movff	SYSLONGTEMPA_U,SYSLONGDIVMULTA_U
	movff	SYSLONGTEMPA_E,SYSLONGDIVMULTA_E
	movff	SYSLONGTEMPB,SYSLONGDIVMULTB
	movff	SYSLONGTEMPB_H,SYSLONGDIVMULTB_H
	movff	SYSLONGTEMPB_U,SYSLONGDIVMULTB_U
	movff	SYSLONGTEMPB_E,SYSLONGDIVMULTB_E
	banksel	SYSLONGDIVMULTX
	clrf	SYSLONGDIVMULTX,BANKED
	clrf	SYSLONGDIVMULTX_H,BANKED
	clrf	SYSLONGDIVMULTX_U,BANKED
	clrf	SYSLONGDIVMULTX_E,BANKED
MUL32LOOP
	banksel	SYSLONGDIVMULTB
	btfss	SYSLONGDIVMULTB,0,BANKED
	bra	ENDIF59
	movf	SYSLONGDIVMULTA,W,BANKED
	addwf	SYSLONGDIVMULTX,F,BANKED
	movf	SYSLONGDIVMULTA_H,W,BANKED
	addwfc	SYSLONGDIVMULTX_H,F,BANKED
	movf	SYSLONGDIVMULTA_U,W,BANKED
	addwfc	SYSLONGDIVMULTX_U,F,BANKED
	movf	SYSLONGDIVMULTA_E,W,BANKED
	addwfc	SYSLONGDIVMULTX_E,F,BANKED
ENDIF59
	bcf	STATUS,C,ACCESS
	rrcf	SYSLONGDIVMULTB_E,F,BANKED
	rrcf	SYSLONGDIVMULTB_U,F,BANKED
	rrcf	SYSLONGDIVMULTB_H,F,BANKED
	rrcf	SYSLONGDIVMULTB,F,BANKED
	bcf	STATUS,C,ACCESS
	rlcf	SYSLONGDIVMULTA,F,BANKED
	rlcf	SYSLONGDIVMULTA_H,F,BANKED
	rlcf	SYSLONGDIVMULTA_U,F,BANKED
	rlcf	SYSLONGDIVMULTA_E,F,BANKED
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
	bra	MUL32LOOP
	movff	SYSLONGDIVMULTX,SYSLONGTEMPX
	movff	SYSLONGDIVMULTX_H,SYSLONGTEMPX_H
	movff	SYSLONGDIVMULTX_U,SYSLONGTEMPX_U
	movff	SYSLONGDIVMULTX_E,SYSLONGTEMPX_E
	return

;********************************************************************************

SYSMULTSUBINT
	movf	SYSINTEGERTEMPA_H,W,ACCESS
	xorwf	SYSINTEGERTEMPB_H,W,ACCESS
	movwf	SYSSIGNBYTE,ACCESS
	btfss	SYSINTEGERTEMPA_H,7,ACCESS
	bra	ENDIF56
	comf	SYSINTEGERTEMPA,F,ACCESS
	comf	SYSINTEGERTEMPA_H,F,ACCESS
	incf	SYSINTEGERTEMPA,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	SYSINTEGERTEMPA_H,F,ACCESS
ENDIF56
	btfss	SYSINTEGERTEMPB_H,7,ACCESS
	bra	ENDIF57
	comf	SYSINTEGERTEMPB,F,ACCESS
	comf	SYSINTEGERTEMPB_H,F,ACCESS
	incf	SYSINTEGERTEMPB,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	SYSINTEGERTEMPB_H,F,ACCESS
ENDIF57
	rcall	SYSMULTSUB16
	btfss	SYSSIGNBYTE,7,ACCESS
	bra	ENDIF58
	comf	SYSINTEGERTEMPX,F,ACCESS
	comf	SYSINTEGERTEMPX_H,F,ACCESS
	incf	SYSINTEGERTEMPX,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	SYSINTEGERTEMPX_H,F,ACCESS
ENDIF58
	return

;********************************************************************************

SYSREADSTRING
	tblrd*+
	movff	TABLAT,SYSCALCTEMPA
	movff	TABLAT,INDF1
	bra	SYSSTRINGREADCHECK
SYSREADSTRINGPART
	tblrd*+
	movf	TABLAT, W,ACCESS
	movwf	SYSCALCTEMPA,ACCESS
	addwf	SYSSTRINGLENGTH,F,ACCESS
SYSSTRINGREADCHECK
	movf	SYSCALCTEMPA,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	return
SYSSTRINGREAD
	tblrd*+
	movff	TABLAT,PREINC1
	decfsz	SYSCALCTEMPA, F,ACCESS
	bra	SYSSTRINGREAD
	return

;********************************************************************************

SysStringTables

StringTable3
	db	6,66,117,105,108,100,32


StringTable4
	db	3,32,64,32


StringTable5
	db	27,76,84,55,54,56,54,32,76,105,98,114,97,114,121,32,68,101,118,101,108,111,112,109
	db	101,110,116,32


StringTable6
	db	31,80,114,111,99,101,101,100,105,110,103,32,119,105,116,104,32,71,76,67,68,32
	db	111,112,101,114,97,116,105,111,110,115


StringTable7
	db	34,76,84,55,54,56,54,95,82,69,71,95,83,84,83,82,32,115,116,97,116,117,115,32
	db	114,101,103,105,115,116,101,114,32,48,98


StringTable8
	db	22,32,32,32,32,115,101,101,32,100,97,116,97,115,104,101,101,116,32,49,57,46,49


StringTable9
	db	56,76,84,55,54,56,54,95,105,110,105,116,118,101,114,105,102,121,99,111,117,110
	db	116,101,114,32,40,32,115,104,111,117,108,100,32,110,111,116,32,98,101,32,97,32
	db	98,105,103,32,110,117,109,98,101,114,33,41,32


StringTable10
	db	12,83,76,82,67,79,78,65,32,61,32,48,120


StringTable11
	db	14,46,32,83,76,82,67,79,78,66,32,61,32,48,120


StringTable12
	db	14,46,32,83,76,82,67,79,78,67,32,61,32,48,120


StringTable13
	db	7,82,101,103,32,91,48,120


StringTable14
	db	5,93,32,58,48,120


StringTable15
	db	26,32,32,32,32,32,32,73,110,105,116,105,97,108,32,115,101,116,116,105,110,103
	db	32,119,97,115,32


StringTable16
	db	2,48,120


StringTable17
	db	39,32,32,32,32,32,32,71,76,67,68,32,103,114,97,112,104,105,99,32,99,111,109,109
	db	97,110,100,115,32,111,118,101,114,119,114,105,116,101,32,32


StringTable18
	db	29,32,32,32,32,32,32,84,105,109,101,114,32,48,32,114,117,110,110,105,110,103,32,118
	db	97,108,117,101,32,32


StringTable19
	db	29,32,32,32,32,32,32,84,105,109,101,114,32,49,32,114,117,110,110,105,110,103,32,118
	db	97,108,117,101,32,32


StringTable20
	db	28,32,32,32,32,32,32,82,101,103,32,110,111,116,32,105,110,105,116,105,97,108
	db	105,115,101,100,32,79,75


StringTable21
	db	20,32,69,82,82,79,82,33,32,115,104,111,117,108,100,32,114,101,97,100,32


StringTable22
	db	17,32,32,32,32,32,32,86,101,114,105,102,105,101,100,32,48,120


StringTable23
	db	1,120


StringTable24
	db	13,76,101,118,101,84,111,112,32,76,84,55,54,56


StringTable25
	db	7,71,67,66,65,83,73,67


StringTable26
	db	12,72,97,114,100,119,97,114,101,32,83,80,73


StringTable28
	db	11,67,104,105,112,102,97,109,105,108,121,32


StringTable29
	db	12,71,67,66,65,83,73,67,32,50,48,50,51


StringTable30
	db	6,67,105,114,99,108,101


StringTable31
	db	8,84,82,73,65,78,71,76,69


StringTable32
	db	14,70,73,76,76,69,68,84,82,73,65,78,71,76,69


StringTable33
	db	11,80,87,77,32,84,101,115,116,105,110,103


StringTable34
	db	13,68,114,97,119,32,67,121,108,105,110,100,101,114


StringTable35
	db	17,68,114,97,119,81,117,97,100,114,105,108,97,116,101,114,97,108


StringTable36
	db	23,70,105,108,108,101,100,68,114,97,119,81,117,97,100,114,105,108,97,116,101,114
	db	97,108


StringTable37
	db	8,68,101,99,32,50,48,50,51


StringTable39
	db	3,48,46,48


StringTable40
	db	2,48,46


StringTable41
	db	1,46


StringTable42
	db	3,57,49,51


StringTable43
	db	19,48,49,45,48,52,45,50,48,50,52,32,48,55,58,50,48,58,53,54


StringTable101
	db	1,48


StringTable147
	db	0


StringTable148
	db	1,49


StringTable191
	db	8,49,56,70,50,55,81,52,51


;********************************************************************************

TRIANGLE_LT7686
	movlw	104
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	105
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	106
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	107
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	108
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET2,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	109
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET2_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	110
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET2,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	111
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET2_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	112
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET3,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	113
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	XOFFSET3_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	114
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET3,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	115
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	YOFFSET3_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movff	LT7686_LINECOLOUR,__SET_LT7686_LINECOLOUR
	movff	LT7686_LINECOLOUR_H,__SET_LT7686_LINECOLOUR_H
	movff	LT7686_LINECOLOUR_U,__SET_LT7686_LINECOLOUR_U
	movff	LT7686_LINECOLOUR_E,__SET_LT7686_LINECOLOUR_E
	movlw	210
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	212
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR,__OUTBYTE
	call	LT7686_WRITEDATA
	bcf	STATUS,C,ACCESS
	banksel	__SET_LT7686_LINECOLOUR
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_H,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_U,F,BANKED
	rlcf	__SET_LT7686_LINECOLOUR_E,F,BANKED
	movlw	211
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	call	LT7686_WRITEDATA
	movlw	103
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
	movlw	130
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

FN_TRIG_REF
	movff	TRIG_ARG1,SysINTEGERTempB
	movff	TRIG_ARG1_H,SysINTEGERTempB_H
	movlw	14
	movwf	SysINTEGERTempA,ACCESS
	movlw	1
	movwf	SysINTEGERTempA_H,ACCESS
	rcall	SYSCOMPLESSTHANINT
	btfss	SysByteTempX,0,ACCESS
	bra	ELSE89_1
	banksel	TRIG_ARG1
	movf	TRIG_ARG1,W,BANKED
	sublw	104
	movwf	TRIG_REF,BANKED
	movlw	1
	movwf	SysTemp3,BANKED
	movf	TRIG_ARG1_H,W,BANKED
	subwfb	SysTemp3,W,BANKED
	movwf	TRIG_REF_H,BANKED
	bra	ENDIF89
ELSE89_1
	movff	TRIG_ARG1,SysINTEGERTempB
	movff	TRIG_ARG1_H,SysINTEGERTempB_H
	movlw	180
	movwf	SysINTEGERTempA,ACCESS
	clrf	SysINTEGERTempA_H,ACCESS
	rcall	SYSCOMPLESSTHANINT
	btfss	SysByteTempX,0,ACCESS
	bra	ELSE90_1
	movlw	180
	banksel	TRIG_ARG1
	subwf	TRIG_ARG1,W,BANKED
	movwf	TRIG_REF,BANKED
	movlw	0
	subwfb	TRIG_ARG1_H,W,BANKED
	movwf	TRIG_REF_H,BANKED
	bra	ENDIF90
ELSE90_1
	movff	TRIG_ARG1,SysINTEGERTempB
	movff	TRIG_ARG1_H,SysINTEGERTempB_H
	movlw	90
	movwf	SysINTEGERTempA,ACCESS
	clrf	SysINTEGERTempA_H,ACCESS
	rcall	SYSCOMPLESSTHANINT
	btfss	SysByteTempX,0,ACCESS
	bra	ELSE91_1
	banksel	TRIG_ARG1
	movf	TRIG_ARG1,W,BANKED
	sublw	180
	movwf	TRIG_REF,BANKED
	clrf	SysTemp3,BANKED
	movf	TRIG_ARG1_H,W,BANKED
	subwfb	SysTemp3,W,BANKED
	movwf	TRIG_REF_H,BANKED
	bra	ENDIF91
ELSE91_1
	movff	TRIG_ARG1,TRIG_REF
	movff	TRIG_ARG1_H,TRIG_REF_H
ENDIF91
ENDIF90
ENDIF89
	banksel	0
	return

;********************************************************************************

FN__HEXPICAS
	movlw	2
	banksel	SYS_HEXPICAS_0
	movwf	SYS_HEXPICAS_0,BANKED
	movlw	15
	banksel	SYSVALTEMP
	andwf	SYSVALTEMP,W,BANKED
	movwf	SYSSTRINGTEMP,BANKED
	sublw	9
	btfsc	STATUS, C,ACCESS
	bra	ENDIF51
	movlw	7
	addwf	SYSSTRINGTEMP,F,BANKED
ENDIF51
	movlw	48
	addwf	SYSSTRINGTEMP,W,BANKED
	banksel	SYS_HEXPICAS_2
	movwf	SYS_HEXPICAS_2,BANKED
	banksel	SYSSTRINGTEMP
	clrf	SYSSTRINGTEMP,BANKED
SysForLoop12
	incf	SYSSTRINGTEMP,F,BANKED
	rrcf	SYSVALTEMP,F,BANKED
	movlw	4
	subwf	SYSSTRINGTEMP,W,BANKED
	btfss	STATUS, C,ACCESS
	bra	SysForLoop12
SysForLoopEnd12
	movlw	15
	andwf	SYSVALTEMP,W,BANKED
	movwf	SYSSTRINGTEMP,BANKED
	sublw	9
	btfsc	STATUS, C,ACCESS
	bra	ENDIF53
	movlw	7
	addwf	SYSSTRINGTEMP,F,BANKED
ENDIF53
	movlw	48
	addwf	SYSSTRINGTEMP,W,BANKED
	banksel	SYS_HEXPICAS_1
	movwf	SYS_HEXPICAS_1,BANKED
	banksel	0
	return

;********************************************************************************


 END
