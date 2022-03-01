<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="hx8347g_controllers"></span>HX8347G Controllers

</div>

</div>

</div>

This section covers GLCD devices that use the HX8347G graphics
controller.

HX8347G is a 262k-color single-chip SoC driver for a-TFT liquid crystal
display with resolution of 240 RGB x 320  dots.

The HX8347-G is designed to provide a single-chip solution that combines
a gate driver, a source driver, power supply circuit for 262k colors to
drive a TFT panel with 240RGBx320 dots at maximum.

Great Cow BASIC supports 65K-color mode operations.

The HX8347-G can be operated in low-voltage (1.4V) condition for the
interface and integrated internal boosters that produce the liquid
crystal voltage, breeder resistance and the voltage follower circuit for
liquid crystal driver. In addition, The HX8347-G also supports various
functions to reduce the power consumption of a LCD system via software
control.

The Great Cow BASIC constants shown below control the configuration of
the HX8347G controller.    The Great Cow BASIC constants for control and
data line connections are shown in the table below.

Connectivity is via an 8-bit bus. Where 8 pins are connected between the
microcontroller and the GLCD to control the data bus plus 5 control
pins. This is simple when using an Arduino GLCD Shield.

To use the HX8347G driver simply include the following in your user
code. This will initialise the driver.

  
  
<span class="strong">**8-bit mode**</span>

``` screen
    'This GLCD driver supports 8 bit only. UNO ports can be replaced with porta.b constants.

    #include <glcd.h>
    #include <UNO_mega328p.h >
    #define GLCD_TYPE GLCD_TYPE_HX8347

    'Pin mappings for SPI - this GLCD driver supports Hardware SPI and Software SPI
    #define GLCD_RD       ANALOG_0          ' read command line
    #define GLCD_WR       ANALOG_1          ' write command line
    #define GLCD_RS       ANALOG_2          ' Command/Data line
    #define GLCD_CS       ANALOG_3          ' Chip select line
    #define GLCD_RST      ANALOG_4          ' Reset line

    #define GLCD_DB0       DIGITAL_8
    #define GLCD_DB1       DIGITAL_9
    #define GLCD_DB2       DIGITAL_2
    #define GLCD_DB3       DIGITAL_3
    #define GLCD_DB4       DIGITAL_4
    #define GLCD_DB5       DIGITAL_5
    #define GLCD_DB6       DIGITAL_6
    #define GLCD_DB7       DIGITAL_7
```

  
  

The Great Cow BASIC constants for the interface to the controller are
shown in the table below.  
  

<div class="informaltable">

| Constants     | Controls                                                                            | Options  |
|:--------------|:------------------------------------------------------------------------------------|:---------|
| `GLCD_TYPE`   | `GLCD_TYPE_HX8347`                                                                  |          |
| `GLCD_DB0..7` | Specifies the pin that is connected to DB0..7 IO pin on the GLCD (8 bit DBI).       | Required |
| `GLCD_RST`    | Specifies the output pin that is connected to Reset IO pin on the GLCD.             | Required |
| `GLCD_CS`     | Specifies the output pin that is connected to Chip Select (CS) on the GLCD.         | Required |
| `GLCD_RS`     | Specifies the output pin that is connected to Data/Command pin on the GLCD.         | Required |
| `GLCD_WR`     | Specifies the output pin that is connected to Data In (RW or WDR) pin on the GLCD.  | Required |
| `GLCD_RD`     | Specifies the output pin that is connected to Data Out (RD or RDR) pin on the GLCD. | Required |

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
<td style="text-align: left;"><p><code class="literal">480</code></p></td>
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
<td style="text-align: left;"><p><code class="literal">FilledBox (Xposition1, Yposition1, Xposition2, Yposition2  [,Optional LineColour] )</code></p></td>
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
<td style="text-align: left;"><p><code class="literal">HX8347G_[color]</code></p></td>
<td style="text-align: left;"><p>Specify color as a parameter for many GLCD commands</p></td>
<td style="text-align: left;"><p>Color constants for this device are shown in the list below.<br />
</p>
<p>Any color can be defined using a valid hexidecimal word value between 0x0000 to 0xFFFF.</p></td>
</tr>
</tbody>
</table>

</div>

  
  

``` screen
    HX8347G_BLACK   'hexidecimal value 0x0000
    HX8347G_RED     'hexidecimal value 0xF800
    HX8347G_GREEN   'hexidecimal value 0x0400
    HX8347G_BLUE    'hexidecimal value 0x001F
    HX8347G_WHITE   'hexidecimal value 0xFFFF
    HX8347G_PURPLE  'hexidecimal value 0xF11F
    HX8347G_YELLOW  'hexidecimal value 0xFFE0
    HX8347G_CYAN    'hexidecimal value 0x07FF
    HX8347G_D_GRAY  'hexidecimal value 0x528A
    HX8347G_L_GRAY  'hexidecimal value 0x7997
    HX8347G_SILVER  'hexidecimal value 0xC618
    HX8347G_MAROON  'hexidecimal value 0x8000
    HX8347G_OLIVE   'hexidecimal value 0x8400
    HX8347G_LIME    'hexidecimal value 0x07E0
    HX8347G_AQUA    'hexidecimal value 0x07FF
    HX8347G_TEAL    'hexidecimal value 0x0410
    HX8347G_NAVY    'hexidecimal value 0x0010
    HX8347G_FUCHSIA 'hexidecimal value 0xF81F
```

  
  

These examples show how to drive a HX8347G based Graphic LCD module with
the built in commands of Great Cow BASIC. The 8 bit DBI example uses a
UNO shield, this can easily adapted to Microchip architecture. The 16
bit DBI example uses a Mega2560 board.

  
  
<span class="strong">**Example:**</span>

``` screen
    #chip mega328p, 16
    #option explicit


    #include <glcd.h>
    #include <UNO_mega328p.h >

    #define GLCD_TYPE GLCD_TYPE_HX8347
    #define GLCD_OLED_FONT

    'Pin mappings for SPI - this GLCD driver supports Hardware SPI and Software SPI
    #define GLCD_RD       ANALOG_0          ' read command line
    #define GLCD_WR       ANALOG_1          ' write command line
    #define GLCD_RS       ANALOG_2          ' Command/Data line
    #define GLCD_CS       ANALOG_3          ' Chip select line
    #define GLCD_RST      ANALOG_4          ' Reset line



    #define GLCD_DB0       DIGITAL_8
    #define GLCD_DB1       DIGITAL_9
    #define GLCD_DB2       DIGITAL_2
    #define GLCD_DB3       DIGITAL_3
    #define GLCD_DB4       DIGITAL_4
    #define GLCD_DB5       DIGITAL_5
    #define GLCD_DB6       DIGITAL_6
    #define GLCD_DB7       DIGITAL_7


    GLCDRotate ( Portrait )
    GLCDCLS HX8347_RED
    GLCDPrint(0, 0, "Test of the HX8347G Device")
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
