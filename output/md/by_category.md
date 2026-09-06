<div class="section">

<div class="titlepage">

<div>

<div>

### <span id="by_category"></span>By Category

</div>

</div>

</div>

<span class="strong">**Analog/Digital conversion**</span>

<div class="informaltable">

| Command                                                                                                                                                                      | Summary                                                                                                                                     |
|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------|
| <a href="adformat_deprecated_do_not_use" class="link" title="ADFormat (Deprecated - Do not use)">ADFormat (Deprecated - Do not use)</a>                                | ADFormat ( Format\_Left \| Format\_Right )                                                                                                  |
| <a href="adoff" class="link" title="ADOff">ADOff</a>                                                                                                                   | This command is obsolete. There should be no need to call it. GCBASIC                                                                       |
| <a href="analog_digital_conversion_code_optimisation" class="link" title="Analog/Digital Conversion Code Optimisation">Analog/Digital Conversion Code Optimisation</a> | The analog to digital converter (ADC or A/D) module support is implemented by GCBASIC to provide 8-bit, 10-bit and 12-bit Single channel …​ |
| <a href="analog_digital_conversion_overview" class="link" title="Analog/Digital Conversion Overview">Analog/Digital Conversion Overview</a>                            | The analog to digital converter (ADC or A/D) module support is implemented by GCBASIC to provide 8-bit, 10-bit and 12-bit Single channel …​ |
| <a href="readad" class="link" title="ReadAD">ReadAD</a>                                                                                                                | For a normal ( also called a Single Channel ) read use.                                                                                     |
| <a href="readad10" class="link" title="ReadAD10">ReadAD10</a>                                                                                                          | For a normal ( also called a Single Channel ) read use.                                                                                     |
| <a href="readad12" class="link" title="ReadAD12">ReadAD12</a>                                                                                                          | For a normal ( also called a Single Channel ) read use.                                                                                     |
| <a href="pot" class="link" title="Pot">Pot</a>                                                                                                                         | Pot <span class="emphasis">*pin, output*</span>                                                                                             |

</div>

<span class="strong">**Bitwise**</span>

<div class="informaltable">

| Command                                                                                                                      | Summary                                                                                         |
|:-----------------------------------------------------------------------------------------------------------------------------|:------------------------------------------------------------------------------------------------|
| <a href="bitwise_operations_overview" class="link" title="Bitwise Operations Overview">Bitwise Operations Overview</a> | GCBASIC (as with most other microcontroller programming languages) supports bitwise operations. |
| <a href="fnlsl" class="link" title="FnLSL">FnLSL</a>                                                                   | BitsOut = FnLSL(BitsIn, NumBits)                                                                |
| <a href="fnlsr" class="link" title="FnLSR">FnLSR</a>                                                                   | BitsOut = FnLSR(BitsIn, NumBits)                                                                |
| <a href="setwith" class="link" title="SetWith">SetWith</a>                                                             | SetWith(TargetBit, Source)                                                                      |

</div>

<span class="strong">**MCU EEPROM ( DFM )**</span>

<div class="informaltable">

| Command                                                                                           | Summary                                                                                |
|:--------------------------------------------------------------------------------------------------|:---------------------------------------------------------------------------------------|
| <a href="dataset_for_eeprom" class="link" title="Dataset for EEPROM">Dataset for EEPROM</a> | EEPROM DataSetName \[\[,\]address\]                                                    |
| <a href="epread" class="link" title="EPRead">EPRead</a>                                     | EPRead <span class="emphasis">*location, store*</span>                                 |
| <a href="epwrite" class="link" title="EPWrite">EPWrite</a>                                  | EPWrite <span class="emphasis">*location*</span>, <span class="emphasis">*data*</span> |

</div>

<span class="strong">**HEFM ( PFM )**</span>

<div class="informaltable">

| Command                                                                            | Summary                                                                                                                                     |
|:-----------------------------------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------|
| <a href="heferaseblock" class="link" title="HEFEraseBlock">HEFEraseBlock</a> | HEFEraseBlock ( block\_number )                                                                                                             |
| <a href="hefm_overview" class="link" title="HEFM Overview">HEFM Overview</a> | Some enhanced mid-range Microchip PIC devices support High-Endurance Flash (HEF) memory. These devices lack the data EEPROM found on othe…​ |
| <a href="hefread" class="link" title="HEFRead">HEFRead</a>                   | 'as a subroutine                                                                                                                            |
| <a href="hefreadblock" class="link" title="HEFReadBlock">HEFReadBlock</a>    | HEFReadBlock ( block\_number, buffer(), \[, num\_bytes\] )                                                                                  |
| <a href="hefreadword" class="link" title="HEFReadWord">HEFReadWord</a>       | 'as a subroutine                                                                                                                            |
| <a href="hefwrite" class="link" title="HEFWrite">HEFWrite</a>                | HEFWrite ( location, data )                                                                                                                 |
| <a href="hefwriteblock" class="link" title="HEFWriteBlock">HEFWriteBlock</a> | HEFWriteBlock ( block\_number, buffer(), \[, num\_bytes\] )                                                                                 |
| <a href="hefwriteword" class="link" title="HEFWriteWord">HEFWriteWord</a>    | HEFWriteWord ( location, data\_word\_value )                                                                                                |

</div>

<span class="strong">**PROGMEM ( PFM )**</span>

<div class="informaltable">

| Command                                                                         | Summary                                                                                        |
|:--------------------------------------------------------------------------------|:-----------------------------------------------------------------------------------------------|
| <a href="data" class="link" title="DATA">DATA</a>                         | DATA DataSetName \[as Byte \| Word\]                                                           |
| <a href="pfmread" class="link" title="PFMRead">PFMRead</a>                | PFMRead (<span class="emphasis">*location, store*</span>)                                      |
| <a href="pfmwrite" class="link" title="PFMWrite">PFMWrite</a>             | PFMWrite (<span class="emphasis">*location*</span>, <span class="emphasis">*value*</span>)     |
| <a href="programerase" class="link" title="ProgramErase">ProgramErase</a> | ProgramErase (<span class="emphasis">*location*</span>)                                        |
| <a href="programread" class="link" title="ProgramRead">ProgramRead</a>    | ProgramRead (<span class="emphasis">*location, store*</span>)                                  |
| <a href="programwrite" class="link" title="ProgramWrite">ProgramWrite</a> | ProgramWrite (<span class="emphasis">*location*</span>, <span class="emphasis">*value*</span>) |

</div>

<span class="strong">**PROGMEM ( MCU Configuration )**</span>

<div class="informaltable">

| Command                                                                                                          | Summary                                                                   |
|:-----------------------------------------------------------------------------------------------------------------|:--------------------------------------------------------------------------|
| <a href="deviceconfigurationread" class="link" title="DeviceConfigurationRead">DeviceConfigurationRead</a> | deviceconfigurationRead (<span class="emphasis">*location, store*</span>) |

</div>

<span class="strong">**SAFM**</span>

<div class="informaltable">

| Command                                                                            | Summary                                                                                                                                     |
|:-----------------------------------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------|
| <a href="saferaseblock" class="link" title="SAFEraseBlock">SAFEraseBlock</a> | SAFEraseBlock ( block\_number )                                                                                                             |
| <a href="safm_overview" class="link" title="SAFM Overview">SAFM Overview</a> | Some Advanced (18F) and some Enhanced Mid-Range (16F) Microchip PIC devices support Storage Area Flash (SAF) memory. These devices also i…​ |
| <a href="safread" class="link" title="SAFRead">SAFRead</a>                   | 'as a subroutine                                                                                                                            |
| <a href="safreadblock" class="link" title="SAFReadBlock">SAFReadBlock</a>    | SAFReadBlock ( block\_number, buffer(), \[, num\_bytes\] )                                                                                  |
| <a href="safreadword" class="link" title="SAFReadWord">SAFReadWord</a>       | 'as a subroutine                                                                                                                            |
| <a href="safwrite" class="link" title="SAFWrite">SAFWrite</a>                | SAFWrite ( location, data )                                                                                                                 |
| <a href="safwriteblock" class="link" title="SAFWriteBlock">SAFWriteBlock</a> | SAFWriteBlock ( block\_number, buffer(), \[, num\_bytes\] )                                                                                 |
| <a href="safwriteword" class="link" title="SAFWriteWord">SAFWriteWord</a>    | SAFWriteWord ( location, data\_word\_value )                                                                                                |

</div>

<span class="strong">**EERAM ( Device )**</span>

<div class="informaltable">

| Command                                                                                              | Summary                                      |
|:-----------------------------------------------------------------------------------------------------|:---------------------------------------------|
| <a href="47xxx_eeram_devices" class="link" title="47xxx EERAM Devices">47xxx EERam Devices</a> | This section covers the 47xxx EERam devices. |

</div>

<span class="strong">**SRAM ( Device )**</span>

<div class="informaltable">

| Command                                                                            | Summary                                                                                                                                     |
|:-----------------------------------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------|
| <a href="sram_overview" class="link" title="SRAM Overview">SRAM Overview</a> | Serial SRAM is a standalone volatile memory that provides an easy and inexpensive way to add more RAM to application. These are 8-pin low…​ |
| <a href="sramread" class="link" title="SRAMRead">SRAMRead</a>                | SRAMRead <span class="emphasis">*location, store*</span>                                                                                    |
| <a href="sramwrite" class="link" title="SRAMWrite">SRAMWrite</a>             | SRAMWrite <span class="emphasis">*location*</span>, <span class="emphasis">*data*</span>                                                    |

</div>

<span class="strong">**Flow control**</span>

<div class="informaltable">

| Command                                                          | Summary                                                                                                                                                                       |
|:-----------------------------------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <a href="do" class="link" title="Do">Do</a>                | Do \[{While \| Until} <span class="emphasis">*condition*</span>\]                                                                                                             |
| <a href="end" class="link" title="End">End</a>             | End                                                                                                                                                                           |
| <a href="exit" class="link" title="Exit">Exit</a>          | Exit Sub \| Exit Function \| Exit Do \| Exit For \| Exit Repeat                                                                                                               |
| <a href="for" class="link" title="For">For</a>             | For <span class="emphasis">*counter*</span> = <span class="emphasis">*start*</span> To <span class="emphasis">*end*</span> \[Step <span class="emphasis">*increment*</span>\] |
| <a href="gosub" class="link" title="Gosub">Gosub</a>       | Gosub <span class="emphasis">*label*</span>                                                                                                                                   |
| <a href="goto" class="link" title="Goto">Goto</a>          | Goto <span class="emphasis">*label*</span>                                                                                                                                    |
| <a href="if" class="link" title="If">If</a>                | If <span class="emphasis">*condition*</span> Then <span class="emphasis">*command*</span>                                                                                     |
| <a href="indcall" class="link" title="IndCall">IndCall</a> | IndCall <span class="emphasis">*Address*</span>                                                                                                                               |
| <a href="pause" class="link" title="Pause">Pause</a>       | Pause time\_ms                                                                                                                                                                |
| <a href="repeat" class="link" title="Repeat">Repeat</a>    | Repeat <span class="emphasis">*times*</span>                                                                                                                                  |
| <a href="select" class="link" title="Select">Select</a>    | Select Case <span class="emphasis">*var*</span>                                                                                                                               |
| <a href="wait" class="link" title="Wait">Wait</a>          | Wait time units                                                                                                                                                               |

</div>

<span class="strong">**Fixed Voltage Reference**</span>

<div class="informaltable">

| Command                                                                                     | Summary                                                     |
|:--------------------------------------------------------------------------------------------|:------------------------------------------------------------|
| <a href="fvrinitialize" class="link" title="FVRInitialize">FVRInitialize</a>          | FVRInitialize ( FVR\_OFF \| FVR\_1x \| FVR\_2x \| FVR\_4x ) |
| <a href="fvrisoutputready" class="link" title="FVRIsOutputReady">FVRIsOutputReady</a> | user\_var = FVRIsOutputReady()                              |

</div>

<span class="strong">**Interrupts**</span>

<div class="informaltable">

| Command                                                                                                                                       | Summary                                                           |
|:----------------------------------------------------------------------------------------------------------------------------------------------|:------------------------------------------------------------------|
| <a href="interrupts_overview" class="link" title="Interrupts Overview">Interrupts overview</a>                                          | Interrupts are a feature of many microcontrollers. They allow the |
| <a href="intoff" class="link" title="IntOff">IntOff</a>                                                                                 | IntOff                                                            |
| <a href="inton" class="link" title="IntOn">IntOn</a>                                                                                    | IntOn                                                             |
| <a href="on_interrupt" class="link" title="On Interrupt">On Interrupt</a>                                                               | On Interrupt event Call handler                                   |
| <a href="on_interrupt_the_default_handler" class="link" title="On Interrupt: The default handler">On Interrupt: The default handler</a> | GCBASIC supports a default interrupt handler in two modes:        |

</div>

<span class="strong">**Keypad**</span>

<div class="informaltable">

| Command                                                                                  | Summary                                                             |
|:-----------------------------------------------------------------------------------------|:--------------------------------------------------------------------|
| <a href="keypad_overview" class="link" title="Keypad Overview">Keypad Overview</a> | The keypad routines allow for a program to read from a 4 x 4 matrix |
| <a href="keypaddata" class="link" title="KeypadData">KeypadData</a>                | <span class="emphasis">*var*</span> = KeypadData                    |
| <a href="keypadraw" class="link" title="KeypadRaw">KeypadRaw</a>                   | <span class="emphasis">*largevar*</span> = KeypadRaw                |

</div>

<span class="strong">**Graphical LCD**</span>

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;">Command</th>
<th style="text-align: left;">Summary</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p><a href="box" class="link" title="Box">Box</a></p></td>
<td style="text-align: left;"><p>Box(LineX1,LineY1, LineX2, LineY2 [, LineColour ] )</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="circle" class="link" title="Circle">Circle</a></p></td>
<td style="text-align: left;"><p>Circle(XPixelPosition, YPixelPosition, Radius [ [,Optional LineColour] [,Optional Rounding] ] )</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="ellipse" class="link" title="Ellipse">Ellipse</a></p></td>
<td style="text-align: left;"><p>Ellipse(XPixelPosition, YPixelPosition, XRadius, YRadius [,Optional LineColour] )</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="e_paper_controllers" class="link" title="e-Paper Controllers">e-Paper Controllers</a></p></td>
<td style="text-align: left;"><p>This section covers GLCD devices known as e-Papers.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="filledbox" class="link" title="FilledBox">FilledBox</a></p></td>
<td style="text-align: left;"><p>FilledBox(LineX1,LineY1, LineX2, LineY2, Optional LineColour = 1)</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="filledcircle" class="link" title="FilledCircle">FilledCircle</a></p></td>
<td style="text-align: left;"><p>FilledCircle(XPixelPosition, YPixelPosition, Radius [,Optional LineColour] )</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="filledellipse" class="link" title="FilledEllipse">FilledEllipse</a></p></td>
<td style="text-align: left;"><p>FilledEllipse(XPixelPosition, YPixelPosition, XRadius, YRadius [,Optional LineColour] )</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="filledtriangle" class="link" title="FilledTriangle">FilledTriangle</a></p></td>
<td style="text-align: left;"><p>FilledTriangle( XPixelPosition1, YPixelPosition1, XPixelPosition2, YPixelPosition2, XPixelPosition3, YPixelPosition3 [,Optional LineColou…​</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="fonts_and_characters" class="link" title="Fonts and Characters">Fonts and Characters</a></p></td>
<td style="text-align: left;"><p>This section covers GLCD fonts and characters.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a></p></td>
<td style="text-align: left;"><p>The GLCD commands are used to control a Graphical Liquid Crystal Display (GLCD)</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="glcdcls" class="link" title="GLCDCLS">GLCDCLS</a></p></td>
<td style="text-align: left;"><p>GLCDCLS [GLCDBackground]</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="glcddisplay" class="link" title="GLCDDisplay">GLCDDisplay</a></p></td>
<td style="text-align: left;"><p>GLCDDisplay Off | On</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="glcddrawchar" class="link" title="GLCDDrawChar">GLCDDrawChar</a></p></td>
<td style="text-align: left;"><p>GLCDDrawChar(CharLocX, CharLocY, CharCode [, Optional Colour] )</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="glcddrawstring" class="link" title="GLCDDrawString">GLCDDrawString</a></p></td>
<td style="text-align: left;"><p>GLCDDrawString(CharLocX, CharLocY, String [, Optional Colour] )</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="glcdlocatestring" class="link" title="GLCDLocateString">GLCDLocateString</a></p></td>
<td style="text-align: left;"><p>GLCDLocateString(PrintLocX, PrintLocY )</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="glcdprint" class="link" title="GLCDPrint">GLCDPrint</a></p></td>
<td style="text-align: left;"><p>GLCDPrint(PrintLocX, PrintLocY, PrintData_Byte [, Optional Colour] ) ',or</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="glcdprintlargefont" class="link" title="GLCDPrintLargeFont">GLCDPrintLargeFont</a></p></td>
<td style="text-align: left;"><p>GLCDPrintLargeFont( PrintLocX, PrintLocY, PrintData_String [, Optional Colour] )</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="glcdprintstring" class="link" title="GLCDPrintString">GLCDPrintString</a></p></td>
<td style="text-align: left;"><p>GLCDPrintString( String )</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="glcdprintstringln" class="link" title="GLCDPrintStringLn">GLCDPrintStringLn</a></p></td>
<td style="text-align: left;"><p>GLCDPrintStringLn( String )</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="glcdprintwithsize" class="link" title="GLCDPrintWithSize">GLCDPrintWithSize</a></p></td>
<td style="text-align: left;"><p>GLCDPrintWithSize(PrintLocX, PrintLocY, PrintData_Byte , FontSize [, Color ] ) ',or</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="glcdreadbyte" class="link" title="GLCDReadByte">GLCDReadByte</a></p></td>
<td style="text-align: left;"><p>byte_variable = GLCDReadByte</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="glcdrotate" class="link" title="GLCDRotate">GLCDRotate</a></p></td>
<td style="text-align: left;"><p>GLCDROTATE LANDSCOPE | PORTRAIT_REV | LANDSCAPE_REV | PORTRAIT</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="glcdtimedelay" class="link" title="GLCDTimeDelay">GLCDTimeDelay</a></p></td>
<td style="text-align: left;"><p>GLCDTime</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="glcdtransaction" class="link" title="GLCDTransaction">GLCDTransaction</a></p></td>
<td style="text-align: left;"><p>GLCD_Open_PageTransaction</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="glcdwritebyte" class="link" title="GLCDWriteByte">GLCDWriteByte</a></p></td>
<td style="text-align: left;"><p>GLCDWriteByte (LCDByte)</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="hx8347g_controllers" class="link" title="HX8347G Controllers">HX8347G Controllers</a></p></td>
<td style="text-align: left;"><p>This section covers GLCD devices that use the HX8347G graphics controller.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="hyperbole" class="link" title="Hyperbole">Hyperbole</a></p></td>
<td style="text-align: left;"><p>Hyperbole (x, y, a_axis, b_axis, type, ModeStop, optional LineColour=GLCDForeground)</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="ili9326_controllers" class="link" title="ILI9326 Controllers">ILI9326 Controllers</a></p></td>
<td style="text-align: left;"><p>This section covers GLCD devices that use the ILI9326 graphics controller. The ILI9326 is a TFT LCD Single Chip Driver with 400RGBx320 Re…​</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="ili9340_controllers" class="link" title="ILI9340 Controllers">ILI9340 Controllers</a></p></td>
<td style="text-align: left;"><p>This section covers GLCD devices that use the ILI9340 graphics controller. The ILI9340 is a TFT LCD Single Chip Driver with 240RGBx320 Re…​</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="ili9341_controllers" class="link" title="ILI9341 Controllers">ILI9341 Controllers</a></p></td>
<td style="text-align: left;"><p>This section covers GLCD devices that use the ILI9341 graphics controller. The ILI9341 is a TFT LCD Single Chip Driver with 240RGBx320 Re…​</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="ili9481_controllers" class="link" title="ILI9481 Controllers">ILI9481 Controllers</a></p></td>
<td style="text-align: left;"><p>This section covers GLCD devices that use the ILI9481 graphics controller.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="ili9486_l_controllers" class="link" title="ILI9486(L) Controllers">ILI9486(L) Controllers</a></p></td>
<td style="text-align: left;"><p>This section covers GLCD devices that use the ILI9486(L) graphics controller.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="ili9488_controllers" class="link" title="ILI9488 Controllers">ILI9488 Controllers</a></p></td>
<td style="text-align: left;"><p>This section covers GLCD devices that use the ILI9488 graphics controller.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="ks0108_controllers" class="link" title="KS0108 Controllers">KS0108 Controllers</a></p></td>
<td style="text-align: left;"><p>This section covers GLCD devices that use the KS0108 graphics controller.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="line" class="link" title="Line">Line</a></p></td>
<td style="text-align: left;"><p>Line(LineX1,LineY1, LineX2, LineY2, Optional LineColour = 1)</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="nextion_controllers" class="link" title="NEXTION Controllers">NEXTION Controllers</a></p></td>
<td style="text-align: left;"><p>This section covers GLCD devices that use the serially attached Nextion graphics displays.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="nt7108c_controllers" class="link" title="NT7108C Controllers">NT7108C Controllers</a></p></td>
<td style="text-align: left;"><p>This section covers GLCD devices that use the NT7108C graphics controller.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="parabola" class="link" title="Parabola">Parabola</a></p></td>
<td style="text-align: left;"><p>Parabola (x, y, p_factor, type, modestop, optional LineColour=GLCDForeground)</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="pcd8544_controllers" class="link" title="PCD8544 Controllers">PCD8544 Controllers</a></p></td>
<td style="text-align: left;"><p>This section covers GLCD devices that use the PCD844 graphics controller.<br />
</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="pset" class="link" title="Pset">Pset</a></p></td>
<td style="text-align: left;"><p>PSet(XPosition, YPosition, GLCDState)</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="ssd1289_controllers" class="link" title="SSD1289 Controllers">SDD1289 Controllers</a></p></td>
<td style="text-align: left;"><p>This section covers GLCD devices that use the SDD1289 graphics controller. The SDD1289 is a 240 x 320 single chip controller driver IC fo…​</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="sh1106_controllers" class="link" title="SH1106 Controllers">SH1106 Controllers</a></p></td>
<td style="text-align: left;"><p>This section covers GLCD devices that use the SH1106 graphics controller. THe SH1106 is a single-chip CMOS OLED/PLED driver with controll…​</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="ssd1306_controllers" class="link" title="SSD1306 Controllers">SSD1306 Controllers</a></p></td>
<td style="text-align: left;"><p>This section covers GLCD devices that use the SSD1306 graphics controller.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="ssd1331_controllers" class="link" title="SSD1331 Controllers">SSD1331 Controllers</a></p></td>
<td style="text-align: left;"><p>This section covers GLCD devices that use the SSD1331 graphics controller. The SSD1331 is a single-chip controller/driver for 262K-color,…​</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="ssd1351_controllers" class="link" title="SSD1351 Controllers">SSD1351 Controllers</a></p></td>
<td style="text-align: left;"><p>This section covers GLCD devices that use the SSD1351 graphics controller. The SSD1351 is a single-chip controller/driver for 262K-color,…​</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="st7567_controllers" class="link" title="ST7567 Controllers">ST7567 Controllers</a></p></td>
<td style="text-align: left;"><p>This section covers GLCD devices that use the ST7567 graphics controller.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="st7735_controllers" class="link" title="ST7735 Controllers">ST7735 Controllers</a></p></td>
<td style="text-align: left;"><p>This section covers GLCD devices that use the ST7735 graphics controller. The ST7735 or ST7735R is a single-chip controller/driver for 26…​</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="st7789_controllers" class="link" title="ST7789 Controllers">ST7789 Controllers</a></p></td>
<td style="text-align: left;"><p>This section covers GLCD devices that use the ST7789 graphics controller. The ST7789 is a TFT LCD Single Chip Driver with 240x240 or 320x…​</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="st7920_controllers" class="link" title="ST7920 Controllers">ST7920 Controllers</a></p></td>
<td style="text-align: left;"><p>This section covers GLCD devices that use the ST7920 graphics controller.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="t6963_controllers" class="link" title="T6963 Controllers">T6963 Controllers</a></p></td>
<td style="text-align: left;"><p>This section covers Graphical Liquid Crystal Display (GLCD) devices that use the Toshiba T6963 graphics controller. The T6963 is a monoch…​</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="triangle" class="link" title="Triangle">Triangle</a></p></td>
<td style="text-align: left;"><p>Triangle(XPixelPosition1, YPixelPosition1, XPixelPosition2, YPixelPosition2, XPixelPosition3, YPixelPosition3 [,Optional LineColour] )</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="uc1601_controllers" class="link" title="UC1601 Controllers">UC1601 Controllers</a></p></td>
<td style="text-align: left;"><p>This section covers GLCD devices that use the UC1601 graphics controller.</p></td>
</tr>
</tbody>
</table>

</div>

<span class="strong">**Touch Screen**</span>

<div class="informaltable">

| Command                                                                                                       | Summary       |
|:--------------------------------------------------------------------------------------------------------------|:--------------|
| <a href="ads_7843_serial_driver" class="link" title="ADS 7843 Serial Driver">ADS 7843 Serial Driver</a> | ADS7843\_Init |

</div>

<span class="strong">**Liquid Crystal Display**</span>

<div class="informaltable">

| Command                                                                               | Summary                                                                                                                     |
|:--------------------------------------------------------------------------------------|:----------------------------------------------------------------------------------------------------------------------------|
| <a href="cls" class="link" title="CLS">CLS</a>                                  | CLS                                                                                                                         |
| <a href="get" class="link" title="Get">Get</a>                                  | var = Get(Line, Column)                                                                                                     |
| <a href="lcd_overview" class="link" title="LCD Overview">LCD Overview</a>       | The LCD routines in this section allow GCBASIC programs to control an                                                       |
| <a href="lcdbacklight" class="link" title="LCDBacklight">LCDBacklight</a>       | LCDBacklight ( On \| Off )                                                                                                  |
| <a href="lcdcmd" class="link" title="LCDCmd">LCDCmd</a>                         | LCDCMD <span class="emphasis">*value*</span>                                                                                |
| <a href="lcdcreatechar" class="link" title="LCDCreateChar">LCDCreateChar</a>    | LCDCreateChar <span class="emphasis">*char, chardata()*</span>                                                              |
| <a href="lcdcreategraph" class="link" title="LCDCreateGraph">LCDCreateGraph</a> | LCDCreateGraph <span class="emphasis">*value*</span>                                                                        |
| <a href="lcdcursor" class="link" title="LCDCursor">LCDCursor</a>                | LCDCursor value                                                                                                             |
| <a href="lcddisplayoff" class="link" title="LCDDisplayOff">LCDDisplayOff</a>    | LCDDisplayOff                                                                                                               |
| <a href="lcddisplayon" class="link" title="LCDDisplayOn">LCDDisplayOn</a>       | LCDDisplayOn                                                                                                                |
| <a href="lcdhex" class="link" title="LCDHex">LCDHex</a>                         | LCDHex value                                                                                                                |
| <a href="lcdhome" class="link" title="LCDHome">LCDHome</a>                      | LCDHome                                                                                                                     |
| <a href="lcdspace" class="link" title="LCDSpace">LCDSpace</a>                   | LCDSpace value                                                                                                              |
| <a href="lcdwritechar" class="link" title="LCDWriteChar">LCDWriteChar</a>       | LCDWriteChar <span class="emphasis">*char*</span>                                                                           |
| <a href="locate" class="link" title="Locate">Locate</a>                         | Locate <span class="emphasis">*Line, Column*</span>                                                                         |
| <a href="print" class="link" title="Print">Print</a>                            | Print <span class="emphasis">*string*</span>                                                                                |
| <a href="put" class="link" title="Put">Put</a>                                  | Put <span class="emphasis">*Line*</span>, <span class="emphasis">*Column*</span>, <span class="emphasis">*Character*</span> |

</div>

<span class="strong">**Pulse width modulation**</span>

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;">Command</th>
<th style="text-align: left;">Summary</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p><a href="atmel_avr_pwm_overview" class="link" title="ATMEL AVR PWM Overview">ATMEL AVR PWM Overview</a></p></td>
<td style="text-align: left;"><p>The methods described in this section allow the generation of Pulse</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="hardware_pwm_code_optimisation" class="link" title="Hardware PWM Code Optimisation">Hardware PWM Code Optimisation</a></p></td>
<td style="text-align: left;"><p>For compatibility all channels are supported by default. This is maintains backward compatibility.<br />
</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="hpwm_10_bit" class="link" title="HPWM 10 Bit">HPWM 10 Bit</a></p></td>
<td style="text-align: left;"><p>HPWM <span class="emphasis"><em>channel, frequency, duty cycle, timer [, resolution]</em></span></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="hpwm_16_bit" class="link" title="HPWM 16 Bit">HPWM 16 Bit</a></p></td>
<td style="text-align: left;"><p>HPWM16 <span class="emphasis"><em>channel, frequency, duty cycle</em></span> 'Enable a 16-bit PWM channel'</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="hpwm_avr_ocrnx" class="link" title="HPWM AVR OCRnx">HPWM AVR OCRnx</a></p></td>
<td style="text-align: left;"><p>HPWM <span class="emphasis"><em>channel</em></span>, <span class="emphasis"><em>frequency</em></span>, <span class="emphasis"><em>duty cycle</em></span></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="hpwm_ccp" class="link" title="HPWM CCP">HPWM CCP</a></p></td>
<td style="text-align: left;"><p>HPWM <span class="emphasis"><em>channel, frequency, duty cycle</em></span></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="hpwm_fixed_mode" class="link" title="HPWM Fixed Mode">HPWM Fixed Mode</a></p></td>
<td style="text-align: left;"><p>PWMOn 'only applies to CCP/PWM channel 1</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="hpwm_fixed_mode_for_avr" class="link" title="HPWM Fixed Mode for AVR">HPWM Fixed Mode for AVR</a></p></td>
<td style="text-align: left;"><p>PWMOn</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="hpwm_ccptimern" class="link" title="HPWM_CCPTimerN">HPWM_CCPTimerN</a></p></td>
<td style="text-align: left;"><p>HPWM_CCPTimerN <span class="emphasis"><em>channel</em></span>, <span class="emphasis"><em>frequency</em></span>, <span class="emphasis"><em>duty cycle</em></span> [, <span class="emphasis"><em>timer</em></span> 2, 4 or 6 ]</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="hpwmoff" class="link" title="HPWMOff">HPWMOff</a></p></td>
<td style="text-align: left;"><p>HPWMOff ( channel ) 'selectively turn off the CCP channel</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="hpwmoff_3" class="link" title="HPWMOff">HPWMOff</a></p></td>
<td style="text-align: left;"><p>HPWMOff ( channel, PWMHardware )</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="hpwmoff_2" class="link" title="HPWMOff">HPWMOff</a></p></td>
<td style="text-align: left;"><p>HPWMOff ( channel ) 'selectively turn off the CCP channel</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="hpwmupdate_for_ccp_pwm_modules_s" class="link" title="HPWMUpdate for CCP/PWM Modules(s)">HPWMUpdate for CCP/PWM Modules(s)</a></p></td>
<td style="text-align: left;"><p>HPWMUpdate ( channel, duty_cycle )</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="hpwmupdate_for_pwm_module_s" class="link" title="HPWMUpdate for PWM Module(s)">HPWMUpdate for PWM Module(s)</a></p></td>
<td style="text-align: left;"><p>HPWMUpdate ( channel, duty_cycle )</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="microchip_pic_pwm_overview" class="link" title="Microchip PIC PWM Overview">Microchip PIC PWM Overview</a></p></td>
<td style="text-align: left;"><p>The methods described in this section allow the generation of Pulse</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="pwm_software_mode" class="link" title="PWM Software Mode">PWM Software Mode</a></p></td>
<td style="text-align: left;"><p>PWMOut <span class="emphasis"><em>channel, duty cycle, cycles</em></span></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="pwmoff" class="link" title="PWMOff">PWMOff</a></p></td>
<td style="text-align: left;"><p>PWMOff</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="pwmoff_for_avr" class="link" title="PWMOff for AVR">PWMOff for AVR</a></p></td>
<td style="text-align: left;"><p>PWMOff</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="pwmon" class="link" title="PWMOn">PWMOn</a></p></td>
<td style="text-align: left;"><p>PWMOn</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="pwmon_for_avr" class="link" title="PWMOn for AVR">PWMOn for AVR</a></p></td>
<td style="text-align: left;"><p>PWMOn</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="pwmout" class="link" title="PWMOut">PWMOut</a></p></td>
<td style="text-align: left;"><p>PWMOut <span class="emphasis"><em>channel, duty cycle, cycles</em></span></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="pulseout" class="link" title="PulseOut">PulseOut</a></p></td>
<td style="text-align: left;"><p>PulseOut <span class="emphasis"><em>pin</em></span>, <span class="emphasis"><em>time units</em></span></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="pulseoutinv" class="link" title="PulseOutInv">PulseOutInv</a></p></td>
<td style="text-align: left;"><p>PulseOutInv <span class="emphasis"><em>pin,</em></span> <span class="emphasis"><em>time units</em></span></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="pulsein" class="link" title="PulseIn">PulseIn</a></p></td>
<td style="text-align: left;"><p>PulseIn <span class="emphasis"><em>pin</em></span>, <span class="emphasis"><em>user_variable</em></span>, <span class="emphasis"><em>time units</em></span></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="pulseininv" class="link" title="PulseInInv">PulseInInv</a></p></td>
<td style="text-align: left;"><p>PulseInInv <span class="emphasis"><em>pin</em></span>, <span class="emphasis"><em>user_variable</em></span>, <span class="emphasis"><em>time units</em></span></p></td>
</tr>
</tbody>
</table>

</div>

<span class="strong">**Random Numbers**</span>

<div class="informaltable">

| Command                                                                | Summary                                                         |
|:-----------------------------------------------------------------------|:----------------------------------------------------------------|
| <a href="overview" class="link" title="Overview">Overview</a>    | These routines allow GCBASIC to generate pseudo-random numbers. |
| <a href="random" class="link" title="Random">Random</a>          | var = Random                                                    |
| <a href="randomize" class="link" title="Randomize">Randomize</a> | Randomize                                                       |

</div>

<span class="strong">**7-Segment Displays**</span>

<div class="informaltable">

| Command                                                                                                                                               | Summary                                                                                                                             |
|:------------------------------------------------------------------------------------------------------------------------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------|
| <a href="7_segment_displays_legacy" class="link" title="7 Segment Displays - Legacy">7 Segment Displays - Legacy</a>                            | The GCBASIC 7 segment display methods make it easier for GCBASIC programs to display numbers and letters on 7 segment LED displays. |
| <a href="7_segment_displays_tm1637_4_digits" class="link" title="7 Segment Displays - TM1637 4 Digits">7 Segment Displays - TM1637 4 Digits</a> | The TM1637 disaplay module is used for displaying numbers on a keyboard matrix.                                                     |
| <a href="7_segment_displays_tm1637_6_digits" class="link" title="7 Segment Displays - TM1637 6 Digits">7 Segment Displays - TM1637 6 Digits</a> | The TM1637 display module is used for displaying numbers on a keyboard matrix.                                                      |
| <a href="7_segment_displays_overview" class="link" title="7 Segment Displays Overview">7 Segment Displays Overview</a>                          | The 7 Segment Displays module provide a cheap red, green, blue or white bright LED Display.                                         |
| <a href="common_anode" class="link" title="Common Anode">Common Anode</a>                                                                       | This is a Common Anode 7 Segment display example.                                                                                   |
| <a href="common_cathode" class="link" title="Common Cathode">Common Cathode</a>                                                                 | This is a Common Cathode 7 Segment display example.                                                                                 |
| <a href="displaychar" class="link" title="DisplayChar">DisplayChar</a>                                                                          | DisplayChar (<span class="emphasis">*display, character, dot*</span>)                                                               |
| <a href="displaysegment" class="link" title="DisplaySegment">DisplaySegment</a>                                                                 | DisplayValue (<span class="emphasis">*display, data*</span>)                                                                        |
| <a href="displayvalue" class="link" title="DisplayValue">DisplayValue</a>                                                                       | DisplayValue (<span class="emphasis">*display, data, dot*</span>)                                                                   |
| <a href="tm_bright_2" class="link" title="TM_Bright">TM_Bright</a>                                                                              | TM\_Bright = Brightness                                                                                                             |
| <a href="tm_bright" class="link" title="TM_Bright">TM_Bright</a>                                                                                | TM\_Bright = Brightness                                                                                                             |
| <a href="tm_point" class="link" title="TM_Point">TM_Point</a>                                                                                   | TM\_Point = (Point)                                                                                                                 |
| <a href="tmdec_2" class="link" title="TMDec">TMDec</a>                                                                                          | TMDec Value \[, Options \]                                                                                                          |
| <a href="tmdec" class="link" title="TMDec">TMDec</a>                                                                                            | TMDec Value \[, Options \]                                                                                                          |
| <a href="tmhex_2" class="link" title="TMHex">TMHex</a>                                                                                          | TMHex Value                                                                                                                         |
| <a href="tmhex" class="link" title="TMHex">TMHex</a>                                                                                            | TMHex Value                                                                                                                         |
| <a href="tmwrite4dig" class="link" title="TMWrite4Dig">TMWrite4Dig</a>                                                                          | TMWrite4Dig (dig1, dig2, dig3, dig4 \[, Brightness \], Colon \] \] )                                                                |
| <a href="tmwrite6dig" class="link" title="TMWrite6Dig">TMWrite6Dig</a>                                                                          | TMWrite6Dig (dig1, dig2, dig3, dig4, dig5, dig6, Brightness, Point)                                                                 |
| <a href="tmwritechar" class="link" title="TMWriteChar">TMWriteChar</a>                                                                          | TMWriteChar ( TMaddr, TMchar )                                                                                                      |
| <a href="tmwritechar_2" class="link" title="TMWriteChar">TMWriteChar</a>                                                                        | TMWriteChar ( TMaddr, TMchar )                                                                                                      |

</div>

<span class="strong">**One Wire Devices**</span>

<div class="informaltable">

| Command                                                                                                 | Summary                                                                                        |
|:--------------------------------------------------------------------------------------------------------|:-----------------------------------------------------------------------------------------------|
| <a href="ds18b20" class="link" title="DS18B20">DS18B20</a>                                        | The DS18B20 is a 1-Wire digital temperature sensor from Maxim IC.                              |
| <a href="ds18b20setresolution" class="link" title="DS18B20SetResolution">DS18B20SetResolution</a> | For Single Channel/Device only. The method assumes a single DS18B20 device on the OneWire bus. |
| <a href="readdigitaltemp" class="link" title="ReadDigitalTemp">ReadDigitalTemp</a>                | ReadDigitalTemp                                                                                |
| <a href="readtemp" class="link" title="ReadTemp">ReadTemp</a>                                     | byte\_var = ReadTemp                                                                           |
| <a href="readtemp12" class="link" title="ReadTemp12">ReadTemp12</a>                               | byte\_var = ReadTemp12                                                                         |

</div>

<span class="strong">**Serial Communications**</span>

<div class="informaltable">

| Command                                                                                                                                            | Summary                                                                                                                  |
|:---------------------------------------------------------------------------------------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------|
| <a href="hsergetnum" class="link" title="HSerGetNum">HSerGetNum</a>                                                                          | HSerGetNum <span class="emphasis">*myNum*</span> ‘Gets a multi digit number from USART 1                                 |
| <a href="hsergetstring" class="link" title="HSerGetString">HSerGetString</a>                                                                 | HSerGetString <span class="emphasis">*myString*</span> ‘Get a multi char string from USART 1                             |
| <a href="hserprint" class="link" title="HSerPrint">HSerPrint</a>                                                                             | HSerPrint <span class="emphasis">*user\_value*</span> \[,1\|2\|3\|4\] 'Choose comport with optional parameter            |
| <a href="hserprintbytecrlf" class="link" title="HserPrintByteCRLF">HserPrintByteCRLF</a>                                                     | HserPrintByteCRLF <span class="emphasis">*user\_data*</span> \[, 1 \| 2 \| 3 \| 4 \]                                     |
| <a href="hserprintcrlf" class="link" title="HserPrintCRLF">HserPrintCRLF</a>                                                                 | HserPrintCRLF \[optional BYTE\] \[, 1 \| 2 \| 3 \| 4 \]                                                                  |
| <a href="hserprintstringcrlf" class="link" title="HSerPrintStringCRLF">HSerPrintStringCRLF</a>                                               | HSerPrintStringCRLF <span class="emphasis">*user\_string*</span> \[,1\|2\|3\|4\] 'Choose comport with optional parameter |
| <a href="hserreceive" class="link" title="HSerReceive">HSerReceive</a>                                                                       | HSerReceive (<span class="emphasis">*user\_byte\_variable*</span>)                                                       |
| <a href="hserreceivefrom" class="link" title="HSerReceiveFrom">HSerReceiveFrom</a>                                                           | <span class="emphasis">*user\_byte*</span> = HSerReceiveFrom \[,1 \| 2 \| 3 \| 4\]                                       |
| <a href="hsersend" class="link" title="HSerSend">HSerSend</a>                                                                                | HSerSend <span class="emphasis">*user\_byte*</span> \[,1\|2\|3\|4\] 'Choose comport with optional parameter              |
| <a href="initser" class="link" title="InitSer">InitSer</a>                                                                                   | InitSer <span class="emphasis">*channel, rate, start, data, stop, parity, invert*</span>                                 |
| <a href="rs232_hardware_overview" class="link" title="RS232 Hardware Overview">RS232 Hardware Overview</a>                                   | GCBASIC support programs to communicate easily using RS232.                                                              |
| <a href="rs232_software_overview" class="link" title="RS232 Software Overview">RS232 Software Overview</a>                                   | These routines allow the microcontroller to send and receive RS232 data.                                                 |
| <a href="rs232_software_overview_optimised" class="link" title="RS232 Software Overview - Optimised">RS232 Software Overview - Optimised</a> | These routines allow the microcontroller to send and receive RS232 data.                                                 |
| <a href="sernprint" class="link" title="SerNPrint">SerNPrint</a>                                                                             | Ser1Print value                                                                                                          |
| <a href="sernreceive" class="link" title="SerNReceive">SerNReceive</a>                                                                       | bytevar = Ser1Receive                                                                                                    |
| <a href="sernsend" class="link" title="SerNSend">SerNSend</a>                                                                                | Ser1Send data                                                                                                            |
| <a href="serprint" class="link" title="SerPrint">SerPrint</a>                                                                                | SerPrint <span class="emphasis">*channel, value*</span>                                                                  |
| <a href="serreceive" class="link" title="SerReceive">SerReceive</a>                                                                          | SerReceive <span class="emphasis">*channel*</span>, <span class="emphasis">*output*</span>                               |
| <a href="sersend" class="link" title="SerSend">SerSend</a>                                                                                   | SerSend <span class="emphasis">*channel*</span>, <span class="emphasis">*data*</span>                                    |

</div>

<span class="strong">**Infrared Remote Control**</span>

<div class="informaltable">

| Command                                                                                           | Summary                                                                               |
|:--------------------------------------------------------------------------------------------------|:--------------------------------------------------------------------------------------|
| <a href="nec_remote_control" class="link" title="NEC Remote Control">NEC Remote Control</a> | NECSend <span class="emphasis">*address*</span>, <span class="emphasis">*data*</span> |
| <a href="rc5_remote_control" class="link" title="RC5 Remote Control">RC5 Remote Control</a> | RC5Send <span class="emphasis">*address*</span>, <span class="emphasis">*data*</span> |

</div>

<span class="strong">**PS/2**</span>

<div class="informaltable">

| Command                                                                            | Summary                                                          |
|:-----------------------------------------------------------------------------------|:-----------------------------------------------------------------|
| <a href="inkey" class="link" title="InKey">InKey</a>                         | output = InKey                                                   |
| <a href="ps_2_overview" class="link" title="PS/2 Overview">PS/2 Overview</a> | These routines make it easier to communicate with a PS/2 device, |
| <a href="ps2readbyte" class="link" title="PS2ReadByte">PS2ReadByte</a>       | output = PS2ReadByte                                             |
| <a href="ps2setkbleds" class="link" title="PS2SetKBLeds">PS2SetKBLeds</a>    | PS2SetKBLeds (<span class="emphasis">*LedStatus*</span>)         |
| <a href="ps2writebyte" class="link" title="PS2WriteByte">PS2WriteByte</a>    | PS2WriteByte <span class="emphasis">*user\_data*</span>          |

</div>

<span class="strong">**SPI**</span>

<div class="informaltable">

| Command                                                                                           | Summary                                                                                                           |
|:--------------------------------------------------------------------------------------------------|:------------------------------------------------------------------------------------------------------------------|
| <a href="fasthwspi2transfer" class="link" title="FastHWSPI2Transfer">FastHWSPI2Transfer</a> | FastHWSPI2Transfer <span class="emphasis">*tx*</span>                                                             |
| <a href="fasthwspitransfer" class="link" title="FastHWSPITransfer">FastHWSPITransfer</a>    | FastHWSPITransfer <span class="emphasis">*tx*</span>                                                              |
| <a href="spi_overview" class="link" title="SPI Overview">SPI Overview</a>                   | The SPI interface allows for the transmission and receiption of data simultaneously on two lines (MOSI and MISO). |
| <a href="spi2mode" class="link" title="SPI2Mode">SPI2Mode</a>                               | SPI2Mode ( <span class="emphasis">*Mode*</span> \[, <span class="emphasis">*SPIClockMode*</span>\])               |
| <a href="spi2transfer" class="link" title="SPI2Transfer">SPI2Transfer</a>                   | SPI2Transfer <span class="emphasis">*tx*</span>, <span class="emphasis">*rx*</span>                               |
| <a href="spimode" class="link" title="SPIMode">SPIMode</a>                                  | SPIMode ( <span class="emphasis">*Mode*</span> \[, <span class="emphasis">*SPIClockMode*</span>\])                |
| <a href="spitransfer" class="link" title="SPITransfer">SPITransfer</a>                      | SPITransfer <span class="emphasis">*tx*</span>, <span class="emphasis">*rx*</span>                                |

</div>

<span class="strong">**I2C Software**</span>

<div class="informaltable">

| Command                                                                                     | Summary                                                                |
|:--------------------------------------------------------------------------------------------|:-----------------------------------------------------------------------|
| <a href="i2c_overview" class="link" title="I2C Overview">I2C Overview</a>             | These software routines allow GCBASIC programs to send and receive I2C |
| <a href="i2cackpoll" class="link" title="I2CAckpoll">I2CAckpoll</a>                   | I2CAckpoll ( <span class="emphasis">*I2C\_device\_address*</span> )    |
| <a href="i2cackpollstate" class="link" title="I2CAckPollState">I2CAckPollState</a>    | &lt;test condition&gt; I2CAckPollState                                 |
| <a href="i2creceive" class="link" title="I2CReceive">I2CReceive</a>                   | I2CReceive <span class="emphasis">*data*</span>                        |
| <a href="i2creset" class="link" title="I2CReset">I2CReset</a>                         | I2CReset                                                               |
| <a href="i2crestart" class="link" title="I2CRestart">I2CRestart</a>                   | I2CRestart                                                             |
| <a href="i2csend" class="link" title="I2CSend">I2CSend</a>                            | I2CSend <span class="emphasis">*data*</span>                           |
| <a href="i2cstart" class="link" title="I2CStart">I2CStart</a>                         | I2CStart                                                               |
| <a href="i2cstartoccurred" class="link" title="I2CStartoccurred">I2CStartoccurred</a> | I2CStartoccurred                                                       |
| <a href="i2cstop" class="link" title="I2CStop">I2CStop</a>                            | I2CStop                                                                |

</div>

<span class="strong">**I2C/TWI Hardware Module**</span>

<div class="informaltable">

| Command                                                                                        | Summary                                                                                                 |
|:-----------------------------------------------------------------------------------------------|:--------------------------------------------------------------------------------------------------------|
| <a href="hi2c_overview" class="link" title="HI2C Overview">HI2C Overview</a>             | These methods allow GCBASIC programs to send and receive Inter- Integrated Circuit (I2C™) messages via: |
| <a href="hi2cackpollstate" class="link" title="HI2CAckPollState">HI2CAckPollState</a>    | &lt;test condition\[s\]&gt; HI2CAckPollState                                                            |
| <a href="hi2cmode" class="link" title="HI2CMode">HI2CMode</a>                            | HI2CMode Master \| Slave                                                                                |
| <a href="hi2creceive" class="link" title="HI2CReceive">HI2CReceive</a>                   | HI2CReceive <span class="emphasis">*data*</span>                                                        |
| <a href="hi2crestart" class="link" title="HI2CRestart">HI2CRestart</a>                   | HI2CRestart                                                                                             |
| <a href="hi2csetaddress" class="link" title="HI2CSetAddress">HI2CSetAddress</a>          | HI2CSetAddress address\_number                                                                          |
| <a href="hi2cstart" class="link" title="HI2CStart">HI2CStart</a>                         | HI2CStart                                                                                               |
| <a href="hi2cstartoccurred" class="link" title="HI2CStartOccurred">HI2CStartOccurred</a> | HI2CStartOccurred                                                                                       |
| <a href="hi2cstop" class="link" title="HI2CStop">HI2CStop</a>                            | HI2CStop                                                                                                |
| <a href="hi2cstopped" class="link" title="HI2CStopped">HI2CStopped</a>                   | HI2CStopped                                                                                             |
| <a href="hi2cwaitmssp" class="link" title="HI2CWaitMSSP">HI2CWaitMSSP</a>                | HI2CWaitMSSP                                                                                            |

</div>

<span class="strong">**Sound**</span>

<div class="informaltable">

| Command                                                                               | Summary                                                                 |
|:--------------------------------------------------------------------------------------|:------------------------------------------------------------------------|
| <a href="play" class="link" title="Play">Play</a>                               | Play SoundPlayDataString                                                |
| <a href="play_rtttl" class="link" title="Play RTTTL">Play RTTTL</a>             | PlayRTTTL SoundPlayRTTTLDataString                                      |
| <a href="shorttone" class="link" title="ShortTone">ShortTone</a>                | ShortTone Frequency, Duration                                           |
| <a href="sound_overview" class="link" title="Sound Overview">Sound Overview</a> | These GCBASIC methods generate tones of a given frequency and duration. |
| <a href="tone" class="link" title="Tone">Tone</a>                               | Tone <span class="emphasis">*Frequency, Duration*</span>                |

</div>

<span class="strong">**Timers**</span>

<div class="informaltable">

| Command                                                                               | Summary                                                                                                                                     |
|:--------------------------------------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------|
| <a href="cleartimer" class="link" title="ClearTimer">ClearTimer</a>             | ClearTimer <span class="emphasis">*TimerNo*</span>                                                                                          |
| <a href="inittimer0" class="link" title="InitTimer0">InitTimer0</a>             | InitTimer0 source, prescaler                                                                                                                |
| <a href="inittimer1" class="link" title="InitTimer1">InitTimer1</a>             | InitTimer1 <span class="emphasis">*source, prescaler*</span>                                                                                |
| <a href="inittimer10" class="link" title="InitTimer10">InitTimer10</a>          | InitTimer10 <span class="emphasis">*prescaler*</span>, <span class="emphasis">*postscaler*</span>                                           |
| <a href="inittimer12" class="link" title="InitTimer12">InitTimer12</a>          | InitTimer12 <span class="emphasis">*prescaler*</span>, <span class="emphasis">*postscaler*</span>                                           |
| <a href="inittimer2" class="link" title="InitTimer2">InitTimer2</a>             | InitTimer2 <span class="emphasis">*prescaler*</span>, <span class="emphasis">*postscaler*</span>                                            |
| <a href="inittimer3" class="link" title="InitTimer3">InitTimer3</a>             | InitTimer3 <span class="emphasis">*source*</span>, <span class="emphasis">*prescaler*</span>                                                |
| <a href="inittimer4" class="link" title="InitTimer4">InitTimer4</a>             | InitTimer4 <span class="emphasis">*prescaler*</span>, <span class="emphasis">*postscaler*</span>                                            |
| <a href="inittimer5" class="link" title="InitTimer5">InitTimer5</a>             | InitTimer5 <span class="emphasis">*source*</span>, <span class="emphasis">*prescaler*</span>                                                |
| <a href="inittimer6" class="link" title="InitTimer6">InitTimer6</a>             | InitTimer6 <span class="emphasis">*prescaler*</span>, <span class="emphasis">*postscaler*</span>                                            |
| <a href="inittimer7" class="link" title="InitTimer7">InitTimer7</a>             | InitTimer7 <span class="emphasis">*source*</span>, <span class="emphasis">*prescaler*</span>                                                |
| <a href="inittimer8" class="link" title="InitTimer8">InitTimer8</a>             | InitTimer8 <span class="emphasis">*prescaler*</span>, <span class="emphasis">*postscaler*</span>                                            |
| <a href="reading_timers" class="link" title="Reading Timers">Reading Timers</a> | GCBASIC has the following macros to read a specific timer value. They                                                                       |
| <a href="settimer" class="link" title="Settimer">Settimer</a>                   | Settimer <span class="emphasis">*timernumber*</span>, <span class="emphasis">*byte\_value*</span>                                           |
| <a href="smt_timers" class="link" title="SMT Timers">SMT Timers</a>             | The Signal Measurement Timer (SMT) capability is a 24-bit counter with advanced clocking and gating logic, which can be configured for me…​ |
| <a href="starttimer" class="link" title="StartTimer">StartTimer</a>             | StartTimer <span class="emphasis">*TimerNo*</span>                                                                                          |
| <a href="stoptimer" class="link" title="StopTimer">StopTimer</a>                | StopTimer <span class="emphasis">*TimerNo*</span>                                                                                           |
| <a href="timer_overview" class="link" title="Timer Overview">Timer Overview</a> | GCBASIC supports methods to set, clear, read, start and stop the microcontroller timers.                                                    |

</div>

<span class="strong">**Variables Operations**</span>

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;">Command</th>
<th style="text-align: left;">Summary</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p><a href="alloc" class="link" title="Alloc">Alloc</a></p></td>
<td style="text-align: left;"><p>Alloc creates a special type of variable - an array variant. This array variant can store values. The values stored in this array variant…​</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="bcdtodec_gcb" class="link" title="BcdToDec_GCB">BcdToDec_GCB</a></p></td>
<td style="text-align: left;"><p>BcdToDec_GCB ( ByteVariable )</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="dectobcd_gcb" class="link" title="DecToBcd_GCB">DecToBcd_GCB</a></p></td>
<td style="text-align: left;"><p>DectoBcd( ByteVariable )</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="dim" class="link" title="Dim">Dim</a></p></td>
<td style="text-align: left;"><p>Dim <span class="emphasis"><em>variable</em></span> // will define a Byte variable</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="more_on_setting_variables_and_constants" class="link" title="More on setting Variables and Constants">More on setting Variables and Constants</a></p></td>
<td style="text-align: left;"><p>Within GCBASIC you can use regular variable assignments. But, you can also use C like maths assignments.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="rotate" class="link" title="Rotate">Rotate</a></p></td>
<td style="text-align: left;"><p>Rotate <span class="emphasis"><em>variable</em></span> {Left | Right} [Simple]</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="set" class="link" title="Set">Set</a></p></td>
<td style="text-align: left;"><p>Set <span class="emphasis"><em>variable.bit</em></span> {On | Off}</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="setting_variables" class="link" title="Setting Variables">Setting Variables</a></p></td>
<td style="text-align: left;"><p><br />
</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="swap" class="link" title="SWAP">SWAP</a></p></td>
<td style="text-align: left;"><p>SWAP( VariableA, VariableB)</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="swap4" class="link" title="SWAP4">SWAP4</a></p></td>
<td style="text-align: left;"><p>SWAP4( VariableA)</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="using_variables" class="link" title="Using Variables">Using Variables</a></p></td>
<td style="text-align: left;"><p>Using and accessing bytes within word and long numbers etc may be required when you are creating your solution. This can be done with som…​</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="variable_lifecycle" class="link" title="Variable Lifecycle">Variable Lifecycle</a></p></td>
<td style="text-align: left;"><p>Within GCBASIC you can use variables. This section details the Variable Lifecycle when using variables.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><a href="peek" class="link" title="Peek">Peek</a></p></td>
<td style="text-align: left;"><p><span class="emphasis"><em>OutputVariable</em></span> = Peek (<span class="emphasis"><em>location</em></span>)</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><a href="poke" class="link" title="Poke">Poke</a></p></td>
<td style="text-align: left;"><p>Poke(<span class="emphasis"><em>location</em></span>, <span class="emphasis"><em>value</em></span>)</p></td>
</tr>
</tbody>
</table>

</div>

<span class="strong">**String Manipulation**</span>

<div class="informaltable">

| Command                                                                                  | Summary                                                                                                                                                                                 |
|:-----------------------------------------------------------------------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <a href="asc" class="link" title="Asc">Asc</a>                                     | byte<span class="emphasis">*var*</span>= ASC(string, \[position\] )                                                                                                                     |
| <a href="bytetobin" class="link" title="ByteToBin">ByteToBin</a>                   | <span class="emphasis">*stringvar*</span> = ByteToBin(<span class="emphasis">*bytevar*</span>)                                                                                          |
| <a href="bytetohex" class="link" title="ByteToHex">ByteToHex</a>                   | <span class="emphasis">*stringvar*</span> = ByteToHex(<span class="emphasis">*number*</span>)                                                                                           |
| <a href="bytetostring" class="link" title="ByteToString">ByteToString</a>          | <span class="emphasis">*stringvar*</span> = ByteToString(<span class="emphasis">*byte\_variable*</span>) 'supports byte.                                                                |
| <a href="chr" class="link" title="Chr">Chr</a>                                     | <span class="emphasis">*stringvar*</span> = CHR(<span class="emphasis">*bytevar*</span>)                                                                                                |
| <a href="concatenation" class="link" title="Concatenation">Concatenation</a>       | <span class="emphasis">*stringvar*</span> = variable1 + variable2                                                                                                                       |
| <a href="fill" class="link" title="Fill">Fill</a>                                  | <span class="emphasis">*stringvar*</span> = Fill ( byte\_value\_of\_the\_new\_length , pad\_character )                                                                                 |
| <a href="instr" class="link" title="Instr">Instr</a>                               | <span class="emphasis">*location*</span> = Instr(<span class="emphasis">*source*</span>, <span class="emphasis">*find*</span>)                                                          |
| <a href="integertobin" class="link" title="IntegerToBin">IntegerToBin</a>          | <span class="emphasis">*stringvar*</span> = IntegerToBin(<span class="emphasis">*integervar*</span>)                                                                                    |
| <a href="integertohex" class="link" title="IntegerToHex">IntegerToHex</a>          | <span class="emphasis">*stringvar*</span> = IntegerToHex(<span class="emphasis">*number*</span>)                                                                                        |
| <a href="integertostring" class="link" title="IntegerToString">IntegerToString</a> | <span class="emphasis">*stringvar*</span> = IntegerToString(<span class="emphasis">*Integer\_variable*</span>) 'supports Integer.                                                       |
| <a href="lcase" class="link" title="LCase">LCase</a>                               | <span class="emphasis">*output*</span> = LCase(<span class="emphasis">*source*</span>)                                                                                                  |
| <a href="left" class="link" title="Left">Left</a>                                  | <span class="emphasis">*output*</span> = Left(<span class="emphasis">*source*</span>, <span class="emphasis">*count*</span>)                                                            |
| <a href="leftpad" class="link" title="LeftPad">LeftPad</a>                         | LeftPad(<span class="emphasis">*string\_variable*</span>,<span class="emphasis">*byte\_value\_of\_the\_new\_length*</span>,<span class="emphasis">*pad\_character*</span>)              |
| <a href="len" class="link" title="Len">Len</a>                                     | <span class="emphasis">*output*</span>= Len( string )                                                                                                                                   |
| <a href="longtobin" class="link" title="LongToBin">LongToBin</a>                   | <span class="emphasis">*stringvar*</span> = LongToBin(<span class="emphasis">*longvar*</span>)                                                                                          |
| <a href="longtohex" class="link" title="LongToHex">LongToHex</a>                   | <span class="emphasis">*stringvar*</span> = LongToHex(<span class="emphasis">*number*</span>)                                                                                           |
| <a href="longtostring" class="link" title="LongToString">LongToString</a>          | <span class="emphasis">*stringvar*</span> = LongToString(<span class="emphasis">*Long\_variable*</span>) 'supports Long.                                                                |
| <a href="ltrim" class="link" title="Ltrim">Ltrim</a>                               | <span class="emphasis">*stringvar*</span> = LTRIM(<span class="emphasis">*stringvar*</span>)                                                                                            |
| <a href="mid" class="link" title="Mid">Mid</a>                                     | <span class="emphasis">*output*</span> = Mid(<span class="emphasis">*source*</span>, <span class="emphasis">*start*</span>\[, <span class="emphasis">*count*</span>\])                  |
| <a href="pad" class="link" title="Pad">Pad</a>                                     | out\_string = Pad( <span class="emphasis">*string\_variable*</span>, <span class="emphasis">*byte\_value\_of\_the\_new\_length*</span>, <span class="emphasis">*pad\_character*</span>) |
| <a href="right" class="link" title="Right">Right</a>                               | <span class="emphasis">*output*</span> = Right(<span class="emphasis">*source*</span>, <span class="emphasis">*count*</span>)                                                           |
| <a href="rtrim" class="link" title="Rtrim">Rtrim</a>                               | <span class="emphasis">*stringvar*</span> = Rtrim(<span class="emphasis">*stringvar*</span>)                                                                                            |
| <a href="singletobin" class="link" title="SingleToBin">SingleToBin</a>             | <span class="emphasis">*stringvar*</span> = SingleToBin(<span class="emphasis">*Singlevar*</span>)                                                                                      |
| <a href="singletohex" class="link" title="SingleToHex">SingleToHex</a>             | <span class="emphasis">*stringvar*</span> = SingleToHex(<span class="emphasis">*number*</span>)                                                                                         |
| <a href="singletostring" class="link" title="SingleToString">SingleToString</a>    | <span class="emphasis">*stringvar*</span> = SingleToString(<span class="emphasis">*Single\_variable*</span>) 'supports Single.                                                          |
| <a href="stringtobyte" class="link" title="StringToByte">StringToByte</a>          | var = StringToByte(<span class="emphasis">*string*</span>) 'Supports decimal byte range strings only.                                                                                   |
| <a href="stringtolong" class="link" title="StringToLong">StringToLong</a>          | var = StringToLong(<span class="emphasis">*string*</span>) 'Supports decimal Long range strings only.                                                                                   |
| <a href="stringtosingle" class="link" title="StringToSingle">StringToSingle</a>    | var = StringToSingle(<span class="emphasis">*string*</span>) 'Supports decimal Single range strings only.                                                                               |
| <a href="stringtoword" class="link" title="StringToWord">StringToWord</a>          | var = StringToWord(<span class="emphasis">*string*</span>) 'Supports decimal Word range strings only.                                                                                   |
| <a href="trim" class="link" title="Trim">Trim</a>                                  | <span class="emphasis">*stringvar*</span> = Trim(<span class="emphasis">*stringvar*</span>)                                                                                             |
| <a href="ucase" class="link" title="UCase">UCase</a>                               | <span class="emphasis">*output*</span> = UCase(<span class="emphasis">*source*</span>)                                                                                                  |
| <a href="ulonginttobin" class="link" title="ULongIntToBin">ULongIntToBin</a>       | <span class="emphasis">*stringvar*</span> = ULongIntToBin(<span class="emphasis">*ULongIntvar*</span>)                                                                                  |
| <a href="wordtobin" class="link" title="WordToBin">WordToBin</a>                   | <span class="emphasis">*stringvar*</span> = WordToBin(<span class="emphasis">*bytevar*</span>)                                                                                          |
| <a href="wordtohex" class="link" title="WordToHex">WordToHex</a>                   | <span class="emphasis">*stringvar*</span> = WordToHex(<span class="emphasis">*number*</span>)                                                                                           |
| <a href="wordtostring" class="link" title="WordToString">WordToString</a>          | <span class="emphasis">*stringvar*</span> = WordToString(<span class="emphasis">*Word\_variable*</span>) 'supports Word.                                                                |

</div>

<span class="strong">**Deprecated string functions.**</span>

<div class="informaltable">

| Command                                              | Summary                                                                                                                               |
|:-----------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------|
| <a href="hex" class="link" title="Hex">Hex</a> | <span class="emphasis">*stringvar*</span> = Hex(<span class="emphasis">*number*</span>)                                               |
| <a href="str" class="link" title="Str">Str</a> | <span class="emphasis">*stringvar*</span> = Str(<span class="emphasis">*number*</span>) 'supports decimal byte and word strings only. |
| <a href="val" class="link" title="Val">Val</a> | var = Val(<span class="emphasis">*string*</span>) 'Supports decimal byte and word strings only.                                       |

</div>

<span class="strong">**Miscellaneous Commands**</span>

<div class="informaltable">

| Command                                                                | Summary                                                           |
|:-----------------------------------------------------------------------|:------------------------------------------------------------------|
| <a href="getuserid" class="link" title="GetUserID">GetUserID</a> | Available on all Microchip microcontrollers that support UserIDs. |

</div>

<span class="strong">**Maths**</span>

<div class="informaltable">

| Command                                                                                                                                                   | Summary                                                                                                                                       |
|:----------------------------------------------------------------------------------------------------------------------------------------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------|
| <a href="abs" class="link" title="Abs">Abs</a>                                                                                                      | integer\_variable = Abs( integer\_variable )                                                                                                  |
| <a href="average" class="link" title="Average">Average</a>                                                                                          | integer\_variable = Average(<span class="emphasis">*byte\_variable1*</span> , <span class="emphasis">*byte\_variable2*</span>)                |
| <a href="difference" class="link" title="Difference">Difference</a>                                                                                 | Difference ( word\_variable1 , word\_variable2 ) or                                                                                           |
| <a href="int" class="link" title="Int">Int</a>                                                                                                      | integer\_variable = Int( single\_variable )                                                                                                   |
| <a href="log10" class="link" title="Log10">Log10</a>                                                                                                | returned\_word\_variable = Log10 (<span class="emphasis">*word\_value*</span>)                                                                |
| <a href="log2" class="link" title="Log2">Log2</a>                                                                                                   | returned\_word\_variable = Log2 ( <span class="emphasis">*word\_value*</span> )                                                               |
| <a href="logarithms" class="link" title="Logarithms">Logarithms</a>                                                                                 | GCBASIC support logarithmic functions through the include file &lt;maths.h&gt;.                                                               |
| <a href="loge" class="link" title="Loge">Loge</a>                                                                                                   | returned\_word\_variable = Loge ( <span class="emphasis">*word\_value*</span> )                                                               |
| <a href="power" class="link" title="Power">Power</a>                                                                                                | power( base, exponent )                                                                                                                       |
| <a href="roundsingle" class="link" title="RoundSingle">RoundSingle</a>                                                                              | rounded\_single\_value = RoundSingle( single\_variable )                                                                                      |
| <a href="scale" class="link" title="Scale">Scale</a>                                                                                                | integer\_variable = Scale (value\_word , fromLow\_integer , fromHigh\_integer , toLow\_integer , toHigh\_integer \[, calibration\_integer\] ) |
| <a href="sqrt" class="link" title="Sqrt">Sqrt</a>                                                                                                   | word\_variable = sqrt ( <span class="emphasis">*word*</span> )                                                                                |
| <a href="trigonometry_atan" class="link" title="Trigonometry ATAN">Trigonometry ATAN</a>                                                            | GCBASIC supports the trigonometric function for ATan.                                                                                         |
| <a href="trigonometry_sine_cosine_and_tangent" class="link" title="Trigonometry Sine, Cosine and Tangent">Trigonometry Sine, Cosine and Tangent</a> | GCBASIC supports Three Primary Trigonometric Functions                                                                                        |

</div>

<span class="strong">**Port control**</span>

<div class="informaltable">

| Command                                                                                                                                                                                                   | Summary                                                                                                                                     |
|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------|
| <a href="dir" class="link" title="Dir">Dir</a>                                                                                                                                                      | Dir <span class="emphasis">*port.bit*</span> {In \| Out} <span class="emphasis">*(Individual Form)*</span>                                  |
| <a href="weak_pullups" class="link" title="Weak Pullups">Weak Pullups</a>                                                                                                                           | Weak pullups provide a method within many microcontrollers such as the Atmel AVR and Microchip PIC microcontrollers to support internal/s…​ |
| <a href="peripheral_pin_select_for_microchip_microcontrollers" class="link" title="Peripheral Pin Select for Microchip microcontrollers.">Peripheral Pin Select for Microchip microcontrollers.</a> | Peripheral Pin Select (PPS) enables the digital peripheral I/O pins to be changed to support mapping of external pins to different pins.    |
| <a href="unlockpps" class="link" title="UnLockPPS">UnLockPPS</a>                                                                                                                                    | UNLOCKPPS                                                                                                                                   |
| <a href="lockpps" class="link" title="LockPPS">LockPPS</a>                                                                                                                                          | LOCKPSS                                                                                                                                     |

</div>

</div>
