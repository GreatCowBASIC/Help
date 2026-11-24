<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="e_paper_controllers"></span>e-Paper Controllers

</div>

</div>

</div>

This section covers GLCD devices known as e-Paper displays.

An e-Paper device is a Microencapsulated Electrophoretic Display (MED).

A MED display uses tiny spheres in which charged colour pigments are
suspended in a transparent oil and move depending on the electronic
charge applied.   The e-Paper screen displays patterns by reflecting
ambient light, so it has no backlight requirement.   Under sunlight, the
e-Paper screen still has high visibility with a wide viewing angle of
180 degrees.   It is the ideal choice for e-reading or for providing
information that can be refreshed at a slow rate of change.  

<span class="strong">**GLCD Support for e-Paper**</span>

GCBASIC covers the full range of GLCD capabilities, such as line,
circle, and print.

GCBASIC supports SPI communications for e-Paper displays — both hardware
and software. GCBASIC also supports low-memory configurations and SRAM
for the display buffer.

See the demonstration programs to see how to use these GLCD
capabilities.

<span class="strong">**Memory Usage**</span>

The GCBASIC library uses RAM to buffer the e-Paper display.   The amount
of RAM used is specific to the total pixel count of the specific e-Paper
display.   You can control the amount of RAM used as the buffer using
the device-specific constants, shown below.   Each device-specific
library has four memory options.   Each of the memory options uses a
different amount of RAM.   The greater the amount of RAM used, the
faster the process of updating the e-Paper display.   Conversely, the
smaller the amount of RAM used, the slower the process of updating the
e-Paper display.  

<span class="strong">**GLCD Page Transactions**</span>

To make the operation of the library seamless, the library supports
`GLCDTransaction`.   `GLCDTransaction` automatically manages the methods
to update the e-Paper via the buffer, where the buffer can be small.  
The transaction process sends GLCD commands to the e-Paper display on a
page-by-page basis.   Each page is the size of the buffer, and for a
large e-Paper display the number of pages may be equivalent to the
number of pixels high (height).

`GLCDTransaction` simplifies the operation by ensuring the buffer is set
up correctly, handling the GLCD appropriately, sending the buffer, and
then closing out the process to update the display.

To use `GLCDTransaction`, use the following two methods.

``` programlisting
        GLCD_Open_PageTransaction
            ....
            glcd commands
            .....

        GLCD_Close_PageTransaction
```

It is recommended to use `GLCDTransaction` at all times.  These methods
remove the complexity of the e-Paper update process.

When using `GLCDTransaction`, you must start the transaction with
`GLCD_Open_PageTransaction`, then include a series of GLCD commands, and
then terminate the transaction with `GLCD_Close_PageTransaction`.

<span class="strong">**GLCDTransaction Insight**</span>: When using
`GLCDTransaction`, the number of buffer pages is probably greater than 1
(unless using the SRAM option), so the process of incrementing variables
and calling non-GLCD methods must be considered carefully.  The
transaction process <span class="strong">**will**</span> increment
variables and call non-GLCD methods the same number of times as the
number of pages.  Therefore, design `GLCDTransaction` operations with
this in mind.

<span class="strong">**SRAM as the e-Paper Buffer**</span>

To improve memory usage, the e-Paper libraries support the use of
SRAM.   SRAM can be used as an alternative to the microcontroller’s own
RAM.   Using SRAM does have a small performance impact but frees up the
critical resource of microcontroller RAM.   The use of SRAM within the
e-Paper library is transparent to the user.   To use SRAM as the e-Paper
buffer, you will need to set up the SRAM library.   See
<a href="sram_overview" class="link" title="SRAM Overview">SRAM Overview</a>
for more details on SRAM usage.  

When using SRAM for the e-Paper buffer, it is still recommended to use
`GLCDTransaction`, since this ensures the SRAM buffer is correctly
initialised.

<span class="strong">**Refresh Mode**</span>

This library uses full refresh:  the e-Paper will flicker when fully
refreshing.   This flicker removes the ghost image from the display.  
You could use partial refresh, as this does not flicker.   Note that you
cannot use partial refresh all the time — you should fully refresh the
e-Paper regularly, otherwise the ghosting problem will get worse and
could even damage the display.  

<span class="strong">**Refresh Rate**</span>

When using the e-Paper library, you should set the update interval to at
least 180 seconds, except when using partial mode.  

Please set the e-Paper to sleep mode in software, or remove power
directly, when not actively updating it — otherwise the e-Paper may be
damaged from working at high voltage for extended periods.   You need to
update the content of the e-Paper at least once every 24 hours to avoid
a burn-in problem.  

<span class="strong">**Operating Voltages**</span>

The e-Paper should be driven with 3.3V operating voltages and signals.  

If your microcontroller (PIC, AVR, and therefore an Arduino) cannot
drive the e-Paper at its native voltage, you must convert the level to
3.3V.   The I/O level of an Arduino is 5V.   HEALTH WARNING: you can
also try connecting the Vcc pin to the Arduino’s 5V supply to see
whether the e-Paper works, but we recommend against using 5V for a long
time.  

<span class="strong">**The e-Paper Looks a Little Black or Grey**</span>

You can try changing the Vcom value in the library by setting the
`VCOM_AND_DATA_INTERVAL` constant.   See the Vcom and data interval
values in the datasheet.  \`VCOM\_AND\_DATA\_INTERVAL\` can range from
`0x00` to `0x0F`.

<span class="strong">**GCBASIC Library Supports Black/White, NOT
Black/White/Red**</span>

The default is Black/White. To support Black/White/Red, add
`#define PANEL_SETTING_KWR 0x00` to your user program. 

The relevant constants are `TFT_BLACK` and `TFT_WHITE`.

<span class="strong">**The e-Paper Has a Ghosting Problem After Working
for Some Days**</span>

Please set the e-Paper to sleep mode, or disconnect it, if you do not
refresh the e-Paper but need to keep your solution powered on.  

Do NOT leave power on for extended periods; otherwise the voltage on the
panel remains high and it will damage the e-Paper display.  

<span class="strong">**e-Paper Guidelines**</span>

Remove power if practical.

ALWAYS use `GLCDDisplay Off` or sleep mode.

When in storage, CLEAR the screen to avoid burn-in — use:

``` programlisting
    GLCDCLS TFT_WHITE          ' <<< clear the display to white before storage
    GLCDDisplay Off
```

The recommended method is:

``` programlisting
    GLCDCLS TFT_WHITE
    GLCDDisplay Off
    do
    loop
```

<span class="strong">**Key line:**</span> `GLCDCLS TFT_WHITE` — clears
the whole panel to white before the display is put into sleep mode,
preventing a static image from burning in during long-term storage.

<span class="strong">**Using the e-Paper Library**</span>

To use the e-Paper driver for a specific device, simply include the
following in your user code.  

This will initialise the driver.  

``` programlisting
    'Setup for the e-Paper
     #include <glcd.h>

     #define GLCD_TYPE GLCD_TYPE_EPD_EPD7in5
     #define GLCD_EXTENDEDFONTSET1
     #define GLCD_OLED_FONT
     #define GLCD_TYPE_EPD7in5_LOWMEMORY4_GLCD_MODE 'fastest but uses a lot of RAM
     '#define GLCD_TYPE_EPD7in5_LOWMEMORY3_GLCD_MODE
     '#define GLCD_TYPE_EPD7in5_LOWMEMORY2_GLCD_MODE
     '#define GLCD_TYPE_EPD7in5_LOWMEMORY1_GLCD_MODE 'slowest, uses the least amount of RAM


    'Pin mappings for SPI - this GLCD driver supports Hardware SPI and Software SPI
    #define GLCD_DC portA.0 ' Data(high)/ command(low) line
    #define GLCD_CS portC.1 ' Chip select line (negate)
    #define GLCD_RESET portD.2 ' Reset line (negate)
    #define GLCD_DO portC.5 ' GLCD MOSI connect to MCU SDO
    #define GLCD_SCK portC.3 ' Clock Line
    #define GLCD_Busy portC.0 ' Busy Line

    'The following should be used for hardware SPI; remove or comment out if you want to use software SPI.
    #define EPD_HardwareSPI
```

Note: the `GLCD_RESET` and `GLCD_SCK` defines above previously ran
together with their pin name (for example `GLCD_RESETportD.2` with no
space) — this has been corrected, since a missing space there would stop
the line being parsed as a valid `#define` and prevent the program
compiling.

The GCBASIC constants for controlling display characteristics are shown
in the table below.

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
<p>Memory management is crucial when using e-Paper displays.</p></td>
<td style="text-align: left;"><p><code class="literal">GLCD_TYPE_EPD7in5_LOWMEMORY4_GLCD_MODE</code> …​ <code class="literal">GLCD_TYPE_EPD7in5_LOWMEMORY1_GLCD_MODE</code>,</p>
<p>or,</p>
<p><code class="literal">GLCD_TYPE_EPD2in13D_LOWMEMORY4_GLCD_MODE</code> …​ <code class="literal">GLCD_TYPE_EPD2in13D_LOWMEMORY1_GLCD_MODE</code></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_DC</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to the Data/Command IO pin on the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_CS</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to Chip Select (CS) on the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_RESET</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to the Reset pin on the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_DO</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to the Data Out (GLCD in) pin on the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_SCK</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to the Clock (CLK) pin on the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_BUSY</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to the Busy pin on the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">EPD_HardwareSPI</code></p></td>
<td style="text-align: left;"><p>Instructs the library to use hardware SPI; remove or comment out if you want to use software SPI.</p></td>
<td style="text-align: left;"><p><code class="literal">#define EPD_HardwareSPI</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">HWSPIMode</code></p></td>
<td style="text-align: left;"><p>Specifies the speed of the SPI communications for hardware SPI only.</p></td>
<td style="text-align: left;"><p>Optional, defaults to MASTERFAST.</p>
<p>Options are MASTERSLOW,<br />
MASTER,<br />
MASTERFAST, or<br />
MASTERULTRAFAST for specific AVRs only.</p></td>
</tr>
</tbody>
</table>

</div>

The GCBASIC constants for the display’s fixed characteristics are shown
in the table below.  

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
<td style="text-align: center;"><p><code class="literal">6</code>, or <code class="literal">5</code> for the OLED font set.</p></td>
</tr>
</tbody>
</table>

</div>

The GCBASIC commands supported for this GLCD are shown in the table
below.   Always review the appropriate library for the latest full set
of supported commands.

<div class="informaltable">

| <span class="strong">**Command**</span> | <span class="strong">**Purpose**</span>                                                                                       | <span class="strong">**Example**</span>                                                                               |
|:----------------------------------------|:------------------------------------------------------------------------------------------------------------------------------|:----------------------------------------------------------------------------------------------------------------------|
| `GLCDCLS`                               | Clear screen of GLCD                                                                                                          | `GLCDCLS`                                                                                                             |
| `GLCDDisplay`                           | Enables sleep mode, or enables operations                                                                                     | `GLCDDisplay Off`, or `GLCDDisplay On`                                                                                |
| `GLCDPrint`                             | Print string of characters on GLCD using GCB font set                                                                         | `GLCDPrint( Xposition, Yposition, Stringvariable )`                                                                   |
| `GLCDDrawChar`                          | Print character on GLCD using GCB font set                                                                                    | `GLCDDrawChar( Xposition, Yposition, CharCode )`                                                                      |
| `GLCDDrawString`                        | Print characters on GLCD using GCB font set                                                                                   | `GLCDDrawString( Xposition, Yposition, Stringvariable )`                                                              |
| `Box`                                   | Draw a box on the GLCD to a specific size                                                                                     | `Box ( Xposition1, Yposition1, Xposition2, Yposition2, [Optional In LineColour as 0 or 1] )`                          |
| `FilledBox`                             | Draw a box on the GLCD to a specific size that is filled with the foreground colour.                                          | `FilledBox (Xposition1, Yposition1, Xposition2, Yposition2, [Optional In LineColour 0 or 1] )`                        |
| `Line`                                  | Draw a line on the GLCD to a specific length that is filled with the specific attribute.                                      | `Line ( Xposition1, Yposition1, Xposition2, Yposition2, [Optional In LineColour 0 or 1] )`                            |
| `PSet`                                  | Set a pixel on the GLCD at a specific position that is set with the specific attribute.                                       | `PSet(Xposition, Yposition, Pixel Colour 0 or 1)`                                                                     |
| `GLCD_Open_PageTransaction`             | Commence a series of GLCD commands with memory buffer management. Must be followed by a `GLCD_Close_PageTransaction` command. | `GLCD_Open_PageTransaction`. Parameters may be passed, where the two parameters are the range of pages to be updated. |
| `GLCD_Close_PageTransaction`            | Terminate a series of GLCD commands. Must follow a `GLCD_Open_PageTransaction` command.                                       | `GLCD_Close_PageTransaction`. Terminates the GLCDTransaction.                                                         |

</div>

<span class="strong">**Example Usage:**</span>

``` programlisting
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
 #define GLCD_RESET DIGITAL_8
 #define GLCD_DO DIGITAL_11
 #define GLCD_SCK DIGITAL_13
 #define GLCD_Busy DIGITAL_7

 #define EPD_HARDWARESPI

 '***********************************************************************************************


'Main program

GLCDForeground=TFT_BLACK
GLCDBackground=TFT_WHITE


 GLCD_Open_PageTransaction          ' <<< opens a page transaction so the five print lines below are batched into one buffered update
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

<span class="strong">**Key line:**</span>
`GLCD_Open_PageTransaction` — begins a buffered update so the five
`GLCDPrintStringLN` calls that follow are sent to the e-Paper together
and closed out cleanly by the matching `GLCD_Close_PageTransaction`,
rather than triggering a separate slow refresh per line.

Note: the pin defines in this example (`GLCD_RESETDIGITAL_8`,
`GLCD_SCKDIGITAL_13`) previously ran together with no space, which is
the same missing-space bug corrected in the setup example above.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcd_overview" class="link" title="GLCD Overview">GLCD Overview</a> — category
    overview and the full supported-display comparison table
-   <a href="glcdcls" class="link" title="GLCDCLS">GLCDCLS</a>
-   <a href="glcddrawchar" class="link" title="GLCDDrawChar">GLCDDrawChar</a>
-   <a href="glcdprint" class="link" title="GLCDPrint">GLCDPrint</a>
-   <a href="glcdreadbyte" class="link" title="GLCDReadByte">GLCDReadByte</a>
-   <a href="glcdwritebyte" class="link" title="GLCDWriteByte">GLCDWriteByte</a>
-   <a href="pset" class="link" title="Pset">Pset</a>
-   <a href="glcdtransaction" class="link" title="GLCDTransaction">GLCDTransaction</a>
-   <a href="sram_overview" class="link" title="SRAM Overview">SRAM Overview</a> — using
    external SRAM as the e-Paper frame buffer

</div>

Supported in &lt;GLCD.H&gt;

</div>
