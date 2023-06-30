<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="ssd1351_controllers"></span>SSD1351 Controllers

</div>

</div>

</div>

This section covers GLCD devices that use the SSD1351 graphics
controller. The SSD1351 is a single-chip controller/driver for
262K-color, graphic type OLED-LCD.

The GCBASIC constants shown below control the configuration of the
SSD1351 controller.    GCBASIC supports SPI, hardware and software SPI,
connectivity. This is shown in the tables below.

GCBASIC supports 65K-color mode operations.

To use the SSD1351 driver simply include the following in your user
code. This will initialise the driver.

``` screen
        #include <glcd.h>
        #define GLCD_TYPE GLCD_TYPE_SSD1351

        'Pin mappings for SPI - this GLCD driver supports Hardware SPI and Software SPI
        #define GLCD_DC       portb.0           ' Data command line
        #define GLCD_CS       portb.2           ' Chip select line
        #define GLCD_RESET    portb.1           ' Reset line
        #define GLCD_DO       portb.3           ' Data out | MOSI
        #define GLCD_SCK      portb.5           ' Clock Line

        #define SSD1351_HardwareSPI    ' remove/comment out if you want to use software SPI.  If you are using PPS to setup the SPI - ensure that PPS SPI is disabled to use software SPI.
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
<td style="text-align: left;"><p><code class="literal">GLCD_TYPE_SSD1351</code></p></td>
<td style="text-align: left;"> </td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_DC</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to Data/Command IO pin on the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_CS</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to Chip Select (CS) on the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_Reset</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to Reset pin on the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_DO</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to Data Out (GLCD in) pin on the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_SCK</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to Clock (CLK) pin on the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">SSD1351_HardwareSPI</code></p></td>
<td style="text-align: left;"><p>Specifies that hardware SPI will be used</p></td>
<td style="text-align: left;"><p>SPI ports MUST be defined that match the SPI module for each specific microcontroller</p>
<p><span class="strong"><strong>#define SSD1351_HardwareSPI</strong></span></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>HWSPIMode</p></td>
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
<td style="text-align: center;"><p><code class="literal">128</code><br />
This cannot be changed</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_HEIGHT</code></p></td>
<td style="text-align: left;"><p>The height parameter of the GLCD</p></td>
<td style="text-align: center;"><p><code class="literal">128</code><br />
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

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;"><span class="strong"><strong>Command</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Purpose</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Example</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCDCLS</code></p></td>
<td style="text-align: left;"><p>Clear screen of GLCD</p></td>
<td style="text-align: left;"><p><code class="literal">GLCDCLS</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCDPrint</code></p></td>
<td style="text-align: left;"><p>Print string of characters on GLCD using GCB font set</p></td>
<td style="text-align: left;"><p><code class="literal">GLCDPrint( Xposition, Yposition, Stringvariable )</code></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCDDrawChar</code></p></td>
<td style="text-align: left;"><p>Print character on GLCD using GCB font set</p></td>
<td style="text-align: left;"><p><code class="literal">GLCDDrawChar( Xposition, Yposition, CharCode )</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCDDrawString</code></p></td>
<td style="text-align: left;"><p>Print characters on GLCD using GCB font set</p></td>
<td style="text-align: left;"><p><code class="literal">GLCDDrawString( Xposition, Yposition, Stringvariable )</code></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">Box</code></p></td>
<td style="text-align: left;"><p>Draw a box on the GLCD to a specific size</p></td>
<td style="text-align: left;"><p><code class="literal">Box ( Xposition1, Yposition1, Xposition2, Yposition2, [Optional In LineColour as 0 or 1] )</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">FilledBox</code></p></td>
<td style="text-align: left;"><p>Draw a box on the GLCD to a specific size that is filled with the foreground colour.</p></td>
<td style="text-align: left;"><p><code class="literal">FilledBox (Xposition1, Yposition1, Xposition2, Yposition2, [Optional In LineColour 0 or 1] )</code></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">Line</code></p></td>
<td style="text-align: left;"><p>Draw a line on the GLCD to a specific length that is filled with the specific attribute.</p></td>
<td style="text-align: left;"><p><code class="literal">Line ( Xposition1, Yposition1, Xposition2, Yposition2, [Optional In LineColour 0 or 1] )</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">PSet</code></p></td>
<td style="text-align: left;"><p>Set a pixel on the GLCD at a specific position that is set with the specific attribute.</p></td>
<td style="text-align: left;"><p><code class="literal">PSet(Xposition, Yposition, Pixel Colour 0 or 1)</code></p>
<p>Any color can be defined using a valid hexidecimal word value between 0x0000 to 0xFFFF.</p></td>
</tr>
</tbody>
</table>

</div>

``` screen
   SSD1351_BLACK   'hexidecimal value 0x0000
   SSD1351_BLUE    'hexidecimal value 0xF800
   SSD1351_RED     'hexidecimal value 0x001F
   SSD1351_GREEN   'hexidecimal value 0x07E0
   SSD1351_CYAN    'hexidecimal value 0xFFE0
   SSD1351_MAGENTA 'hexidecimal value 0xF81F
   SSD1351_YELLOW  'hexidecimal value 0x07FF
   SSD1351_WHITE   'hexidecimal value 0xFFFF
```

<span class="strong">**Example:**</span>

``` screen
    #chip mega328p, 16
    #option explicit

    #include <glcd.h>
    #define GLCD_TYPE GLCD_TYPE_SSD1351

    'Pin mappings for SPI - this GLCD driver supports Hardware SPI and Software SPI
    #define GLCD_DC       portb.0           ' Data command line
    #define GLCD_CS       portb.2           ' Chip select line
    #define GLCD_RESET    portb.1           ' Reset line
    #define GLCD_DO       portb.3           ' Data out | MOSI
    #define GLCD_SCK      portb.5           ' Clock Line

    #define SSD1351_HardwareSPI    ' remove/comment out if you want to use software SPI.

    'GLCD selected OLED font set.
    #define GLCD_OLED_FONT
    GLCDfntDefaultsize = 1

    GLCDCLS
    GLCDPrintStringLN ("GCBASIC")
    GLCDPrintStringLN ("")
    GLCDPrintStringLN ("Test of the SSD1351")
    GLCDPrintStringLN ("")
    GLCDPrintStringLN ("October 2021")
    end
```

<span class="strong">**For more help, see**</span>
<a href="glcdcls" class="link" title="GLCDCLS">GLCDCLS</a>,
<a href="glcddrawchar" class="link" title="GLCDDrawChar">GLCDDrawChar</a>,
<a href="glcdprint" class="link" title="GLCDPrint">GLCDPrint</a>,
<a href="glcdreadbyte" class="link" title="GLCDReadByte">GLCDReadByte</a>,
<a href="glcdwritebyte" class="link" title="GLCDWriteByte">GLCDWriteByte</a>
or <a href="pset" class="link" title="Pset">Pset</a>

Supported in &lt;GLCD.H&gt;

</div>
