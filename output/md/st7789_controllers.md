<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="st7789_controllers"></span>ST7789 Controllers

</div>

</div>

</div>

This section covers GLCD devices that use the ST7789 graphics
controller. The ST7789 is a TFT LCD Single Chip Driver with 240RGBx240
Resolution and 65K colors.

Great Cow BASIC supports 65K-color mode operations.

The Great Cow BASIC constants shown below control the configuration of
the ST7789 controller.    Great Cow BASIC supports SPI hardware and
software connectivity - this is shown in the tables below.

To use the ST7789 driver simply include the following in your user code.
This will initialise the driver.

``` screen
    #include <glcd.h>
    #DEFINE GLCD_TYPE GLCD_TYPE_ST7789_240_240

    'Pin mappings for ST7789 - these MUST be specified
    #define GLCD_DC     porta.0           'example port setting
    #define GLCD_RESET  porta.2           'example port setting
    #define GLCD_DO     porta.4           'example port setting
    #define GLCD_SCK    porta.5           'example port setting

    'Optional to use the following - please check the datasheet for the specific GLCD.
    #define GLCD_CS     porta.1           'example port setting
    #define GLCD_DI     porta.3           'example port setting
```

The Great Cow BASIC constants for the interface to the controller are
shown in the table below.

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;">Constants</th>
<th style="text-align: left;">Controls</th>
<th style="text-align: left;">Options</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_TYPE</code></p></td>
<td style="text-align: left;"><p><code class="literal">GLCD_TYPE_ST7789_240_240</code></p></td>
<td style="text-align: left;"> </td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_DC</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to Data/Command IO pin on the GLCD.</p></td>
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
<td style="text-align: left;"><p><code class="literal">GLCD_DI</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to Data In (GLCD out) pin on the GLCD.</p></td>
<td style="text-align: left;"><p>Optional</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_CS</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to Chip Select (CS) on the GLCD.</p></td>
<td style="text-align: left;"><p>Optional</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
</tr>
<tr class="odd">
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

The Great Cow BASIC constants for control display characteristics are
shown in the table below.

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;">Constants</th>
<th style="text-align: left;">Controls</th>
<th style="text-align: left;">Default</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_WIDTH</code></p></td>
<td style="text-align: left;"><p>The width parameter of the GLCD</p></td>
<td style="text-align: left;"><p><code class="literal">320</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_HEIGHT</code></p></td>
<td style="text-align: left;"><p>The height parameter of the GLCD</p></td>
<td style="text-align: left;"><p><code class="literal">240</code></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCDFontWidth</code></p></td>
<td style="text-align: left;"><p>Specifies the font width of the Great Cow BASIC font set.</p></td>
<td style="text-align: left;"><p><code class="literal">6</code> for GCB fonts, and <code class="literal">5</code> for OLED fonts.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_OLED_FONT</code></p></td>
<td style="text-align: left;"><p>Specifies the use of the optional OLED font set.</p>
<p>The GLCDfntDefaultsize can be set to 1 or 2 only.</p>
<p><code class="literal">GLCDfntDefaultsize=  1</code>. A small 8 height pixel font with variable width. <code class="literal">GLCDfntDefaultsize=  2</code>. A larger 10 width * 16 height pixel font.</p></td>
<td style="text-align: left;"><p>Optional</p></td>
</tr>
</tbody>
</table>

</div>

The Great Cow BASIC commands supported for this GLCD are shown in the
table below.   Always review the appropiate library for the latest full
set of supported commands.

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;">Command</th>
<th style="text-align: left;">Purpose</th>
<th style="text-align: left;">Example</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCDCLS</code></p></td>
<td style="text-align: left;"><p>Clear screen of GLCD</p></td>
<td style="text-align: left;"><p><code class="literal">GLCDCLS  [,Optional LineColour]</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCDPrint</code></p></td>
<td style="text-align: left;"><p>Print string of characters on GLCD using GCB font set</p></td>
<td style="text-align: left;"><p><code class="literal">GLCDPrint( Xposition, Yposition, Stringvariable )</code></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCDDrawChar</code></p></td>
<td style="text-align: left;"><p>Print character on GLCD using GCB font set</p></td>
<td style="text-align: left;"><p><code class="literal">GLCDDrawChar( Xposition, Yposition, CharCode [,Optional LineColour] )</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCDDrawString</code></p></td>
<td style="text-align: left;"><p>Print characters on GLCD using GCB font set</p></td>
<td style="text-align: left;"><p><code class="literal">GLCDDrawString( Xposition, Yposition, Stringvariable [,Optional LineColour] )</code></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">Box</code></p></td>
<td style="text-align: left;"><p>Draw a box on the GLCD to a specific size</p></td>
<td style="text-align: left;"><p><code class="literal">Box ( Xposition1, Yposition1, Xposition2, Yposition2 [,Optional LineColour]</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">FilledBox</code></p></td>
<td style="text-align: left;"><p>Draw a box on the GLCD to a specific size that is filled with the foreground colour.</p></td>
<td style="text-align: left;"><p><code class="literal">FilledBox (Xposition1, Yposition1, Xposition2, Yposition2 [,Optional LineColour] )</code></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">Line</code></p></td>
<td style="text-align: left;"><p>Draw a line on the GLCD to a specific length that is filled with the specific attribute.</p></td>
<td style="text-align: left;"><p><code class="literal">Line ( Xposition1, Yposition1, Xposition2, Yposition2 [,Optional LineColour] )</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">PSet</code></p></td>
<td style="text-align: left;"><p>Set a pixel on the GLCD at a specific position that is set with the specific attribute.</p></td>
<td style="text-align: left;"><p><code class="literal">PSet(Xposition, Yposition, Pixel Colour)</code></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCDWriteByte</code></p></td>
<td style="text-align: left;"><p>Set a byte value to the controller, see the datasheet for usage.</p></td>
<td style="text-align: left;"><p><code class="literal">GLCDWriteByte ( LCDByte)</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCDReadByte</code></p></td>
<td style="text-align: left;"><p>Read a byte value from the controller, see the datasheet for usage.</p></td>
<td style="text-align: left;"><p><code class="literal">bytevariable = GLCDReadByte</code></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCDRotate</code></p></td>
<td style="text-align: left;"><p>Rotate the display</p></td>
<td style="text-align: left;"><p><code class="literal">LANDSCAPE</code>, <code class="literal">PORTRAIT_REV</code>, <code class="literal">LANDSCAPE_REV</code> and <code class="literal">PORTRAIT</code> are supported</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">ST7789_[color]</code></p></td>
<td style="text-align: left;"><p>Specify color as a parameter for many GLCD commands</p></td>
<td style="text-align: left;"><p>Color constants for this device are shown in the list below.<br />
</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">ReadPixel</code></p></td>
<td style="text-align: left;"><p>Read the pixel color at the specified XY coordination. Returns long variable with Red, Green and Blue encoded in the lower 24 bits.</p></td>
<td style="text-align: left;"><p>ReadPixel( Xosition , Yposition ) or ReadPixel_ST7789( Xosition , Yposition )</p>
<p>Any color can be defined using a valid hexidecimal word value between 0x0000 to 0xFFFF.</p></td>
</tr>
</tbody>
</table>

</div>

``` screen
    TFT_BLACK       0x0000
    TFT_NAVY        0x000F
    TFT_DARKGREEN   0x03E0
    TFT_DARKCYAN    0x03EF
    TFT_MAROON      0x7800
    TFT_PURPLE      0x780F
    TFT_OLIVE       0x7BE0
    TFT_LIGHTGREY   0xC618
    TFT_DARKGREY    0x7BEF
    TFT_BLUE        0x001F
    TFT_GREEN       0x07E0
    TFT_CYAN        0x07FF
    TFT_RED         0xF800
    TFT_MAGENTA     0xF81F
    TFT_YELLOW      0xFFE0
    TFT_WHITE       0xFFFF
    TFT_ORANGE      0xFD20
    TFT_GREENYELLOW 0xAFE5
    TFT_PINK        0xF81F
```

This example shows how to drive a ST7789 based Graphic LCD module with
the built in commands of Great Cow BASIC.

<span class="strong">**Example \#1**</span>

``` screen
    #chip 16F15376
    #option Explicit

        #startup InitPPS, 85

        Sub InitPPS
            #ifdef ST7789_HardwareSPI

                'This #ifdef is added to enable easy change from hardware SPI (using PPS) to software PPS that just uses the port assignments shown below.

                SSP1CLKPPS = 0x1    //RC3->MSSP1:SCK1
                RC3PPS = 0x15       //RC3->MSSP1:SCK1
                RC5PPS = 0x16       //RC5->MSSP1:SDO1
                SSP1DATPPS = 0x14   //RC4->MSSP1:SDI1

            #endif
        End Sub

    ' ********************** Setup the GLCD ************************************************

        #INCLUDE <glcd.h>
        #define GLCD_TYPE     GLCD__TYPE_ST7789_240_240


        'This is a PPS chip, so, need to make the DO/SDO & SCK match the PPS assignments
        #DEFINE GLCD_DO     portC.5
        #DEFINE GLCD_SCK    portC.3

        'Additinal pin assignments for GLCD
        #DEFINE GLCD_DC     portA.4
        #DEFINE GLCD_RESET  portA.1
        'It is optional on the ST7789 to set the GLCD_CS... therefore, here but commented out
        '#DEFINE GLCD_CS     porte.0

        'Uncomment out the next line... enable or disable the PPS!!!
        #DEFINE ST7789_HardwareSPI    ' remove/comment out if you want to use software SPI.0

    ' ********************** DEMO REALLY STARTS HERE ************************************************
    GLCDPrint(0, 0, "Test of the ST7789 Device")
    end
```

  

<span class="strong">**Example \#2**</span> This example shows how to
drive a ILI3941 with the OLED fonts. Note the use of the
`GLCDfntDefaultSize` to select the size of the OLED font in use.  

``` screen
    #define GLCD_OLED_FONT                'The constant is required to support OLED fonts

    GLCDfntDefaultSize = 2
    GLCDFontWidth = 5
    GLCDPrint ( 40, 0, "OLED" )
    GLCDPrint ( 0, 18, "Typ:  ST7789" )
    GLCDPrint ( 0, 34, "Size: 240 x 240" )

    GLCDfntDefaultSize = 1
    GLCDPrint(20, 56,"https://goo.gl/gjrxkp")
```

  

<span class="strong">**Example \#2**</span> This example shows how to
disable the large OLED Fontset. This disables the font to reduce memory
usage.

When the extended OLED fontset is disabled every character will be shown
as a block character.  

``` screen
    #define GLCD_OLED_FONT                'The constant is required to support OLED fonts
    #define GLCD_Disable_OLED_FONT2       'The constant to disable the extended OLED fontset.

    GLCDfntDefaultSize = 2
    GLCDFontWidth = 5
    GLCDPrint ( 40, 0, "OLED" )
    GLCDPrint ( 0, 18, "Typ:  ST7789" )
    GLCDPrint ( 0, 34, "Size: 240 x 240" )

    GLCDfntDefaultSize = 1
    GLCDPrint(20, 56,"https://goo.gl/gjrxkp")
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
