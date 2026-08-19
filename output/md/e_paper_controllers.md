<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="e_paper_controllers"></span>e-Paper Controllers

</div>

</div>

</div>

This section covers GLCD devices known as e-Papers.

An e-paper device is a Microencapsulated Electrophoretic Display, MED.

A MED display uses tiny spheres, in which the charged color pigments are
suspending in the transparent oil and would move depending on the
electronic charge.   The e-paper screen display patterns by reflecting
the ambient light, so it has no background light requirement.   Under
sunshine, the e-paper screen still has high visibility with a wide
viewing angle of 180 degree.   It is the ideal choice for e-reading or
providing information that can be refeshed at a slow rate of change.  

<span class="strong">**GLCD Support for e-Papers**</span>

GCBASIC supports covers the full range of GLCD capabilities like line,
circle, print.

GCBASIC supports SPI communications for the e-Papers - both hardware and
software. And, GCBASIC suppors low memory configurations and SRAM for
the display buffer.

See the demonstration programs to show you how to use these GCLD
capabilities.

<span class="strong">**Memory Usage**</span>

The GCBASIC library uses RAM to buffer the e-paper display.   The amount
of RAM used is specific the the total pixel of the specific e-paper
display.   You can control to amount of RAM used as the buffer using the
device specific constants, see below.   Each device specific library has
four memory options.   Each of the memory options uses different amount
RAM.   The greater the amount of RAM used the faster the process of
updating the e-paper display.   Conversely, the smaller the amount of
RAM used the slower the process of updating the e-paper display.  

<span class="strong">**GLCD Page Transactions**</span>

To make the operation of the library seamless - the library supports
GLCDTransaction.   GLCDTransaction automatically manages the methods to
update the e-paper via the buffer, where the buffer can be small.   The
process of transaction send GLCD commands to the e-paper display on a
page and page basis.   Each page is the size of the buffer and for a
large e-paper display the number of pages may be equivilent to the
numbers of pixels high (height).

GLCDTransaction simplies the operation by ensure the buffer is setup
correctly, handles the GLCD appropiately, handles the sending of the
buffer and then close out the process to update to the display.

To use GLCDTransaction use the followng two methods.

``` screen
        GLCD_Open_PageTransaction
            ....
            glcd commands
            .....

        GLCD_Close_PageTransaction
```

It recommended to use GLCDTransactions at all times.  These methods
remove the complexity of the e-paper update process.

When using GLCDTransaction you must start the transaction
with\`GLCD\_Open\_PageTransaction\` then include a series of GLCD
commands and then terminate the transaction with
`GLCD_Close_PageTransaction`.

<span class="strong">**GLCDTransaction Insight**</span>: When using
GLCDtransactions the number of buffer pages is probably be greater then
1 (unless using the SRAM option), so the process of incrementing
variables and calls to non-GLCD methods must be considered carefully.   
The transaction process <span class="strong">**will**</span> increment
variables and call non-GLCD methods the same number of times as the
number of pages.  Therefore, design GLCDTransaction operations with this
is mind.

<span class="strong">**SRAM as the e-paper buffer**</span>

To improve memory usage the e-paper the e-Paper libraries support the
use of SRAM.   SRAM can be used as an alternative to the
microcontrollers RAM.   Using SRAM does have a small performance impact
but does free up the critical resource of the microcontroller RAM.   The
use of SRAM within the e-paper library is transparent to the user.   To
use SRAM as the e-paper buffer you will need to set-up the SRAM
library.   See the SRAM library for more details on SRAM usage.   

When using SRAM for the e-paper buffer it is still remcommend to use
GLCDTransaction as this ensure the SRAM buffer is correctly initialised.

<span class="strong">**Refresh mode**</span>

This library uses Full refresh:  The e-Paper will flicker when full
refreshing.   This flicker removes the ghost image from the display.  
You could use Partial refresh as this doesnot flicker.   Note that you
cannot use Partial refresh all the time, you should full refresh e-paper
regularly, otherwise, the ghost problem will get worse and even damage
the display.  

<span class="strong">**Refresh rate**</span>

When using the e-Paper library, you should set the update interval at
least 180seconds, except when using Partial mode.  

Please set the e-Paper to sleep mode in software or remove the power
directly, otherwise, the e-Paper will be damaged because of working in
high voltage for extendedtime periods.   You need to update the content
of the e-Paper at least once every 24 hours to avoid from burn-in
problem.  

<span class="strong">**Operating Voltages**</span>

The e-Paper should be driven with 3V3 operating voltages and signals.  

If your Microcontroller (PIC, AVR and therefore an Arduino)cannot drive
the e-Paper successfully.   You must convert the level to 3.3V.    The
I/O level of Arduino is 5V.   HEALTH WARNING:You can also try to connect
the Vcc pin to the 5V of Arduino to see whether the e-Paper works, but
we recommend you not to use 5V for a long time.  

<span class="strong">**The e-Paper looks a little black or grey**</span>

You can try to change the value of Vcom the library by setting the
VCOM\_AND\_DATA\_INTERVAL constant.   See the Vcom and data interval in
the dataheet.  VCOM\_AND\_DATA\_INTERVAL can be 0x00 to 0x0F

<span class="strong">**GCBASIC library supports Black/White NOT
Black/White/Red**</span>

The default is Black/White. To support Black/White/Red add \`\#define
PANEL\_SETTING\_KWR 0x00\`to you user program. 

The constant are the TFT\_BLACK and TFT\_WHITE constants.

<span class="strong">**The e-paper has ghosting problem after working
for some days**</span>

Please set the e-paper to sleep mode or disconnect it if you do not
refresh the e-paper but need to power on your solution.  

Do NOT leave power on for extended periods, otherwise, the voltage of
panel remains high and it will damage the e-paper display.  

<span class="strong">**e-Paper Guidelines**</span>

Remove power if practical.

ALWAYS use `GLCDDisplay Off` or sleep mode.

When in storage CLEAR the screen…​. avoid burn it - use

``` screen
    GLCDCLD TFT_WHITE
    GLCDDisplay Off
```

The recommended method is:

``` screen
    GLCDCLS TFT_WHITE
    GLCDDisplay Off
    do
    loop
```

<span class="strong">**Using the e-Paper Library**</span>

To use the e-Paper driver for a specific simply include the following in
your user code.  

This will initialise the driver.  

``` screen
    'Setup for the e-Paper
     #include <glcd.h>

     #define GLCD_TYPE GLCD_TYPE_EPD_EPD7in5
     #define GLCD_EXTENDEDFONTSET1
     #define GLCD_OLED_FONT
     #define GLCD_TYPE_EPD7in5_LOWMEMORY4_GLCD_MODE fastest but uses a lot of RAM
     '#define GLCD_TYPE_EPD7in5_LOWMEMORY3_GLCD_MODE
     '#define GLCD_TYPE_EPD7in5_LOWMEMORY2_GLCD_MODE
     '#define GLCD_TYPE_EPD7in5_LOWMEMORY1_GLCD_MODEslowest uses the least amount of RAM


    'Pin mappings for SPI - this GLCD driver supports Hardware SPI and Software SPI
    #define GLCD_DC portA.0 ' Data(hight)/ command(low) line
    #define GLCD_CS portC.1 ' Chip select line (negate)
    #define GLCD_RESETportD.2 ' Reset line (negate)
    #define GLCD_DO portC.5 ' GLCD MOSI connect to MCU SDO
    #define GLCD_SCKportC.3 ' Clock Line
    #define GLCD_Busy portC.0 ' Busy Line

    'The following should be used for hardware SPI remove or comment out if you want to use software SPI.
    #define EPD_HardwareSPI
```

The GCBASIC constants for control display characteristics are shown in
the table below.

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;"><span class="strong"><strong>Constants</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Controls</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Options</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_TYPE</code></p></td>
<td style="text-align: left;"><p><code class="literal">GLCD_TYPE_EPD_EPD7in5</code></p></td>
<td style="text-align: left;"><p>GLCD_TYPE_EPD_EPD7in5 and GLCD_TYPE_EPD_EPD2in13D supported</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_TYPE_&lt;device_memory_mode&gt;</code></p></td>
<td style="text-align: left;"><p>Memory usage for the display buffer.  </p>
<p>Memory management is crutial when using the e-paper displays.</p></td>
<td style="text-align: left;"><p><code class="literal">GLCD_TYPE_EPD7in5_LOWMEMORY4_GLCD_MODE</code> …​ <code class="literal">GLCD_TYPE_EPD7in5_LOWMEMORY1_GLCD_MODE</code>,</p>
<p>or,</p>
<p><code class="literal">GLCD_TYPE_EPD2in13D_LOWMEMORY4_GLCD_MODE</code> …​ <code class="literal">GLCD_TYPE_EPD2in13D_LOWMEMORY1_GLCD_MODE</code></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_DC</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to Data/Command IO pin on the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_CS</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to Chip Select (CS) on the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_Reset</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to Reset pin on the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_DO</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to Data Out (GLCD in) pin on the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_SCK</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to Clock (CLK) pin on the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_BUSY</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to Busy pin on the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">EPD_HardwareSPI</code></p></td>
<td style="text-align: left;"><p>Instructs the library to use hardware SPI, remove or comment out if you want to use software SPI.</p></td>
<td style="text-align: left;"><p><code class="literal">#define EPD_HardwareSPI</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">HWSPIMode</code></p></td>
<td style="text-align: left;"><p>Specifies the speed of the SPI communications for Hardware SPI only.</p></td>
<td style="text-align: left;"><p>Optional defaults to MASTERFAST.</p>
<p>Options are MASTERSLOW,<br />
MASTER,<br />
MASTERFAST, or<br />
MASTERULTRAFAST for specific AVRs only.</p></td>
</tr>
</tbody>
</table>

</div>

The GCBASIC constants for control display characteristics are shown in
the table below.  

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;"><span class="strong"><strong>Constants</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Controls</strong></span></th>
<th style="text-align: center;"><span class="strong"><strong>Default</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_WIDTH</code></p></td>
<td style="text-align: left;"><p>The width parameter of the GLCD</p></td>
<td style="text-align: center;"><p>Specific to the e-Paper selected<br />
This cannot be changed</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_HEIGHT</code></p></td>
<td style="text-align: left;"><p>The height parameter of the GLCD</p></td>
<td style="text-align: center;"><p>Specific to the e-Paper selected<br />
This cannot be changed</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCDFontWidth</code></p></td>
<td style="text-align: left;"><p>Specifies the font width of the GCBASIC font set.</p></td>
<td style="text-align: center;"><p><code class="literal">6</code> or <code class="literal">5</code> for the OLED font set.</p></td>
</tr>
</tbody>
</table>

</div>

The GCBASIC commands supported for this GLCD are shown in the table
below.   Always review the appropiate library for the latest full set of
supported commands.

<div class="informaltable">

| <span class="strong">**Command**</span> | <span class="strong">**Purpose**</span>                                                                                    | <span class="strong">**Example**</span>                                                                             |
|:----------------------------------------|:---------------------------------------------------------------------------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------|
| `GLCDCLS`                               | Clear screen of GLCD                                                                                                       | `GLCDCLS`                                                                                                           |
| `GLCDDisplay`                           | Enables sleep mode, or, enables operations                                                                                 | `GLCDDisplay Off`, or, `GLCDDisplay On`                                                                             |
| `GLCDPrint`                             | Print string of characters on GLCD using GCB font set                                                                      | `GLCDPrint( Xposition, Yposition, Stringvariable )`                                                                 |
| `GLCDDrawChar`                          | Print character on GLCD using GCB font set                                                                                 | `GLCDDrawChar( Xposition, Yposition, CharCode )`                                                                    |
| `GLCDDrawString`                        | Print characters on GLCD using GCB font set                                                                                | `GLCDDrawString( Xposition, Yposition, Stringvariable )`                                                            |
| `Box`                                   | Draw a box on the GLCD to a specific size                                                                                  | `Box ( Xposition1, Yposition1, Xposition2, Yposition2, [Optional In LineColour as 0 or 1] )`                        |
| `FilledBox`                             | Draw a box on the GLCD to a specific size that is filled with the foreground colour.                                       | `FilledBox (Xposition1, Yposition1, Xposition2, Yposition2, [Optional In LineColour 0 or 1] )`                      |
| `Line`                                  | Draw a line on the GLCD to a specific length that is filled with the specific attribute.                                   | `Line ( Xposition1, Yposition1, Xposition2, Yposition2, [Optional In LineColour 0 or 1] )`                          |
| `PSet`                                  | Set a pixel on the GLCD at a specific position that is set with the specific attribute.                                    | `PSet(Xposition, Yposition, Pixel Colour 0 or 1)`                                                                   |
| `GLCD_Open_PageTransaction`             | Commence a series of GLCD commands with memory buffer management. Must be followed a `GLCD_Close_PageTransaction` command. | `GLCD_Open_PageTransaction`. Parameters may be passed where the two parameters are the range of pages to be updated |
| `GLCD_Close_PageTransaction`            | Terminate a series of GLCD commands. Must follow a `GLCD_Open_PageTransaction` command.                                    | `GLCD_Close_PageTransaction`. Terminates the GLCDTransaction.                                                       |

</div>

<span class="strong">**Example Usage:**</span>

``` screen
#chip mega328p, 16
#include <uno_mega328p.h>
#option explicit

 '******************************************************************************************************

'Setup the E-Paper
 #include <glcd.h>

 #define HWSPIMode ULTRAFAST

 #define GLCD_TYPE GLCD_TYPE_EPD_EPD2in13D
 #define GLCD_EXTENDEDFONTSET1
 #define GLCD_TYPE_EPD2in13D_LOWMEMORY4_GLCD_MODE
 #define GLCD_OLED_FONT
 #define GLCD_PROTECTOVERRUN



 'Pin mappings for SPI - this GLCD driver supports Hardware SPI and Software SPI
 #define GLCD_DC DIGITAL_9
 #define GLCD_CS DIGITAL_10
 #define GLCD_RESETDIGITAL_8
 #define GLCD_DO DIGITAL_11
 #define GLCD_SCKDIGITAL_13
 #define GLCD_Busy DIGITAL_7

 #define EPD_HARDWARESPI

 '***********************************************************************************************


'Main program

GLCDForeground=TFT_BLACK
GLCDBackground=TFT_WHITE


 GLCD_Open_PageTransaction
    GLCDPrintStringLN ("GCBASIC")
    GLCDPrintStringLN ("")
    GLCDPrintStringLN ("Test of the e-Paper")
    GLCDPrintStringLN ("")
    GLCDPrintStringLN ("December 2021")
 GLCD_Close_PageTransaction
 GLCDDisplay Off

 wait 2 s
 GLCDDisplay On
 GLCDCLS
 GLCDDisplay off

 do

 loop
```

<span class="strong">**For more help, see**</span>
<a href="glcdcls" class="link" title="GLCDCLS">GLCDCLS</a>,
<a href="glcddrawchar" class="link" title="GLCDDrawChar">GLCDDrawChar</a>,
<a href="glcdprint" class="link" title="GLCDPrint">GLCDPrint</a>,
<a href="glcdreadbyte" class="link" title="GLCDReadByte">GLCDReadByte</a>,
<a href="glcdwritebyte" class="link" title="GLCDWriteByte">GLCDWriteByte</a>,
<a href="pset" class="link" title="Pset">Pset</a> or
<a href="glcdtransaction" class="link" title="GLCDTransaction">GLCDTransaction</a>

Supported in &lt;GLCD.H&gt;

</div>
