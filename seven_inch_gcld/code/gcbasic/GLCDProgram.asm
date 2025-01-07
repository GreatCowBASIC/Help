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
;   Source file      : D:\GreatCowBASICGits\Help.git\seven_inch_gcld\code\gcbasic\GLCDProgram.gcb
;   Setting file     : C:\GCstudio\gcbasic\use.ini
;   Preserve mode    : 2
;   Assembler        : GCASM
;   Programmer       : C:\GCstudio\gcbasic\..\PICKitPlus\PICKitCommandline.exe
;   Output file      : D:\GreatCowBASICGits\Help.git\seven_inch_gcld\code\gcbasic\GLCDProgram.asm
;   Float Capability : 1
;********************************************************************************

;Set up the assembler options (Chip type, clock source, other bits and pieces)
 LIST p=18F27Q43, r=DEC
#include <P18F27Q43.inc>
 CONFIG CP = OFF, WRTSAF = OFF, WRTD = OFF, WRTB = OFF, WDTE = OFF, XINST = OFF, LVP = OFF, MVECEN = OFF, MCLRE = EXTMCLR, FCMEN = ON, CLKOUTEN = OFF, RSTOSC = HFINTOSC_1MHZ, FEXTOSC = OFF

;********************************************************************************

;Set aside memory locations for variables
ABS                              EQU    1294          ; 0x50E
ABS_H                            EQU    1295          ; 0x50F
BYTENUM                          EQU    1296          ; 0x510
BYTETOBIN                        EQU    9149          ; 0x23BD
CACHE_LT7686_FILLCOLOUR          EQU    1297          ; 0x511
CACHE_LT7686_FILLCOLOUR_E        EQU    1300          ; 0x514
CACHE_LT7686_FILLCOLOUR_H        EQU    1298          ; 0x512
CACHE_LT7686_FILLCOLOUR_U        EQU    1299          ; 0x513
CACHE_LT7686_LINECOLOUR          EQU    1301          ; 0x515
CACHE_LT7686_LINECOLOUR_E        EQU    1304          ; 0x518
CACHE_LT7686_LINECOLOUR_H        EQU    1302          ; 0x516
CACHE_LT7686_LINECOLOUR_U        EQU    1303          ; 0x517
CHARCODE                         EQU    1305          ; 0x519
CHARCOL                          EQU    1306          ; 0x51A
CHARCOLS                         EQU    1308          ; 0x51C
CHARCOL_H                        EQU    1307          ; 0x51B
CHARLOCX                         EQU    1309          ; 0x51D
CHARLOCX_H                       EQU    1310          ; 0x51E
CHARLOCY                         EQU    1311          ; 0x51F
CHARLOCY_H                       EQU    1312          ; 0x520
CHARROW                          EQU    1313          ; 0x521
CHARROWS                         EQU    1315          ; 0x523
CHARROW_H                        EQU    1314          ; 0x522
COL                              EQU    1316          ; 0x524
COLORS                           EQU    1317          ; 0x525
COLORS_H                         EQU    1318          ; 0x526
COMPORT                          EQU    1319          ; 0x527
CURRCHARCOL                      EQU    1320          ; 0x528
CURRCHARROW                      EQU    1321          ; 0x529
CURRCHARVAL                      EQU    1322          ; 0x52A
DELAYTEMP                        EQU    1280          ; 0x500
DELAYTEMP2                       EQU    1281          ; 0x501
DRAWCOUNT                        EQU    1323          ; 0x52B
DRAWCOUNT_H                      EQU    1324          ; 0x52C
FIRSTRUN                         EQU    1325          ; 0x52D
GCBBUILDSTR                      EQU    9135          ; 0x23AF
GCBBUILDTIMESTR                  EQU    9158          ; 0x23C6
GLCDBACKGROUND                   EQU    1326          ; 0x52E
GLCDBACKGROUND_E                 EQU    1329          ; 0x531
GLCDBACKGROUND_H                 EQU    1327          ; 0x52F
GLCDBACKGROUND_U                 EQU    1328          ; 0x530
GLCDDEVICEHEIGHT                 EQU    1330          ; 0x532
GLCDDEVICEHEIGHT_H               EQU    1331          ; 0x533
GLCDDEVICEWIDTH                  EQU    1332          ; 0x534
GLCDDEVICEWIDTH_H                EQU    1333          ; 0x535
GLCDFNTDEFAULT                   EQU    1334          ; 0x536
GLCDFNTDEFAULTHEIGHT             EQU    1335          ; 0x537
GLCDFNTDEFAULTSIZE               EQU    1336          ; 0x538
GLCDFONTWIDTH                    EQU    1337          ; 0x539
GLCDFOREGROUND                   EQU    1338          ; 0x53A
GLCDFOREGROUND_E                 EQU    1341          ; 0x53D
GLCDFOREGROUND_H                 EQU    1339          ; 0x53B
GLCDFOREGROUND_U                 EQU    1340          ; 0x53C
GLCDPRINTLEN                     EQU    1342          ; 0x53E
GLCDPRINTLEN_H                   EQU    1343          ; 0x53F
GLCDPRINTLOC                     EQU    1344          ; 0x540
GLCDPRINTLOC_H                   EQU    1345          ; 0x541
GLCDPRINT_STRING_COUNTER         EQU    1346          ; 0x542
GLCDPRINT_STRING_COUNTER_H       EQU    1347          ; 0x543
GLCDROTATESTATE                  EQU    1348          ; 0x544
GLCD_INFO                        EQU    9141          ; 0x23B5
GLCD_YORDINATE                   EQU    1349          ; 0x545
GLCD_YORDINATE_H                 EQU    1350          ; 0x546
HSERPRINTCRLFCOUNT               EQU    1351          ; 0x547
INXRADIUS                        EQU    1352          ; 0x548
INXRADIUS_H                      EQU    1353          ; 0x549
INYRADIUS                        EQU    1354          ; 0x54A
INYRADIUS_H                      EQU    1355          ; 0x54B
LCDVALUE                         EQU    1356          ; 0x54C
LCDVALUE_E                       EQU    1359          ; 0x54F
LCDVALUE_H                       EQU    1357          ; 0x54D
LCDVALUE_U                       EQU    1358          ; 0x54E
LINECOLOUR                       EQU    1360          ; 0x550
LINECOLOUR_H                     EQU    1361          ; 0x551
LT7686_CHECK_INIT                EQU    1362          ; 0x552
LT7686_CHECK_INIT_COUNTER        EQU    1363          ; 0x553
LT7686_CHECK_INIT_FAIL           EQU    1364          ; 0x554
LT7686_DATAREAD                  EQU    1365          ; 0x555
LT7686_DISPLAY_COLORBAR_STATE    EQU    1366          ; 0x556
LT7686_DISPLAY_PWM               EQU    1367          ; 0x557
LT7686_FILLCOLOUR                EQU    1368          ; 0x558
LT7686_FILLCOLOUR_E              EQU    1371          ; 0x55B
LT7686_FILLCOLOUR_H              EQU    1369          ; 0x559
LT7686_FILLCOLOUR_U              EQU    1370          ; 0x55A
LT7686_INITVERIFYCOUNTER         EQU    1372          ; 0x55C
LT7686_INITVERIFYCOUNTER_H       EQU    1373          ; 0x55D
LT7686_LINECOLOUR                EQU    1374          ; 0x55E
LT7686_LINECOLOUR_E              EQU    1377          ; 0x561
LT7686_LINECOLOUR_H              EQU    1375          ; 0x55F
LT7686_LINECOLOUR_U              EQU    1376          ; 0x560
LT7686_POINTER                   EQU    1378          ; 0x562
LT7686_POINTER_H                 EQU    1379          ; 0x563
LT7686_STATUSREAD                EQU    1380          ; 0x564
LT7686_STATUSREADRESULT          EQU    1381          ; 0x565
L_CALIBRATE                      EQU    1382          ; 0x566
L_CALIBRATE_H                    EQU    1383          ; 0x567
L_FROMHIGH                       EQU    1384          ; 0x568
L_FROMHIGH_H                     EQU    1385          ; 0x569
L_FROMLOW                        EQU    1386          ; 0x56A
L_FROMLOW_H                      EQU    1387          ; 0x56B
L_MAP                            EQU    1388          ; 0x56C
L_MAP_H                          EQU    1389          ; 0x56D
L_SYSCALC                        EQU    1390          ; 0x56E
L_SYSCALCF                       EQU    1392          ; 0x570
L_SYSCALCF_E                     EQU    1395          ; 0x573
L_SYSCALCF_H                     EQU    1393          ; 0x571
L_SYSCALCF_U                     EQU    1394          ; 0x572
L_SYSCALC_H                      EQU    1391          ; 0x56F
L_TOHIGH                         EQU    1396          ; 0x574
L_TOHIGH_H                       EQU    1397          ; 0x575
L_TOLOW                          EQU    1398          ; 0x576
L_TOLOW_H                        EQU    1399          ; 0x577
PRINTLEN                         EQU    1400          ; 0x578
PRINTLOCX                        EQU    1401          ; 0x579
PRINTLOCX_H                      EQU    1402          ; 0x57A
PRINTLOCY                        EQU    1403          ; 0x57B
PRINTLOCY_H                      EQU    1404          ; 0x57C
RANDOM                           EQU    1405          ; 0x57D
RANDOMSEED                       EQU    1406          ; 0x57E
RANDOMSEED_H                     EQU    1407          ; 0x57F
RANDOMTEMP                       EQU    1408          ; 0x580
RANDOMTEMP_H                     EQU    1409          ; 0x581
REGVAL                           EQU    1410          ; 0x582
ROW                              EQU    1411          ; 0x583
RR                               EQU    1412          ; 0x584
RR2                              EQU    1414          ; 0x586
RR2_H                            EQU    1415          ; 0x587
RR_H                             EQU    1413          ; 0x585
SCALE                            EQU    1416          ; 0x588
SCALE_H                          EQU    1417          ; 0x589
SERDATA                          EQU    1418          ; 0x58A
STR                              EQU    9260          ; 0x242C
STRINGPOINTER                    EQU    1419          ; 0x58B
STYLE                            EQU    1420          ; 0x58C
STYLE_H                          EQU    1421          ; 0x58D
SYSBYTETEMPA                     EQU    1285          ; 0x505
SYSBYTETEMPB                     EQU    1289          ; 0x509
SYSBYTETEMPX                     EQU    1280          ; 0x500
SYSCALCTEMPA                     EQU    1285          ; 0x505
SYSCALCTEMPA_H                   EQU    1286          ; 0x506
SYSCALCTEMPX                     EQU    1280          ; 0x500
SYSCALCTEMPX_H                   EQU    1281          ; 0x501
SYSCHARCOUNT                     EQU    1422          ; 0x58E
SYSDIVLOOP                       EQU    1284          ; 0x504
SYSDIVMULTA                      EQU    1287          ; 0x507
SYSDIVMULTA_H                    EQU    1288          ; 0x508
SYSDIVMULTB                      EQU    1291          ; 0x50B
SYSDIVMULTB_H                    EQU    1292          ; 0x50C
SYSDIVMULTX                      EQU    1282          ; 0x502
SYSDIVMULTX_H                    EQU    1283          ; 0x503
SYSFORLOOPABSVALUE2              EQU    1423          ; 0x58F
SYSFORLOOPABSVALUE2_H            EQU    1424          ; 0x590
SYSFORLOOPABSVALUE3              EQU    1425          ; 0x591
SYSFORLOOPABSVALUE3_H            EQU    1426          ; 0x592
SYSFORLOOPABSVALUE5              EQU    1427          ; 0x593
SYSFORLOOPABSVALUE5_H            EQU    1428          ; 0x594
SYSFORLOOPSTEP1                  EQU    1429          ; 0x595
SYSFORLOOPSTEP1_H                EQU    1430          ; 0x596
SYSFORLOOPSTEP2                  EQU    1431          ; 0x597
SYSFORLOOPSTEP2_H                EQU    1432          ; 0x598
SYSFORLOOPSTEP4                  EQU    1433          ; 0x599
SYSFORLOOPSTEP4_H                EQU    1434          ; 0x59A
SYSINTEGERTEMPA                  EQU    1285          ; 0x505
SYSINTEGERTEMPA_H                EQU    1286          ; 0x506
SYSINTEGERTEMPB                  EQU    1289          ; 0x509
SYSINTEGERTEMPB_H                EQU    1290          ; 0x50A
SYSINTEGERTEMPX                  EQU    1280          ; 0x500
SYSINTEGERTEMPX_H                EQU    1281          ; 0x501
SYSLCDPRINTDATAHANDLER           EQU    1435          ; 0x59B
SYSLCDPRINTDATAHANDLER_H         EQU    1436          ; 0x59C
SYSLONGDIVMULTA                  EQU    1437          ; 0x59D
SYSLONGDIVMULTA_E                EQU    1440          ; 0x5A0
SYSLONGDIVMULTA_H                EQU    1438          ; 0x59E
SYSLONGDIVMULTA_U                EQU    1439          ; 0x59F
SYSLONGDIVMULTB                  EQU    1441          ; 0x5A1
SYSLONGDIVMULTB_E                EQU    1444          ; 0x5A4
SYSLONGDIVMULTB_H                EQU    1442          ; 0x5A2
SYSLONGDIVMULTB_U                EQU    1443          ; 0x5A3
SYSLONGDIVMULTX                  EQU    1445          ; 0x5A5
SYSLONGDIVMULTX_E                EQU    1448          ; 0x5A8
SYSLONGDIVMULTX_H                EQU    1446          ; 0x5A6
SYSLONGDIVMULTX_U                EQU    1447          ; 0x5A7
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
SYSPRINTDATAHANDLER              EQU    1449          ; 0x5A9
SYSPRINTDATAHANDLER_H            EQU    1450          ; 0x5AA
SYSPRINTTEMP                     EQU    1451          ; 0x5AB
SYSREPEATTEMP1                   EQU    1452          ; 0x5AC
SYSREPEATTEMP11                  EQU    1453          ; 0x5AD
SYSREPEATTEMP12                  EQU    1454          ; 0x5AE
SYSREPEATTEMP2                   EQU    1455          ; 0x5AF
SYSREPEATTEMP3                   EQU    1456          ; 0x5B0
SYSREPEATTEMP4                   EQU    1457          ; 0x5B1
SYSREPEATTEMP5                   EQU    1458          ; 0x5B2
SYSREPEATTEMP7                   EQU    1459          ; 0x5B3
SYSREPEATTEMP9                   EQU    1460          ; 0x5B4
SYSSIGNBYTE                      EQU    1293          ; 0x50D
SYSSTRDATA                       EQU    1461          ; 0x5B5
SYSSTRINGA                       EQU    1287          ; 0x507
SYSSTRINGA_H                     EQU    1288          ; 0x508
SYSSTRINGLENGTH                  EQU    1286          ; 0x506
SYSSTRINGPARAM1                  EQU    9415          ; 0x24C7
SYSSTRINGPARAM2                  EQU    9358          ; 0x248E
SYSSTRINGPARAM3                  EQU    9301          ; 0x2455
SYSSTRINGTEMP                    EQU    1462          ; 0x5B6
SYSTEMP1                         EQU    1463          ; 0x5B7
SYSTEMP1_E                       EQU    1466          ; 0x5BA
SYSTEMP1_H                       EQU    1464          ; 0x5B8
SYSTEMP1_U                       EQU    1465          ; 0x5B9
SYSTEMP2                         EQU    1467          ; 0x5BB
SYSTEMP2_H                       EQU    1468          ; 0x5BC
SYSTEMP3                         EQU    1469          ; 0x5BD
SYSVALTEMP                       EQU    1470          ; 0x5BE
SYSVALTEMP_H                     EQU    1471          ; 0x5BF
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
TABLELENGTH                      EQU    1472          ; 0x5C0
TABLELENGTH_H                    EQU    1473          ; 0x5C1
TABLEPOINTER                     EQU    1474          ; 0x5C2
TABLEPOINTER_H                   EQU    1475          ; 0x5C3
TEMP_LT7686                      EQU    1476          ; 0x5C4
TEMP_LT7686_H                    EQU    1477          ; 0x5C5
TMPREADDATA                      EQU    1478          ; 0x5C6
VALIDREG                         EQU    1479          ; 0x5C7
VERIFY                           EQU    1480          ; 0x5C8
VERSIONSTRING                    EQU    9219          ; 0x2403
WTEMP                            EQU    1481          ; 0x5C9
WTEMP_H                          EQU    1482          ; 0x5CA
XOFFSET1                         EQU    1483          ; 0x5CB
XOFFSET1_H                       EQU    1484          ; 0x5CC
XOFFSET2                         EQU    1485          ; 0x5CD
XOFFSET2_H                       EQU    1486          ; 0x5CE
XOFFSET3                         EQU    1487          ; 0x5CF
XOFFSET3_H                       EQU    1488          ; 0x5D0
XOFFSET4                         EQU    1489          ; 0x5D1
XOFFSET4_H                       EQU    1490          ; 0x5D2
XOFFSET5                         EQU    1491          ; 0x5D3
XOFFSET5_H                       EQU    1492          ; 0x5D4
XTEMP                            EQU    1493          ; 0x5D5
XTEMP_H                          EQU    1494          ; 0x5D6
XX                               EQU    1495          ; 0x5D7
XX1                              EQU    1497          ; 0x5D9
XX1_H                            EQU    1498          ; 0x5DA
XX3                              EQU    1499          ; 0x5DB
XX3_H                            EQU    1500          ; 0x5DC
XX4                              EQU    1501          ; 0x5DD
XX4_H                            EQU    1502          ; 0x5DE
XXLOOP                           EQU    1503          ; 0x5DF
XX_H                             EQU    1496          ; 0x5D8
YOFFSET1                         EQU    1504          ; 0x5E0
YOFFSET1_H                       EQU    1505          ; 0x5E1
YOFFSET2                         EQU    1506          ; 0x5E2
YOFFSET2_H                       EQU    1507          ; 0x5E3
YOFFSET3                         EQU    1508          ; 0x5E4
YOFFSET3_H                       EQU    1509          ; 0x5E5
YOFFSET4                         EQU    1510          ; 0x5E6
YOFFSET4_H                       EQU    1511          ; 0x5E7
YOFFSET5                         EQU    1512          ; 0x5E8
YOFFSET5_H                       EQU    1513          ; 0x5E9
YTEMP                            EQU    1514          ; 0x5EA
YTEMP_H                          EQU    1515          ; 0x5EB
YY                               EQU    1516          ; 0x5EC
YY1                              EQU    1518          ; 0x5EE
YY1OOP                           EQU    1520          ; 0x5F0
YY1OOP_H                         EQU    1521          ; 0x5F1
YY1_H                            EQU    1519          ; 0x5EF
YY3                              EQU    1522          ; 0x5F2
YY3_H                            EQU    1523          ; 0x5F3
YY4                              EQU    1524          ; 0x5F4
YY4_H                            EQU    1525          ; 0x5F5
YY_H                             EQU    1517          ; 0x5ED
ZL                               EQU    1526          ; 0x5F6
ZL_H                             EQU    1527          ; 0x5F7
ZZ                               EQU    1528          ; 0x5F8
ZZ_H                             EQU    1529          ; 0x5F9
_ALIGNMENT                       EQU    1530          ; 0x5FA
_CHROMAKEY                       EQU    1531          ; 0x5FB
_FONTSIZE                        EQU    1532          ; 0x5FC
_HEXPICAS                        EQU    9178          ; 0x23DA
_INXRADIUS                       EQU    1533          ; 0x5FD
_INXRADIUS_H                     EQU    1534          ; 0x5FE
_INYRADIUS                       EQU    1535          ; 0x5FF
_INYRADIUS_H                     EQU    1536          ; 0x600
_TEMP_LT7686                     EQU    1537          ; 0x601
_WOFFSET                         EQU    1538          ; 0x602
_WOFFSET_H                       EQU    1539          ; 0x603
_XOFFSET1                        EQU    1540          ; 0x604
_XOFFSET1_H                      EQU    1541          ; 0x605
_XOFFSET2                        EQU    1542          ; 0x606
_XOFFSET2_H                      EQU    1543          ; 0x607
_XOFFSET3                        EQU    1544          ; 0x608
_XOFFSET3_H                      EQU    1545          ; 0x609
_XOFFSET4                        EQU    1546          ; 0x60A
_XOFFSET4_H                      EQU    1547          ; 0x60B
_XOFFSET5                        EQU    1548          ; 0x60C
_XOFFSET5_H                      EQU    1549          ; 0x60D
_XOFFSET6                        EQU    1550          ; 0x60E
_XOFFSET6_H                      EQU    1551          ; 0x60F
_XWIDTHMAG                       EQU    1552          ; 0x610
_YHEIGHTMAG                      EQU    1553          ; 0x611
_YOFFSET1                        EQU    1554          ; 0x612
_YOFFSET1_H                      EQU    1555          ; 0x613
_YOFFSET2                        EQU    1556          ; 0x614
_YOFFSET2_H                      EQU    1557          ; 0x615
_YOFFSET3                        EQU    1558          ; 0x616
_YOFFSET3_H                      EQU    1559          ; 0x617
_YOFFSET4                        EQU    1560          ; 0x618
_YOFFSET4_H                      EQU    1561          ; 0x619
_YOFFSET5                        EQU    1562          ; 0x61A
_YOFFSET5_H                      EQU    1563          ; 0x61B
_YOFFSET6                        EQU    1564          ; 0x61C
_YOFFSET6_H                      EQU    1565          ; 0x61D
_ZOFFSET                         EQU    1566          ; 0x61E
_ZOFFSET_H                       EQU    1567          ; 0x61F
__LT7686_FBUFFER                 EQU    1568          ; 0x620
__LT7686_OUTBUFFER               EQU    1569          ; 0x621
__OUTBYTE                        EQU    1570          ; 0x622
__SET_LT7686_LINECOLOUR          EQU    1571          ; 0x623
__SET_LT7686_LINECOLOUR_E        EQU    1574          ; 0x626
__SET_LT7686_LINECOLOUR_H        EQU    1572          ; 0x624
__SET_LT7686_LINECOLOUR_U        EQU    1573          ; 0x625
__TEMP_LT7686                    EQU    1575          ; 0x627

;********************************************************************************

;Alias variables
AFSR0 EQU 1257
AFSR0_H EQU 1258
LASTLT7686_CMDREGISTER EQU 1333
LT7686_INITDATA EQU 1330
LT7686_INITLENGTH EQU 1338
LT7686_INITLENGTH_H EQU 1339
OLDLT7686_INITDATA EQU 1331
SYSSCALEWORD EQU 1416
SYSSCALEWORD_H EQU 1417
SYSSTR_0 EQU 9260
SYS_HEXPICAS_0 EQU 9178
SYS_HEXPICAS_1 EQU 9179
SYS_HEXPICAS_2 EQU 9180
TIMER0 EQU 792

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
	call	INITPPS
	call	INITUSART
	call	INITGLCD_ILI9341
	call	INITRANDOM
	call	INITGLCD_LT7686

;Start_of_the_main_program
;Prototype GLCD library
;Development configuration options
;#define LT7686_COMMAND_DEBUG
;Hardware setup
;Setup USART used fro debugging
;PIC PPS
;Add this code segment to your GCBASIC source program
;Pin mappings for LCD SPI
;Comment out the next line... but you MUST disable the PPS!!! This is done via Conditional statement in this program
;#define LT7686_HARDWARESPI
;end of hardware setup
;HserPrintCRLF
	movlw	1
	movwf	HSERPRINTCRLFCOUNT,ACCESS
	movlw	1
	movwf	COMPORT,ACCESS
	call	HSERPRINTCRLF
;HSerPrintStringCRLF "Initialised"
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable2
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable2
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable2
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM1*11
	banksel	0
	call	HSERPRINTSTRINGCRLF
;Inserts
;#insert "009_GLCDProgram.gcb"    // Tests lots of primitives
;This is a support program for the LT7686
;#include "gcbversionnumber.cnt"  // has to be included in the main program.
;Include the GCBVersionNumber.cnt to increment versionString and create the build time string called GCBBuildTimeStr.
;versionString a string is created automatically.
;GCBBuildTimeStr is a string that is also created automatically.
;use "GCBVersionNumber.cnt" as this will create a local copy of the versionString tracker.
;if you use <GCBVersionNumber.cnt> this is a system wide versionString tracker.
;dim versionString as string * 40
;versionString = "Build "+GCBBuildStr
	call	FN_GCBBUILDSTR
	lfsr	1,VERSIONSTRING
	clrf	SysStringLength,ACCESS
	movlw	low StringTable4
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable4
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable4
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,GCBBUILDSTR
	call	SYSCOPYSTRINGPART
	lfsr	0,VERSIONSTRING
	movff	SysStringLength, INDF0
;versionString = versionString + " @ "+GCBBuildTimeStr
	call	FN_GCBBUILDTIMESTR
	lfsr	1,VERSIONSTRING
	clrf	SysStringLength,ACCESS
	lfsr	0,VERSIONSTRING
	call	SYSCOPYSTRINGPART
	movlw	low StringTable5
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable5
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable5
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,GCBBUILDTIMESTR
	call	SYSCOPYSTRINGPART
	lfsr	0,VERSIONSTRING
	movff	SysStringLength, INDF0
;ShowDebug
	call	SHOWDEBUG
;Dim GLCD_info as String * 7
;style = 1
	movlw	1
	banksel	STYLE
	movwf	STYLE,BANKED
	clrf	STYLE_H,BANKED
;GLCD_info = Str(GLCDDeviceWidth) +"x"
	movff	GLCDDEVICEWIDTH,SYSVALTEMP
	movff	GLCDDEVICEWIDTH_H,SYSVALTEMP_H
	banksel	0
	call	FN_STR
	lfsr	1,GLCD_INFO
	clrf	SysStringLength,ACCESS
	lfsr	0,STR
	call	SYSCOPYSTRINGPART
	movlw	low StringTable6
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable6
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable6
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,GLCD_INFO
	movff	SysStringLength, INDF0
;GLCD_info += Str(GLCDDeviceHeight)
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
;GLCDSelect_Internal_Font_Init( 16 )
	movlw	16
	banksel	_FONTSIZE
	movwf	_FONTSIZE,BANKED
	movlw	1
	banksel	_XWIDTHMAG
	movwf	_XWIDTHMAG,BANKED
	movlw	1
	movwf	_YHEIGHTMAG,BANKED
	movlw	1
	banksel	_CHROMAKEY
	movwf	_CHROMAKEY,BANKED
	movlw	1
	movwf	_ALIGNMENT,BANKED
	banksel	0
	call	LT7686_SELECT_INTERNAL_FONT_INIT
;GLCDPrint_Internal_Font( 0, 0,  "LeveTop LT768", TFT_WHITE )
	banksel	_XOFFSET1
	clrf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	clrf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable7
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable7
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable7
	movwf	TBLPTRU,ACCESS
	banksel	0
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSLCDPRINTDATAHANDLER
	movwf	SysLCDPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysLCDPRINTDATAHandler_H,BANKED
	setf	LT7686_LINECOLOUR,ACCESS
	setf	LT7686_LINECOLOUR_H,ACCESS
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
;Using SYSSTRINGPARAM1*13
	banksel	0
	call	LT7686_PRINT_INTERNAL_FONT592
;GLCDPrint_Internal_Font( 0, 16, GLCD_info, TFT_YELLOW )
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
	movwf	LT7686_LINECOLOUR,ACCESS
	setf	LT7686_LINECOLOUR_H,ACCESS
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LT7686_PRINT_INTERNAL_FONT592
;GLCDSelect_Internal_Font_Init( 32, 4, 4 )
	movlw	32
	banksel	_FONTSIZE
	movwf	_FONTSIZE,BANKED
	movlw	4
	banksel	_XWIDTHMAG
	movwf	_XWIDTHMAG,BANKED
	movlw	4
	movwf	_YHEIGHTMAG,BANKED
	movlw	1
	banksel	_CHROMAKEY
	movwf	_CHROMAKEY,BANKED
	movlw	1
	movwf	_ALIGNMENT,BANKED
	banksel	0
	call	LT7686_SELECT_INTERNAL_FONT_INIT
;GLCDPrint_Internal_Font( 200, 200,  "GCBASIC", TFT_WHITE )
	movlw	200
	banksel	_XOFFSET1
	movwf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	movlw	200
	movwf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable8
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable8
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable8
	movwf	TBLPTRU,ACCESS
	banksel	0
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSLCDPRINTDATAHANDLER
	movwf	SysLCDPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysLCDPRINTDATAHandler_H,BANKED
	setf	LT7686_LINECOLOUR,ACCESS
	setf	LT7686_LINECOLOUR_H,ACCESS
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
;Using SYSSTRINGPARAM1*7
	banksel	0
	call	LT7686_PRINT_INTERNAL_FONT592
;GLCDSelect_Internal_Font_Init()
	movlw	16
	banksel	_FONTSIZE
	movwf	_FONTSIZE,BANKED
	movlw	1
	banksel	_XWIDTHMAG
	movwf	_XWIDTHMAG,BANKED
	movlw	1
	movwf	_YHEIGHTMAG,BANKED
	movlw	1
	banksel	_CHROMAKEY
	movwf	_CHROMAKEY,BANKED
	movlw	1
	movwf	_ALIGNMENT,BANKED
	banksel	0
	call	LT7686_SELECT_INTERNAL_FONT_INIT
;GLCDPrint_Internal_Font( 200, 340,  "Software SPI", TFT_WHITE )
	movlw	200
	banksel	_XOFFSET1
	movwf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	movlw	84
	movwf	_YOFFSET1,BANKED
	movlw	1
	movwf	_YOFFSET1_H,BANKED
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable10
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable10
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable10
	movwf	TBLPTRU,ACCESS
	banksel	0
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSLCDPRINTDATAHANDLER
	movwf	SysLCDPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysLCDPRINTDATAHandler_H,BANKED
	setf	LT7686_LINECOLOUR,ACCESS
	setf	LT7686_LINECOLOUR_H,ACCESS
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
;Using SYSSTRINGPARAM1*12
	banksel	0
	call	LT7686_PRINT_INTERNAL_FONT592
;GLCDPrint_Internal_Font( 200, 360,  CHIPNAMESTR , TFT_WHITE )
	movlw	200
	banksel	_XOFFSET1
	movwf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	movlw	104
	movwf	_YOFFSET1,BANKED
	movlw	1
	movwf	_YOFFSET1_H,BANKED
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable228
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable228
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable228
	movwf	TBLPTRU,ACCESS
	banksel	0
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSLCDPRINTDATAHANDLER
	movwf	SysLCDPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysLCDPRINTDATAHandler_H,BANKED
	setf	LT7686_LINECOLOUR,ACCESS
	setf	LT7686_LINECOLOUR_H,ACCESS
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
;Using SYSSTRINGPARAM1*8
	banksel	0
	call	LT7686_PRINT_INTERNAL_FONT592
;GLCDPrint_Internal_Font( 200, 380,  "Chipfamily " + str( CHIPSUBFAMILY ) , TFT_WHITE )
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
	movlw	low StringTable11
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable11
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable11
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
	setf	LT7686_LINECOLOUR,ACCESS
	setf	LT7686_LINECOLOUR_H,ACCESS
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
;Using SYSSTRINGPARAM1*11
	banksel	0
	call	LT7686_PRINT_INTERNAL_FONT592
;If style = 0 Then
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	clrf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	ELSE1_1
;Now legacy GLCD command
;GLCDPrint 632, 0, "GCBASIC 2024", TFT_YELLOW
	movlw	120
	banksel	PRINTLOCX
	movwf	PRINTLOCX,BANKED
	movlw	2
	movwf	PRINTLOCX_H,BANKED
	clrf	PRINTLOCY,BANKED
	clrf	PRINTLOCY_H,BANKED
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable12
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable12
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable12
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
;Using SYSSTRINGPARAM1*12
	banksel	0
	call	GLCDPRINT9
;WAIT 1 s
	movlw	1
	movwf	SysWaitTempS,ACCESS
	call	Delay_S
;Else
	bra	ENDIF1
ELSE1_1
;WAIT 1 s
	movlw	1
	movwf	SysWaitTempS,ACCESS
	call	Delay_S
;End If
ENDIF1
;GLCDCLS
	call	GLCDCLS_LT7686
;Dim style, colors, drawcount, xx,yy,zz,xx1,yy1,xx3,yy3,xx4,yy4,zl,rr,rr2 as Word
;Dim xxloop, firstrun as Byte
;drawcount = 0
	clrf	DRAWCOUNT,ACCESS
	clrf	DRAWCOUNT_H,ACCESS
;Do
SysDoLoop_S1
;generate XY random positions
;if style < 15 then
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	15
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPLESSTHAN16
	btfss	SysByteTempX,0,ACCESS
	bra	ELSE2_1
;xx = Scale( Random, 0, 255, 0, GLCDDeviceWidth - 1 )
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
	call	FN_SCALE148
	movff	SYSSCALEWORD,XX
	movff	SYSSCALEWORD_H,XX_H
;xx1 = Scale( Random, 0, 255, 0, GLCDDeviceWidth - 1 - xx )
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
	call	FN_SCALE148
	movff	SYSSCALEWORD,XX1
	movff	SYSSCALEWORD_H,XX1_H
;xx1 = xx + xx1
	banksel	XX1
	movf	XX1,W,BANKED
	addwf	XX,W,BANKED
	movwf	XX1,BANKED
	movf	XX1_H,W,BANKED
	addwfc	XX_H,W,BANKED
	movwf	XX1_H,BANKED
;yy = Scale( Random, 0, 255, 0, GLCDDeviceHeight - 1 )
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
	call	FN_SCALE148
	movff	SYSSCALEWORD,YY
	movff	SYSSCALEWORD_H,YY_H
;yy1 = Scale( Random, 0, 255, 0, GLCDDeviceHeight - 1 - yy )
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
	movf	YY,W,BANKED
	subwf	SysTemp1,W,BANKED
	movwf	L_TOHIGH,BANKED
	movf	YY_H,W,BANKED
	subwfb	SysTemp1_H,W,BANKED
	movwf	L_TOHIGH_H,BANKED
	clrf	L_CALIBRATE,BANKED
	clrf	L_CALIBRATE_H,BANKED
	banksel	0
	call	FN_SCALE148
	movff	SYSSCALEWORD,YY1
	movff	SYSSCALEWORD_H,YY1_H
;yy1 = yy + yy1
	banksel	YY1
	movf	YY1,W,BANKED
	addwf	YY,W,BANKED
	movwf	YY1,BANKED
	movf	YY1_H,W,BANKED
	addwfc	YY_H,W,BANKED
	movwf	YY1_H,BANKED
;xx3 = Scale( Random, 0, 255, 0, GLCDDeviceWidth - 1 )
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
	call	FN_SCALE148
	movff	SYSSCALEWORD,XX3
	movff	SYSSCALEWORD_H,XX3_H
;xx4 = Scale( Random, 0, 255, 0, GLCDDeviceWidth - 1 - xx3 )
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
	movf	XX3,W,BANKED
	subwf	SysTemp1,W,BANKED
	movwf	L_TOHIGH,BANKED
	movf	XX3_H,W,BANKED
	subwfb	SysTemp1_H,W,BANKED
	movwf	L_TOHIGH_H,BANKED
	clrf	L_CALIBRATE,BANKED
	clrf	L_CALIBRATE_H,BANKED
	banksel	0
	call	FN_SCALE148
	movff	SYSSCALEWORD,XX4
	movff	SYSSCALEWORD_H,XX4_H
;xx4 = xx3 + xx4
	banksel	XX4
	movf	XX4,W,BANKED
	addwf	XX3,W,BANKED
	movwf	XX4,BANKED
	movf	XX4_H,W,BANKED
	addwfc	XX3_H,W,BANKED
	movwf	XX4_H,BANKED
;yy3 = Scale( Random, 0, 255, 0, GLCDDeviceHeight - 1 )
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
	call	FN_SCALE148
	movff	SYSSCALEWORD,YY3
	movff	SYSSCALEWORD_H,YY3_H
;yy4 = Scale( Random, 0, 255, 0, GLCDDeviceHeight - 1 - yy3 )
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
	movf	YY3,W,BANKED
	subwf	SysTemp1,W,BANKED
	movwf	L_TOHIGH,BANKED
	movf	YY3_H,W,BANKED
	subwfb	SysTemp1_H,W,BANKED
	movwf	L_TOHIGH_H,BANKED
	clrf	L_CALIBRATE,BANKED
	clrf	L_CALIBRATE_H,BANKED
	banksel	0
	call	FN_SCALE148
	movff	SYSSCALEWORD,YY4
	movff	SYSSCALEWORD_H,YY4_H
;yy4 = yy3 + yy4
	banksel	YY4
	movf	YY4,W,BANKED
	addwf	YY3,W,BANKED
	movwf	YY4,BANKED
	movf	YY4_H,W,BANKED
	addwfc	YY3_H,W,BANKED
	movwf	YY4_H,BANKED
;zz = Scale( Random, 0, 255, 0, GLCDDeviceHeight - 1 )
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
	call	FN_SCALE148
	movff	SYSSCALEWORD,ZZ
	movff	SYSSCALEWORD_H,ZZ_H
;zl = Scale( Random, 0, 255, 0, GLCDDeviceHeight - 1 - zz )
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
	movf	ZZ,W,BANKED
	subwf	SysTemp1,W,BANKED
	movwf	L_TOHIGH,BANKED
	movf	ZZ_H,W,BANKED
	subwfb	SysTemp1_H,W,BANKED
	movwf	L_TOHIGH_H,BANKED
	clrf	L_CALIBRATE,BANKED
	clrf	L_CALIBRATE_H,BANKED
	banksel	0
	call	FN_SCALE148
	movff	SYSSCALEWORD,ZL
	movff	SYSSCALEWORD_H,ZL_H
;zl = yy + zl
	banksel	ZL
	movf	ZL,W,BANKED
	addwf	YY,W,BANKED
	movwf	ZL,BANKED
	movf	ZL_H,W,BANKED
	addwfc	YY_H,W,BANKED
	movwf	ZL_H,BANKED
;rr = Scale( Random, 0, 255, 1, 20 )
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
	call	FN_SCALE148
	movff	SYSSCALEWORD,RR
	movff	SYSSCALEWORD_H,RR_H
;rr2 = Scale( Random, 0, 255, 1, 20 )
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
	call	FN_SCALE148
	movff	SYSSCALEWORD,RR2
	movff	SYSSCALEWORD_H,RR2_H
;else
	bra	ENDIF2
ELSE2_1
;ensure curves are within screen extents
;rr = Scale( Random, 0, 255, 1, 100 )
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
	call	FN_SCALE148
	movff	SYSSCALEWORD,RR
	movff	SYSSCALEWORD_H,RR_H
;rr2 = Scale( Random, 0, 255, 1, 100 )
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
	call	FN_SCALE148
	movff	SYSSCALEWORD,RR2
	movff	SYSSCALEWORD_H,RR2_H
;xx = Scale( Random, 0, 255, rr, GLCDDeviceWidth - rr )
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
	call	FN_SCALE148
	movff	SYSSCALEWORD,XX
	movff	SYSSCALEWORD_H,XX_H
;yy = Scale( Random, 0, 255, rr2, GLCDDeviceHeight - rr2 )
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
	call	FN_SCALE148
	movff	SYSSCALEWORD,YY
	movff	SYSSCALEWORD_H,YY_H
;End if
ENDIF2
;colors = Scale( Random, 0, 255, 0, 0xFFFF )
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
	call	FN_SCALE148
	movff	SYSSCALEWORD,COLORS
	movff	SYSSCALEWORD_H,COLORS_H
;Select Case style
;case 0: LT7686_Display_ColorBar ( TRUE )
SysSelect1Case1
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	clrf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect1Case2
;case 0: LT7686_Display_ColorBar ( TRUE )
	setf	LT7686_DISPLAY_COLORBAR_STATE,ACCESS
	call	LT7686_DISPLAY_COLORBAR
;wait 5 s
	movlw	5
	movwf	SysWaitTempS,ACCESS
	call	Delay_S
;style++
	banksel	STYLE
	incf	STYLE,F,BANKED
	btfsc	STATUS,Z,ACCESS
	incf	STYLE_H,F,BANKED
;case 1: LT7686_Display_ColorBar ( FALSE )
	goto	SysSelectEnd1
SysSelect1Case2
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	1
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect1Case3
;case 1: LT7686_Display_ColorBar ( FALSE )
	clrf	LT7686_DISPLAY_COLORBAR_STATE,ACCESS
	call	LT7686_DISPLAY_COLORBAR
;style++
	banksel	STYLE
	incf	STYLE,F,BANKED
	btfsc	STATUS,Z,ACCESS
	incf	STYLE_H,F,BANKED
;GLCDCLS
	banksel	0
	call	GLCDCLS_LT7686
;case 2:
	goto	SysSelectEnd1
SysSelect1Case3
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	2
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect1Case4
;If firstrun = TRUE Then
	incf	FIRSTRUN,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	ELSE3_1
;GLCDPrint_Internal_Font( 0, 0, "Circle", TFT_WHITE )
	banksel	_XOFFSET1
	clrf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	clrf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
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
	banksel	SYSLCDPRINTDATAHANDLER
	movwf	SysLCDPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysLCDPRINTDATAHandler_H,BANKED
	setf	LT7686_LINECOLOUR,ACCESS
	setf	LT7686_LINECOLOUR_H,ACCESS
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
;Using SYSSTRINGPARAM1*6
	banksel	0
	call	LT7686_PRINT_INTERNAL_FONT592
;firstrun = FALSE
	clrf	FIRSTRUN,ACCESS
;else
	bra	ENDIF3
ELSE3_1
;Circle ( xx, yy, rr, colors )
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
;End if
ENDIF3
;case 3: FilledCircle ( xx, yy, rr, colors )
	goto	SysSelectEnd1
SysSelect1Case4
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	3
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect1Case5
;case 3: FilledCircle ( xx, yy, rr, colors )
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
;case 4: Line (  xx, yy, xx1, yy1, colors )
	goto	SysSelectEnd1
SysSelect1Case5
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	4
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect1Case6
;case 4: Line (  xx, yy, xx1, yy1, colors )
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
;case 5: Box (  xx, yy, xx1, yy1, colors )
	goto	SysSelectEnd1
SysSelect1Case6
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	5
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect1Case7
;case 5: Box (  xx, yy, xx1, yy1, colors )
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
;case 6: FilledBox (  xx, yy, xx1, yy1, colors )
	goto	SysSelectEnd1
SysSelect1Case7
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	6
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect1Case8
;case 6: FilledBox (  xx, yy, xx1, yy1, colors )
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
;case 7: Ellipse (  xx, yy, random / 2, random / 2 , colors )
	goto	SysSelectEnd1
SysSelect1Case8
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	7
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect1Case9
;case 7: Ellipse (  xx, yy, random / 2, random / 2 , colors )
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
;case 8: FilledEllipse (  xx, yy, random / 2 , random / 2 , colors )
	goto	SysSelectEnd1
SysSelect1Case9
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	8
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect1Case10
;case 8: FilledEllipse (  xx, yy, random / 2 , random / 2 , colors )
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
;case 9: RoundRect (  xx, yy, xx1, yy1, rr, rr, colors )
	goto	SysSelectEnd1
SysSelect1Case10
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	9
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect1Case11
;case 9: RoundRect (  xx, yy, xx1, yy1, rr, rr, colors )
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
;case 10: FilledRoundRect (  xx, yy, xx1, yy1, rr, rr, colors )
	goto	SysSelectEnd1
SysSelect1Case11
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	10
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect1Case12
;case 10: FilledRoundRect (  xx, yy, xx1, yy1, rr, rr, colors )
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
;case 11:
	goto	SysSelectEnd1
SysSelect1Case12
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	11
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect1Case13
;If firstrun = TRUE Then
	incf	FIRSTRUN,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	ELSE4_1
;GLCDPrint_Internal_Font( 0, 0, "TRIANGLE", TFT_WHITE )
	banksel	_XOFFSET1
	clrf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	clrf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable14
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable14
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable14
	movwf	TBLPTRU,ACCESS
	banksel	0
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSLCDPRINTDATAHANDLER
	movwf	SysLCDPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysLCDPRINTDATAHandler_H,BANKED
	setf	LT7686_LINECOLOUR,ACCESS
	setf	LT7686_LINECOLOUR_H,ACCESS
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
;Using SYSSTRINGPARAM1*8
	banksel	0
	call	LT7686_PRINT_INTERNAL_FONT592
;firstrun = FALSE
	clrf	FIRSTRUN,ACCESS
;else
	bra	ENDIF4
ELSE4_1
;Triangle (  xx, yy, xx1, yy1, zz, zl, colors )
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
;End if
ENDIF4
;case 12:
	goto	SysSelectEnd1
SysSelect1Case13
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	12
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect1Case14
;If firstrun = TRUE Then
	incf	FIRSTRUN,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	ELSE5_1
;GLCDPrint_Internal_Font( 0, 0, "FILLEDTRIANGLE", TFT_WHITE )
	banksel	_XOFFSET1
	clrf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	clrf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
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
	banksel	SYSLCDPRINTDATAHANDLER
	movwf	SysLCDPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysLCDPRINTDATAHandler_H,BANKED
	setf	LT7686_LINECOLOUR,ACCESS
	setf	LT7686_LINECOLOUR_H,ACCESS
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
;Using SYSSTRINGPARAM1*14
	banksel	0
	call	LT7686_PRINT_INTERNAL_FONT592
;firstrun = FALSE
	clrf	FIRSTRUN,ACCESS
;else
	bra	ENDIF5
ELSE5_1
;FilledTriangle (  xx, yy, xx1, yy1, zz, zl, colors )
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
;End if
ENDIF5
;case 13:  // for PWM testing
	goto	SysSelectEnd1
SysSelect1Case14
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	13
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect1Case15
;If firstrun = TRUE Then
	incf	FIRSTRUN,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	ELSE6_1
;GLCDPrint_Internal_Font( 0, 0, "PWM Testing", TFT_WHITE )
	banksel	_XOFFSET1
	clrf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	clrf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
	lfsr	1,SYSSTRINGPARAM1
	movlw	low StringTable16
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable16
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable16
	movwf	TBLPTRU,ACCESS
	banksel	0
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSLCDPRINTDATAHANDLER
	movwf	SysLCDPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysLCDPRINTDATAHandler_H,BANKED
	setf	LT7686_LINECOLOUR,ACCESS
	setf	LT7686_LINECOLOUR_H,ACCESS
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
;Using SYSSTRINGPARAM1*11
	banksel	0
	call	LT7686_PRINT_INTERNAL_FONT592
;firstrun = FALSE
	clrf	FIRSTRUN,ACCESS
;else
	bra	ENDIF6
ELSE6_1
;FilledBox (  xx, yy, xx1, yy1, colors )
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
;For xxloop = 0 to 255
;Legacy method
	banksel	XXLOOP
	setf	XXLOOP,BANKED
SysForLoop1
	incf	XXLOOP,F,BANKED
;LT7686_PWM_DUTY ( SCALE( xxloop, 0, 255, 1, LT7686_PWM_PRESCALER_MAX ) )
	movff	XXLOOP,L_MAP
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
	call	FN_SCALE148
	movff	SYSSCALEWORD,LT7686_DISPLAY_PWM
	call	LT7686_PWM_DUTY
;wait 25 ms
	movlw	25
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	call	Delay_MS
;next
	movlw	255
	banksel	XXLOOP
	subwf	XXLOOP,W,BANKED
	btfss	STATUS, C,ACCESS
	bra	SysForLoop1
SysForLoopEnd1
;exit from doing this lots of time
;drawcount = DRAWCOUNTMAX
	movlw	80
	movwf	DRAWCOUNT,ACCESS
	clrf	DRAWCOUNT_H,ACCESS
;End If
ENDIF6
;Case 14:
	goto	SysSelectEnd1
SysSelect1Case15
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	14
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect1Case16
;If firstrun = TRUE Then
	incf	FIRSTRUN,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	ELSE7_1
;GLCDPrint_Internal_Font( 0, 0, "Draw Cylinder", TFT_WHITE )
	banksel	_XOFFSET1
	clrf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	clrf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
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
	banksel	SYSLCDPRINTDATAHANDLER
	movwf	SysLCDPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysLCDPRINTDATAHandler_H,BANKED
	setf	LT7686_LINECOLOUR,ACCESS
	setf	LT7686_LINECOLOUR_H,ACCESS
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
;Using SYSSTRINGPARAM1*13
	banksel	0
	call	LT7686_PRINT_INTERNAL_FONT592
;firstrun = FALSE
	clrf	FIRSTRUN,ACCESS
;else
	bra	ENDIF7
ELSE7_1
;Repeat 4
	movlw	4
	banksel	SYSREPEATTEMP1
	movwf	SysRepeatTemp1,BANKED
SysRepeatLoop1
;for yy = 0 to 150 step 5
	clrf	YY,BANKED
	clrf	YY_H,BANKED
SysForLoop2
;Init SysForLoopStep1 :#0
	movlw	5
	movwf	SysForLoopStep1,BANKED
	clrf	SysForLoopStep1_H,BANKED
;Cylinder (200, 300, 50, 5, 150, GLCDbackground, GLCDbackground )
	movlw	200
	banksel	_XOFFSET1
	movwf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	movlw	44
	movwf	_YOFFSET1,BANKED
	movlw	1
	movwf	_YOFFSET1_H,BANKED
	movlw	50
	banksel	_INXRADIUS
	movwf	_INXRADIUS,BANKED
	clrf	_INXRADIUS_H,BANKED
	movlw	5
	movwf	_INYRADIUS,BANKED
	banksel	_INYRADIUS_H
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
	clrf	LT7686_FILLCOLOUR_U,ACCESS
	clrf	LT7686_FILLCOLOUR_E,ACCESS
	banksel	0
	call	CYLINDER_LT7686
;Cylinder (200, 300, 50, 5, yy, TFT_RED, TFT_BLUE )
	movlw	200
	banksel	_XOFFSET1
	movwf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	movlw	44
	movwf	_YOFFSET1,BANKED
	movlw	1
	movwf	_YOFFSET1_H,BANKED
	movlw	50
	banksel	_INXRADIUS
	movwf	_INXRADIUS,BANKED
	clrf	_INXRADIUS_H,BANKED
	movlw	5
	movwf	_INYRADIUS,BANKED
	banksel	_INYRADIUS_H
	clrf	_INYRADIUS_H,BANKED
	movff	YY,_ZOFFSET
	movff	YY_H,_ZOFFSET_H
	clrf	LT7686_LINECOLOUR,ACCESS
	movlw	248
	movwf	LT7686_LINECOLOUR_H,ACCESS
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	movlw	31
	movwf	LT7686_FILLCOLOUR,ACCESS
	clrf	LT7686_FILLCOLOUR_H,ACCESS
	clrf	LT7686_FILLCOLOUR_U,ACCESS
	clrf	LT7686_FILLCOLOUR_E,ACCESS
	banksel	0
	call	CYLINDER_LT7686
;wait 25 ms
	movlw	25
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	call	Delay_MS
;Next
;Integer negative Step Handler in For-next statement
	banksel	SYSFORLOOPSTEP1_H
	btfss	SYSFORLOOPSTEP1_H,7,BANKED
	bra	ELSE15_1
;Set SysForLoopABsValue to -StepValue :#1 
	comf	SYSFORLOOPSTEP1,W,BANKED
	movwf	SysForLoopABsValue2,BANKED
	comf	SYSFORLOOPSTEP1_H,W,BANKED
	movwf	SysForLoopABsValue2_H,BANKED
	incf	SysForLoopABsValue2,F,BANKED
	btfsc	STATUS,Z,ACCESS
	incf	SysForLoopABsValue2_H,F,BANKED
;IF ( YY - 150) } [WORD]SysForLoopABsValue2 THEN  :#1n 
	movlw	150
	subwf	YY,W,BANKED
	movwf	SysTemp1,BANKED
	movlw	0
	subwfb	YY_H,W,BANKED
	movwf	SysTemp1_H,BANKED
	movff	SysTemp1,SysWORDTempA
	movff	SysTemp1_H,SysWORDTempA_H
	movff	SYSFORLOOPABSVALUE2,SysWORDTempB
	movff	SYSFORLOOPABSVALUE2_H,SysWORDTempB_H
	banksel	0
	call	SYSCOMPLESSTHAN16
	comf	SysByteTempX,F,ACCESS
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF18
;Set LoopVar to LoopVar + StepValue where StepValue is a negative value
	banksel	SYSFORLOOPSTEP1
	movf	SysForLoopStep1,W,BANKED
	addwf	YY,F,BANKED
	movf	SysForLoopStep1_H,W,BANKED
	addwfc	YY_H,F,BANKED
	bra	SysForLoop2
;END IF
ENDIF18
	bra	ENDIF15
ELSE15_1
;Integer positive Step Handler in For-next statement
;IF ([WORD]150 - [WORD]YY) } [WORD]SysForLoopStep1 THEN :#1p 
	movf	YY,W,BANKED
	sublw	150
	movwf	SysTemp1,BANKED
	clrf	SysTemp2,BANKED
	movf	YY_H,W,BANKED
	subwfb	SysTemp2,W,BANKED
	movwf	SysTemp1_H,BANKED
	movff	SysTemp1,SysWORDTempA
	movff	SysTemp1_H,SysWORDTempA_H
	movff	SYSFORLOOPSTEP1,SysWORDTempB
	movff	SYSFORLOOPSTEP1_H,SysWORDTempB_H
	banksel	0
	call	SYSCOMPLESSTHAN16
	comf	SysByteTempX,F,ACCESS
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF19
;Set LoopVar to LoopVar + StepValue where StepValue is a positive value
	banksel	SYSFORLOOPSTEP1
	movf	SysForLoopStep1,W,BANKED
	addwf	YY,F,BANKED
	movf	SysForLoopStep1_H,W,BANKED
	addwfc	YY_H,F,BANKED
	bra	SysForLoop2
;END IF
ENDIF19
;END IF
ENDIF15
SysForLoopEnd2
;for yy = 149 to 0 step -5
	movlw	149
	banksel	YY
	movwf	YY,BANKED
	clrf	YY_H,BANKED
SysForLoop3
;Init SysForLoopStep2 :#0
	movlw	251
	movwf	SysForLoopStep2,BANKED
	setf	SysForLoopStep2_H,BANKED
;Cylinder (200, 300, 50, 5, 150, GLCDbackground, GLCDbackground )
	movlw	200
	banksel	_XOFFSET1
	movwf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	movlw	44
	movwf	_YOFFSET1,BANKED
	movlw	1
	movwf	_YOFFSET1_H,BANKED
	movlw	50
	banksel	_INXRADIUS
	movwf	_INXRADIUS,BANKED
	clrf	_INXRADIUS_H,BANKED
	movlw	5
	movwf	_INYRADIUS,BANKED
	banksel	_INYRADIUS_H
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
	clrf	LT7686_FILLCOLOUR_U,ACCESS
	clrf	LT7686_FILLCOLOUR_E,ACCESS
	banksel	0
	call	CYLINDER_LT7686
;Cylinder (200, 300, 50, 5, yy, TFT_RED, TFT_BLUE )
	movlw	200
	banksel	_XOFFSET1
	movwf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	movlw	44
	movwf	_YOFFSET1,BANKED
	movlw	1
	movwf	_YOFFSET1_H,BANKED
	movlw	50
	banksel	_INXRADIUS
	movwf	_INXRADIUS,BANKED
	clrf	_INXRADIUS_H,BANKED
	movlw	5
	movwf	_INYRADIUS,BANKED
	banksel	_INYRADIUS_H
	clrf	_INYRADIUS_H,BANKED
	movff	YY,_ZOFFSET
	movff	YY_H,_ZOFFSET_H
	clrf	LT7686_LINECOLOUR,ACCESS
	movlw	248
	movwf	LT7686_LINECOLOUR_H,ACCESS
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	movlw	31
	movwf	LT7686_FILLCOLOUR,ACCESS
	clrf	LT7686_FILLCOLOUR_H,ACCESS
	clrf	LT7686_FILLCOLOUR_U,ACCESS
	clrf	LT7686_FILLCOLOUR_E,ACCESS
	banksel	0
	call	CYLINDER_LT7686
;wait 25 ms
	movlw	25
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	call	Delay_MS
;Next
;Integer negative Step Handler in For-next statement
	banksel	SYSFORLOOPSTEP2_H
	btfss	SYSFORLOOPSTEP2_H,7,BANKED
	bra	ELSE16_1
;Set SysForLoopABsValue to -StepValue :#1 
	comf	SYSFORLOOPSTEP2,W,BANKED
	movwf	SysForLoopABsValue3,BANKED
	comf	SYSFORLOOPSTEP2_H,W,BANKED
	movwf	SysForLoopABsValue3_H,BANKED
	incf	SysForLoopABsValue3,F,BANKED
	btfsc	STATUS,Z,ACCESS
	incf	SysForLoopABsValue3_H,F,BANKED
;IF ( YY - 0) } [WORD]SysForLoopABsValue3 THEN  :#1n 
	movlw	0
	subwf	YY,W,BANKED
	movwf	SysTemp1,BANKED
	movlw	0
	subwfb	YY_H,W,BANKED
	movwf	SysTemp1_H,BANKED
	movff	SysTemp1,SysWORDTempA
	movff	SysTemp1_H,SysWORDTempA_H
	movff	SYSFORLOOPABSVALUE3,SysWORDTempB
	movff	SYSFORLOOPABSVALUE3_H,SysWORDTempB_H
	banksel	0
	call	SYSCOMPLESSTHAN16
	comf	SysByteTempX,F,ACCESS
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF20
;Set LoopVar to LoopVar + StepValue where StepValue is a negative value
	banksel	SYSFORLOOPSTEP2
	movf	SysForLoopStep2,W,BANKED
	addwf	YY,F,BANKED
	movf	SysForLoopStep2_H,W,BANKED
	addwfc	YY_H,F,BANKED
	bra	SysForLoop3
;END IF
ENDIF20
	bra	ENDIF16
ELSE16_1
;Integer positive Step Handler in For-next statement
;IF ([WORD]0 - [WORD]YY) } [WORD]SysForLoopStep2 THEN :#1p 
	movf	YY,W,BANKED
	sublw	0
	movwf	SysTemp1,BANKED
	clrf	SysTemp2,BANKED
	movf	YY_H,W,BANKED
	subwfb	SysTemp2,W,BANKED
	movwf	SysTemp1_H,BANKED
	movff	SysTemp1,SysWORDTempA
	movff	SysTemp1_H,SysWORDTempA_H
	movff	SYSFORLOOPSTEP2,SysWORDTempB
	movff	SYSFORLOOPSTEP2_H,SysWORDTempB_H
	banksel	0
	call	SYSCOMPLESSTHAN16
	comf	SysByteTempX,F,ACCESS
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF21
;Set LoopVar to LoopVar + StepValue where StepValue is a positive value
	banksel	SYSFORLOOPSTEP2
	movf	SysForLoopStep2,W,BANKED
	addwf	YY,F,BANKED
	movf	SysForLoopStep2_H,W,BANKED
	addwfc	YY_H,F,BANKED
	bra	SysForLoop3
;END IF
ENDIF21
;END IF
ENDIF16
SysForLoopEnd3
;End Repeat
	banksel	SYSREPEATTEMP1
	decfsz	SysRepeatTemp1,F,BANKED
	bra	SysRepeatLoop1
SysRepeatLoopEnd1
;exit from doing this lots of time
;drawcount = DRAWCOUNTMAX
	movlw	80
	movwf	DRAWCOUNT,ACCESS
	clrf	DRAWCOUNT_H,ACCESS
;End if
ENDIF7
;Case 15:
	goto	SysSelectEnd1
SysSelect1Case16
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	15
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect1Case17
;LeftUpCurve(  xx, yy, rr, rr2, colors )
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
;Case 16:
	goto	SysSelectEnd1
SysSelect1Case17
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	16
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect1Case18
;LeftDownCurve(  xx, yy, rr, rr2, colors )
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
;Case 17:
	goto	SysSelectEnd1
SysSelect1Case18
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	17
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect1Case19
;RightUpCurve(  xx, yy, rr, rr2, colors )
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
;Case 18:
	goto	SysSelectEnd1
SysSelect1Case19
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	18
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect1Case20
;RightDownCurve(  xx, yy, rr, rr2, colors )
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
;Case 19:
	goto	SysSelectEnd1
SysSelect1Case20
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	19
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect1Case21
;FilledLeftUpCurve(  xx, yy, rr, rr2, colors )
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
;Case 20:
	goto	SysSelectEnd1
SysSelect1Case21
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	20
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect1Case22
;FilledLeftDownCurve(  xx, yy, rr, rr2, colors )
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
;Case 21:
	goto	SysSelectEnd1
SysSelect1Case22
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	21
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect1Case23
;FilledRightUpCurve(  xx, yy, rr, rr2, colors )
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
;Case 22:
	goto	SysSelectEnd1
SysSelect1Case23
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	22
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect1Case24
;FilledRightDownCurve(  xx, yy, rr, rr2, colors )
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
;Case 23:
	goto	SysSelectEnd1
SysSelect1Case24
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	23
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect1Case25
;If firstrun = TRUE Then
	incf	FIRSTRUN,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	ENDIF8
;GLCDPrint_Internal_Font( 0, 0, "DrawQuadrilateral", TFT_WHITE )
	banksel	_XOFFSET1
	clrf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	clrf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
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
	banksel	SYSLCDPRINTDATAHANDLER
	movwf	SysLCDPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysLCDPRINTDATAHandler_H,BANKED
	setf	LT7686_LINECOLOUR,ACCESS
	setf	LT7686_LINECOLOUR_H,ACCESS
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
;Using SYSSTRINGPARAM1*17
	banksel	0
	call	LT7686_PRINT_INTERNAL_FONT592
;firstrun = FALSE
	clrf	FIRSTRUN,ACCESS
;End If
ENDIF8
;Quadrilateral       (  50, 50, 200, 80, 150, 130, 60, 100, colors )
	movlw	50
	banksel	XOFFSET1
	movwf	XOFFSET1,BANKED
	clrf	XOFFSET1_H,BANKED
	movlw	50
	movwf	YOFFSET1,BANKED
	clrf	YOFFSET1_H,BANKED
	movlw	200
	movwf	XOFFSET2,BANKED
	clrf	XOFFSET2_H,BANKED
	movlw	80
	movwf	YOFFSET2,BANKED
	clrf	YOFFSET2_H,BANKED
	movlw	150
	movwf	XOFFSET3,BANKED
	clrf	XOFFSET3_H,BANKED
	movlw	130
	movwf	YOFFSET3,BANKED
	clrf	YOFFSET3_H,BANKED
	movlw	60
	movwf	XOFFSET4,BANKED
	clrf	XOFFSET4_H,BANKED
	movlw	100
	movwf	YOFFSET4,BANKED
	clrf	YOFFSET4_H,BANKED
	movff	COLORS,LT7686_LINECOLOUR
	movff	COLORS_H,LT7686_LINECOLOUR_H
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	QUADRILATERAL_LT7686
;wait 5 s
	movlw	5
	movwf	SysWaitTempS,ACCESS
	call	Delay_S
;exit from doing this lots of time
;drawcount = DRAWCOUNTMAX
	movlw	80
	movwf	DRAWCOUNT,ACCESS
	clrf	DRAWCOUNT_H,ACCESS
;Case 24:
	goto	SysSelectEnd1
SysSelect1Case25
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	24
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect1Case26
;If firstrun = TRUE Then
	incf	FIRSTRUN,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	ENDIF9
;GLCDPrint_Internal_Font( 0, 0, "FilledDrawQuadrilateral", TFT_WHITE )
	banksel	_XOFFSET1
	clrf	_XOFFSET1,BANKED
	clrf	_XOFFSET1_H,BANKED
	clrf	_YOFFSET1,BANKED
	clrf	_YOFFSET1_H,BANKED
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
	banksel	SYSLCDPRINTDATAHANDLER
	movwf	SysLCDPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysLCDPRINTDATAHandler_H,BANKED
	setf	LT7686_LINECOLOUR,ACCESS
	setf	LT7686_LINECOLOUR_H,ACCESS
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
;Using SYSSTRINGPARAM1*23
	banksel	0
	call	LT7686_PRINT_INTERNAL_FONT592
;firstrun = FALSE
	clrf	FIRSTRUN,ACCESS
;End If
ENDIF9
;FilledQuadrilateral (  150, 50, 300, 80, 250, 130, 160, 100, colors )
	movlw	150
	banksel	XOFFSET1
	movwf	XOFFSET1,BANKED
	clrf	XOFFSET1_H,BANKED
	movlw	50
	movwf	YOFFSET1,BANKED
	clrf	YOFFSET1_H,BANKED
	movlw	44
	movwf	XOFFSET2,BANKED
	movlw	1
	movwf	XOFFSET2_H,BANKED
	movlw	80
	movwf	YOFFSET2,BANKED
	clrf	YOFFSET2_H,BANKED
	movlw	250
	movwf	XOFFSET3,BANKED
	clrf	XOFFSET3_H,BANKED
	movlw	130
	movwf	YOFFSET3,BANKED
	clrf	YOFFSET3_H,BANKED
	movlw	160
	movwf	XOFFSET4,BANKED
	clrf	XOFFSET4_H,BANKED
	movlw	100
	movwf	YOFFSET4,BANKED
	clrf	YOFFSET4_H,BANKED
	movff	COLORS,LT7686_LINECOLOUR
	movff	COLORS_H,LT7686_LINECOLOUR_H
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	FILLEDQUADRILATERAL_LT7686
;wait 2 s
	movlw	2
	movwf	SysWaitTempS,ACCESS
	call	Delay_S
;exit from doing this lots of time
;drawcount = DRAWCOUNTMAX
	movlw	80
	movwf	DRAWCOUNT,ACCESS
	clrf	DRAWCOUNT_H,ACCESS
;Case 25:
	bra	SysSelectEnd1
SysSelect1Case26
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	25
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect1Case27
;If firstrun = TRUE Then
	incf	FIRSTRUN,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	ELSE10_1
;FilledTriangle (  22, 53, 75, 92, 43, 96, TFT_BLUE )
	movlw	22
	banksel	XOFFSET1
	movwf	XOFFSET1,BANKED
	clrf	XOFFSET1_H,BANKED
	movlw	53
	movwf	YOFFSET1,BANKED
	clrf	YOFFSET1_H,BANKED
	movlw	75
	movwf	XOFFSET2,BANKED
	clrf	XOFFSET2_H,BANKED
	movlw	92
	movwf	YOFFSET2,BANKED
	clrf	YOFFSET2_H,BANKED
	movlw	43
	movwf	XOFFSET3,BANKED
	clrf	XOFFSET3_H,BANKED
	movlw	96
	movwf	YOFFSET3,BANKED
	clrf	YOFFSET3_H,BANKED
	movlw	31
	movwf	LT7686_LINECOLOUR,ACCESS
	clrf	LT7686_LINECOLOUR_H,ACCESS
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	FILLEDTRIANGLE_LT7686
;FilledTriangle (  93, 99, 170, 66, 267, 219, TFT_DARKGREY )
	movlw	93
	banksel	XOFFSET1
	movwf	XOFFSET1,BANKED
	clrf	XOFFSET1_H,BANKED
	movlw	99
	movwf	YOFFSET1,BANKED
	clrf	YOFFSET1_H,BANKED
	movlw	170
	movwf	XOFFSET2,BANKED
	clrf	XOFFSET2_H,BANKED
	movlw	66
	movwf	YOFFSET2,BANKED
	clrf	YOFFSET2_H,BANKED
	movlw	11
	movwf	XOFFSET3,BANKED
	movlw	1
	movwf	XOFFSET3_H,BANKED
	movlw	219
	movwf	YOFFSET3,BANKED
	clrf	YOFFSET3_H,BANKED
	movlw	239
	movwf	LT7686_LINECOLOUR,ACCESS
	movlw	123
	movwf	LT7686_LINECOLOUR_H,ACCESS
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	FILLEDTRIANGLE_LT7686
;FilledTriangle (  94, 111, 231, 206, 159, 330, TFT_DARKGREY )
	movlw	94
	banksel	XOFFSET1
	movwf	XOFFSET1,BANKED
	clrf	XOFFSET1_H,BANKED
	movlw	111
	movwf	YOFFSET1,BANKED
	clrf	YOFFSET1_H,BANKED
	movlw	231
	movwf	XOFFSET2,BANKED
	clrf	XOFFSET2_H,BANKED
	movlw	206
	movwf	YOFFSET2,BANKED
	clrf	YOFFSET2_H,BANKED
	movlw	159
	movwf	XOFFSET3,BANKED
	clrf	XOFFSET3_H,BANKED
	movlw	74
	movwf	YOFFSET3,BANKED
	movlw	1
	movwf	YOFFSET3_H,BANKED
	movlw	239
	movwf	LT7686_LINECOLOUR,ACCESS
	movlw	123
	movwf	LT7686_LINECOLOUR_H,ACCESS
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	FILLEDTRIANGLE_LT7686
;FilledTriangle (  196, 91, 365, 106, 346, 328, TFT_BLUE )
	movlw	196
	banksel	XOFFSET1
	movwf	XOFFSET1,BANKED
	clrf	XOFFSET1_H,BANKED
	movlw	91
	movwf	YOFFSET1,BANKED
	clrf	YOFFSET1_H,BANKED
	movlw	109
	movwf	XOFFSET2,BANKED
	movlw	1
	movwf	XOFFSET2_H,BANKED
	movlw	106
	movwf	YOFFSET2,BANKED
	clrf	YOFFSET2_H,BANKED
	movlw	90
	movwf	XOFFSET3,BANKED
	movlw	1
	movwf	XOFFSET3_H,BANKED
	movlw	72
	movwf	YOFFSET3,BANKED
	movlw	1
	movwf	YOFFSET3_H,BANKED
	movlw	31
	movwf	LT7686_LINECOLOUR,ACCESS
	clrf	LT7686_LINECOLOUR_H,ACCESS
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	FILLEDTRIANGLE_LT7686
;FilledTriangle (  368, 127, 373, 187, 397, 211, TFT_DARKGREY )
	movlw	112
	banksel	XOFFSET1
	movwf	XOFFSET1,BANKED
	movlw	1
	movwf	XOFFSET1_H,BANKED
	movlw	127
	movwf	YOFFSET1,BANKED
	clrf	YOFFSET1_H,BANKED
	movlw	117
	movwf	XOFFSET2,BANKED
	movlw	1
	movwf	XOFFSET2_H,BANKED
	movlw	187
	movwf	YOFFSET2,BANKED
	clrf	YOFFSET2_H,BANKED
	movlw	141
	movwf	XOFFSET3,BANKED
	movlw	1
	movwf	XOFFSET3_H,BANKED
	movlw	211
	movwf	YOFFSET3,BANKED
	clrf	YOFFSET3_H,BANKED
	movlw	239
	movwf	LT7686_LINECOLOUR,ACCESS
	movlw	123
	movwf	LT7686_LINECOLOUR_H,ACCESS
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	FILLEDTRIANGLE_LT7686
;FilledPentagon ( 46, 102, 79, 101, 107, 186, 12, 186, 2, 155, TFT_BLUE )
	movlw	46
	banksel	XOFFSET1
	movwf	XOFFSET1,BANKED
	clrf	XOFFSET1_H,BANKED
	movlw	102
	movwf	YOFFSET1,BANKED
	clrf	YOFFSET1_H,BANKED
	movlw	79
	movwf	XOFFSET2,BANKED
	clrf	XOFFSET2_H,BANKED
	movlw	101
	movwf	YOFFSET2,BANKED
	clrf	YOFFSET2_H,BANKED
	movlw	107
	movwf	XOFFSET3,BANKED
	clrf	XOFFSET3_H,BANKED
	movlw	186
	movwf	YOFFSET3,BANKED
	clrf	YOFFSET3_H,BANKED
	movlw	12
	movwf	XOFFSET4,BANKED
	clrf	XOFFSET4_H,BANKED
	movlw	186
	movwf	YOFFSET4,BANKED
	clrf	YOFFSET4_H,BANKED
	movlw	2
	movwf	XOFFSET5,BANKED
	clrf	XOFFSET5_H,BANKED
	movlw	155
	movwf	YOFFSET5,BANKED
	clrf	YOFFSET5_H,BANKED
	movlw	31
	movwf	LT7686_LINECOLOUR,ACCESS
	clrf	LT7686_LINECOLOUR_H,ACCESS
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	FILLEDPENTAGON_LT7686
;GLCDSelect_Internal_Font_Init( 32, 4, 4 )
	movlw	32
	banksel	_FONTSIZE
	movwf	_FONTSIZE,BANKED
	movlw	4
	banksel	_XWIDTHMAG
	movwf	_XWIDTHMAG,BANKED
	movlw	4
	movwf	_YHEIGHTMAG,BANKED
	movlw	1
	banksel	_CHROMAKEY
	movwf	_CHROMAKEY,BANKED
	movlw	1
	movwf	_ALIGNMENT,BANKED
	banksel	0
	call	LT7686_SELECT_INTERNAL_FONT_INIT
;GLCDPrint_Internal_Font( 300, 350,  "GCBASIC", TFT_WHITE )
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
	movlw	low StringTable8
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable8
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable8
	movwf	TBLPTRU,ACCESS
	banksel	0
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSLCDPRINTDATAHANDLER
	movwf	SysLCDPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysLCDPRINTDATAHandler_H,BANKED
	setf	LT7686_LINECOLOUR,ACCESS
	setf	LT7686_LINECOLOUR_H,ACCESS
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
;Using SYSSTRINGPARAM1*7
	banksel	0
	call	LT7686_PRINT_INTERNAL_FONT592
;GLCDSelect_Internal_Font_Init()
	movlw	16
	banksel	_FONTSIZE
	movwf	_FONTSIZE,BANKED
	movlw	1
	banksel	_XWIDTHMAG
	movwf	_XWIDTHMAG,BANKED
	movlw	1
	movwf	_YHEIGHTMAG,BANKED
	movlw	1
	banksel	_CHROMAKEY
	movwf	_CHROMAKEY,BANKED
	movlw	1
	movwf	_ALIGNMENT,BANKED
	banksel	0
	call	LT7686_SELECT_INTERNAL_FONT_INIT
;GLCDPrint_Internal_Font( 690 , 470,  "Dec 2023", TFT_WHITE )
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
	movlw	low StringTable20
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable20
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable20
	movwf	TBLPTRU,ACCESS
	banksel	0
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM1
	banksel	SYSLCDPRINTDATAHANDLER
	movwf	SysLCDPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM1
	movwf	SysLCDPRINTDATAHandler_H,BANKED
	setf	LT7686_LINECOLOUR,ACCESS
	setf	LT7686_LINECOLOUR_H,ACCESS
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
;Using SYSSTRINGPARAM1*8
	banksel	0
	call	LT7686_PRINT_INTERNAL_FONT592
;firstrun = FALSE
	clrf	FIRSTRUN,ACCESS
;Else
	bra	ENDIF10
ELSE10_1
;GLCDPrint_Internal_Font( 10, 450, style )
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
	call	LT7686_PRINT_INTERNAL_FONT593
;GLCDPrint_Internal_Font( 10, 462, drawcount )
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
	call	LT7686_PRINT_INTERNAL_FONT593
;drawcount = drawcount + 10
	movlw	10
	addwf	DRAWCOUNT,F,ACCESS
	movlw	0
	addwfc	DRAWCOUNT_H,F,ACCESS
;wait 25 ms
	movlw	25
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	call	Delay_MS
;End If
ENDIF10
;Case 26:
	bra	SysSelectEnd1
SysSelect1Case27
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	26
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelect1Case28
;LineWidth 0, 100, GLCDDeviceWidth - 1, 100, 0, TFT_WHITE
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
	setf	LT7686_LINECOLOUR,ACCESS
	setf	LT7686_LINECOLOUR_H,ACCESS
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_WIDTH_LT7686
;LineWidth 0, 150, GLCDDeviceWidth - 1, 150, 1, TFT_WHITE
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
	setf	LT7686_LINECOLOUR,ACCESS
	setf	LT7686_LINECOLOUR_H,ACCESS
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_WIDTH_LT7686
;LineWidth 0, 200, GLCDDeviceWidth - 1, 200, 2, TFT_WHITE
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
	setf	LT7686_LINECOLOUR,ACCESS
	setf	LT7686_LINECOLOUR_H,ACCESS
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_WIDTH_LT7686
;LineWidth 0, 250, GLCDDeviceWidth - 1, 250, 4, TFT_WHITE
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
	setf	LT7686_LINECOLOUR,ACCESS
	setf	LT7686_LINECOLOUR_H,ACCESS
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_WIDTH_LT7686
;LineWidth 0, 300, GLCDDeviceWidth - 1, 300, 5, TFT_WHITE
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
	setf	LT7686_LINECOLOUR,ACCESS
	setf	LT7686_LINECOLOUR_H,ACCESS
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_WIDTH_LT7686
;LineWidth 0, 0, GLCDDeviceWidth - 1, 100, 0, TFT_WHITE
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
	setf	LT7686_LINECOLOUR,ACCESS
	setf	LT7686_LINECOLOUR_H,ACCESS
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_WIDTH_LT7686
;LineWidth 0, 0, GLCDDeviceWidth - 1, 150, 1, TFT_WHITE
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
	setf	LT7686_LINECOLOUR,ACCESS
	setf	LT7686_LINECOLOUR_H,ACCESS
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_WIDTH_LT7686
;LineWidth 0, 0, GLCDDeviceWidth - 1, 200, 2, TFT_WHITE
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
	setf	LT7686_LINECOLOUR,ACCESS
	setf	LT7686_LINECOLOUR_H,ACCESS
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_WIDTH_LT7686
;LineWidth 0, 0, GLCDDeviceWidth - 1, 250, 4, TFT_WHITE
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
	setf	LT7686_LINECOLOUR,ACCESS
	setf	LT7686_LINECOLOUR_H,ACCESS
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_WIDTH_LT7686
;LineWidth 0, 0, GLCDDeviceWidth - 1, 300, 5, TFT_WHITE
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
	setf	LT7686_LINECOLOUR,ACCESS
	setf	LT7686_LINECOLOUR_H,ACCESS
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_WIDTH_LT7686
;LineWidth GLCDDeviceWidth - 1, 0, 0, 100, 0, TFT_WHITE
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
	setf	LT7686_LINECOLOUR,ACCESS
	setf	LT7686_LINECOLOUR_H,ACCESS
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_WIDTH_LT7686
;LineWidth GLCDDeviceWidth - 1, 0, 0, 150, 1, TFT_WHITE
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
	setf	LT7686_LINECOLOUR,ACCESS
	setf	LT7686_LINECOLOUR_H,ACCESS
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_WIDTH_LT7686
;LineWidth GLCDDeviceWidth - 1, 0, 0, 200, 2, TFT_WHITE
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
	setf	LT7686_LINECOLOUR,ACCESS
	setf	LT7686_LINECOLOUR_H,ACCESS
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_WIDTH_LT7686
;LineWidth GLCDDeviceWidth - 1, 0, 0, 250, 4, TFT_WHITE
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
	setf	LT7686_LINECOLOUR,ACCESS
	setf	LT7686_LINECOLOUR_H,ACCESS
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_WIDTH_LT7686
;LineWidth GLCDDeviceWidth - 1, 0, 0, 300, 5, TFT_WHITE
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
	setf	LT7686_LINECOLOUR,ACCESS
	setf	LT7686_LINECOLOUR_H,ACCESS
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_WIDTH_LT7686
;LineWidth 0, 400, GLCDDeviceWidth - 1, 400, 80, TFT_BLUE
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
	movwf	LT7686_LINECOLOUR,ACCESS
	clrf	LT7686_LINECOLOUR_H,ACCESS
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	LINE_WIDTH_LT7686
;If firstrun = TRUE Then
	incf	FIRSTRUN,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	ENDIF11
;Wait 10 s
	movlw	10
	movwf	SysWaitTempS,ACCESS
	rcall	Delay_S
;exit from doing this lots of time
;drawcount = DRAWCOUNTMAX
	movlw	80
	movwf	DRAWCOUNT,ACCESS
	clrf	DRAWCOUNT_H,ACCESS
;End If
ENDIF11
;Case 27:
	bra	SysSelectEnd1
SysSelect1Case28
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	27
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	SysSelectEnd1
;FramedFilledCircle  ( xx, yy, rr, (rr/20), TFT_WHITE, colors)
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
	setf	LT7686_LINECOLOUR,ACCESS
	setf	LT7686_LINECOLOUR_H,ACCESS
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	movff	COLORS,LT7686_FILLCOLOUR
	movff	COLORS_H,LT7686_FILLCOLOUR_H
	clrf	LT7686_FILLCOLOUR_U,ACCESS
	clrf	LT7686_FILLCOLOUR_E,ACCESS
	banksel	0
	call	FRAMEDFILLEDCIRCLE_LT7686
;FramedFilledbox (  200, 60, 400, 150, 5, TFT_RED, TFT_WHITE)
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
	clrf	LT7686_LINECOLOUR,ACCESS
	movlw	248
	movwf	LT7686_LINECOLOUR_H,ACCESS
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	setf	LT7686_FILLCOLOUR,ACCESS
	setf	LT7686_FILLCOLOUR_H,ACCESS
	clrf	LT7686_FILLCOLOUR_U,ACCESS
	clrf	LT7686_FILLCOLOUR_E,ACCESS
	banksel	0
	call	FRAMEDFILLEDBOX_LT7686
;FramedFilledRoundRect ( 550, 60, 500, 350, 30, 20,  5, TFT_RED, TFT_WHITE)
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
	clrf	LT7686_LINECOLOUR,ACCESS
	movlw	248
	movwf	LT7686_LINECOLOUR_H,ACCESS
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	setf	LT7686_FILLCOLOUR,ACCESS
	setf	LT7686_FILLCOLOUR_H,ACCESS
	clrf	LT7686_FILLCOLOUR_U,ACCESS
	clrf	LT7686_FILLCOLOUR_E,ACCESS
	banksel	0
	call	FRAMEDFILLEDROUNDRECT_LT7686
;FramedFilledTriangle(100, 100, 50, 200, 150, 150, TFT_RED, TFT_WHITE)
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
	clrf	LT7686_LINECOLOUR,ACCESS
	movlw	248
	movwf	LT7686_LINECOLOUR_H,ACCESS
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	setf	LT7686_FILLCOLOUR,ACCESS
	setf	LT7686_FILLCOLOUR_H,ACCESS
	clrf	LT7686_FILLCOLOUR_U,ACCESS
	clrf	LT7686_FILLCOLOUR_E,ACCESS
	banksel	0
	call	FRAMEDFILLEDTRIANGLE_LT7686
;FilledCube (300, 300, 350, 250, 400, 250, 350, 300, 350, 350, 400, 300, TFT_RED, TFT_WHITE)
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
	clrf	LT7686_LINECOLOUR,ACCESS
	movlw	248
	movwf	LT7686_LINECOLOUR_H,ACCESS
	banksel	LT7686_LINECOLOUR_U
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	setf	LT7686_FILLCOLOUR,ACCESS
	setf	LT7686_FILLCOLOUR_H,ACCESS
	clrf	LT7686_FILLCOLOUR_U,ACCESS
	clrf	LT7686_FILLCOLOUR_E,ACCESS
	banksel	0
	call	FILLEDCUBE_LT7686
;If firstrun = TRUE Then
	incf	FIRSTRUN,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	ENDIF12
;Wait 10 s
	movlw	10
	movwf	SysWaitTempS,ACCESS
	rcall	Delay_S
;exit from doing this lots of time
;drawcount = DRAWCOUNTMAX
	movlw	80
	movwf	DRAWCOUNT,ACCESS
	clrf	DRAWCOUNT_H,ACCESS
;End If
ENDIF12
;End Select
SysSelectEnd1
;If drawcount => DRAWCOUNTMAX  Then
	movff	DRAWCOUNT,SysWORDTempA
	movff	DRAWCOUNT_H,SysWORDTempA_H
	movlw	80
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	banksel	0
	call	SYSCOMPLESSTHAN16
	comf	SysByteTempX,F,ACCESS
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF13
;GLCDCLS TFT_BLACK
	clrf	GLCDBACKGROUND,ACCESS
	clrf	GLCDBACKGROUND_H,ACCESS
	clrf	GLCDBACKGROUND_U,ACCESS
	clrf	GLCDBACKGROUND_E,ACCESS
	call	GLCDCLS_LT7686
;firstrun = TRUE
	setf	FIRSTRUN,ACCESS
;Wait 250 ms
	movlw	250
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	rcall	Delay_MS
;drawcount = 0
	clrf	DRAWCOUNT,ACCESS
	clrf	DRAWCOUNT_H,ACCESS
;Randomize TIMER0
	movff	TIMER0,RANDOMTEMP
	banksel	RANDOMTEMP_H
	clrf	RANDOMTEMP_H,BANKED
	banksel	0
	call	RANDOMIZE
;style++
	banksel	STYLE
	incf	STYLE,F,BANKED
	btfsc	STATUS,Z,ACCESS
	incf	STYLE_H,F,BANKED
;If style = 30 then style = 0
	movff	STYLE,SysWORDTempA
	movff	STYLE_H,SysWORDTempA_H
	movlw	30
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	banksel	0
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF17
;If style = 30 then style = 0
	banksel	STYLE
	clrf	STYLE,BANKED
	clrf	STYLE_H,BANKED
;If style = 30 then style = 0
ENDIF17
;End If
ENDIF13
;drawcount++
	incf	DRAWCOUNT,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	DRAWCOUNT_H,F,ACCESS
;wait 10 ms
	movlw	10
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	banksel	0
	rcall	Delay_MS
;Loop
	goto	SysDoLoop_S1
SysDoLoop_E1
;End
	bra	BASPROGRAMEND
;#insert "010_GLCDProgram.gcb"    // Show GCBASIC logo
;#insert "011_GLCDProgram.gcb"    // Show GCBASIC test screen
;#insert "012_GLCDProgram.gcb"    // Show Framed primitives
;#insert "014_GLCDProgram.gcb"    // Shows all the colors and PWM control on ADC0
;#insert "015_GLCDProgram.gcb"    // Shows ADC values on a table
;#insert "016_GLCDProgram.gcb"    // Rotate.. or, lack of ROTATE!!!
;#insert "017_GLCDProgram.gcb"    // Shows super computer
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
	bra	ELSE75_1
;Abs = -SysCalcTempA
	comf	SYSCALCTEMPA,W,ACCESS
	movwf	ABS,ACCESS
	comf	SYSCALCTEMPA_H,W,ACCESS
	movwf	ABS_H,ACCESS
	incf	ABS,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	ABS_H,F,ACCESS
;Else
	bra	ENDIF75
ELSE75_1
;Abs = SysCalcTempA
	movff	SYSCALCTEMPA,ABS
	movff	SYSCALCTEMPA_H,ABS_H
;End If
ENDIF75
	return

;********************************************************************************

;Source: GLCD_LT7686.H (458)
BOX_LT7686
;LT7686_CreateBox
;Macro Source: GLCD_LT7686.H (503)
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
;Macro Source: GLCD_LT7686.H (1594)
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
;LT7686_WriteData(0xA0)
	movlw	160
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

;Source: string.h (1171)
FN_BYTETOBIN
;ByteToBin = ""
	lfsr	1,BYTETOBIN
	movlw	low StringTable125
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable125
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable125
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRING
;Repeat 8
	movlw	8
	banksel	SYSREPEATTEMP3
	movwf	SysRepeatTemp3,BANKED
SysRepeatLoop3
;If ByteNum.7 = 1 Then
	btfss	BYTENUM,7,ACCESS
	bra	ELSE46_1
;ByteToBin = ByteToBin +"1"
	lfsr	1,BYTETOBIN
	clrf	SysStringLength,ACCESS
	lfsr	0,BYTETOBIN
	banksel	0
	call	SYSCOPYSTRINGPART
	movlw	low StringTable129
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable129
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable129
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,BYTETOBIN
	movff	SysStringLength, INDF0
;Else
	bra	ENDIF46
ELSE46_1
;ByteToBin = ByteToBin +"0"
	lfsr	1,BYTETOBIN
	clrf	SysStringLength,ACCESS
	lfsr	0,BYTETOBIN
	banksel	0
	call	SYSCOPYSTRINGPART
	movlw	low StringTable130
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable130
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable130
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,BYTETOBIN
	movff	SysStringLength, INDF0
;End If
ENDIF46
;Rotate ByteNum Left
	rlcf	BYTENUM,F,ACCESS
;End Repeat
	banksel	SYSREPEATTEMP3
	decfsz	SysRepeatTemp3,F,BANKED
	bra	SysRepeatLoop3
SysRepeatLoopEnd3
	banksel	0
	return

;********************************************************************************

;Source: GLCD_LT7686.H (611)
CIRCLE_LT7686
;LT7686_CreateCircle
;Macro Source: GLCD_LT7686.H (656)
;LT7686_WriteCMD(0x7B)
	movlw	123
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset1)
	movff	XOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7C)
	movlw	124
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset1_H)
	movff	XOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7D)
	movlw	125
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset1)
	movff	YOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7E)
	movlw	126
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset1_H)
	movff	YOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x77)
	movlw	119
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inxradius)
	movff	INXRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x78)
	movlw	120
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inxradius_H)
	movff	INXRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x79)
	movlw	121
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inxradius)
	movff	INXRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7A)
	movlw	122
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inxradius_H)
	movff	INXRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_SendColor
;Macro Source: GLCD_LT7686.H (1594)
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
;LT7686_WriteCMD(0x76)
	movlw	118
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(0x80)//B1000_XXXX
	movlw	128
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw	
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

;Source: GLCD_LT7686.H (899)
CYLINDER_LT7686
;if ( _yoffset1 < _zoffset ) then Exit Sub
	movff	_YOFFSET1,SysWORDTempA
	movff	_YOFFSET1_H,SysWORDTempA_H
	movff	_ZOFFSET,SysWORDTempB
	movff	_ZOFFSET_H,SysWORDTempB_H
	call	SYSCOMPLESSTHAN16
	btfsc	SysByteTempX,0,ACCESS
;if ( _yoffset1 < _zoffset ) then Exit Sub
	return
;if ( _yoffset1 < _zoffset ) then Exit Sub
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
;FilledEllipse ( _xoffset1, _yoffset1, _Inxradius, _Inyradius, cache_LT7686_FillColour )
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
;Ellipse (       _xoffset1, _yoffset1, _Inxradius, _Inyradius, cache_LT7686_LineColour )
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
;FilledBox ( _xoffset1 - inxradius, _yoffset1 - _zoffset, _xoffset1 + _inxradius, _yoffset1, cache_LT7686_FillColour )
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
	banksel	YOFFSET1
	movwf	YOFFSET1,BANKED
	banksel	_ZOFFSET_H
	movf	_ZOFFSET_H,W,BANKED
	subwfb	_YOFFSET1_H,W,BANKED
	banksel	YOFFSET1_H
	movwf	YOFFSET1_H,BANKED
	movf	_INXRADIUS,W,BANKED
	banksel	_XOFFSET1
	addwf	_XOFFSET1,W,BANKED
	banksel	XOFFSET2
	movwf	XOFFSET2,BANKED
	movf	_INXRADIUS_H,W,BANKED
	banksel	_XOFFSET1_H
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
;FilledEllipse ( _xoffset1, _yoffset1 - _zoffset, _Inxradius, _Inyradius, cache_LT7686_FillColour )
	movff	_XOFFSET1,XOFFSET1
	movff	_XOFFSET1_H,XOFFSET1_H
	banksel	_ZOFFSET
	movf	_ZOFFSET,W,BANKED
	subwf	_YOFFSET1,W,BANKED
	banksel	YOFFSET1
	movwf	YOFFSET1,BANKED
	banksel	_ZOFFSET_H
	movf	_ZOFFSET_H,W,BANKED
	subwfb	_YOFFSET1_H,W,BANKED
	banksel	YOFFSET1_H
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
;Ellipse ( _xoffset1, _yoffset1 - _zoffset, _Inxradius, _Inyradius, cache_LT7686_LineColour )
	movff	_XOFFSET1,XOFFSET1
	movff	_XOFFSET1_H,XOFFSET1_H
	banksel	_ZOFFSET
	movf	_ZOFFSET,W,BANKED
	subwf	_YOFFSET1,W,BANKED
	banksel	YOFFSET1
	movwf	YOFFSET1,BANKED
	banksel	_ZOFFSET_H
	movf	_ZOFFSET_H,W,BANKED
	subwfb	_YOFFSET1_H,W,BANKED
	banksel	YOFFSET1_H
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
;Line ( _xoffset1 - _Inxradius, _yoffset1, _xoffset1 - _Inxradius, _yoffset1 - _zoffset, cache_LT7686_LineColour )
	banksel	_INXRADIUS
	movf	_INXRADIUS,W,BANKED
	banksel	_XOFFSET1
	subwf	_XOFFSET1,W,BANKED
	banksel	XOFFSET1
	movwf	XOFFSET1,BANKED
	movf	_INXRADIUS_H,W,BANKED
	banksel	_XOFFSET1_H
	subwfb	_XOFFSET1_H,W,BANKED
	banksel	XOFFSET1_H
	movwf	XOFFSET1_H,BANKED
	movff	_YOFFSET1,YOFFSET1
	movff	_YOFFSET1_H,YOFFSET1_H
	movf	_INXRADIUS,W,BANKED
	banksel	_XOFFSET1
	subwf	_XOFFSET1,W,BANKED
	banksel	XOFFSET2
	movwf	XOFFSET2,BANKED
	movf	_INXRADIUS_H,W,BANKED
	banksel	_XOFFSET1_H
	subwfb	_XOFFSET1_H,W,BANKED
	banksel	XOFFSET2_H
	movwf	XOFFSET2_H,BANKED
	banksel	_ZOFFSET
	movf	_ZOFFSET,W,BANKED
	subwf	_YOFFSET1,W,BANKED
	banksel	YOFFSET2
	movwf	YOFFSET2,BANKED
	banksel	_ZOFFSET_H
	movf	_ZOFFSET_H,W,BANKED
	subwfb	_YOFFSET1_H,W,BANKED
	banksel	YOFFSET2_H
	movwf	YOFFSET2_H,BANKED
	movff	CACHE_LT7686_LINECOLOUR,LT7686_LINECOLOUR
	movff	CACHE_LT7686_LINECOLOUR_H,LT7686_LINECOLOUR_H
	movff	CACHE_LT7686_LINECOLOUR_U,LT7686_LINECOLOUR_U
	movff	CACHE_LT7686_LINECOLOUR_E,LT7686_LINECOLOUR_E
	banksel	0
	call	LINE_LT7686
;Line ( _xoffset1 + _Inxradius, _yoffset1, _xoffset1 + _Inxradius, _yoffset1 - _zoffset, cache_LT7686_LineColour )
	banksel	_INXRADIUS
	movf	_INXRADIUS,W,BANKED
	banksel	_XOFFSET1
	addwf	_XOFFSET1,W,BANKED
	banksel	XOFFSET1
	movwf	XOFFSET1,BANKED
	movf	_INXRADIUS_H,W,BANKED
	banksel	_XOFFSET1_H
	addwfc	_XOFFSET1_H,W,BANKED
	banksel	XOFFSET1_H
	movwf	XOFFSET1_H,BANKED
	movff	_YOFFSET1,YOFFSET1
	movff	_YOFFSET1_H,YOFFSET1_H
	movf	_INXRADIUS,W,BANKED
	banksel	_XOFFSET1
	addwf	_XOFFSET1,W,BANKED
	banksel	XOFFSET2
	movwf	XOFFSET2,BANKED
	movf	_INXRADIUS_H,W,BANKED
	banksel	_XOFFSET1_H
	addwfc	_XOFFSET1_H,W,BANKED
	banksel	XOFFSET2_H
	movwf	XOFFSET2_H,BANKED
	banksel	_ZOFFSET
	movf	_ZOFFSET,W,BANKED
	subwf	_YOFFSET1,W,BANKED
	banksel	YOFFSET2
	movwf	YOFFSET2,BANKED
	banksel	_ZOFFSET_H
	movf	_ZOFFSET_H,W,BANKED
	subwfb	_YOFFSET1_H,W,BANKED
	banksel	YOFFSET2_H
	movwf	YOFFSET2_H,BANKED
	movff	CACHE_LT7686_LINECOLOUR,LT7686_LINECOLOUR
	movff	CACHE_LT7686_LINECOLOUR_H,LT7686_LINECOLOUR_H
	movff	CACHE_LT7686_LINECOLOUR_U,LT7686_LINECOLOUR_U
	movff	CACHE_LT7686_LINECOLOUR_E,LT7686_LINECOLOUR_E
	banksel	0
	call	LINE_LT7686
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

;Source: GLCD_LT7686.H (686)
ELLIPSE_LT7686
;LT7686_CreateEllipse
;Macro Source: GLCD_LT7686.H (731)
;LT7686_WriteCMD(0x7B)
	movlw	123
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset1)
	movff	XOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7C)
	movlw	124
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset1_H)
	movff	XOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7D)
	movlw	125
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset1)
	movff	YOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7E)
	movlw	126
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset1_H)
	movff	YOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x77)
	movlw	119
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inxradius)
	movff	INXRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x78)
	movlw	120
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inxradius_H)
	movff	INXRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x79)
	movlw	121
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inyradius)
	movff	INYRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7A)
	movlw	122
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inyradius_H)
	movff	INYRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_SendColor
;Macro Source: GLCD_LT7686.H (1594)
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
;LT7686_WriteCMD(LT7686_REG_DCR1)
	movlw	118
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(0x80)//B1000_XXXX
	movlw	128
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

;Source: GLCD_LT7686.H (472)
FILLEDBOX_LT7686
;LT7686_CreateBox
;Macro Source: GLCD_LT7686.H (503)
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
;Macro Source: GLCD_LT7686.H (1594)
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
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

;Source: GLCD_LT7686.H (625)
FILLEDCIRCLE_LT7686
;LT7686_CreateCircle
;Macro Source: GLCD_LT7686.H (656)
;LT7686_WriteCMD(0x7B)
	movlw	123
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset1)
	movff	XOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7C)
	movlw	124
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset1_H)
	movff	XOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7D)
	movlw	125
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset1)
	movff	YOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7E)
	movlw	126
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset1_H)
	movff	YOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x77)
	movlw	119
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inxradius)
	movff	INXRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x78)
	movlw	120
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inxradius_H)
	movff	INXRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x79)
	movlw	121
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inxradius)
	movff	INXRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7A)
	movlw	122
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inxradius_H)
	movff	INXRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_SendColor
;Macro Source: GLCD_LT7686.H (1594)
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
;LT7686_WriteCMD(0x76)
	movlw	118
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(0xC0)//B1100_XXXX
	movlw	192
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

;Source: GLCD_LT7686.H (1240)
FILLEDCUBE_LT7686
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
;FilledBox(_xoffset1,_yoffset1,_xoffset5,_yoffset5, cache_LT7686_FillColour )
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
;Box(_xoffset1,_yoffset1,_xoffset5,_yoffset5, cache_LT7686_LineColour )
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
;FilledQuadrilateral (_xoffset1,_yoffset1, _xoffset2, _yoffset2, _xoffset3, _yoffset3 , _xoffset4, _yoffset4, cache_LT7686_FillColour)
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
;Quadrilateral(_xoffset1,_yoffset1, _xoffset2, _yoffset2, _xoffset3, _yoffset3 , _xoffset4, _yoffset4, cache_LT7686_LineColour)
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
;FilledQuadrilateral (_xoffset3,_yoffset3, _xoffset4, _yoffset4, _xoffset5, _yoffset5 , _xoffset6, _yoffset6, cache_LT7686_FillColour)
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
;Quadrilateral(_xoffset3,_yoffset3, _xoffset4, _yoffset4, _xoffset5, _yoffset5 , _xoffset6, _yoffset6, cache_LT7686_LineColour)
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

;Source: GLCD_LT7686.H (700)
FILLEDELLIPSE_LT7686
;LT7686_CreateEllipse
;Macro Source: GLCD_LT7686.H (731)
;LT7686_WriteCMD(0x7B)
	movlw	123
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset1)
	movff	XOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7C)
	movlw	124
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset1_H)
	movff	XOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7D)
	movlw	125
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset1)
	movff	YOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7E)
	movlw	126
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset1_H)
	movff	YOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x77)
	movlw	119
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inxradius)
	movff	INXRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x78)
	movlw	120
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inxradius_H)
	movff	INXRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x79)
	movlw	121
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inyradius)
	movff	INYRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7A)
	movlw	122
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inyradius_H)
	movff	INYRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_SendColor
;Macro Source: GLCD_LT7686.H (1594)
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
;LT7686_WriteCMD(LT7686_REG_DCR1)
	movlw	118
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(0xC0)//B1100_XXXX
	movlw	192
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

;Source: GLCD_LT7686.H (1000)
FILLEDLEFTDOWNCURVE_LT7686
;LT7686_CreateEllipse
;Macro Source: GLCD_LT7686.H (731)
;LT7686_WriteCMD(0x7B)
	movlw	123
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset1)
	movff	XOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7C)
	movlw	124
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset1_H)
	movff	XOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7D)
	movlw	125
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset1)
	movff	YOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7E)
	movlw	126
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset1_H)
	movff	YOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x77)
	movlw	119
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inxradius)
	movff	INXRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x78)
	movlw	120
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inxradius_H)
	movff	INXRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x79)
	movlw	121
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inyradius)
	movff	INYRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7A)
	movlw	122
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inyradius_H)
	movff	INYRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_SendColor
;Macro Source: GLCD_LT7686.H (1594)
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
;LT7686_WriteCMD(0x76)
	movlw	118
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(0xD0)//B1101_XX00
	movlw	208
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

;Source: GLCD_LT7686.H (985)
FILLEDLEFTUPCURVE_LT7686
;LT7686_CreateEllipse
;Macro Source: GLCD_LT7686.H (731)
;LT7686_WriteCMD(0x7B)
	movlw	123
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset1)
	movff	XOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7C)
	movlw	124
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset1_H)
	movff	XOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7D)
	movlw	125
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset1)
	movff	YOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7E)
	movlw	126
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset1_H)
	movff	YOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x77)
	movlw	119
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inxradius)
	movff	INXRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x78)
	movlw	120
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inxradius_H)
	movff	INXRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x79)
	movlw	121
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inyradius)
	movff	INYRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7A)
	movlw	122
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inyradius_H)
	movff	INYRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_SendColor
;Macro Source: GLCD_LT7686.H (1594)
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
;LT7686_WriteCMD(0x76)
	movlw	118
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(0xD1)//B1101_XX01
	movlw	209
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

;Source: GLCD_LT7686.H (1152)
FILLEDPENTAGON_LT7686
;LT7686_CreatePentagon
;Macro Source: GLCD_LT7686.H (1165)
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
;LT7686_WriteCMD(0x70)
	movlw	112
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset3)
	movff	XOFFSET3,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x71)
	movlw	113
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset3_H)
	movff	XOFFSET3_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x72)
	movlw	114
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset3)
	movff	YOFFSET3,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x73)
	movlw	115
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset3_H)
	movff	YOFFSET3_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x77)
	movlw	119
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset4)
	movff	XOFFSET4,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x78)
	movlw	120
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset4_H)
	movff	XOFFSET4_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x79)
	movlw	121
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset4)
	movff	YOFFSET4,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7A)
	movlw	122
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset4_H)
	movff	YOFFSET4_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7B)
	movlw	123
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset5)
	movff	XOFFSET5,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7C)
	movlw	124
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset5_H)
	movff	XOFFSET5_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7D)
	movlw	125
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset5)
	movff	YOFFSET5,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7E)
	movlw	126
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset5_H)
	movff	YOFFSET5_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_SendColor
;Macro Source: GLCD_LT7686.H (1594)
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
;LT7686_WriteCMD(0x67)
	movlw	103
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(0xa9)
	movlw	169
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

;Source: GLCD_LT7686.H (1063)
FILLEDQUADRILATERAL_LT7686
;LT7686_CreateQuadrilateral
;Macro Source: GLCD_LT7686.H (1075)
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
;LT7686_WriteCMD(0x70)
	movlw	112
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset3)
	movff	XOFFSET3,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x71)
	movlw	113
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset3_H)
	movff	XOFFSET3_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x72)
	movlw	114
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset3)
	movff	YOFFSET3,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x73)
	movlw	115
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset3_H)
	movff	YOFFSET3_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x77)
	movlw	119
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset4)
	movff	XOFFSET4,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x78)
	movlw	120
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset4_H)
	movff	XOFFSET4_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x79)
	movlw	121
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset4)
	movff	YOFFSET4,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7A)
	movlw	122
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset4_H)
	movff	YOFFSET4_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_SendColor
;Macro Source: GLCD_LT7686.H (1594)
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
;LT7686_WriteCMD(0x67)
	movlw	103
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(0xA6)
	movlw	166
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

;Source: GLCD_LT7686.H (1030)
FILLEDRIGHTDOWNCURVE_LT7686
;LT7686_CreateEllipse
;Macro Source: GLCD_LT7686.H (731)
;LT7686_WriteCMD(0x7B)
	movlw	123
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset1)
	movff	XOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7C)
	movlw	124
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset1_H)
	movff	XOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7D)
	movlw	125
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset1)
	movff	YOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7E)
	movlw	126
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset1_H)
	movff	YOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x77)
	movlw	119
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inxradius)
	movff	INXRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x78)
	movlw	120
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inxradius_H)
	movff	INXRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x79)
	movlw	121
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inyradius)
	movff	INYRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7A)
	movlw	122
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inyradius_H)
	movff	INYRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_SendColor
;Macro Source: GLCD_LT7686.H (1594)
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
;LT7686_WriteCMD(0x76)
	movlw	118
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(0xD3)//B1101_XX11
	movlw	211
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

;Source: GLCD_LT7686.H (1015)
FILLEDRIGHTUPCURVE_LT7686
;LT7686_CreateEllipse
;Macro Source: GLCD_LT7686.H (731)
;LT7686_WriteCMD(0x7B)
	movlw	123
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset1)
	movff	XOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7C)
	movlw	124
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset1_H)
	movff	XOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7D)
	movlw	125
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset1)
	movff	YOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7E)
	movlw	126
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset1_H)
	movff	YOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x77)
	movlw	119
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inxradius)
	movff	INXRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x78)
	movlw	120
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inxradius_H)
	movff	INXRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x79)
	movlw	121
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inyradius)
	movff	INYRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7A)
	movlw	122
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inyradius_H)
	movff	INYRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_SendColor
;Macro Source: GLCD_LT7686.H (1594)
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
;LT7686_WriteCMD(0x76)
	movlw	118
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(0xD2)//B1101_XX10
	movlw	210
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

;Source: GLCD_LT7686.H (777)
FILLEDROUNDRECT_LT7686
;LT7686_CreateRoundRect
;Macro Source: GLCD_LT7686.H (809)
;LT7686_CreateBox
;Macro Source: GLCD_LT7686.H (503)
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
;LT7686_WriteCMD(0x77)
	movlw	119
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inxradius)
	movff	INXRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x78)
	movlw	120
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inxradius_H)
	movff	INXRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x79)
	movlw	121
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inyradius)
	movff	INYRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7A)
	movlw	122
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inyradius_H)
	movff	INYRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_SendColor
;Macro Source: GLCD_LT7686.H (1594)
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
;LT7686_WriteCMD(LT7686_REG_DCR1)
	movlw	118
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(0xF0)//B1111_XXXX
	movlw	240
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

;Source: GLCD_LT7686.H (845)
FILLEDTRIANGLE_LT7686
;LT7686_CreateTriangle
;Macro Source: GLCD_LT7686.H (877)
;LT7686_CreateBox
;Macro Source: GLCD_LT7686.H (503)
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
;LT7686_WriteCMD(0x70)
	movlw	112
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset3)
	movff	XOFFSET3,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x71)
	movlw	113
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset3_H)
	movff	XOFFSET3_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x72)
	movlw	114
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset3)
	movff	YOFFSET3,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x73)
	movlw	115
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset3_H)
	movff	YOFFSET3_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_SendColor
;Macro Source: GLCD_LT7686.H (1594)
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
;LT7686_WriteCMD(0x67)
	movlw	103
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(0xA2)//B1010_0010
	movlw	162
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

;Source: GLCD_LT7686.H (488)
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
	call	FILLEDBOX_LT7686
;FilledBox ( _xoffset1 + _woffset, _yoffset1 + _woffset, _xoffset2 - _woffset, _yoffset2 - _woffset, cache_LT7686_FillColour )
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
	banksel	YOFFSET1
	movwf	YOFFSET1,BANKED
	banksel	_WOFFSET_H
	movf	_WOFFSET_H,W,BANKED
	addwfc	_YOFFSET1_H,W,BANKED
	banksel	YOFFSET1_H
	movwf	YOFFSET1_H,BANKED
	banksel	_WOFFSET
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
	banksel	YOFFSET2
	movwf	YOFFSET2,BANKED
	banksel	_WOFFSET_H
	movf	_WOFFSET_H,W,BANKED
	subwfb	_YOFFSET2_H,W,BANKED
	banksel	YOFFSET2_H
	movwf	YOFFSET2_H,BANKED
	movff	CACHE_LT7686_FILLCOLOUR,LT7686_LINECOLOUR
	movff	CACHE_LT7686_FILLCOLOUR_H,LT7686_LINECOLOUR_H
	movff	CACHE_LT7686_FILLCOLOUR_U,LT7686_LINECOLOUR_U
	movff	CACHE_LT7686_FILLCOLOUR_E,LT7686_LINECOLOUR_E
	banksel	0
	call	FILLEDBOX_LT7686
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

;Source: GLCD_LT7686.H (641)
FRAMEDFILLEDCIRCLE_LT7686
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
;FilledCircle ( xoffset1, yoffset1, ( _Inxradius  ), cache_LT7686_LineColour )
	movff	_INXRADIUS,INXRADIUS
	movff	_INXRADIUS_H,INXRADIUS_H
	movff	CACHE_LT7686_LINECOLOUR,LT7686_LINECOLOUR
	movff	CACHE_LT7686_LINECOLOUR_H,LT7686_LINECOLOUR_H
	movff	CACHE_LT7686_LINECOLOUR_U,LT7686_LINECOLOUR_U
	movff	CACHE_LT7686_LINECOLOUR_E,LT7686_LINECOLOUR_E
	call	FILLEDCIRCLE_LT7686
;FilledCircle ( xoffset1, yoffset1, _Inxradius - _woffset, cache_LT7686_FillColour )
	banksel	_WOFFSET
	movf	_WOFFSET,W,BANKED
	banksel	_INXRADIUS
	subwf	_INXRADIUS,W,BANKED
	movwf	INXRADIUS,ACCESS
	banksel	_WOFFSET_H
	movf	_WOFFSET_H,W,BANKED
	banksel	_INXRADIUS_H
	subwfb	_INXRADIUS_H,W,BANKED
	movwf	INXRADIUS_H,ACCESS
	movff	CACHE_LT7686_FILLCOLOUR,LT7686_LINECOLOUR
	movff	CACHE_LT7686_FILLCOLOUR_H,LT7686_LINECOLOUR_H
	movff	CACHE_LT7686_FILLCOLOUR_U,LT7686_LINECOLOUR_U
	movff	CACHE_LT7686_FILLCOLOUR_E,LT7686_LINECOLOUR_E
	banksel	0
	call	FILLEDCIRCLE_LT7686
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

;Source: GLCD_LT7686.H (794)
FRAMEDFILLEDROUNDRECT_LT7686
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
;FilledRoundRect ( _xoffset1, _yoffset1, _xoffset2, _yoffset2, Inxradius,  Inyradius , cache_LT7686_LineColour )
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
;FilledRoundRect ( _xoffset1 + _woffset, _yoffset1 + _woffset, _xoffset2 - _woffset, _yoffset2 - _woffset, Inxradius,  Inyradius , cache_LT7686_FillColour )
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
	banksel	YOFFSET1
	movwf	YOFFSET1,BANKED
	banksel	_WOFFSET_H
	movf	_WOFFSET_H,W,BANKED
	addwfc	_YOFFSET1_H,W,BANKED
	banksel	YOFFSET1_H
	movwf	YOFFSET1_H,BANKED
	banksel	_WOFFSET
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
	banksel	YOFFSET2
	movwf	YOFFSET2,BANKED
	banksel	_WOFFSET_H
	movf	_WOFFSET_H,W,BANKED
	subwfb	_YOFFSET2_H,W,BANKED
	banksel	YOFFSET2_H
	movwf	YOFFSET2_H,BANKED
	movff	CACHE_LT7686_FILLCOLOUR,LT7686_LINECOLOUR
	movff	CACHE_LT7686_FILLCOLOUR_H,LT7686_LINECOLOUR_H
	movff	CACHE_LT7686_FILLCOLOUR_U,LT7686_LINECOLOUR_U
	movff	CACHE_LT7686_FILLCOLOUR_E,LT7686_LINECOLOUR_E
	banksel	0
	rcall	FILLEDROUNDRECT_LT7686
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

;Source: GLCD_LT7686.H (861)
FRAMEDFILLEDTRIANGLE_LT7686
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
;FilledTriangle ( _xoffset1, _yoffset1, _xoffset2, _yoffset2, _xoffset3, _yoffset3, cache_LT7686_FillColour )
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
;Triangle ( _xoffset1, _yoffset1, _xoffset2, _yoffset2, _xoffset3, _yoffset3, cache_LT7686_LineColour )
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

;Source: gcbversionnumber.gcb (2)
FN_GCBBUILDSTR
;GCBBuildStr="1115"
	lfsr	1,GCBBUILDSTR
	movlw	low StringTable38
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable38
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable38
	movwf	TBLPTRU,ACCESS
	goto	SYSREADSTRING

;********************************************************************************

;Source: gcbversionnumber.gcb (5)
FN_GCBBUILDTIMESTR
;GCBBuildTimeStr="12-03-2024 16:42:19"
	lfsr	1,GCBBUILDTIMESTR
	movlw	low StringTable39
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable39
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable39
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

;Source: GLCD_LT7686.H (367)
GLCDCLS_LT7686
;Dim LT7686_LineColour as Long
;initialise global variable. Required variable for Circle In all DEVICE DRIVERS- DO NOT DELETE
;GLCD_yordinate = 0
	clrf	GLCD_YORDINATE,ACCESS
	clrf	GLCD_YORDINATE_H,ACCESS
;LT7686_Check_Busy_Draw
	call	LT7686_CHECK_BUSY_DRAW
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
;Macro Source: GLCD_LT7686.H (1594)
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
	call	LT7686_CHECK_BUSY_DRAW
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
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

;Source: GLCD_ILI9341.H (804)
GLCDDRAWCHAR_ILI9341
;This has got a tad complex
;We have three major pieces
;1 The preamble - this just adjusted color and the input character
;2 The code that deals with GCB fontset
;3 The code that deals with OLED fontset
;
;You can make independent change to section 2 and 3 but they are mutual exclusive with many common pieces
;dim CharCol, CharRow, GLCDTemp as word
;CharCode -= 15
	movlw	15
	subwf	CHARCODE,F,ACCESS
;CharCol=0
	clrf	CHARCOL,ACCESS
	clrf	CHARCOL_H,ACCESS
;if CharCode>=178 and CharCode<=202 then
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
	bra	ENDIF67
;CharLocY=CharLocY-1
	movlw	1
	subwf	CHARLOCY,F,ACCESS
	movlw	0
	subwfb	CHARLOCY_H,F,ACCESS
;end if
ENDIF67
;For CurrCharCol = 1 to 5
;Legacy method
	clrf	CURRCHARCOL,ACCESS
SysForLoop11
	incf	CURRCHARCOL,F,ACCESS
;Select Case CurrCharCol
;Case 1: ReadTable GLCDCharCol3, CharCode, CurrCharVal
SysSelect8Case1
	decf	CURRCHARCOL,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect8Case2
;Case 1: ReadTable GLCDCharCol3, CharCode, CurrCharVal
	movff	CHARCODE,SYSSTRINGA
	banksel	0
	rcall	GLCDCHARCOL3
	movwf	CURRCHARVAL,ACCESS
;Case 2: ReadTable GLCDCharCol4, CharCode, CurrCharVal
	bra	SysSelectEnd8
SysSelect8Case2
	movlw	2
	subwf	CURRCHARCOL,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect8Case3
;Case 2: ReadTable GLCDCharCol4, CharCode, CurrCharVal
	movff	CHARCODE,SYSSTRINGA
	banksel	0
	rcall	GLCDCHARCOL4
	movwf	CURRCHARVAL,ACCESS
;Case 3: ReadTable GLCDCharCol5, CharCode, CurrCharVal
	bra	SysSelectEnd8
SysSelect8Case3
	movlw	3
	subwf	CURRCHARCOL,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect8Case4
;Case 3: ReadTable GLCDCharCol5, CharCode, CurrCharVal
	movff	CHARCODE,SYSSTRINGA
	banksel	0
	rcall	GLCDCHARCOL5
	movwf	CURRCHARVAL,ACCESS
;Case 4: ReadTable GLCDCharCol6, CharCode, CurrCharVal
	bra	SysSelectEnd8
SysSelect8Case4
	movlw	4
	subwf	CURRCHARCOL,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect8Case5
;Case 4: ReadTable GLCDCharCol6, CharCode, CurrCharVal
	movff	CHARCODE,SYSSTRINGA
	banksel	0
	rcall	GLCDCHARCOL6
	movwf	CURRCHARVAL,ACCESS
;Case 5: ReadTable GLCDCharCol7, CharCode, CurrCharVal
	bra	SysSelectEnd8
SysSelect8Case5
	movlw	5
	subwf	CURRCHARCOL,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelectEnd8
;Case 5: ReadTable GLCDCharCol7, CharCode, CurrCharVal
	movff	CHARCODE,SYSSTRINGA
	banksel	0
	rcall	GLCDCHARCOL7
	movwf	CURRCHARVAL,ACCESS
;End Select
SysSelectEnd8
;CharRow=0
	clrf	CHARROW,ACCESS
	clrf	CHARROW_H,ACCESS
;For CurrCharRow = 1 to 8
;Legacy method
	clrf	CURRCHARROW,ACCESS
SysForLoop12
	incf	CURRCHARROW,F,ACCESS
;CharColS=0
	clrf	CHARCOLS,ACCESS
;For Col=1 to GLCDfntDefaultsize
;Legacy method
	clrf	COL,ACCESS
	movlw	1
	subwf	GLCDFNTDEFAULTSIZE,W,ACCESS
	btfss	STATUS, C,ACCESS
	bra	SysForLoopEnd13
SysForLoop13
	incf	COL,F,ACCESS
;CharColS +=1
	incf	CHARCOLS,F,ACCESS
;CharRowS=0
	clrf	CHARROWS,ACCESS
;For Row=1 to GLCDfntDefaultsize
;Legacy method
	banksel	ROW
	clrf	ROW,BANKED
	movlw	1
	subwf	GLCDFNTDEFAULTSIZE,W,ACCESS
	btfss	STATUS, C,ACCESS
	bra	SysForLoopEnd14
SysForLoop14
	incf	ROW,F,BANKED
;CharRowS +=1
	incf	CHARROWS,F,ACCESS
;if CurrCharVal.0=1 then
	btfss	CURRCHARVAL,0,ACCESS
	bra	ELSE70_1
;PSet [word]CharLocX + CharCol+ CharColS, [word]CharLocY + CharRow+CharRowS, LineColour
	movf	CHARCOL,W,ACCESS
	addwf	CHARLOCX,W,ACCESS
	movwf	SysTemp2,BANKED
	movf	CHARCOL_H,W,ACCESS
	addwfc	CHARLOCX_H,W,ACCESS
	movwf	SysTemp2_H,BANKED
	movf	CHARCOLS,W,ACCESS
	addwf	SysTemp2,W,BANKED
	movwf	XOFFSET1,BANKED
	movlw	0
	addwfc	SysTemp2_H,W,BANKED
	movwf	XOFFSET1_H,BANKED
	movf	CHARROW,W,ACCESS
	addwf	CHARLOCY,W,ACCESS
	movwf	SysTemp2,BANKED
	movf	CHARROW_H,W,ACCESS
	addwfc	CHARLOCY_H,W,ACCESS
	movwf	SysTemp2_H,BANKED
	movf	CHARROWS,W,ACCESS
	addwf	SysTemp2,W,BANKED
	movwf	YOFFSET1,BANKED
	movlw	0
	addwfc	SysTemp2_H,W,BANKED
	movwf	YOFFSET1_H,BANKED
	movff	LINECOLOUR,LT7686_LINECOLOUR
	movff	LINECOLOUR_H,LT7686_LINECOLOUR_H
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	PSET_LT7686
;Else
	bra	ENDIF70
ELSE70_1
;PSet [word]CharLocX + CharCol+ CharColS, [word]CharLocY + CharRow+CharRowS, GLCDBACKGROUND
	movf	CHARCOL,W,ACCESS
	addwf	CHARLOCX,W,ACCESS
	movwf	SysTemp2,BANKED
	movf	CHARCOL_H,W,ACCESS
	addwfc	CHARLOCX_H,W,ACCESS
	movwf	SysTemp2_H,BANKED
	movf	CHARCOLS,W,ACCESS
	addwf	SysTemp2,W,BANKED
	movwf	XOFFSET1,BANKED
	movlw	0
	addwfc	SysTemp2_H,W,BANKED
	movwf	XOFFSET1_H,BANKED
	movf	CHARROW,W,ACCESS
	addwf	CHARLOCY,W,ACCESS
	movwf	SysTemp2,BANKED
	movf	CHARROW_H,W,ACCESS
	addwfc	CHARLOCY_H,W,ACCESS
	movwf	SysTemp2_H,BANKED
	movf	CHARROWS,W,ACCESS
	addwf	SysTemp2,W,BANKED
	movwf	YOFFSET1,BANKED
	movlw	0
	addwfc	SysTemp2_H,W,BANKED
	movwf	YOFFSET1_H,BANKED
	movff	GLCDBACKGROUND,LT7686_LINECOLOUR
	movff	GLCDBACKGROUND_H,LT7686_LINECOLOUR_H
	clrf	LT7686_LINECOLOUR_U,BANKED
	clrf	LT7686_LINECOLOUR_E,BANKED
	banksel	0
	call	PSET_LT7686
;End if
ENDIF70
;Next Row
	movf	GLCDFNTDEFAULTSIZE,W,ACCESS
	banksel	ROW
	subwf	ROW,W,BANKED
	btfss	STATUS, C,ACCESS
	bra	SysForLoop14
SysForLoopEnd14
;Next Col
	movf	GLCDFNTDEFAULTSIZE,W,ACCESS
	subwf	COL,W,ACCESS
	btfss	STATUS, C,ACCESS
	bra	SysForLoop13
SysForLoopEnd13
;Rotate CurrCharVal Right
	rrcf	CURRCHARVAL,F,ACCESS
;CharRow +=GLCDfntDefaultsize
	movf	GLCDFNTDEFAULTSIZE,W,ACCESS
	addwf	CHARROW,F,ACCESS
	movlw	0
	addwfc	CHARROW_H,F,ACCESS
;Next
	movlw	8
	subwf	CURRCHARROW,W,ACCESS
	btfss	STATUS, C,ACCESS
	bra	SysForLoop12
SysForLoopEnd12
;CharCol +=GLCDfntDefaultsize
	movf	GLCDFNTDEFAULTSIZE,W,ACCESS
	addwf	CHARCOL,F,ACCESS
	movlw	0
	addwfc	CHARCOL_H,F,ACCESS
;Next
	movlw	5
	subwf	CURRCHARCOL,W,ACCESS
	btfss	STATUS, C,ACCESS
	bra	SysForLoop11
SysForLoopEnd11
	banksel	0
	return

;********************************************************************************

;Overloaded signature: WORD:WORD:STRING:WORD:, Source: glcd.h (1254)
GLCDPRINT9
;Dim GLCDPrintLoc as word
;GLCDPrintLen = LCDPrintData(0)
	movff	SysLCDPRINTDATAHandler,AFSR0
	movff	SysLCDPRINTDATAHandler_H,AFSR0_H
	movff	INDF0,GLCDPRINTLEN
;If GLCDPrintLen = 0 Then Exit Sub
	movf	GLCDPRINTLEN,F,ACCESS
	btfsc	STATUS, Z,ACCESS
;If GLCDPrintLen = 0 Then Exit Sub
	return
;If GLCDPrintLen = 0 Then Exit Sub
;GLCDPrintLoc = PrintLocX
	movff	PRINTLOCX,GLCDPRINTLOC
	movff	PRINTLOCX_H,GLCDPRINTLOC_H
;Write Data
;For GLCDPrint_String_Counter = 1 To GLCDPrintLen
;Legacy method
	clrf	GLCDPRINT_STRING_COUNTER,ACCESS
	movlw	1
	subwf	GLCDPRINTLEN,W,ACCESS
	btfss	STATUS, C,ACCESS
	bra	SysForLoopEnd6
SysForLoop6
	incf	GLCDPRINT_STRING_COUNTER,F,ACCESS
;GLCDDrawChar GLCDPrintLoc, PrintLocY, LCDPrintData(GLCDPrint_String_Counter), LineColour
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
;GLCDPrintIncrementPixelPositionMacro
;Macro Source: glcd.h (1462)
;GLCDPrintLoc = GLCDPrintLoc + ( GLCDFontWidth * GLCDfntDefaultsize )+1
	movf	GLCDFONTWIDTH,W,ACCESS
	mulwf	GLCDFNTDEFAULTSIZE,ACCESS
	movff	PRODL,SysTemp2
	banksel	SYSTEMP2
	movf	SysTemp2,W,BANKED
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
;Next
	movf	GLCDPRINTLEN,W,ACCESS
	subwf	GLCDPRINT_STRING_COUNTER,W,ACCESS
	btfss	STATUS, C,ACCESS
	bra	SysForLoop6
SysForLoopEnd6
;Update the current X position for GLCDPrintString
;PrintLocX = GLCDPrintLoc
	movff	GLCDPRINTLOC,PRINTLOCX
	movff	GLCDPRINTLOC_H,PRINTLOCX_H
	banksel	0
	return

;********************************************************************************

;Source: GLCD_LT7686.H (1691)
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
	call	FN_LT7686_DATAREAD
	movff	LT7686_DATAREAD,__TEMP_LT7686
;LT7686_WriteCMD(LT7686_REG_DPCR)
	movlw	18
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;_temp_LT7686 = LT7686_DataRead()
	call	FN_LT7686_DATAREAD
	movff	LT7686_DATAREAD,_TEMP_LT7686
;select case GLCDRotateState
;case PORTRAIT
SysSelect9Case1
	movlw	4
	subwf	GLCDROTATESTATE,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect9Case2
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
	bra	SysSelectEnd9
SysSelect9Case2
	decf	GLCDROTATESTATE,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect9Case3
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
	bra	SysSelectEnd9
SysSelect9Case3
	movlw	2
	subwf	GLCDROTATESTATE,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect9Case4
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
	bra	SysSelectEnd9
SysSelect9Case4
	movlw	3
	subwf	GLCDROTATESTATE,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect9Case5
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
	bra	SysSelectEnd9
SysSelect9Case5
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
SysSelectEnd9
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
	call	LT7686_CHECK_BUSY_DRAW
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
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

;Overloaded signature: STRING:byte:, Source: usart.h (3298)
HSERPRINT419
;PrintLen = PrintData(0)
	movff	SysPRINTDATAHandler,AFSR0
	movff	SysPRINTDATAHandler_H,AFSR0_H
	movff	INDF0,PRINTLEN
;If PrintLen <> 0 then
	banksel	PRINTLEN
	movf	PRINTLEN,F,BANKED
	btfsc	STATUS, Z,ACCESS
	bra	ENDIF50
;Write Data
;for SysPrintTemp = 1 to PrintLen
;Legacy method
	clrf	SYSPRINTTEMP,BANKED
	movlw	1
	subwf	PRINTLEN,W,BANKED
	btfss	STATUS, C,ACCESS
	bra	SysForLoopEnd9
SysForLoop9
	incf	SYSPRINTTEMP,F,BANKED
;HSerSend(PrintData(SysPrintTemp),comport )
	movf	SYSPRINTTEMP,W,BANKED
	addwf	SysPRINTDATAHandler,W,BANKED
	movwf	AFSR0,ACCESS
	movlw	0
	addwfc	SysPRINTDATAHandler_H,W,BANKED
	movwf	AFSR0_H,ACCESS
	movff	INDF0,SERDATA
	banksel	0
	rcall	HSERSEND407
;next
	banksel	PRINTLEN
	movf	PRINTLEN,W,BANKED
	subwf	SYSPRINTTEMP,W,BANKED
	btfss	STATUS, C,ACCESS
	bra	SysForLoop9
SysForLoopEnd9
;End If
ENDIF50
;CR
;All Usarts
;--------------------------
;Specific USARTs
;------------------
	banksel	0
	return

;********************************************************************************

;Source: usart.h (3506)
HSERPRINTCRLF
;repeat HSerPrintCRLFCount
	movff	HSERPRINTCRLFCOUNT,SysRepeatTemp4
	banksel	SYSREPEATTEMP4
	movf	SYSREPEATTEMP4,F,BANKED
	btfsc	STATUS, Z,ACCESS
	bra	SysRepeatLoopEnd4
SysRepeatLoop4
;HSerSend(13,comport)
	movlw	13
	movwf	SERDATA,BANKED
	banksel	0
	rcall	HSERSEND407
;HSerSend(10,comport)
	movlw	10
	banksel	SERDATA
	movwf	SERDATA,BANKED
	banksel	0
	rcall	HSERSEND407
;end Repeat
	banksel	SYSREPEATTEMP4
	decfsz	SysRepeatTemp4,F,BANKED
	bra	SysRepeatLoop4
SysRepeatLoopEnd4
	banksel	0
	return

;********************************************************************************

;Source: usart.h (3281)
HSERPRINTSTRINGCRLF
;PrintLen = PrintData(0)
	movff	SysPRINTDATAHandler,AFSR0
	movff	SysPRINTDATAHandler_H,AFSR0_H
	movff	INDF0,PRINTLEN
;If PrintLen <> 0 then
	banksel	PRINTLEN
	movf	PRINTLEN,F,BANKED
	btfsc	STATUS, Z,ACCESS
	bra	ENDIF47
;Write Data
;for SysPrintTemp = 1 to PrintLen
;Legacy method
	clrf	SYSPRINTTEMP,BANKED
	movlw	1
	subwf	PRINTLEN,W,BANKED
	btfss	STATUS, C,ACCESS
	bra	SysForLoopEnd8
SysForLoop8
	incf	SYSPRINTTEMP,F,BANKED
;HSerSend(PrintData(SysPrintTemp),comport )
	movf	SYSPRINTTEMP,W,BANKED
	addwf	SysPRINTDATAHandler,W,BANKED
	movwf	AFSR0,ACCESS
	movlw	0
	addwfc	SysPRINTDATAHandler_H,W,BANKED
	movwf	AFSR0_H,ACCESS
	movff	INDF0,SERDATA
	banksel	0
	rcall	HSERSEND407
;next
	banksel	PRINTLEN
	movf	PRINTLEN,W,BANKED
	subwf	SYSPRINTTEMP,W,BANKED
	btfss	STATUS, C,ACCESS
	bra	SysForLoop8
SysForLoopEnd8
;End If
ENDIF47
;HSerSend(13,comport)
	movlw	13
	movwf	SERDATA,BANKED
	banksel	0
	rcall	HSERSEND407
;HSerSend(10,comport)
	movlw	10
	banksel	SERDATA
	movwf	SERDATA,BANKED
	banksel	0
	bra	HSERSEND407

;********************************************************************************

;Overloaded signature: BYTE:byte:, Source: usart.h (1993)
HSERSEND407
HSERSENDUSART1HANDLER
;USART_TX_BLOCKING
;Wait While TXIF = Off
SysWaitLoop2
	btfss	PIR4,U1TXIF,ACCESS
	bra	SysWaitLoop2
;TXREG = SerData
	movff	SERDATA,U1TXB
	return

;********************************************************************************

;Source: GLCD_ILI9341.H (214)
INITGLCD_ILI9341
	return

;********************************************************************************

;Source: GLCD_LT7686.H (32)
INITGLCD_LT7686
;HserPrintCRLF
	movlw	1
	movwf	HSERPRINTCRLFCOUNT,ACCESS
	movlw	1
	movwf	COMPORT,ACCESS
	rcall	HSERPRINTCRLF
;HSerPrintStringCRLF "InitGLCD_LT7686()"
	lfsr	1,SYSSTRINGPARAM2
	movlw	low StringTable206
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable206
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable206
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM2
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM2
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM2*17
	banksel	0
	rcall	HSERPRINTSTRINGCRLF
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
;Software SPI
;Force SPI SCK to known state for SPI MODE
;LT7686_SCK = 1
	bsf	LATC,3,ACCESS
;HSerPrintStringCRLF "SW SPIMODE Initialised SPI clockmode = " + ByteToString(LT7686_SPICLOCKMODE)
	movlw	3
	banksel	SYSVALTEMP
	movwf	SYSVALTEMP,BANKED
	clrf	SYSVALTEMP_H,BANKED
	banksel	0
	call	FN_STR
	lfsr	1,SYSSTRINGPARAM2
	clrf	SysStringLength,ACCESS
	movlw	low StringTable210
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable210
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable210
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,STR
	call	SYSCOPYSTRINGPART
	lfsr	0,SYSSTRINGPARAM2
	movff	SysStringLength, INDF0
	movlw	low SYSSTRINGPARAM2
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM2
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM2*39
	banksel	0
	rcall	HSERPRINTSTRINGCRLF
;Physical reset before any GLCD comms
;Repeat 3
	movlw	3
	banksel	SYSREPEATTEMP11
	movwf	SysRepeatTemp11,BANKED
SysRepeatLoop11
;LT7686_RST = 1
	bsf	LATB,5,ACCESS
;Wait 50 ms
	movlw	50
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	banksel	0
	call	Delay_MS
;LT7686_RST = 0
	bcf	LATB,5,ACCESS
;Wait 100 ms
	movlw	100
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	call	Delay_MS
;LT7686_RST = 1
	bsf	LATB,5,ACCESS
;Wait 50 ms
	movlw	50
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	call	Delay_MS
;End Repeat
	banksel	SYSREPEATTEMP11
	decfsz	SysRepeatTemp11,F,BANKED
	bra	SysRepeatLoop11
SysRepeatLoopEnd11
;HSerPrint "LT7686_Software_Reset called..."
	lfsr	1,SYSSTRINGPARAM2
	movlw	low StringTable211
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable211
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable211
	movwf	TBLPTRU,ACCESS
	banksel	0
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM2
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM2
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM2*31
	banksel	0
	rcall	HSERPRINT419
;LT7686_Software_Reset
	call	LT7686_SOFTWARE_RESET
;wait 10 ms
	movlw	10
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	call	Delay_MS
;HSerPrintStringCRLF "LT7686_Software_Reset initialised..."
	lfsr	1,SYSSTRINGPARAM2
	movlw	low StringTable212
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable212
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable212
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM2
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM2
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM2*36
	banksel	0
	rcall	HSERPRINTSTRINGCRLF
;Dim GLCDbackground, GLCDForeground as Long
;HSerPrint "LT7686_Check_Init commenced..."
	lfsr	1,SYSSTRINGPARAM2
	movlw	low StringTable213
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable213
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable213
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM2
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM2
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM2*30
	banksel	0
	rcall	HSERPRINT419
;! This could be a dead lock as the GLCD needs to respond - user can check value of LT7686_CHECKATTEMPTS and LT7686_Check_Init_Counter
;Do While LT7686_Check_Init = False
SysDoLoop_S5
	rcall	FN_LT7686_CHECK_INIT
	movf	LT7686_CHECK_INIT,F,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysDoLoop_E5
;Loop
	bra	SysDoLoop_S5
SysDoLoop_E5
;HSerPrintStringCRLF "LT7686_Check_Init completed..."
	lfsr	1,SYSSTRINGPARAM2
	movlw	low StringTable214
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable214
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable214
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM2
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM2
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM2*30
	banksel	0
	rcall	HSERPRINTSTRINGCRLF
;HSerPrintStringCRLF "LT7686_Check_Init result [LT7686_Check_Init_Counter = " + ByteToString(LT7686_Check_Init_Counter) + "]"
	movff	LT7686_CHECK_INIT_COUNTER,SYSVALTEMP
	banksel	SYSVALTEMP_H
	clrf	SYSVALTEMP_H,BANKED
	banksel	0
	call	FN_STR
	lfsr	1,SYSSTRINGPARAM2
	clrf	SysStringLength,ACCESS
	movlw	low StringTable215
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable215
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable215
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,STR
	call	SYSCOPYSTRINGPART
	movlw	low StringTable113
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable113
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable113
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,SYSSTRINGPARAM2
	movff	SysStringLength, INDF0
	movlw	low SYSSTRINGPARAM2
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM2
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM2*54
	banksel	0
	rcall	HSERPRINTSTRINGCRLF
;If LT7686_CHECKATTEMPTS = LT7686_Check_Init_Counter Then
	movlw	20
	subwf	LT7686_CHECK_INIT_COUNTER,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	ENDIF85
;HSerPrintStringCRLF ByteToString(LT7686_Check_Init_Counter) + " is an Initialisation failure- check power etc."
	movff	LT7686_CHECK_INIT_COUNTER,SYSVALTEMP
	banksel	SYSVALTEMP_H
	clrf	SYSVALTEMP_H,BANKED
	banksel	0
	call	FN_STR
	lfsr	1,SYSSTRINGPARAM2
	clrf	SysStringLength,ACCESS
	lfsr	0,STR
	call	SYSCOPYSTRINGPART
	movlw	low StringTable216
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable216
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable216
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,SYSSTRINGPARAM2
	movff	SysStringLength, INDF0
	movlw	low SYSSTRINGPARAM2
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM2
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM2*0
	banksel	0
	rcall	HSERPRINTSTRINGCRLF
;End If
ENDIF85
;#IFDEF SERIALDEBUG
;HSerPrint "LT7686_LoadDefaultRegisters called..."
;#ENDIF
;LT7686_LoadDefaultRegisters
;#IFDEF SERIALDEBUG
;HSerPrintStringCRLF "LT7686_LoadDefaultRegisters initialised..."
;#ENDIF
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

;Source: GLCDProgram.gcb (27)
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
	banksel	0
	return

;********************************************************************************

;Source: random.h (35)
INITRANDOM
;Dim RandomSeed As Word
;RandomSeed = RandStart
	movlw	1
	banksel	RANDOMSEED
	movwf	RANDOMSEED,BANKED
	movlw	190
	movwf	RANDOMSEED_H,BANKED
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

;Source: GLCD_LT7686.H (940)
LEFTDOWNCURVE_LT7686
;LT7686_CreateEllipse
;Macro Source: GLCD_LT7686.H (731)
;LT7686_WriteCMD(0x7B)
	movlw	123
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset1)
	movff	XOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7C)
	movlw	124
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset1_H)
	movff	XOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7D)
	movlw	125
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset1)
	movff	YOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7E)
	movlw	126
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset1_H)
	movff	YOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x77)
	movlw	119
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inxradius)
	movff	INXRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x78)
	movlw	120
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inxradius_H)
	movff	INXRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x79)
	movlw	121
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inyradius)
	movff	INYRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7A)
	movlw	122
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inyradius_H)
	movff	INYRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_SendColor
;Macro Source: GLCD_LT7686.H (1594)
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
;LT7686_WriteCMD(0x76)
	movlw	118
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(0x90)//B1001_XX00
	movlw	144
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	bra	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

;Source: GLCD_LT7686.H (925)
LEFTUPCURVE_LT7686
;LT7686_CreateEllipse
;Macro Source: GLCD_LT7686.H (731)
;LT7686_WriteCMD(0x7B)
	movlw	123
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset1)
	movff	XOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7C)
	movlw	124
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset1_H)
	movff	XOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7D)
	movlw	125
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset1)
	movff	YOFFSET1,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7E)
	movlw	126
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset1_H)
	movff	YOFFSET1_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x77)
	movlw	119
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inxradius)
	movff	INXRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x78)
	movlw	120
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inxradius_H)
	movff	INXRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x79)
	movlw	121
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inyradius)
	movff	INYRADIUS,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7A)
	movlw	122
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(Inyradius_H)
	movff	INYRADIUS_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_SendColor
;Macro Source: GLCD_LT7686.H (1594)
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
;LT7686_WriteCMD(0x76)
	movlw	118
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(0x91)//B1001_XX01
	movlw	145
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	bra	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

;Source: GLCD_LT7686.H (533)
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
;Macro Source: GLCD_LT7686.H (1594)
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
;LT7686_WriteCMD(0x67)
	movlw	103
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(0x80)
	movlw	128
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	bra	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

;Source: GLCD_LT7686.H (573)
LINE_WIDTH_LT7686
;Uses factorisation for integer support
;Dim xtemp, ytemp, wtemp as Integer
;Dim temp_LT7686 as Integer
;xtemp = ( _xoffset2 - _xoffset1 )
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
;ytemp = ( _yoffset2 - _yoffset1 ) * 10  // Y factorised by 10
	banksel	_YOFFSET1
	movf	_YOFFSET1,W,BANKED
	subwf	_YOFFSET2,W,BANKED
	banksel	SYSTEMP2
	movwf	SysTemp2,BANKED
	banksel	_YOFFSET1_H
	movf	_YOFFSET1_H,W,BANKED
	subwfb	_YOFFSET2_H,W,BANKED
	banksel	SYSTEMP2_H
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
	bra	ELSE55_1
;this is factorised by 10
;temp_LT7686 = 20
	movlw	20
	banksel	TEMP_LT7686
	movwf	TEMP_LT7686,BANKED
	clrf	TEMP_LT7686_H,BANKED
;else
	bra	ENDIF55
ELSE55_1
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
ENDIF55
;if  ( ABS( temp_LT7686 ) <= 10 ) Then   // factorised by 10
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
	bra	ELSE56_1
;do while ( _woffset > 0)
SysDoLoop_S2
	movff	_woffset,SysWORDTempB
	movff	_woffset_H,SysWORDTempB_H
	clrf	SysWORDTempA,ACCESS
	clrf	SysWORDTempA_H,ACCESS
	banksel	0
	call	SYSCOMPLESSTHAN16
	btfss	SysByteTempX,0,ACCESS
	bra	SysDoLoop_E2
;_woffset--
	movlw	1
	banksel	_WOFFSET
	subwf	_WOFFSET,F,BANKED
	movlw	0
	subwfb	_WOFFSET_H,F,BANKED
;Line( _xoffset1, _yoffset1+wtemp, _xoffset2, _yoffset2+wtemp, LT7686_LineColour)
	movff	_XOFFSET1,XOFFSET1
	movff	_XOFFSET1_H,XOFFSET1_H
	banksel	WTEMP
	movf	WTEMP,W,BANKED
	banksel	_YOFFSET1
	addwf	_YOFFSET1,W,BANKED
	banksel	YOFFSET1
	movwf	YOFFSET1,BANKED
	movf	WTEMP_H,W,BANKED
	banksel	_YOFFSET1_H
	addwfc	_YOFFSET1_H,W,BANKED
	banksel	YOFFSET1_H
	movwf	YOFFSET1_H,BANKED
	movff	_XOFFSET2,XOFFSET2
	movff	_XOFFSET2_H,XOFFSET2_H
	movf	WTEMP,W,BANKED
	banksel	_YOFFSET2
	addwf	_YOFFSET2,W,BANKED
	banksel	YOFFSET2
	movwf	YOFFSET2,BANKED
	movf	WTEMP_H,W,BANKED
	banksel	_YOFFSET2_H
	addwfc	_YOFFSET2_H,W,BANKED
	banksel	YOFFSET2_H
	movwf	YOFFSET2_H,BANKED
	banksel	0
	rcall	LINE_LT7686
;wtemp++
	banksel	WTEMP
	incf	WTEMP,F,BANKED
	btfsc	STATUS,Z,ACCESS
	incf	WTEMP_H,F,BANKED
;Loop	
	bra	SysDoLoop_S2
SysDoLoop_E2
;else
	bra	ENDIF56
ELSE56_1
;Do while ( _woffset > 0)
SysDoLoop_S3
	movff	_woffset,SysWORDTempB
	movff	_woffset_H,SysWORDTempB_H
	clrf	SysWORDTempA,ACCESS
	clrf	SysWORDTempA_H,ACCESS
	banksel	0
	call	SYSCOMPLESSTHAN16
	btfss	SysByteTempX,0,ACCESS
	bra	SysDoLoop_E3
;_woffset--
	movlw	1
	banksel	_WOFFSET
	subwf	_WOFFSET,F,BANKED
	movlw	0
	subwfb	_WOFFSET_H,F,BANKED
;Line( _xoffset1+wtemp, _yoffset1, _xoffset2+wtemp, _yoffset2, LT7686_LineColour)
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
;wtemp++
	banksel	WTEMP
	incf	WTEMP,F,BANKED
	btfsc	STATUS,Z,ACCESS
	incf	WTEMP_H,F,BANKED
;Loop	
	bra	SysDoLoop_S3
SysDoLoop_E3
;End if
ENDIF56
	return

;********************************************************************************

;Source: GLCD_LT7686.H (2117)
LT7686_CHECK_BUSY_DRAW
;do while  ( ( LT7686_StatusRead() & 0x08 ) = 0x08 )
SysDoLoop_S4
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
	bra	SysDoLoop_E4
;wait 10 us
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS27
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS27
;loop
	bra	SysDoLoop_S4
SysDoLoop_E4
	return

;********************************************************************************

;Source: GLCD_LT7686.H (1785)
FN_LT7686_CHECK_INIT
;Reuse variables to save RAM
;Dim LT7686_Check_Init_Fail, LT7686_StatusReadResult, LT7686_Check_Init_Counter as Byte
;LT7686_Check_Init = False
	clrf	LT7686_CHECK_INIT,ACCESS
;LT7686_Check_Init_Counter = 0
	clrf	LT7686_CHECK_INIT_COUNTER,ACCESS
;LT7686_Check_Init_Fail = 0
	clrf	LT7686_CHECK_INIT_FAIL,ACCESS
;write to Set the PPL on
;LT7686_WriteCMD(0x01)
	movlw	1
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(0x80)
	movlw	128
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
;wait 10 us
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS28
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS28
;do
SysDoLoop_S7
;Increment the exit counters... to ensure this is NOT a deadlock
;LT7686_Check_Init_Counter++
	incf	LT7686_CHECK_INIT_COUNTER,F,ACCESS
;LT7686_Check_Init_Fail++
	incf	LT7686_CHECK_INIT_FAIL,F,ACCESS
;LT7686_StatusReadResult = LT7686_StatusRead
	banksel	0
	call	FN_LT7686_STATUSREAD
	movff	LT7686_STATUSREAD,LT7686_STATUSREADRESULT
;if ( LT7686_StatusReadResult & 0x02 ) = 0x00 and LT7686_Check_Init_Fail < LT7686_CHECKATTEMPTS Then
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
	bra	ELSE86_1
;check the PPL is operating and the Operation Mode Status
;0: Normal operation state
;1: Inhibit operation state
;Table 19-2: Status Register (STSR) Bit 1 needs to 0x00
;
;wait 10 us
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS29
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS29
;LT7686_WriteCMD( 0x01 )
	movlw	1
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;Check if REG[01h] Chip Configuration Register (CCR) - PLL is ready
;if ( ( LT7686_DataRead() & 0x80 ) = 0x80 ) Then
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
	bra	ENDIF88
;LT7686_Check_Init = True
	setf	LT7686_CHECK_INIT,ACCESS
;exit Sub
	return
;end if
ENDIF88
;else
	bra	ENDIF86
ELSE86_1
;write to Set the PPL on
;wait 10 us
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS30
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS30
;LT7686_WriteCMD(0x01)
	movlw	1
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(0x80)
	movlw	128
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
;end if
ENDIF86
;if LT7686_Check_Init = 0 & LT7686_Check_Init_Fail = 5 Then
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
	bra	ENDIF87
;LT7686_Hardware_Reset
	banksel	0
	rcall	LT7686_HARDWARE_RESET
;wait 10 ms
	movlw	10
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	call	Delay_MS
;LT7686_Software_Reset
	call	LT7686_SOFTWARE_RESET
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
	call	LT7686_WRITECMD
;LT7686_WriteData ( 0x01 )
	movlw	1
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
;wait 10 ms
	movlw	10
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	call	Delay_MS
;LT7686_Check_Init_Fail = 0
	clrf	LT7686_CHECK_INIT_FAIL,ACCESS
;End if
ENDIF87
;Loop while ( LT7686_Check_Init = 0 & LT7686_Check_Init_Counter <> LT7686_CHECKATTEMPTS )
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
	bra	SysDoLoop_S7
SysDoLoop_E7
;! But, this is failure to init
;LT7686_Check_Init = True
	setf	LT7686_CHECK_INIT,ACCESS
	banksel	0
	return

;********************************************************************************

;Source: GLCD_LT7686.H (1974)
FN_LT7686_DATAREAD
;dim __LT7686_outbuffer as Byte
;LT7686_CS = 0
	bcf	LATA,3,ACCESS
;Wait LT7686_STATE1_DELAY us
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS19
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS19
;__LT7686_outbuffer = 0xC0
	movlw	192
	banksel	__LT7686_OUTBUFFER
	movwf	__LT7686_OUTBUFFER,BANKED
;repeat 8
	movlw	8
	banksel	SYSREPEATTEMP9
	movwf	SysRepeatTemp9,BANKED
SysRepeatLoop9
;if __LT7686_outbuffer.7 = ON  then
	banksel	__LT7686_OUTBUFFER
	btfss	__LT7686_OUTBUFFER,7,BANKED
	bra	ELSE65_1
;set LT7686_DO ON
	bsf	LATB,0,ACCESS
;else
	bra	ENDIF65
ELSE65_1
;set LT7686_DO OFF
	bcf	LATB,0,ACCESS
;end if
ENDIF65
;SET LT7686_SCK STATE1
	bcf	LATC,3,ACCESS
;Wait LT7686_STATE1_DELAY us
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS20
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS20
;rotate __LT7686_outbuffer left
	rlcf	__LT7686_OUTBUFFER,F,BANKED
;SET LT7686_SCK STATE2
	bsf	LATC,3,ACCESS
;Wait LT7686_STATE2_DELAY us
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS21
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS21
;end repeat
	banksel	SYSREPEATTEMP9
	decfsz	SysRepeatTemp9,F,BANKED
	bra	SysRepeatLoop9
SysRepeatLoopEnd9
;Dir LT7686_DI In
	bsf	TRISC,4,ACCESS
;Wait LT7686_STATE2_DELAY us
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS22
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS22
;repeat 8
	movlw	8
	movwf	SysRepeatTemp9,BANKED
SysRepeatLoop10
;LT7686_DO = 0
	bcf	LATB,0,ACCESS
;SET LT7686_SCK STATE1
	bcf	LATC,3,ACCESS
;Wait LT7686_STATE1_DELAY us
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS23
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS23
;Set C Off
	bcf	STATUS,C,ACCESS
;rotate LT7686_DataRead left
	rlcf	LT7686_DATAREAD,F,ACCESS
;if LT7686_DI = On then
	btfss	PORTC,4,ACCESS
	bra	ELSE66_1
;set LT7686_DataRead.0 On
	bsf	LT7686_DATAREAD,0,ACCESS
;Else
	bra	ENDIF66
ELSE66_1
;set LT7686_DataRead.0 Off
	bcf	LT7686_DATAREAD,0,ACCESS
;end if
ENDIF66
;SET LT7686_SCK STATE2
	bsf	LATC,3,ACCESS
;Wait LT7686_STATE2_DELAY us
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS24
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS24
;end repeat
	decfsz	SysRepeatTemp9,F,BANKED
	bra	SysRepeatLoop10
SysRepeatLoopEnd10
;Wait While LT7686_SCK <> STATE2
SysWaitLoop1
	btfss	PORTC,3,ACCESS
	bra	SysWaitLoop1
;Wait LT7686_STATE1_DELAY us
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS25
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS25
;set LT7686_DO OFF
	bcf	LATB,0,ACCESS
;Wait LT7686_STATE1_DELAY us
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS26
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS26
;LT7686_CS = 1
	bsf	LATA,3,ACCESS
	banksel	0
	return

;********************************************************************************

;Source: GLCD_LT7686.H (251)
LT7686_DISPLAY_COLORBAR
;This method destroys the state of LT7686_Display_ColorBar_State to save a byte of RAM.
;LT7686_WriteCMD( LT7686_REG_DPCR )
	movlw	18
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;If LT7686_Display_ColorBar_State = True Then
	incf	LT7686_DISPLAY_COLORBAR_STATE,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	ELSE53_1
;LT7686_Display_ColorBar_State = LT7686_DataRead()
	rcall	FN_LT7686_DATAREAD
	movff	LT7686_DATAREAD,LT7686_DISPLAY_COLORBAR_STATE
;LT7686_Display_ColorBar_State = LT7686_Display_ColorBar_State OR LT7686_SETB5
	movlw	32
	iorwf	LT7686_DISPLAY_COLORBAR_STATE,F,ACCESS
;Else
	bra	ENDIF53
ELSE53_1
;LT7686_Display_ColorBar_State = LT7686_DataRead()
	rcall	FN_LT7686_DATAREAD
	movff	LT7686_DATAREAD,LT7686_DISPLAY_COLORBAR_STATE
;LT7686_Display_ColorBar_State = LT7686_Display_ColorBar_State AND LT7686_CLRB5
	movlw	223
	andwf	LT7686_DISPLAY_COLORBAR_STATE,F,ACCESS
;End If
ENDIF53
;LT7686_WriteCMD( LT7686_REG_DPCR )
	movlw	18
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData( LT7686_Display_ColorBar_State )
	movff	LT7686_DISPLAY_COLORBAR_STATE,__OUTBYTE
	call	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	bra	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

;Source: GLCD_LT7686.H (1757)
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
	movlw	106
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
	db	105,0,17,5,19,138,170,170,170,170,17,5,18,138,17,6,19,51,17,7,19,138,17,8,19,100
	db	17,9,19,138,17,10,19,80,17,0,19,128,170,170,170,170,17,1,19,146,17,1,18,146,17,2
	db	19,64,170,170,170,170,17,224,19,41,17,225,19,3,17,226,19,11,17,227,19,3,17,228
	db	19,1,170,170,170,170,170,170,170,170,170,170,170,170,17,16,19,4,17,18,19,128,17,19
	db	19,0,17,20,19,127,17,21,19,0,17,26,19,87,17,27,19,2,17,22,19,16,17,23,19,4,17,24
	db	19,19,17,25,19,1,17,28,19,19,17,29,19,0,17,30,19,11,17,31,19,2,17,187,19,1,17,32
	db	19,0,17,33,19,0,17,34,19,0,17,35,19,0,17,36,19,0,17,37,19,4,17,38,19,0,17,39,19,0
	db	17,40,19,0,17,41,19,0,170,170,170,170,17,80,19,0,17,81,19,0,17,82,19,0,17,83,19,0
	db	17,84,19,0,17,85,19,4,17,86,19,0,17,87,19,0,17,88,19,0,17,89,19,0,17,90,19,0,17,91
	db	19,4,17,92,19,88,17,93,19,2,17,94,19,1,17,188,19,0,17,189,19,2,17,190,19,0,17,191
	db	19,0,17,192,19,0,17,193,19,0,17,194,19,0,17,195,19,0,17,198,19,0,17,199,19,4,17,200
	db	19,88,17,201,19,2,17,202,19,0,17,203,19,4,17,183,19,192,170,170,170,170,17,18
	db	19,192,170,170,170,170,17,132,19,19,17,133,19,10,17,135,19,0,17,140,19,100,17,141
	db	19,0,17,142,19,70,17,143,19,0,17,134,19,48

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

;Source: GLCD_LT7686.H (152)
LT7686_LOADDEFAULTREGISTERS
;Reuse variables to reduce RAM
;Dim LT7686_pointer as Word
;Dim tableloop  as Word alias GLCDForeground_E, GLCDForeground_U
;Dim LT7686_initlength as Word alias GLCDForeground_H, GLCDForeground
;Dim LT7686_initdata as Byte alias GLCDDeviceHeight
;Dim oldLT7686_initdata as Byte alias GLCDDeviceHeight_H
;Dim lastLT7686_cmdregister as Byte alias GLCDDeviceWidth_H
;Dim LT7686_initverifycounter as Word
;Dim tmpreaddata
;Get init dataset, readtable to init LC
;oldLT7686_initdata = 0
	clrf	OLDLT7686_INITDATA,ACCESS
;LT7686_pointer = 0
	banksel	LT7686_POINTER
	clrf	LT7686_POINTER,BANKED
	clrf	LT7686_POINTER_H,BANKED
;table name is set in GLCD.H
;readtable LT7686_INITTFT_DATASET, LT7686_pointer, LT7686_initlength
	movff	LT7686_POINTER,SYSSTRINGA
	movff	LT7686_POINTER_H,SYSSTRINGA_H
	banksel	0
	rcall	LT7686_INITTFT_DATASET_1024_600
	movwf	LT7686_INITLENGTH,ACCESS
	movff	LT7686_POINTER,SYSSTRINGA
	movff	LT7686_POINTER_H,SYSSTRINGA_H
	rcall	LT7686_INITTFT_DATASET_1024_600_H
	movwf	LT7686_INITLENGTH_H,ACCESS
;LT7686_pointer++
	banksel	LT7686_POINTER
	incf	LT7686_POINTER,F,BANKED
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_POINTER_H,F,BANKED
;Do Forever
SysDoLoop_S8
;wait 1 ms
	movlw	1
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	banksel	0
	call	Delay_MS
;readtable LT7686_INITTFT_DATASET, LT7686_pointer, LT7686_initdata
	movff	LT7686_POINTER,SYSSTRINGA
	movff	LT7686_POINTER_H,SYSSTRINGA_H
	rcall	LT7686_INITTFT_DATASET_1024_600
	movwf	LT7686_INITDATA,ACCESS
;LT7686_pointer++
	banksel	LT7686_POINTER
	incf	LT7686_POINTER,F,BANKED
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_POINTER_H,F,BANKED
;Select Case LT7686_initdata
;Case 0x11
SysSelect10Case1
	movlw	17
	subwf	LT7686_INITDATA,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect10Case2
;Wait 50ms to ensure no overrun at this initial stage of the process
;wait 100 ms
	movlw	100
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	banksel	0
	call	Delay_MS
;readtable LT7686_INITTFT_DATASET, LT7686_pointer, LT7686_initdata
	movff	LT7686_POINTER,SYSSTRINGA
	movff	LT7686_POINTER_H,SYSSTRINGA_H
	rcall	LT7686_INITTFT_DATASET_1024_600
	movwf	LT7686_INITDATA,ACCESS
;oldLT7686_initdata = LT7686_initdata
;LT7686_pointer++
	banksel	LT7686_POINTER
	incf	LT7686_POINTER,F,BANKED
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_POINTER_H,F,BANKED
;LT7686_WriteCMD( LT7686_initdata)
	movff	LT7686_INITDATA,__OUTBYTE
	banksel	0
	rcall	LT7686_WRITECMD
;lastLT7686_cmdregister = LT7686_initdata
	movff	LT7686_INITDATA,LASTLT7686_CMDREGISTER
;HserPrint "0y"+ByteToHex(lastLT7686_cmdregister)
	movff	LASTLT7686_CMDREGISTER,SYSVALTEMP
	call	FN__HEXPICAS
	lfsr	1,SYSSTRINGPARAM3
	clrf	SysStringLength,ACCESS
	movlw	low StringTable217
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable217
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable217
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,_HEXPICAS
	call	SYSCOPYSTRINGPART
	lfsr	0,SYSSTRINGPARAM3
	movff	SysStringLength, INDF0
	movlw	low SYSSTRINGPARAM3
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM3
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM3*2
	banksel	0
	call	HSERPRINT419
;HserPrint ": "
	lfsr	1,SYSSTRINGPARAM3
	movlw	low StringTable218
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable218
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable218
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM3
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM3
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM3*2
	banksel	0
	call	HSERPRINT419
;Case 0x12
	bra	SysSelectEnd10
SysSelect10Case2
	movlw	18
	subwf	LT7686_INITDATA,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect10Case3
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
	banksel	0
	rcall	LT7686_INITTFT_DATASET_1024_600
	movwf	LT7686_INITDATA,ACCESS
;LT7686_pointer++
	banksel	LT7686_POINTER
	incf	LT7686_POINTER,F,BANKED
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_POINTER_H,F,BANKED
;! Danger.. this could be deadlock function!! if the GLCD does not reply... then, this is a lockup
;! To be safe we should use a Watchdog
;! add Watchdog when operational
;Read register and get the result
;tmpreaddata = LT7686_DataRead()
	banksel	0
	rcall	FN_LT7686_DATAREAD
	movff	LT7686_DATAREAD,TMPREADDATA
;do while tmpreaddata <> LT7686_initdata AND LT7686_initverifycounter < 50
SysDoLoop_S9
	movff	tmpreaddata,SysBYTETempA
	movff	lt7686_initdata,SysBYTETempB
	call	SYSCOMPEQUAL
	comf	SysByteTempX,F,ACCESS
	movff	SysByteTempX,SysTemp3
	movff	lt7686_initverifycounter,SysWORDTempA
	movff	lt7686_initverifycounter_H,SysWORDTempA_H
	movlw	50
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPLESSTHAN16
	banksel	SYSTEMP3
	movf	SysTemp3,W,BANKED
	andwf	SysByteTempX,W,ACCESS
	movwf	SysTemp1,BANKED
	btfss	SysTemp1,0,BANKED
	bra	SysDoLoop_E9
;LT7686_initverifycounter++
	incf	LT7686_INITVERIFYCOUNTER,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_INITVERIFYCOUNTER_H,F,ACCESS
;wait 10 ms
	movlw	10
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	banksel	0
	call	Delay_MS
;HserPrint "ReadReg:"
	lfsr	1,SYSSTRINGPARAM3
	movlw	low StringTable219
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable219
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable219
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM3
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM3
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM3*8
	banksel	0
	call	HSERPRINT419
;HserPrint "0x"+ByteToHex(lastLT7686_cmdregister)
	movff	LASTLT7686_CMDREGISTER,SYSVALTEMP
	call	FN__HEXPICAS
	lfsr	1,SYSSTRINGPARAM3
	clrf	SysStringLength,ACCESS
	movlw	low StringTable32
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable32
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable32
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,_HEXPICAS
	call	SYSCOPYSTRINGPART
	lfsr	0,SYSSTRINGPARAM3
	movff	SysStringLength, INDF0
	movlw	low SYSSTRINGPARAM3
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM3
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM3*2
	banksel	0
	call	HSERPRINT419
;HserPrint ",0x"+ByteToHex(LT7686_initdata)
	movff	LT7686_INITDATA,SYSVALTEMP
	call	FN__HEXPICAS
	lfsr	1,SYSSTRINGPARAM3
	clrf	SysStringLength,ACCESS
	movlw	low StringTable220
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable220
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable220
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,_HEXPICAS
	call	SYSCOPYSTRINGPART
	lfsr	0,SYSSTRINGPARAM3
	movff	SysStringLength, INDF0
	movlw	low SYSSTRINGPARAM3
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM3
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM3*3
	banksel	0
	call	HSERPRINT419
;HSerPrintStringCRLF " v " + ByteToHex(tmpreaddata)
	movff	TMPREADDATA,SYSVALTEMP
	call	FN__HEXPICAS
	lfsr	1,SYSSTRINGPARAM3
	clrf	SysStringLength,ACCESS
	movlw	low StringTable221
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable221
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable221
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,_HEXPICAS
	call	SYSCOPYSTRINGPART
	lfsr	0,SYSSTRINGPARAM3
	movff	SysStringLength, INDF0
	movlw	low SYSSTRINGPARAM3
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM3
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM3*3
	banksel	0
	call	HSERPRINTSTRINGCRLF
;Resend last command address
;LT7686_WriteCMD( lastLT7686_cmdregister )
	movff	LASTLT7686_CMDREGISTER,__OUTBYTE
	rcall	LT7686_WRITECMD
;LT7686_WriteData( LT7686_initdata )
	movff	LT7686_INITDATA,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD( lastLT7686_cmdregister )
	movff	LASTLT7686_CMDREGISTER,__OUTBYTE
	rcall	LT7686_WRITECMD
;loop
	bra	SysDoLoop_S9
SysDoLoop_E9
;LT7686_initverifycounter = 0
	clrf	LT7686_INITVERIFYCOUNTER,ACCESS
	clrf	LT7686_INITVERIFYCOUNTER_H,ACCESS
;Case 0x13
	bra	SysSelectEnd10
SysSelect10Case3
	movlw	19
	subwf	LT7686_INITDATA,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelect10Case4
;readtable LT7686_INITTFT_DATASET, LT7686_pointer, LT7686_initdata
	movff	LT7686_POINTER,SYSSTRINGA
	movff	LT7686_POINTER_H,SYSSTRINGA_H
	banksel	0
	rcall	LT7686_INITTFT_DATASET_1024_600
	movwf	LT7686_INITDATA,ACCESS
;oldLT7686_initdata = LT7686_initdata
	movff	LT7686_INITDATA,OLDLT7686_INITDATA
;LT7686_pointer++
	banksel	LT7686_POINTER
	incf	LT7686_POINTER,F,BANKED
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_POINTER_H,F,BANKED
;LT7686_initverifycounter = 0
	clrf	LT7686_INITVERIFYCOUNTER,ACCESS
	clrf	LT7686_INITVERIFYCOUNTER_H,ACCESS
;LT7686_WriteData( LT7686_initdata)
	movff	LT7686_INITDATA,__OUTBYTE
	banksel	0
	rcall	LT7686_WRITEDATA
;Case 0xAA
	bra	SysSelectEnd10
SysSelect10Case4
	movlw	170
	subwf	LT7686_INITDATA,W,ACCESS
	btfss	STATUS, Z,ACCESS
	bra	SysSelectEnd10
;readtable LT7686_INITTFT_DATASET, LT7686_pointer, LT7686_initdata
	movff	LT7686_POINTER,SYSSTRINGA
	movff	LT7686_POINTER_H,SYSSTRINGA_H
	banksel	0
	rcall	LT7686_INITTFT_DATASET_1024_600
	movwf	LT7686_INITDATA,ACCESS
;LT7686_pointer++
	banksel	LT7686_POINTER
	incf	LT7686_POINTER,F,BANKED
	btfsc	STATUS,Z,ACCESS
	incf	LT7686_POINTER_H,F,BANKED
;If oldLT7686_initdata <>  LT7686_initdata Then
	movf	LT7686_INITDATA,W,ACCESS
	subwf	OLDLT7686_INITDATA,W,ACCESS
	btfsc	STATUS, Z,ACCESS
	bra	ENDIF91
;Only do this once
;LT7686_Wait10ms
	banksel	0
	rcall	LT7686_WAIT10MS
;oldLT7686_initdata = LT7686_initdata
	movff	LT7686_INITDATA,OLDLT7686_INITDATA
;End if
ENDIF91
;End Select
SysSelectEnd10
;If LT7686_pointer > LT7686_initlength then Exit Do
	movff	LT7686_POINTER,SysWORDTempB
	movff	LT7686_POINTER_H,SysWORDTempB_H
	movff	LT7686_INITLENGTH,SysWORDTempA
	movff	LT7686_INITLENGTH_H,SysWORDTempA_H
	banksel	0
	call	SYSCOMPLESSTHAN16
	btfsc	SysByteTempX,0,ACCESS
;If LT7686_pointer > LT7686_initlength then Exit Do
	bra	SysDoLoop_E8
;If LT7686_pointer > LT7686_initlength then Exit Do
;Loop
	bra	SysDoLoop_S8
SysDoLoop_E8
	return

;********************************************************************************

;Overloaded signature: WORD:WORD:STRING:long:, Source: GLCD_LT7686.H (1411)
LT7686_PRINT_INTERNAL_FONT592
;Dim temp_LT7686
;Dim GLCDPrintLen, GLCDPrint_String_Counter as word
;GLCDPrintLen = LCDPrintData(0)
	movff	SysLCDPRINTDATAHandler,AFSR0
	movff	SysLCDPRINTDATAHandler_H,AFSR0_H
	movff	INDF0,GLCDPRINTLEN
	clrf	GLCDPRINTLEN_H,ACCESS
;If GLCDPrintLen = 0 Then Exit Sub
	movff	GLCDPRINTLEN,SysWORDTempA
	movff	GLCDPRINTLEN_H,SysWORDTempA_H
	clrf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	call	SYSCOMPEQUAL16
	btfsc	SysByteTempX,0,ACCESS
;If GLCDPrintLen = 0 Then Exit Sub
	return
;If GLCDPrintLen = 0 Then Exit Sub
;Send xx yy
;LT7686_WriteCMD(LT7686_REG_F_CURX0)
	movlw	99
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(_xoffset1)
	movff	_XOFFSET1,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(LT7686_REG_F_CURX1)
	movlw	100
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(_xoffset1_H)
	movff	_XOFFSET1_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	rcall	LT7686_CHECK_BUSY_DRAW
;LT7686_WriteCMD(LT7686_REG_F_CURY0)
	movlw	101
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(_yoffset1)
	movff	_YOFFSET1,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(LT7686_REG_F_CURY1)
	movlw	102
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(_yoffset1_H)
	movff	_YOFFSET1_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	rcall	LT7686_CHECK_BUSY_DRAW
;Select CGROM_Select_Internal_CGROM
;LT7686_WriteCMD(LT7686_REG_CCR0)
	movlw	204
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
;LT7686_WriteData(temp_LT7686)
	movff	TEMP_LT7686,__OUTBYTE
	banksel	0
	rcall	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	rcall	LT7686_CHECK_BUSY_DRAW
;LT7686_SendColor
;Macro Source: GLCD_LT7686.H (1594)
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
	rcall	LT7686_WRITECMD
;LT7686_WriteData( __Set_LT7686_LineColour_H  )
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
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
	rcall	LT7686_WRITECMD
;LT7686_WriteData( __Set_LT7686_LineColour )
	movff	__SET_LT7686_LINECOLOUR,__OUTBYTE
	rcall	LT7686_WRITEDATA
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
;Select Text mode
;LT7686_WriteCMD(0x03)
	movlw	3
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;temp_LT7686 = LT7686_DataRead()
	rcall	FN_LT7686_DATAREAD
	movff	LT7686_DATAREAD,TEMP_LT7686
;temp_LT7686.2 = 1
	banksel	TEMP_LT7686
	bsf	TEMP_LT7686,2,BANKED
;temp_LT7686.1 = 0
	bcf	TEMP_LT7686,1,BANKED
;temp_LT7686.0 = 0
	bcf	TEMP_LT7686,0,BANKED
;LT7686_WriteData(temp_LT7686)
	movff	TEMP_LT7686,__OUTBYTE
	banksel	0
	rcall	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	call	LT7686_CHECK_BUSY_DRAW
;wait 50 us
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
;Write string - char by char
;For GLCDPrint_String_Counter = 1 To GLCDPrintLen
;Legacy method
	clrf	GLCDPRINT_STRING_COUNTER,ACCESS
	clrf	GLCDPRINT_STRING_COUNTER_H,ACCESS
	movlw	1
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	movff	GLCDPRINTLEN,SysWORDTempA
	movff	GLCDPRINTLEN_H,SysWORDTempA_H
	call	SYSCOMPLESSTHAN16
	btfsc	SysByteTempX,0,ACCESS
	bra	SysForLoopEnd10
SysForLoop10
	incf	GLCDPRINT_STRING_COUNTER,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	GLCDPRINT_STRING_COUNTER_H,F,ACCESS
;LT7686_WriteCMD(LT7686_REG_MRWDP)
	movlw	4
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData( LCDPrintData(GLCDPrint_String_Counter) )
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
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	call	LT7686_CHECK_BUSY_DRAW
;Next
	movff	GLCDPRINT_STRING_COUNTER,SysWORDTempA
	movff	GLCDPRINT_STRING_COUNTER_H,SysWORDTempA_H
	movff	GLCDPRINTLEN,SysWORDTempB
	movff	GLCDPRINTLEN_H,SysWORDTempB_H
	call	SYSCOMPLESSTHAN16
	btfsc	SysByteTempX,0,ACCESS
	bra	SysForLoop10
SysForLoopEnd10
;set graphics mode
;LT7686_WriteCMD(0x03)
	movlw	3
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;temp_LT7686 = LT7686_DataRead()
	rcall	FN_LT7686_DATAREAD
	movff	LT7686_DATAREAD,TEMP_LT7686
;temp_LT7686.2 = 0
	banksel	TEMP_LT7686
	bcf	TEMP_LT7686,2,BANKED
;LT7686_WriteData(temp_LT7686)
	movff	TEMP_LT7686,__OUTBYTE
	banksel	0
	rcall	LT7686_WRITEDATA
;wait 50 us
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

;Overloaded signature: WORD:WORD:LONG:long:, Source: GLCD_LT7686.H (1477)
LT7686_PRINT_INTERNAL_FONT593
;Display
;LT7686_Print_Internal_Font ( _xoffset1, _yoffset1, Str(LCDValue) , LT7686_LineColour )
	movff	LCDVALUE,SYSVALTEMP
	movff	LCDVALUE_H,SYSVALTEMP_H
	call	FN_STR
	movlw	low STR
	banksel	SYSLCDPRINTDATAHANDLER
	movwf	SysLCDPRINTDATAHandler,BANKED
	movlw	high STR
	movwf	SysLCDPRINTDATAHandler_H,BANKED
	banksel	0
	bra	LT7686_PRINT_INTERNAL_FONT592

;********************************************************************************

;Source: GLCD_LT7686.H (291)
LT7686_PWM_DUTY
;If LT7686_Display_PWM > LT7686_PWM_PRESCALER_MAX then LT7686_Display_PWM = (LT7686_PWM_PRESCALER_MAX / 2 ) -1
	movf	LT7686_DISPLAY_PWM,W,ACCESS
	sublw	200
	btfsc	STATUS, C,ACCESS
	bra	ENDIF54
;If LT7686_Display_PWM > LT7686_PWM_PRESCALER_MAX then LT7686_Display_PWM = (LT7686_PWM_PRESCALER_MAX / 2 ) -1
	movlw	99
	movwf	LT7686_DISPLAY_PWM,ACCESS
;If LT7686_Display_PWM > LT7686_PWM_PRESCALER_MAX then LT7686_Display_PWM = (LT7686_PWM_PRESCALER_MAX / 2 ) -1
ENDIF54
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
	call	LT7686_CHECK_BUSY_DRAW
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
	call	LT7686_CHECK_BUSY_DRAW
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
	call	LT7686_CHECK_BUSY_DRAW
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
	call	LT7686_CHECK_BUSY_DRAW
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
	call	LT7686_CHECK_BUSY_DRAW
;Start PWM
;LT7686_WriteCMD( LT7686_REG_PCFGR )
	movlw	134
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;temp_LT7686 = LT7686_DataRead()
	call	FN_LT7686_DATAREAD
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
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

;Source: GLCD_LT7686.H (1322)
LT7686_SELECT_INTERNAL_FONT_INIT
;Dim temp_LT7686 as Byte
;LT7686_WriteCMD(LT7686_REG_CCR0)
	movlw	204
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;temp_LT7686 = 0
	banksel	TEMP_LT7686
	clrf	TEMP_LT7686,BANKED
;Select Case _fontsize
;Case 16
;temp_LT7686.5 = 0
;temp_LT7686.4 = 0
;Case 24
SysSelect3Case1
	movlw	24
	subwf	_FONTSIZE,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelect3Case2
;temp_LT7686.5 = 0
;temp_LT7686.4 = 1
	bsf	TEMP_LT7686,4,BANKED
;Case 32
	bra	SysSelectEnd3
SysSelect3Case2
	movlw	32
	subwf	_FONTSIZE,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelectEnd3
;temp_LT7686.5 = 1
	bsf	TEMP_LT7686,5,BANKED
;temp_LT7686.4 = 0
;Case Else
;temp_LT7686.5 = 0
;temp_LT7686.4 = 0
;End Select
SysSelectEnd3
;LT7686_WriteData(temp_LT7686)
	movff	TEMP_LT7686,__OUTBYTE
	banksel	0
	rcall	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	call	LT7686_CHECK_BUSY_DRAW
;LT7686_WriteCMD(LT7686_REG_CCR1)
	movlw	205
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;temp_LT7686 = 0
	banksel	TEMP_LT7686
	clrf	TEMP_LT7686,BANKED
;Select Case _xwidthmag
;Case 1
;temp_LT7686.3 = 0
;temp_LT7686.2 = 0
;Case 2
SysSelect4Case1
	movlw	2
	banksel	_XWIDTHMAG
	subwf	_XWIDTHMAG,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelect4Case2
;temp_LT7686.3 = 0
;temp_LT7686.2 = 1
	banksel	TEMP_LT7686
	bsf	TEMP_LT7686,2,BANKED
;Case 3
	bra	SysSelectEnd4
SysSelect4Case2
	movlw	3
	subwf	_XWIDTHMAG,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelect4Case3
;temp_LT7686.3 = 1
	banksel	TEMP_LT7686
	bsf	TEMP_LT7686,3,BANKED
;temp_LT7686.2 = 0
;Case 4
	bra	SysSelectEnd4
SysSelect4Case3
	movlw	4
	subwf	_XWIDTHMAG,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelectEnd4
;temp_LT7686.3 = 1
	banksel	TEMP_LT7686
	bsf	TEMP_LT7686,3,BANKED
;temp_LT7686.2 = 1
	bsf	TEMP_LT7686,2,BANKED
;Case Else
;temp_LT7686.3 = 0
;temp_LT7686.2 = 0
;End Select
SysSelectEnd4
;Select Case _yheightmag
;Case 1
;temp_LT7686.1 = 0
;temp_LT7686.0 = 0
;Case 2
SysSelect5Case1
	movlw	2
	banksel	_YHEIGHTMAG
	subwf	_YHEIGHTMAG,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelect5Case2
;temp_LT7686.1 = 0
;temp_LT7686.0 = 1
	banksel	TEMP_LT7686
	bsf	TEMP_LT7686,0,BANKED
;Case 3
	bra	SysSelectEnd5
SysSelect5Case2
	movlw	3
	subwf	_YHEIGHTMAG,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelect5Case3
;temp_LT7686.1 = 1
	banksel	TEMP_LT7686
	bsf	TEMP_LT7686,1,BANKED
;temp_LT7686.0 = 0
;Case 4
	bra	SysSelectEnd5
SysSelect5Case3
	movlw	4
	subwf	_YHEIGHTMAG,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelectEnd5
;temp_LT7686.1 = 1
	banksel	TEMP_LT7686
	bsf	TEMP_LT7686,1,BANKED
;temp_LT7686.0 = 1
	bsf	TEMP_LT7686,0,BANKED
;Case Else
;temp_LT7686.1 = 0
;temp_LT7686.0 = 0
;End Select
SysSelectEnd5
;Select Case _chromakey
;Case 1
SysSelect6Case1
	banksel	_CHROMAKEY
	decf	_CHROMAKEY,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelectEnd6
;temp_LT7686.6 = 1
	bsf	TEMP_LT7686,6,BANKED
;Case 2
;temp_LT7686.6 = 1
;Case Else
;temp_LT7686.6 = 0
;End Select
SysSelectEnd6
;Select Case _alignment
;Case 1
SysSelect7Case1
	decf	_ALIGNMENT,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelectEnd7
;temp_LT7686.7 = 1
	bsf	TEMP_LT7686,7,BANKED
;Case 2
;temp_LT7686.7 = 1
;Case Else
;temp_LT7686.7 = 0
;End Select
SysSelectEnd7
;LT7686_WriteData(temp_LT7686)
	movff	TEMP_LT7686,__OUTBYTE
	banksel	0
	rcall	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

;Source: GLCD_LT7686.H (1768)
LT7686_SOFTWARE_RESET
;Dim _temp_LT7686
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
;wait 10 ms
	movlw	10
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	call	Delay_MS
;Do
SysDoLoop_S6
;LT7686_WriteCMD( LT7686_REG_SRR )
	banksel	__OUTBYTE
	clrf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;_temp_LT7686 = LT7686_DataRead()
	call	FN_LT7686_DATAREAD
	movff	LT7686_DATAREAD,_TEMP_LT7686
;HSerPrintStringCRLF ByteToHex( _temp_LT7686 )
;wait 10 ms
	movlw	10
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	call	Delay_MS
;Loop While _temp_LT7686.1 = 1
	banksel	_TEMP_LT7686
	btfsc	_TEMP_LT7686,1,BANKED
	bra	SysDoLoop_S6
SysDoLoop_E6
	banksel	0
	return

;********************************************************************************

;Source: GLCD_LT7686.H (2045)
FN_LT7686_STATUSREAD
;LT7686_StatusRead = 0x00
	banksel	LT7686_STATUSREAD
	clrf	LT7686_STATUSREAD,BANKED
;dim __LT7686_outbuffer as Byte
;LT7686_CS = 0
	bcf	LATA,3,ACCESS
;Wait LT7686_STATE1_DELAY us
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS31
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS31
;__LT7686_outbuffer = 0x40
	movlw	64
	banksel	__LT7686_OUTBUFFER
	movwf	__LT7686_OUTBUFFER,BANKED
;repeat 8
	movlw	8
	banksel	SYSREPEATTEMP12
	movwf	SysRepeatTemp12,BANKED
SysRepeatLoop12
;if __LT7686_outbuffer.7 = ON  then
	banksel	__LT7686_OUTBUFFER
	btfss	__LT7686_OUTBUFFER,7,BANKED
	bra	ELSE89_1
;set LT7686_DO ON
	bsf	LATB,0,ACCESS
;else
	bra	ENDIF89
ELSE89_1
;set LT7686_DO OFF
	bcf	LATB,0,ACCESS
;end if
ENDIF89
;SET LT7686_SCK STATE1
	bcf	LATC,3,ACCESS
;Wait LT7686_STATE1_DELAY us
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS32
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS32
;rotate __LT7686_outbuffer left
	rlcf	__LT7686_OUTBUFFER,F,BANKED
;SET LT7686_SCK STATE2
	bsf	LATC,3,ACCESS
;Wait LT7686_STATE2_DELAY us
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS33
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS33
;end repeat
	banksel	SYSREPEATTEMP12
	decfsz	SysRepeatTemp12,F,BANKED
	bra	SysRepeatLoop12
SysRepeatLoopEnd12
;Wait LT7686_STATE2_DELAY us
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS34
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS34
;repeat 8
	movlw	8
	movwf	SysRepeatTemp12,BANKED
SysRepeatLoop13
;Dir LT7686_DI In
	bsf	TRISC,4,ACCESS
;SET LT7686_SCK STATE1
	bcf	LATC,3,ACCESS
;Set C Off
	bcf	STATUS,C,ACCESS
;rotate LT7686_StatusRead left
	rlcf	LT7686_STATUSREAD,F,BANKED
;Wait LT7686_STATE1_DELAY us
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS35
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS35
;if LT7686_DI = On then
	btfss	PORTC,4,ACCESS
	bra	ELSE90_1
;set LT7686_StatusRead.0 On
	bsf	LT7686_STATUSREAD,0,BANKED
;Else
	bra	ENDIF90
ELSE90_1
;set LT7686_StatusRead.0 Off
	bcf	LT7686_STATUSREAD,0,BANKED
;end if
ENDIF90
;SET LT7686_SCK STATE2
	bsf	LATC,3,ACCESS
;Wait LT7686_STATE2_DELAY us
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS36
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS36
;end repeat
	decfsz	SysRepeatTemp12,F,BANKED
	bra	SysRepeatLoop13
SysRepeatLoopEnd13
;Wait LT7686_STATE1_DELAY us
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS37
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS37
;Dir LT7686_DO Out
	bcf	TRISB,0,ACCESS
;LT7686_CS = 1
	bsf	LATA,3,ACCESS
	banksel	0
	return

;********************************************************************************

;Source: GLCD_LT7686.H (1904)
LT7686_WAIT10MS
;Wait 10 ms
	movlw	10
	movwf	SysWaitTempMS,ACCESS
	clrf	SysWaitTempMS_H,ACCESS
	goto	Delay_MS
;!

;********************************************************************************

;Source: GLCD_LT7686.H (1916)
LT7686_WRITECMD
;0x00
;dim __LT7686_fbuffer as Byte
;__LT7686_fbuffer = LT7686_REGISTER_ADDRESS
	banksel	__LT7686_FBUFFER
	clrf	__LT7686_FBUFFER,BANKED
;__LT7686_outbuffer = __outbyte
	movff	__OUTBYTE,__LT7686_OUTBUFFER
;LT7686_macro_WriteTwoBytes
;Macro Source: GLCD_LT7686.H (1850)
;LT7686_CS = 0
	bcf	LATA,3,ACCESS
;Wait LT7686_STATE1_DELAY us
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS5
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS5
;SET LT7686_SCK STATE2
	bsf	LATC,3,ACCESS
;SET C OFF
	bcf	STATUS,C,ACCESS
;repeat 8
	movlw	8
	banksel	SYSREPEATTEMP5
	movwf	SysRepeatTemp5,BANKED
SysRepeatLoop5
;if __LT7686_fbuffer.7 = ON  then
	banksel	__LT7686_FBUFFER
	btfss	__LT7686_FBUFFER,7,BANKED
	bra	ELSE61_1
;set LT7686_DO ON
	bsf	LATB,0,ACCESS
;else
	bra	ENDIF61
ELSE61_1
;set LT7686_DO OFF
	bcf	LATB,0,ACCESS
;end if
ENDIF61
;SET LT7686_SCK STATE1
	bcf	LATC,3,ACCESS
;Wait LT7686_STATE1_DELAY us
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS6
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS6
;rotate __LT7686_fbuffer left
	rlcf	__LT7686_FBUFFER,F,BANKED
;SET LT7686_SCK STATE2
	bsf	LATC,3,ACCESS
;Wait LT7686_STATE2_DELAY us
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS7
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS7
;end repeat
	banksel	SYSREPEATTEMP5
	decfsz	SysRepeatTemp5,F,BANKED
	bra	SysRepeatLoop5
SysRepeatLoopEnd5
;wait LT7686_STATE2_DELAY us
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS8
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS8
;SET C OFF
	bcf	STATUS,C,ACCESS
;repeat 8
	movlw	8
	movwf	SysRepeatTemp5,BANKED
SysRepeatLoop6
;SET LT7686_SCK STATE1
	bcf	LATC,3,ACCESS
;if __LT7686_outbuffer.7 = ON  then
	banksel	__LT7686_OUTBUFFER
	btfss	__LT7686_OUTBUFFER,7,BANKED
	bra	ELSE62_1
;set LT7686_DO ON
	bsf	LATB,0,ACCESS
;else
	bra	ENDIF62
ELSE62_1
;set LT7686_DO OFF
	bcf	LATB,0,ACCESS
;end if
ENDIF62
;Wait LT7686_STATE1_DELAY us
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS9
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS9
;rotate __LT7686_outbuffer left
	rlcf	__LT7686_OUTBUFFER,F,BANKED
;SET LT7686_SCK STATE2
	bsf	LATC,3,ACCESS
;Wait LT7686_STATE2_DELAY us
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS10
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS10
;end repeat
	banksel	SYSREPEATTEMP5
	decfsz	SysRepeatTemp5,F,BANKED
	bra	SysRepeatLoop6
SysRepeatLoopEnd6
;set LT7686_DO OFF
	bcf	LATB,0,ACCESS
;Wait LT7686_STATE2_DELAY us
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS11
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS11
;LT7686_CS = 1
	bsf	LATA,3,ACCESS
	banksel	0
	return

;********************************************************************************

;Source: GLCD_LT7686.H (1931)
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
;Macro Source: GLCD_LT7686.H (1850)
;LT7686_CS = 0
	bcf	LATA,3,ACCESS
;Wait LT7686_STATE1_DELAY us
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS12
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS12
;SET LT7686_SCK STATE2
	bsf	LATC,3,ACCESS
;SET C OFF
	bcf	STATUS,C,ACCESS
;repeat 8
	movlw	8
	banksel	SYSREPEATTEMP7
	movwf	SysRepeatTemp7,BANKED
SysRepeatLoop7
;if __LT7686_fbuffer.7 = ON  then
	banksel	__LT7686_FBUFFER
	btfss	__LT7686_FBUFFER,7,BANKED
	bra	ELSE63_1
;set LT7686_DO ON
	bsf	LATB,0,ACCESS
;else
	bra	ENDIF63
ELSE63_1
;set LT7686_DO OFF
	bcf	LATB,0,ACCESS
;end if
ENDIF63
;SET LT7686_SCK STATE1
	bcf	LATC,3,ACCESS
;Wait LT7686_STATE1_DELAY us
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS13
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS13
;rotate __LT7686_fbuffer left
	rlcf	__LT7686_FBUFFER,F,BANKED
;SET LT7686_SCK STATE2
	bsf	LATC,3,ACCESS
;Wait LT7686_STATE2_DELAY us
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS14
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS14
;end repeat
	banksel	SYSREPEATTEMP7
	decfsz	SysRepeatTemp7,F,BANKED
	bra	SysRepeatLoop7
SysRepeatLoopEnd7
;wait LT7686_STATE2_DELAY us
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS15
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS15
;SET C OFF
	bcf	STATUS,C,ACCESS
;repeat 8
	movlw	8
	movwf	SysRepeatTemp7,BANKED
SysRepeatLoop8
;SET LT7686_SCK STATE1
	bcf	LATC,3,ACCESS
;if __LT7686_outbuffer.7 = ON  then
	banksel	__LT7686_OUTBUFFER
	btfss	__LT7686_OUTBUFFER,7,BANKED
	bra	ELSE64_1
;set LT7686_DO ON
	bsf	LATB,0,ACCESS
;else
	bra	ENDIF64
ELSE64_1
;set LT7686_DO OFF
	bcf	LATB,0,ACCESS
;end if
ENDIF64
;Wait LT7686_STATE1_DELAY us
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS16
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS16
;rotate __LT7686_outbuffer left
	rlcf	__LT7686_OUTBUFFER,F,BANKED
;SET LT7686_SCK STATE2
	bsf	LATC,3,ACCESS
;Wait LT7686_STATE2_DELAY us
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS17
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS17
;end repeat
	banksel	SYSREPEATTEMP7
	decfsz	SysRepeatTemp7,F,BANKED
	bra	SysRepeatLoop8
SysRepeatLoopEnd8
;set LT7686_DO OFF
	bcf	LATB,0,ACCESS
;Wait LT7686_STATE2_DELAY us
	movlw	53
	movwf	DELAYTEMP,ACCESS
DelayUS18
	decfsz	DELAYTEMP,F,ACCESS
	bra	DelayUS18
;LT7686_CS = 1
	bsf	LATA,3,ACCESS
	banksel	0
	return

;********************************************************************************

;Source: GLCD_LT7686.H (415)
PSET_LT7686
;Dim LT7686_LineColour as Long
;Box( xoffset1 , yoffset1 , xoffset1 , yoffset1, LT7686_LineColour )
	movff	XOFFSET1,XOFFSET2
	movff	XOFFSET1_H,XOFFSET2_H
	movff	YOFFSET1,YOFFSET2
	movff	YOFFSET1_H,YOFFSET2_H
	call	BOX_LT7686
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

;Source: GLCD_LT7686.H (1047)
QUADRILATERAL_LT7686
;LT7686_CreateQuadrilateral
;Macro Source: GLCD_LT7686.H (1075)
;LT7686_WriteCMD(0x68)
	movlw	104
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(xoffset1)
	movff	XOFFSET1,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x69)
	movlw	105
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(xoffset1_H)
	movff	XOFFSET1_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x6A)
	movlw	106
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(yoffset1)
	movff	YOFFSET1,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x6B)
	movlw	107
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(yoffset1_H)
	movff	YOFFSET1_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x6C)
	movlw	108
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(xoffset2)
	movff	XOFFSET2,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x6D)
	movlw	109
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(xoffset2_H)
	movff	XOFFSET2_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x6E)
	movlw	110
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(yoffset2)
	movff	YOFFSET2,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x6F)
	movlw	111
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(yoffset2_H)
	movff	YOFFSET2_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x70)
	movlw	112
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(xoffset3)
	movff	XOFFSET3,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x71)
	movlw	113
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(xoffset3_H)
	movff	XOFFSET3_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x72)
	movlw	114
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(yoffset3)
	movff	YOFFSET3,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x73)
	movlw	115
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(yoffset3_H)
	movff	YOFFSET3_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x77)
	movlw	119
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(xoffset4)
	movff	XOFFSET4,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x78)
	movlw	120
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(xoffset4_H)
	movff	XOFFSET4_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x79)
	movlw	121
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(yoffset4)
	movff	YOFFSET4,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7A)
	movlw	122
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(yoffset4_H)
	movff	YOFFSET4_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_SendColor
;Macro Source: GLCD_LT7686.H (1594)
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
	rcall	LT7686_WRITECMD
;LT7686_WriteData( __Set_LT7686_LineColour_H  )
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
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
	rcall	LT7686_WRITECMD
;LT7686_WriteData( __Set_LT7686_LineColour )
	movff	__SET_LT7686_LINECOLOUR,__OUTBYTE
	rcall	LT7686_WRITEDATA
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
;LT7686_WriteData(0x8D)
	movlw	141
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	goto	LT7686_CHECK_BUSY_DRAW

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
	call	SYSCOMPEQUAL16
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF41
;If RandomSeed = 0 Then RandomSeed = 1
	movlw	1
	banksel	RANDOMSEED
	movwf	RANDOMSEED,BANKED
	clrf	RANDOMSEED_H,BANKED
;If RandomSeed = 0 Then RandomSeed = 1
ENDIF41
	banksel	0
	return

;********************************************************************************

;Source: GLCD_LT7686.H (970)
RIGHTDOWNCURVE_LT7686
;LT7686_CreateEllipse
;Macro Source: GLCD_LT7686.H (731)
;LT7686_WriteCMD(0x7B)
	movlw	123
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(xoffset1)
	movff	XOFFSET1,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7C)
	movlw	124
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(xoffset1_H)
	movff	XOFFSET1_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7D)
	movlw	125
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(yoffset1)
	movff	YOFFSET1,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7E)
	movlw	126
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(yoffset1_H)
	movff	YOFFSET1_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x77)
	movlw	119
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(Inxradius)
	movff	INXRADIUS,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x78)
	movlw	120
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(Inxradius_H)
	movff	INXRADIUS_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x79)
	movlw	121
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(Inyradius)
	movff	INYRADIUS,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7A)
	movlw	122
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(Inyradius_H)
	movff	INYRADIUS_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_SendColor
;Macro Source: GLCD_LT7686.H (1594)
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
	rcall	LT7686_WRITECMD
;LT7686_WriteData( __Set_LT7686_LineColour_H  )
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
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
	rcall	LT7686_WRITECMD
;LT7686_WriteData( __Set_LT7686_LineColour )
	movff	__SET_LT7686_LINECOLOUR,__OUTBYTE
	rcall	LT7686_WRITEDATA
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
;LT7686_WriteCMD(0x76)
	movlw	118
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(0x93)//B1001_XX11
	movlw	147
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

;Source: GLCD_LT7686.H (955)
RIGHTUPCURVE_LT7686
;LT7686_CreateEllipse
;Macro Source: GLCD_LT7686.H (731)
;LT7686_WriteCMD(0x7B)
	movlw	123
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(xoffset1)
	movff	XOFFSET1,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7C)
	movlw	124
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(xoffset1_H)
	movff	XOFFSET1_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7D)
	movlw	125
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(yoffset1)
	movff	YOFFSET1,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7E)
	movlw	126
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(yoffset1_H)
	movff	YOFFSET1_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x77)
	movlw	119
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(Inxradius)
	movff	INXRADIUS,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x78)
	movlw	120
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(Inxradius_H)
	movff	INXRADIUS_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x79)
	movlw	121
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(Inyradius)
	movff	INYRADIUS,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7A)
	movlw	122
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(Inyradius_H)
	movff	INYRADIUS_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_SendColor
;Macro Source: GLCD_LT7686.H (1594)
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
	rcall	LT7686_WRITECMD
;LT7686_WriteData( __Set_LT7686_LineColour_H  )
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
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
	rcall	LT7686_WRITECMD
;LT7686_WriteData( __Set_LT7686_LineColour )
	movff	__SET_LT7686_LINECOLOUR,__OUTBYTE
	rcall	LT7686_WRITEDATA
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
;LT7686_WriteCMD(0x76)
	movlw	118
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(0x92)//B1001_XX10
	movlw	146
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

;Source: GLCD_LT7686.H (762)
ROUNDRECT_LT7686
;LT7686_CreateRoundRect
;Macro Source: GLCD_LT7686.H (809)
;LT7686_CreateBox
;Macro Source: GLCD_LT7686.H (503)
;LT7686_WriteCMD(0x68)
	movlw	104
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(xoffset1)
	movff	XOFFSET1,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x69)
	movlw	105
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(xoffset1_H)
	movff	XOFFSET1_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x6A)
	movlw	106
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(yoffset1)
	movff	YOFFSET1,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x6B)
	movlw	107
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(yoffset1_H)
	movff	YOFFSET1_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x6C)
	movlw	108
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(xoffset2)
	movff	XOFFSET2,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x6D)
	movlw	109
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(xoffset2_H)
	movff	XOFFSET2_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x6E)
	movlw	110
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(yoffset2)
	movff	YOFFSET2,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x6F)
	movlw	111
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(yoffset2_H)
	movff	YOFFSET2_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x77)
	movlw	119
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(Inxradius)
	movff	INXRADIUS,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x78)
	movlw	120
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(Inxradius_H)
	movff	INXRADIUS_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x79)
	movlw	121
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(Inyradius)
	movff	INYRADIUS,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_WriteCMD(0x7A)
	movlw	122
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(Inyradius_H)
	movff	INYRADIUS_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
;LT7686_SendColor
;Macro Source: GLCD_LT7686.H (1594)
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
	rcall	LT7686_WRITECMD
;LT7686_WriteData( __Set_LT7686_LineColour_H  )
	movff	__SET_LT7686_LINECOLOUR_H,__OUTBYTE
	rcall	LT7686_WRITEDATA
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
	rcall	LT7686_WRITECMD
;LT7686_WriteData( __Set_LT7686_LineColour )
	movff	__SET_LT7686_LINECOLOUR,__OUTBYTE
	rcall	LT7686_WRITEDATA
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
;LT7686_WriteCMD(LT7686_REG_DCR1)
	movlw	118
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITECMD
;LT7686_WriteData(0xB0)//B1011_XXXX
	movlw	176
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	rcall	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	goto	LT7686_CHECK_BUSY_DRAW

;********************************************************************************

;Overloaded signature: WORD:WORD:WORD:WORD:WORD:integer:, Source: stdbasic.h (266)
FN_SCALE148
;dim l_syscalc as word
;dim l_syscalcF as long
;l_syscalcf =  [long]( l_map - l_fromLow ) * [long](l_toHigh   - l_toLow)
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
	call	SYSMULTSUB32
	movff	SysLONGTempX,L_SYSCALCF
	movff	SysLONGTempX_H,L_SYSCALCF_H
	movff	SysLONGTempX_U,L_SYSCALCF_U
	movff	SysLONGTempX_E,L_SYSCALCF_E
;l_syscalc = (  l_fromHigh - l_fromLow )
	banksel	L_FROMLOW
	movf	L_FROMLOW,W,BANKED
	subwf	L_FROMHIGH,W,BANKED
	movwf	L_SYSCALC,BANKED
	movf	L_FROMLOW_H,W,BANKED
	subwfb	L_FROMHIGH_H,W,BANKED
	movwf	L_SYSCALC_H,BANKED
;scale = (l_syscalcf / l_syscalc) + l_toLow + l_calibrate
	movff	L_SYSCALCF,SysLONGTempA
	movff	L_SYSCALCF_H,SysLONGTempA_H
	movff	L_SYSCALCF_U,SysLONGTempA_U
	movff	L_SYSCALCF_E,SysLONGTempA_E
	movff	L_SYSCALC,SysLONGTempB
	movff	L_SYSCALC_H,SysLONGTempB_H
	clrf	SysLONGTempB_U,ACCESS
	clrf	SysLONGTempB_E,ACCESS
	banksel	0
	call	SYSDIVSUB32
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

;Source: GLCDProgram.gcb (1570283)
SHOWDEBUG
;HSerPrintCRLF
	movlw	1
	movwf	HSERPRINTCRLFCOUNT,ACCESS
	movlw	1
	movwf	COMPORT,ACCESS
	call	HSERPRINTCRLF
;HSerPrintStringCRLF "LT7686 Library Development " + versionString
	lfsr	1,SYSSTRINGPARAM2
	clrf	SysStringLength,ACCESS
	movlw	low StringTable21
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable21
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable21
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,VERSIONSTRING
	call	SYSCOPYSTRINGPART
	lfsr	0,SYSSTRINGPARAM2
	movff	SysStringLength, INDF0
	movlw	low SYSSTRINGPARAM2
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM2
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM2*27
	banksel	0
	call	HSERPRINTSTRINGCRLF
;HSerPrint "Proceeding with GLCD operations": HSerPrintCRLF
	lfsr	1,SYSSTRINGPARAM2
	movlw	low StringTable22
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable22
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable22
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM2
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM2
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM2*31
	banksel	0
	call	HSERPRINT419
;HSerPrint "Proceeding with GLCD operations": HSerPrintCRLF
	movlw	1
	movwf	HSERPRINTCRLFCOUNT,ACCESS
	movlw	1
	movwf	COMPORT,ACCESS
	call	HSERPRINTCRLF
;HserPrint "LT7686_REG_STSR status register 0b" + bytetobin(LT7686_StatusReadResult): HSerPrintCRLF
	movff	LT7686_STATUSREADRESULT,BYTENUM
	call	FN_BYTETOBIN
	lfsr	1,SYSSTRINGPARAM2
	clrf	SysStringLength,ACCESS
	movlw	low StringTable23
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable23
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable23
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,BYTETOBIN
	call	SYSCOPYSTRINGPART
	lfsr	0,SYSSTRINGPARAM2
	movff	SysStringLength, INDF0
	movlw	low SYSSTRINGPARAM2
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM2
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM2*34
	banksel	0
	call	HSERPRINT419
;HserPrint "LT7686_REG_STSR status register 0b" + bytetobin(LT7686_StatusReadResult): HSerPrintCRLF
	movlw	1
	movwf	HSERPRINTCRLFCOUNT,ACCESS
	movlw	1
	movwf	COMPORT,ACCESS
	call	HSERPRINTCRLF
;HserPrint "    see datasheet 19.1": HSerPrintCRLF 2
	lfsr	1,SYSSTRINGPARAM2
	movlw	low StringTable24
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable24
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable24
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRING
	movlw	low SYSSTRINGPARAM2
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM2
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM2*22
	banksel	0
	call	HSERPRINT419
;HserPrint "    see datasheet 19.1": HSerPrintCRLF 2
	movlw	2
	movwf	HSERPRINTCRLFCOUNT,ACCESS
	movlw	1
	movwf	COMPORT,ACCESS
	call	HSERPRINTCRLF
;HSerPrintStringCRLF "LT7686_initverifycounter ( should not be a big number!) " + str(LT7686_initverifycounter): HSerPrintCRLF
	movff	LT7686_INITVERIFYCOUNTER,SYSVALTEMP
	banksel	SYSVALTEMP_H
	clrf	SYSVALTEMP_H,BANKED
	banksel	0
	rcall	FN_STR
	lfsr	1,SYSSTRINGPARAM2
	clrf	SysStringLength,ACCESS
	movlw	low StringTable25
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable25
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable25
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,STR
	rcall	SYSCOPYSTRINGPART
	lfsr	0,SYSSTRINGPARAM2
	movff	SysStringLength, INDF0
	movlw	low SYSSTRINGPARAM2
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM2
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM2*56
	banksel	0
	call	HSERPRINTSTRINGCRLF
;HSerPrintStringCRLF "LT7686_initverifycounter ( should not be a big number!) " + str(LT7686_initverifycounter): HSerPrintCRLF
	movlw	1
	movwf	HSERPRINTCRLFCOUNT,ACCESS
	movlw	1
	movwf	COMPORT,ACCESS
	call	HSERPRINTCRLF
;HSerPrint "SLRCONA = 0x"+hex(SLRCONA): HSerPrint ". SLRCONB = 0x"+hex(SLRCONB): HSerPrint ". SLRCONC = 0x"+hex(SLRCONC) : HSerPrintCRLF 2
	movff	SLRCONA,SYSVALTEMP
	call	FN__HEXPICAS
	lfsr	1,SYSSTRINGPARAM2
	clrf	SysStringLength,ACCESS
	movlw	low StringTable26
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable26
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable26
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,_HEXPICAS
	rcall	SYSCOPYSTRINGPART
	lfsr	0,SYSSTRINGPARAM2
	movff	SysStringLength, INDF0
	movlw	low SYSSTRINGPARAM2
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM2
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM2*12
	banksel	0
	call	HSERPRINT419
;HSerPrint "SLRCONA = 0x"+hex(SLRCONA): HSerPrint ". SLRCONB = 0x"+hex(SLRCONB): HSerPrint ". SLRCONC = 0x"+hex(SLRCONC) : HSerPrintCRLF 2
	movff	SLRCONB,SYSVALTEMP
	call	FN__HEXPICAS
	lfsr	1,SYSSTRINGPARAM2
	clrf	SysStringLength,ACCESS
	movlw	low StringTable27
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable27
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable27
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,_HEXPICAS
	rcall	SYSCOPYSTRINGPART
	lfsr	0,SYSSTRINGPARAM2
	movff	SysStringLength, INDF0
	movlw	low SYSSTRINGPARAM2
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM2
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM2*14
	banksel	0
	call	HSERPRINT419
;HSerPrint "SLRCONA = 0x"+hex(SLRCONA): HSerPrint ". SLRCONB = 0x"+hex(SLRCONB): HSerPrint ". SLRCONC = 0x"+hex(SLRCONC) : HSerPrintCRLF 2
	movff	SLRCONC,SYSVALTEMP
	call	FN__HEXPICAS
	lfsr	1,SYSSTRINGPARAM2
	clrf	SysStringLength,ACCESS
	movlw	low StringTable28
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable28
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable28
	movwf	TBLPTRU,ACCESS
	call	SYSREADSTRINGPART
	lfsr	0,_HEXPICAS
	rcall	SYSCOPYSTRINGPART
	lfsr	0,SYSSTRINGPARAM2
	movff	SysStringLength, INDF0
	movlw	low SYSSTRINGPARAM2
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM2
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM2*14
	banksel	0
	call	HSERPRINT419
;HSerPrint "SLRCONA = 0x"+hex(SLRCONA): HSerPrint ". SLRCONB = 0x"+hex(SLRCONB): HSerPrint ". SLRCONC = 0x"+hex(SLRCONC) : HSerPrintCRLF 2
	movlw	2
	movwf	HSERPRINTCRLFCOUNT,ACCESS
	movlw	1
	movwf	COMPORT,ACCESS
	call	HSERPRINTCRLF
;Dump registers to show end state of registers
;HserPrintCRLF
	movlw	1
	movwf	HSERPRINTCRLFCOUNT,ACCESS
	movlw	1
	movwf	COMPORT,ACCESS
	call	HSERPRINTCRLF
;dim xxloop,verify, regval, validreg as Byte
;dim tablepointer, tablelength, yy1oop as Word
;for xxloop = 1 to 0xff
;Legacy method
	banksel	XXLOOP
	clrf	XXLOOP,BANKED
SysForLoop4
	incf	XXLOOP,F,BANKED
;get data from table
;tablepointer = 0
	clrf	TABLEPOINTER,BANKED
	clrf	TABLEPOINTER_H,BANKED
;validreg = 0
	clrf	VALIDREG,BANKED
;readtable LT7686_INITTFT_DATASET, 0, tablelength
	movlw	105
	movwf	TABLELENGTH,BANKED
	movlw	1
	movwf	TABLELENGTH_H,BANKED
;for yy1oop = 3 to tablelength step 4
	movlw	3
	movwf	YY1OOP,BANKED
	clrf	YY1OOP_H,BANKED
SysForLoop5
;Init SysForLoopStep4 :#0
	movlw	4
	movwf	SysForLoopStep4,BANKED
	clrf	SysForLoopStep4_H,BANKED
;readtable LT7686_INITTFT_DATASET, yy1oop, verify
	movff	YY1OOP,SYSSTRINGA
	movff	YY1OOP_H,SYSSTRINGA_H
	banksel	0
	call	LT7686_INITTFT_DATASET_1024_600
	banksel	VERIFY
	movwf	VERIFY,BANKED
;hserprint hex(verify)
;hserprint ", "
;if verify = xxloop then
	movf	XXLOOP,W,BANKED
	subwf	VERIFY,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	ENDIF22
;readtable LT7686_INITTFT_DATASET, yy1oop+2, verify
	movlw	2
	addwf	YY1OOP,W,BANKED
	movwf	SYSSTRINGA,ACCESS
	movlw	0
	addwfc	YY1OOP_H,W,BANKED
	movwf	SYSSTRINGA_H,ACCESS
	banksel	0
	call	LT7686_INITTFT_DATASET_1024_600
	banksel	VERIFY
	movwf	VERIFY,BANKED
;validreg = 1
	movlw	1
	movwf	VALIDREG,BANKED
;exit for
	bra	SysForLoopEnd5
;End if
ENDIF22
;next
;Integer negative Step Handler in For-next statement
	btfss	SYSFORLOOPSTEP4_H,7,BANKED
	bra	ELSE23_1
;Set SysForLoopABsValue to -StepValue :#1 
	comf	SYSFORLOOPSTEP4,W,BANKED
	movwf	SysForLoopABsValue5,BANKED
	comf	SYSFORLOOPSTEP4_H,W,BANKED
	movwf	SysForLoopABsValue5_H,BANKED
	incf	SysForLoopABsValue5,F,BANKED
	btfsc	STATUS,Z,ACCESS
	incf	SysForLoopABsValue5_H,F,BANKED
;IF ( YY1OOP - TABLELENGTH) } [WORD]SysForLoopABsValue5 THEN  :#1n 
	movf	TABLELENGTH,W,BANKED
	subwf	YY1OOP,W,BANKED
	movwf	SysTemp1,BANKED
	movf	TABLELENGTH_H,W,BANKED
	subwfb	YY1OOP_H,W,BANKED
	movwf	SysTemp1_H,BANKED
	movff	SysTemp1,SysWORDTempA
	movff	SysTemp1_H,SysWORDTempA_H
	movff	SYSFORLOOPABSVALUE5,SysWORDTempB
	movff	SYSFORLOOPABSVALUE5_H,SysWORDTempB_H
	banksel	0
	rcall	SYSCOMPLESSTHAN16
	comf	SysByteTempX,F,ACCESS
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF26
;Set LoopVar to LoopVar + StepValue where StepValue is a negative value
	banksel	SYSFORLOOPSTEP4
	movf	SysForLoopStep4,W,BANKED
	addwf	YY1OOP,F,BANKED
	movf	SysForLoopStep4_H,W,BANKED
	addwfc	YY1OOP_H,F,BANKED
	bra	SysForLoop5
;END IF
ENDIF26
	bra	ENDIF23
ELSE23_1
;Integer positive Step Handler in For-next statement
;IF ([WORD]TABLELENGTH - [WORD]YY1OOP) } [WORD]SysForLoopStep4 THEN :#1p 
	movf	YY1OOP,W,BANKED
	subwf	TABLELENGTH,W,BANKED
	movwf	SysTemp1,BANKED
	movf	YY1OOP_H,W,BANKED
	subwfb	TABLELENGTH_H,W,BANKED
	movwf	SysTemp1_H,BANKED
	movff	SysTemp1,SysWORDTempA
	movff	SysTemp1_H,SysWORDTempA_H
	movff	SYSFORLOOPSTEP4,SysWORDTempB
	movff	SYSFORLOOPSTEP4_H,SysWORDTempB_H
	banksel	0
	rcall	SYSCOMPLESSTHAN16
	comf	SysByteTempX,F,ACCESS
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF27
;Set LoopVar to LoopVar + StepValue where StepValue is a positive value
	banksel	SYSFORLOOPSTEP4
	movf	SysForLoopStep4,W,BANKED
	addwf	YY1OOP,F,BANKED
	movf	SysForLoopStep4_H,W,BANKED
	addwfc	YY1OOP_H,F,BANKED
	bra	SysForLoop5
;END IF
ENDIF27
;END IF
ENDIF23
SysForLoopEnd5
;if validreg = 1 then
	banksel	VALIDREG
	decf	VALIDREG,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	ENDIF24
;HserPrint "Reg [0x"
	lfsr	1,SYSSTRINGPARAM2
	movlw	low StringTable29
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable29
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable29
	movwf	TBLPTRU,ACCESS
	banksel	0
	rcall	SYSREADSTRING
	movlw	low SYSSTRINGPARAM2
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM2
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM2*7
	banksel	0
	call	HSERPRINT419
;LT7686_WriteCMD( xxloop )
	movff	XXLOOP,__OUTBYTE
	call	LT7686_WRITECMD
;hserprint hex(xxloop)
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
	call	HSERPRINT419
;hserprint "] :0x"
	lfsr	1,SYSSTRINGPARAM2
	movlw	low StringTable30
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable30
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable30
	movwf	TBLPTRU,ACCESS
	rcall	SYSREADSTRING
	movlw	low SYSSTRINGPARAM2
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM2
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM2*5
	banksel	0
	call	HSERPRINT419
;regval = LT7686_DataRead()
	call	FN_LT7686_DATAREAD
	movff	LT7686_DATAREAD,REGVAL
;HserPrint hex(regval)
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
	call	HSERPRINT419
;if regval <> verify  and validreg = 1 then
	movff	REGVAL,SysBYTETempA
	movff	VERIFY,SysBYTETempB
	rcall	SYSCOMPEQUAL
	comf	SysByteTempX,F,ACCESS
	movff	SysByteTempX,SysTemp2
	movff	VALIDREG,SysBYTETempA
	movlw	1
	movwf	SysBYTETempB,ACCESS
	rcall	SYSCOMPEQUAL
	banksel	SYSTEMP2
	movf	SysTemp2,W,BANKED
	andwf	SysByteTempX,W,ACCESS
	movwf	SysTemp3,BANKED
	btfss	SysTemp3,0,BANKED
	bra	ELSE28_1
;Select Case xxloop
;Case 0x12
SysSelect2Case1
	movlw	18
	subwf	XXLOOP,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelect2Case2
;HserPrint "      Initial setting was "
	lfsr	1,SYSSTRINGPARAM2
	movlw	low StringTable31
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable31
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable31
	movwf	TBLPTRU,ACCESS
	banksel	0
	rcall	SYSREADSTRING
	movlw	low SYSSTRINGPARAM2
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM2
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM2*26
	banksel	0
	call	HSERPRINT419
;HserPrint "0x" + hex(verify)
	movff	VERIFY,SYSVALTEMP
	call	FN__HEXPICAS
	lfsr	1,SYSSTRINGPARAM2
	clrf	SysStringLength,ACCESS
	movlw	low StringTable32
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable32
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable32
	movwf	TBLPTRU,ACCESS
	rcall	SYSREADSTRINGPART
	lfsr	0,_HEXPICAS
	rcall	SYSCOPYSTRINGPART
	lfsr	0,SYSSTRINGPARAM2
	movff	SysStringLength, INDF0
	movlw	low SYSSTRINGPARAM2
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM2
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM2*2
	banksel	0
	call	HSERPRINT419
;Case 0x6C to 0x6F
	bra	SysSelectEnd2
SysSelect2Case2
	movlw	108
	subwf	XXLOOP,W,BANKED
	btfss	STATUS, C,ACCESS
	bra	SysSelect2Case3
	movf	XXLOOP,W,BANKED
	sublw	111
	btfss	STATUS, C,ACCESS
	bra	SysSelect2Case3
;HserPrint "      GLCD graphic commands overwrite  "
	lfsr	1,SYSSTRINGPARAM2
	movlw	low StringTable33
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable33
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable33
	movwf	TBLPTRU,ACCESS
	banksel	0
	rcall	SYSREADSTRING
	movlw	low SYSSTRINGPARAM2
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM2
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM2*39
	banksel	0
	call	HSERPRINT419
;HserPrint "0x" + hex(verify)
	movff	VERIFY,SYSVALTEMP
	call	FN__HEXPICAS
	lfsr	1,SYSSTRINGPARAM2
	clrf	SysStringLength,ACCESS
	movlw	low StringTable32
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable32
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable32
	movwf	TBLPTRU,ACCESS
	rcall	SYSREADSTRINGPART
	lfsr	0,_HEXPICAS
	rcall	SYSCOPYSTRINGPART
	lfsr	0,SYSSTRINGPARAM2
	movff	SysStringLength, INDF0
	movlw	low SYSSTRINGPARAM2
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM2
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM2*2
	banksel	0
	call	HSERPRINT419
;Case 0x8A
	bra	SysSelectEnd2
SysSelect2Case3
	movlw	138
	subwf	XXLOOP,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelect2Case4
;HserPrint "      Timer 0 running value  "
	lfsr	1,SYSSTRINGPARAM2
	movlw	low StringTable34
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable34
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable34
	movwf	TBLPTRU,ACCESS
	banksel	0
	rcall	SYSREADSTRING
	movlw	low SYSSTRINGPARAM2
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM2
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM2*29
	banksel	0
	call	HSERPRINT419
;HserPrint "0x" + hex(verify)
	movff	VERIFY,SYSVALTEMP
	call	FN__HEXPICAS
	lfsr	1,SYSSTRINGPARAM2
	clrf	SysStringLength,ACCESS
	movlw	low StringTable32
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable32
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable32
	movwf	TBLPTRU,ACCESS
	rcall	SYSREADSTRINGPART
	lfsr	0,_HEXPICAS
	rcall	SYSCOPYSTRINGPART
	lfsr	0,SYSSTRINGPARAM2
	movff	SysStringLength, INDF0
	movlw	low SYSSTRINGPARAM2
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM2
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM2*2
	banksel	0
	call	HSERPRINT419
;Case 0x8E
	bra	SysSelectEnd2
SysSelect2Case4
	movlw	142
	subwf	XXLOOP,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelect2Case5
;HserPrint "      Timer 1 running value  "
	lfsr	1,SYSSTRINGPARAM2
	movlw	low StringTable35
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable35
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable35
	movwf	TBLPTRU,ACCESS
	banksel	0
	rcall	SYSREADSTRING
	movlw	low SYSSTRINGPARAM2
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM2
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM2*29
	banksel	0
	call	HSERPRINT419
;HserPrint "0x" + hex(verify)
	movff	VERIFY,SYSVALTEMP
	call	FN__HEXPICAS
	lfsr	1,SYSSTRINGPARAM2
	clrf	SysStringLength,ACCESS
	movlw	low StringTable32
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable32
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable32
	movwf	TBLPTRU,ACCESS
	rcall	SYSREADSTRINGPART
	lfsr	0,_HEXPICAS
	rcall	SYSCOPYSTRINGPART
	lfsr	0,SYSSTRINGPARAM2
	movff	SysStringLength, INDF0
	movlw	low SYSSTRINGPARAM2
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM2
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM2*2
	banksel	0
	call	HSERPRINT419
;Case 0xAA
	bra	SysSelectEnd2
SysSelect2Case5
	movlw	170
	subwf	XXLOOP,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	SysSelect2Case6
;HserPrint "      Reg not initialised OK"
;Case Else
	bra	SysSelectEnd2
SysSelect2Case6
;HserPrint " ERROR! should read "
	lfsr	1,SYSSTRINGPARAM2
	movlw	low StringTable36
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable36
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable36
	movwf	TBLPTRU,ACCESS
	banksel	0
	rcall	SYSREADSTRING
	movlw	low SYSSTRINGPARAM2
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM2
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM2*20
	banksel	0
	call	HSERPRINT419
;HserPrint "0x" + hex(verify)
	movff	VERIFY,SYSVALTEMP
	call	FN__HEXPICAS
	lfsr	1,SYSSTRINGPARAM2
	clrf	SysStringLength,ACCESS
	movlw	low StringTable32
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable32
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable32
	movwf	TBLPTRU,ACCESS
	rcall	SYSREADSTRINGPART
	lfsr	0,_HEXPICAS
	rcall	SYSCOPYSTRINGPART
	lfsr	0,SYSSTRINGPARAM2
	movff	SysStringLength, INDF0
	movlw	low SYSSTRINGPARAM2
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM2
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM2*2
	banksel	0
	call	HSERPRINT419
;End Select
SysSelectEnd2
;else if validreg = 1 Then
	bra	ENDIF28
ELSE28_1
	decf	VALIDREG,W,BANKED
	btfss	STATUS, Z,ACCESS
	bra	ENDIF28
;HserPrint "      Verified 0x"
	lfsr	1,SYSSTRINGPARAM2
	movlw	low StringTable37
	movwf	TBLPTRL,ACCESS
	movlw	high StringTable37
	movwf	TBLPTRH,ACCESS
	movlw	upper StringTable37
	movwf	TBLPTRU,ACCESS
	banksel	0
	rcall	SYSREADSTRING
	movlw	low SYSSTRINGPARAM2
	banksel	SYSPRINTDATAHANDLER
	movwf	SysPRINTDATAHandler,BANKED
	movlw	high SYSSTRINGPARAM2
	movwf	SysPRINTDATAHandler_H,BANKED
	movlw	1
	movwf	COMPORT,ACCESS
;Using SYSSTRINGPARAM2*17
	banksel	0
	call	HSERPRINT419
;HserPrint hex(verify)
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
	call	HSERPRINT419
;end if
ENDIF28
;if validreg = 0 then  HserPrint "      Reg not initialised OK"
;HserPrintCRLF
	movlw	1
	movwf	HSERPRINTCRLFCOUNT,ACCESS
	movlw	1
	movwf	COMPORT,ACCESS
	banksel	0
	call	HSERPRINTCRLF
;end if
ENDIF24
;next
	movlw	255
	banksel	XXLOOP
	subwf	XXLOOP,W,BANKED
	btfss	STATUS, C,ACCESS
	bra	SysForLoop4
SysForLoopEnd4
	banksel	0
	return

;********************************************************************************

;Source: string.h (124)
FN_STR
;SysCharCount = 0
	banksel	SYSCHARCOUNT
	clrf	SYSCHARCOUNT,BANKED
;Dim SysCalcTempX As Word
;Ten Thousands
;IF SysValTemp >= 10000 then
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
	bra	ENDIF42
;SysStrData = SysValTemp / 10000
	movff	SYSVALTEMP,SysWORDTempA
	movff	SYSVALTEMP_H,SysWORDTempA_H
	movlw	16
	movwf	SysWORDTempB,ACCESS
	movlw	39
	movwf	SysWORDTempB_H,ACCESS
	rcall	SYSDIVSUB16
	movff	SysWORDTempA,SYSSTRDATA
;SysValTemp = SysCalcTempX
	movff	SYSCALCTEMPX,SYSVALTEMP
	movff	SYSCALCTEMPX_H,SYSVALTEMP_H
;SysCharCount += 1
	banksel	SYSCHARCOUNT
	incf	SYSCHARCOUNT,F,BANKED
;Str(SysCharCount) = SysStrData + 48
	lfsr	0,STR
	movf	SYSCHARCOUNT,W,BANKED
	addwf	AFSR0,F,ACCESS
	movlw	0
	addwfc	AFSR0_H,F,ACCESS
	movlw	48
	addwf	SYSSTRDATA,W,BANKED
	movwf	INDF0,ACCESS
;Goto SysValThousands
	bra	SYSVALTHOUSANDS
;End If
ENDIF42
;Thousands
;IF SysValTemp >= 1000 then
	movff	SYSVALTEMP,SysWORDTempA
	movff	SYSVALTEMP_H,SysWORDTempA_H
	movlw	232
	movwf	SysWORDTempB,ACCESS
	movlw	3
	movwf	SysWORDTempB_H,ACCESS
	rcall	SYSCOMPLESSTHAN16
	comf	SysByteTempX,F,ACCESS
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF43
SYSVALTHOUSANDS
;SysStrData = SysValTemp / 1000
	movff	SYSVALTEMP,SysWORDTempA
	movff	SYSVALTEMP_H,SysWORDTempA_H
	movlw	232
	movwf	SysWORDTempB,ACCESS
	movlw	3
	movwf	SysWORDTempB_H,ACCESS
	banksel	0
	rcall	SYSDIVSUB16
	movff	SysWORDTempA,SYSSTRDATA
;SysValTemp = SysCalcTempX
	movff	SYSCALCTEMPX,SYSVALTEMP
	movff	SYSCALCTEMPX_H,SYSVALTEMP_H
;SysCharCount += 1
	banksel	SYSCHARCOUNT
	incf	SYSCHARCOUNT,F,BANKED
;Str(SysCharCount) = SysStrData + 48
	lfsr	0,STR
	movf	SYSCHARCOUNT,W,BANKED
	addwf	AFSR0,F,ACCESS
	movlw	0
	addwfc	AFSR0_H,F,ACCESS
	movlw	48
	addwf	SYSSTRDATA,W,BANKED
	movwf	INDF0,ACCESS
;Goto SysValHundreds
	bra	SYSVALHUNDREDS
;End If
ENDIF43
;Hundreds
;IF SysValTemp >= 100 then
	movff	SYSVALTEMP,SysWORDTempA
	movff	SYSVALTEMP_H,SysWORDTempA_H
	movlw	100
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	rcall	SYSCOMPLESSTHAN16
	comf	SysByteTempX,F,ACCESS
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF44
SYSVALHUNDREDS
;SysStrData = SysValTemp / 100
	movff	SYSVALTEMP,SysWORDTempA
	movff	SYSVALTEMP_H,SysWORDTempA_H
	movlw	100
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	banksel	0
	rcall	SYSDIVSUB16
	movff	SysWORDTempA,SYSSTRDATA
;SysValTemp = SysCalcTempX
	movff	SYSCALCTEMPX,SYSVALTEMP
	movff	SYSCALCTEMPX_H,SYSVALTEMP_H
;SysCharCount += 1
	banksel	SYSCHARCOUNT
	incf	SYSCHARCOUNT,F,BANKED
;Str(SysCharCount) = SysStrData + 48
	lfsr	0,STR
	movf	SYSCHARCOUNT,W,BANKED
	addwf	AFSR0,F,ACCESS
	movlw	0
	addwfc	AFSR0_H,F,ACCESS
	movlw	48
	addwf	SYSSTRDATA,W,BANKED
	movwf	INDF0,ACCESS
;Goto SysValTens
	bra	SYSVALTENS
;End If
ENDIF44
;Tens
;IF SysValTemp >= 10 Then
	movff	SYSVALTEMP,SysWORDTempA
	movff	SYSVALTEMP_H,SysWORDTempA_H
	movlw	10
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	rcall	SYSCOMPLESSTHAN16
	comf	SysByteTempX,F,ACCESS
	btfss	SysByteTempX,0,ACCESS
	bra	ENDIF45
SYSVALTENS
;SysStrData = SysValTemp / 10
	movff	SYSVALTEMP,SysWORDTempA
	movff	SYSVALTEMP_H,SysWORDTempA_H
	movlw	10
	movwf	SysWORDTempB,ACCESS
	clrf	SysWORDTempB_H,ACCESS
	banksel	0
	rcall	SYSDIVSUB16
	movff	SysWORDTempA,SYSSTRDATA
;SysValTemp = SysCalcTempX
	movff	SYSCALCTEMPX,SYSVALTEMP
	movff	SYSCALCTEMPX_H,SYSVALTEMP_H
;SysCharCount += 1
	banksel	SYSCHARCOUNT
	incf	SYSCHARCOUNT,F,BANKED
;Str(SysCharCount) = SysStrData + 48
	lfsr	0,STR
	movf	SYSCHARCOUNT,W,BANKED
	addwf	AFSR0,F,ACCESS
	movlw	0
	addwfc	AFSR0_H,F,ACCESS
	movlw	48
	addwf	SYSSTRDATA,W,BANKED
	movwf	INDF0,ACCESS
;End If
ENDIF45
;Ones
;SysCharCount += 1
	banksel	SYSCHARCOUNT
	incf	SYSCHARCOUNT,F,BANKED
;Str(SysCharCount) = SysValTemp + 48
	lfsr	0,STR
	movf	SYSCHARCOUNT,W,BANKED
	addwf	AFSR0,F,ACCESS
	movlw	0
	addwfc	AFSR0_H,F,ACCESS
	movlw	48
	addwf	SYSVALTEMP,W,BANKED
	movwf	INDF0,ACCESS
;SysValTemp = SysCalcTempX
	movff	SYSCALCTEMPX,SYSVALTEMP
	movff	SYSCALCTEMPX_H,SYSVALTEMP_H
;Str(0) = SysCharCount
	movffl	SYSCHARCOUNT,SYSSTR_0
	banksel	0
	return

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

;Source: system.h (4087)
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

;Source: system.h (4141)
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

;Source: system.h (4451)
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

;Source: system.h (4481)
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

;Source: system.h (4919)
SYSCOMPLESSTHANINT
;Dim SysIntegerTempA, SysIntegerTempB, SysDivMultA as Integer
;Clear result
;SysByteTempX = 0
	clrf	SYSBYTETEMPX,ACCESS
;Compare sign bits
;-A
;If SysIntegerTempA.15 = On Then
	btfss	SYSINTEGERTEMPA_H,7,ACCESS
	bra	ELSE82_1
;-A, +B, return true
;If SysIntegerTempB.15 = Off Then
	btfsc	SYSINTEGERTEMPB_H,7,ACCESS
	bra	ENDIF83
;Set SysByteTempX to 255
;SysByteTempX = Not SysByteTempX
	comf	SYSBYTETEMPX,F,ACCESS
;Exit Sub
	return
;End If
ENDIF83
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
	bra	ENDIF82
ELSE82_1
;+A, -B, return false
;If SysIntegerTempB.15 = On Then
	btfsc	SYSINTEGERTEMPB_H,7,ACCESS
;Exit Sub
	return
;End If
;End If
ENDIF82
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

;Source: system.h (3455)
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
	bra	ENDIF37
;SysWordTempA = 0
	clrf	SYSWORDTEMPA,ACCESS
	clrf	SYSWORDTEMPA_H,ACCESS
;exit sub
	return
;end if
ENDIF37
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
	bra	ENDIF38
;Set SysDivMultA.0 Off
	bcf	SYSDIVMULTA,0,ACCESS
;SysDivMultX = SysDivMultX + SysDivMultB
	movf	SYSDIVMULTB,W,ACCESS
	addwf	SYSDIVMULTX,F,ACCESS
	movf	SYSDIVMULTB_H,W,ACCESS
	addwfc	SYSDIVMULTX_H,F,ACCESS
;End If
ENDIF38
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

;Source: system.h (3531)
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
	bra	ENDIF39
;SysLongTempA = 0
	clrf	SYSLONGTEMPA,ACCESS
	clrf	SYSLONGTEMPA_H,ACCESS
	clrf	SYSLONGTEMPA_U,ACCESS
	clrf	SYSLONGTEMPA_E,ACCESS
;exit sub
	return
;end if
ENDIF39
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
	bra	ENDIF40
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
ENDIF40
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

;Source: system.h (3509)
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
	bra	ENDIF79
;If SysIntegerTempA.15 Then SysIntegerTempA = -SysIntegerTempA
	comf	SYSINTEGERTEMPA,F,ACCESS
	comf	SYSINTEGERTEMPA_H,F,ACCESS
	incf	SYSINTEGERTEMPA,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	SYSINTEGERTEMPA_H,F,ACCESS
;If SysIntegerTempA.15 Then SysIntegerTempA = -SysIntegerTempA
ENDIF79
;If SysIntegerTempB.15 Then SysIntegerTempB = -SysIntegerTempB
	btfss	SYSINTEGERTEMPB_H,7,ACCESS
	bra	ENDIF80
;If SysIntegerTempB.15 Then SysIntegerTempB = -SysIntegerTempB
	comf	SYSINTEGERTEMPB,F,ACCESS
	comf	SYSINTEGERTEMPB_H,F,ACCESS
	incf	SYSINTEGERTEMPB,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	SYSINTEGERTEMPB_H,F,ACCESS
;If SysIntegerTempB.15 Then SysIntegerTempB = -SysIntegerTempB
ENDIF80
;Call word divide routine
;SysDivSub16
	rcall	SYSDIVSUB16
;Negate result if necessary
;If SysSignByte.7 Then
	btfss	SYSSIGNBYTE,7,ACCESS
	bra	ENDIF81
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
ENDIF81
	return

;********************************************************************************

;Source: system.h (2921)
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

;Source: system.h (3038)
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
	bra	ENDIF35
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
ENDIF35
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

;Source: system.h (3019)
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
	bra	ENDIF76
;if SysIntegerTempA.15 then SysIntegerTempA = -SysIntegerTempA
	comf	SYSINTEGERTEMPA,F,ACCESS
	comf	SYSINTEGERTEMPA_H,F,ACCESS
	incf	SYSINTEGERTEMPA,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	SYSINTEGERTEMPA_H,F,ACCESS
;if SysIntegerTempA.15 then SysIntegerTempA = -SysIntegerTempA
ENDIF76
;if SysIntegerTempB.15 then SysIntegerTempB = -SysIntegerTempB
	btfss	SYSINTEGERTEMPB_H,7,ACCESS
	bra	ENDIF77
;if SysIntegerTempB.15 then SysIntegerTempB = -SysIntegerTempB
	comf	SYSINTEGERTEMPB,F,ACCESS
	comf	SYSINTEGERTEMPB_H,F,ACCESS
	incf	SYSINTEGERTEMPB,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	SYSINTEGERTEMPB_H,F,ACCESS
;if SysIntegerTempB.15 then SysIntegerTempB = -SysIntegerTempB
ENDIF77
;Call word multiply routine
;SysMultSub16
	rcall	SYSMULTSUB16
;Negate result if necessary
;if SysSignByte.7 then SysIntegerTempX = -SysIntegerTempX
	btfss	SYSSIGNBYTE,7,ACCESS
	bra	ENDIF78
;if SysSignByte.7 then SysIntegerTempX = -SysIntegerTempX
	comf	SYSINTEGERTEMPX,F,ACCESS
	comf	SYSINTEGERTEMPX_H,F,ACCESS
	incf	SYSINTEGERTEMPX,F,ACCESS
	btfsc	STATUS,Z,ACCESS
	incf	SYSINTEGERTEMPX_H,F,ACCESS
;if SysSignByte.7 then SysIntegerTempX = -SysIntegerTempX
ENDIF78
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

StringTable2
	db	11,73,110,105,116,105,97,108,105,115,101,100


StringTable4
	db	6,66,117,105,108,100,32


StringTable5
	db	3,32,64,32


StringTable6
	db	1,120


StringTable7
	db	13,76,101,118,101,84,111,112,32,76,84,55,54,56


StringTable8
	db	7,71,67,66,65,83,73,67


StringTable10
	db	12,83,111,102,116,119,97,114,101,32,83,80,73


StringTable11
	db	11,67,104,105,112,102,97,109,105,108,121,32


StringTable12
	db	12,71,67,66,65,83,73,67,32,50,48,50,52


StringTable13
	db	6,67,105,114,99,108,101


StringTable14
	db	8,84,82,73,65,78,71,76,69


StringTable15
	db	14,70,73,76,76,69,68,84,82,73,65,78,71,76,69


StringTable16
	db	11,80,87,77,32,84,101,115,116,105,110,103


StringTable17
	db	13,68,114,97,119,32,67,121,108,105,110,100,101,114


StringTable18
	db	17,68,114,97,119,81,117,97,100,114,105,108,97,116,101,114,97,108


StringTable19
	db	23,70,105,108,108,101,100,68,114,97,119,81,117,97,100,114,105,108,97,116,101,114
	db	97,108


StringTable20
	db	8,68,101,99,32,50,48,50,51


StringTable21
	db	27,76,84,55,54,56,54,32,76,105,98,114,97,114,121,32,68,101,118,101,108,111,112,109
	db	101,110,116,32


StringTable22
	db	31,80,114,111,99,101,101,100,105,110,103,32,119,105,116,104,32,71,76,67,68,32
	db	111,112,101,114,97,116,105,111,110,115


StringTable23
	db	34,76,84,55,54,56,54,95,82,69,71,95,83,84,83,82,32,115,116,97,116,117,115,32
	db	114,101,103,105,115,116,101,114,32,48,98


StringTable24
	db	22,32,32,32,32,115,101,101,32,100,97,116,97,115,104,101,101,116,32,49,57,46,49


StringTable25
	db	56,76,84,55,54,56,54,95,105,110,105,116,118,101,114,105,102,121,99,111,117,110
	db	116,101,114,32,40,32,115,104,111,117,108,100,32,110,111,116,32,98,101,32,97,32
	db	98,105,103,32,110,117,109,98,101,114,33,41,32


StringTable26
	db	12,83,76,82,67,79,78,65,32,61,32,48,120


StringTable27
	db	14,46,32,83,76,82,67,79,78,66,32,61,32,48,120


StringTable28
	db	14,46,32,83,76,82,67,79,78,67,32,61,32,48,120


StringTable29
	db	7,82,101,103,32,91,48,120


StringTable30
	db	5,93,32,58,48,120


StringTable31
	db	26,32,32,32,32,32,32,73,110,105,116,105,97,108,32,115,101,116,116,105,110,103
	db	32,119,97,115,32


StringTable32
	db	2,48,120


StringTable33
	db	39,32,32,32,32,32,32,71,76,67,68,32,103,114,97,112,104,105,99,32,99,111,109,109
	db	97,110,100,115,32,111,118,101,114,119,114,105,116,101,32,32


StringTable34
	db	29,32,32,32,32,32,32,84,105,109,101,114,32,48,32,114,117,110,110,105,110,103,32,118
	db	97,108,117,101,32,32


StringTable35
	db	29,32,32,32,32,32,32,84,105,109,101,114,32,49,32,114,117,110,110,105,110,103,32,118
	db	97,108,117,101,32,32


StringTable36
	db	20,32,69,82,82,79,82,33,32,115,104,111,117,108,100,32,114,101,97,100,32


StringTable37
	db	17,32,32,32,32,32,32,86,101,114,105,102,105,101,100,32,48,120


StringTable38
	db	4,49,49,49,53


StringTable39
	db	19,49,50,45,48,51,45,50,48,50,52,32,49,54,58,52,50,58,49,57


StringTable113
	db	1,93


StringTable125
	db	0


StringTable129
	db	1,49


StringTable130
	db	1,48


StringTable206
	db	17,73,110,105,116,71,76,67,68,95,76,84,55,54,56,54,40,41


StringTable210
	db	39,83,87,32,83,80,73,77,79,68,69,32,73,110,105,116,105,97,108,105,115,101,100,32
	db	83,80,73,32,99,108,111,99,107,109,111,100,101,32,61,32


StringTable211
	db	31,76,84,55,54,56,54,95,83,111,102,116,119,97,114,101,95,82,101,115,101,116,32,99
	db	97,108,108,101,100,46,46,46


StringTable212
	db	36,76,84,55,54,56,54,95,83,111,102,116,119,97,114,101,95,82,101,115,101,116,32,105
	db	110,105,116,105,97,108,105,115,101,100,46,46,46


StringTable213
	db	30,76,84,55,54,56,54,95,67,104,101,99,107,95,73,110,105,116,32,99,111,109,109,101
	db	110,99,101,100,46,46,46


StringTable214
	db	30,76,84,55,54,56,54,95,67,104,101,99,107,95,73,110,105,116,32,99,111,109,112,108
	db	101,116,101,100,46,46,46


StringTable215
	db	54,76,84,55,54,56,54,95,67,104,101,99,107,95,73,110,105,116,32,114,101,115,117,108
	db	116,32,91,76,84,55,54,56,54,95,67,104,101,99,107,95,73,110,105,116,95,67,111,117
	db	110,116,101,114,32,61,32


StringTable216
	db	47,32,105,115,32,97,110,32,73,110,105,116,105,97,108,105,115,97,116,105,111,110
	db	32,102,97,105,108,117,114,101,45,32,99,104,101,99,107,32,112,111,119,101,114,32
	db	101,116,99,46


StringTable217
	db	2,48,121


StringTable218
	db	2,58,32


StringTable219
	db	8,82,101,97,100,82,101,103,58


StringTable220
	db	3,44,48,120


StringTable221
	db	3,32,118,32


StringTable228
	db	8,49,56,70,50,55,81,52,51


;********************************************************************************

;Source: GLCD_LT7686.H (830)
TRIANGLE_LT7686
;LT7686_CreateTriangle
;Macro Source: GLCD_LT7686.H (877)
;LT7686_CreateBox
;Macro Source: GLCD_LT7686.H (503)
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
;LT7686_WriteCMD(0x70)
	movlw	112
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset3)
	movff	XOFFSET3,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x71)
	movlw	113
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(xoffset3_H)
	movff	XOFFSET3_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x72)
	movlw	114
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset3)
	movff	YOFFSET3,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_WriteCMD(0x73)
	movlw	115
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(yoffset3_H)
	movff	YOFFSET3_H,__OUTBYTE
	call	LT7686_WRITEDATA
;LT7686_SendColor
;Macro Source: GLCD_LT7686.H (1594)
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
;LT7686_WriteCMD(0x67)
	movlw	103
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITECMD
;LT7686_WriteData(0x82)//B1000_0010
	movlw	130
	banksel	__OUTBYTE
	movwf	__OUTBYTE,BANKED
	banksel	0
	call	LT7686_WRITEDATA
;Core Task is Busy, Fontwr_Busy
;LT7686_Check_Busy_Draw
	goto	LT7686_CHECK_BUSY_DRAW

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
	banksel	SYSVALTEMP
	andwf	SYSVALTEMP,W,BANKED
	movwf	SYSSTRINGTEMP,BANKED
;If SysStringTemp > 9 Then SysStringTemp = SysStringTemp + 7
	sublw	9
	btfsc	STATUS, C,ACCESS
	bra	ENDIF32
;If SysStringTemp > 9 Then SysStringTemp = SysStringTemp + 7
	movlw	7
	addwf	SYSSTRINGTEMP,F,BANKED
;If SysStringTemp > 9 Then SysStringTemp = SysStringTemp + 7
ENDIF32
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
SysForLoop7
	incf	SYSSTRINGTEMP,F,BANKED
;Rotate SysValTemp Right
	rrcf	SYSVALTEMP,F,BANKED
;Next
	movlw	4
	subwf	SYSSTRINGTEMP,W,BANKED
	btfss	STATUS, C,ACCESS
	bra	SysForLoop7
SysForLoopEnd7
;SysStringTemp = SysValTemp And 0x0F
	movlw	15
	andwf	SYSVALTEMP,W,BANKED
	movwf	SYSSTRINGTEMP,BANKED
;If SysStringTemp > 9 Then SysStringTemp = SysStringTemp + 7
	sublw	9
	btfsc	STATUS, C,ACCESS
	bra	ENDIF34
;If SysStringTemp > 9 Then SysStringTemp = SysStringTemp + 7
	movlw	7
	addwf	SYSSTRINGTEMP,F,BANKED
;If SysStringTemp > 9 Then SysStringTemp = SysStringTemp + 7
ENDIF34
;_HexPICAS(1) = SysStringTemp + 48
	movlw	48
	addwf	SYSSTRINGTEMP,W,BANKED
	banksel	SYS_HEXPICAS_1
	movwf	SYS_HEXPICAS_1,BANKED
	banksel	0
	return

;********************************************************************************


 END
