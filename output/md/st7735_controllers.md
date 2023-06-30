<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="st7735_controllers"></span>ST7735 Controllers

</div>

</div>

</div>

This section covers GLCD devices that use the ST7735 graphics
controller. The ST7735 or ST7735R is a single-chip controller/driver for
262K-color, graphic type TFT-LCD.

GCBASIC supports 65K-color mode operations.

The GCBASIC constants shown below control the configuration of the
ST7735 or ST7735R controller.    GCBASIC supports an 8 bit bus
connectivity. The 8 bit must be a single port of consective bits - this
is shown in the tables below.

To use the ST7735 driver simply include the following in your user code.
This will initialise the driver.

``` screen
    #include <glcd.h>
    #define GLCD_TYPE GLCD_TYPE_ST7735R
    #define ST7735TABCOLOR ST7735_BLACKTAB  ; can also be ST7735_GREENTAB or ST7735_REDTAB or GLCD_TYPE_ST7735R_160_80

    'Pin mappings for ST7735
    #define GLCD_DC     porta.0           'example port setting
    #define GLCD_CS    porta.1           'example port setting
    #define GLCD_RESET  porta.2           'example port setting
    #define GLCD_DI     porta.3           'example port setting
    #define GLCD_DO     porta.4           'example port setting
    #define GLCD_SCK    porta.5           'example port setting
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
<td style="text-align: left;"><p><code class="literal">GLCD_TYPE_ST7735</code> or <code class="literal">GLCD_TYPE_ST7735R</code> or <code class="literal">GLCD_TYPE_ST7735R_160_80</code></p></td>
<td style="text-align: left;"> </td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">ST7735TABCOLOR</code></p></td>
<td style="text-align: left;"><p>Specifies the type of ST7735 chipset. The default is <code class="literal">ST7735_BLACKTAB</code></p></td>
<td style="text-align: left;"><p>Options are <code class="literal">ST7735_BLACKTAB</code>, <code class="literal">ST7735_GREENTAB</code> or <code class="literal">ST7735_REDTAB</code>. Each tab is a different ST7735 configuration. If you do not know your type try each constant and test.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_DATA_PORT</code></p></td>
<td style="text-align: left;"><p>Not Available for this controller.</p></td>
<td style="text-align: left;"><p>Not applicable.</p></td>
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
<td style="text-align: left;"><p><code class="literal">GLCD_DI</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to Data In (GLCD out) pin on the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_D0</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to Data Out (GLCD in) pin on the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_SLK</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to Clock (CLK) pin on the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">ST7735_HardwareSPI</code></p></td>
<td style="text-align: left;"><p>Specifies that hardware SPI will be used</p></td>
<td style="text-align: left;"><p>SPI ports MUST be defined that match the SPI module for each specific microcontroller</p>
<p><span class="strong"><strong>#define ST7735_HardwareSPI</strong></span></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>HWSPIMode</p></td>
<td style="text-align: left;"><p>Specifies the speed of the SPI communications for Hardware SPI only.</p></td>
<td style="text-align: left;"><p>Optional defaults to MASTERFAST.</p>
<p>Options are MASTERSLOW,<br />
MASTER,<br />
MASTERFAST, or<br />
MASTERULTRAFAST for specific AVRs only.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">ST7735_XSTART</code></p></td>
<td style="text-align: left;"><p>Specifies the adjustment made to the X axis when writing to the GLCD. This is used to correct any geometry correction required for specific GLCDs.</p></td>
<td style="text-align: left;"><p>Optional. Defaults are set for each specific GLCD.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">ST7735_YSTART</code></p></td>
<td style="text-align: left;"><p>Specifies the adjustment made to the Y axis when writing to the GLCD. This is used to correct any geometry correction required for specific GLCDs.</p></td>
<td style="text-align: left;"><p>Optional. Defaults are set for each specific GLCD.</p></td>
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
<td style="text-align: center;"><p><code class="literal">160</code><br />
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
<td style="text-align: center;"><p><code class="literal">6</code></p></td>
</tr>
</tbody>
</table>

</div>

The GCBASIC commands supported for this GLCD are shown in the table
below.   Always review the appropiate library for the latest full set of
supported commands.

<div class="informaltable">

| <span class="strong">**Command**</span> | <span class="strong">**Purpose**</span>                                                  | <span class="strong">**Example**</span>                                                                                                                                                   |
|:----------------------------------------|:-----------------------------------------------------------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `GLCDCLS`                               | Clear screen of GLCD                                                                     | `GLCDCLS`                                                                                                                                                                                 |
| `GLCDPrint`                             | Print string of characters on GLCD using GCB font set                                    | `GLCDPrint( Xposition, Yposition, Stringvariable )`                                                                                                                                       |
| `GLCDDrawChar`                          | Print character on GLCD using GCB font set                                               | `GLCDDrawChar( Xposition, Yposition, CharCode )`                                                                                                                                          |
| `GLCDDrawString`                        | Print characters on GLCD using GCB font set                                              | `GLCDDrawString( Xposition, Yposition, Stringvariable )`                                                                                                                                  |
| `Box`                                   | Draw a box on the GLCD to a specific size                                                | `Box ( Xposition1, Yposition1, Xposition2, Yposition2, [Optional In LineColour as 0 or 1] )`                                                                                              |
| `FilledBox`                             | Draw a box on the GLCD to a specific size that is filled with the foreground colour.     | `FilledBox (Xposition1, Yposition1, Xposition2, Yposition2, [Optional In LineColour 0 or 1] )`                                                                                            |
| `Line`                                  | Draw a line on the GLCD to a specific length that is filled with the specific attribute. | `Line ( Xposition1, Yposition1, Xposition2, Yposition2, [Optional In LineColour 0 or 1] )`                                                                                                |
| `PSet`                                  | Set a pixel on the GLCD at a specific position that is set with the specific attribute.  | `PSet(Xposition, Yposition, Pixel Colour 0 or 1)`                                                                                                                                         |
| `GLCDWriteByte`                         | Set a byte value to the controller, see the datasheet for usage.                         | `GLCDWriteByte (LCDByte)`                                                                                                                                                                 |
| `GLCDReadByte`                          | Read a byte value from the controller, see the datasheet for usage.                      | `bytevariable = GLCDReadByte`                                                                                                                                                             |
| `ST7735_[color]`                        | Specify color as a parameter for many GLCD commands                                      | Any color can be defined using a valid hexidecimal word value between 0x0000 to 0xFFFF., see <http://www.barth-dev.de/online/rgb565-color-picker/> for a wider range of color parameters. |

</div>

For a ST7735 datasheet, please refer
<a href="http://www.crystalfontz.com/controllers/ST7735_V2.1_20100505.pdf" class="link">here.</a>

For a ST7735R datasheet, please refer
<a href="https://cdn-shop.adafruit.com/datasheets/ST7735R_V0.2.pdf" class="link">here.</a>

<span class="strong">**Example:**</span>

``` screen
    ;Chip Settings
    #chip 16F1937,32
    #config MCLRE_ON

    #include <glcd.h>

    'Defines for ST7735
GLCD_TYPE GLCD_TYPE_ST7735R
    'Pin mappings for ST7735
GLCD_DC porta.0
GLCD_CS porta.1
GLCD_RESET porta.2
GLCD_DI porta.3
GLCD_DO porta.4
GLCD_SCK porta.5

    GLCDPrint(0, 0, "Test of the ST7735 Device")
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
