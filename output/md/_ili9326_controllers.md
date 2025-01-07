<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="_ili9326_controllers"></span>ILI9326 Controllers

</div>

</div>

</div>

This section covers GLCD devices that use the ILI9326 graphics
controller. The ILI9326 is a TFT LCD Single Chip Driver with 400RGBx320
Resolution and 262K colors.

GCBASIC supports 65K-color mode operations.

The GCBASIC constants shown below control the configuration of the
ILI9326 controller.    GCBASIC supports 8 bit bus connectivity - this is
shown in the tables below.

To use the ILI9326 driver simply include the following in your user
code. This will initialise the driver.

``` screen
    #include <glcd.h>
    #DEFINE GLCD_TYPE GLCD_TYPE_ILI9326

    'Pin mappings for ILI9326 - these MUST be specified
    #define GLCD_RD       porta.3        ' read command line
    #define GLCD_WR       porta.2         ' write command line
    #define GLCD_RS       porta.1         ' Command/Data line
    #define GLCD_CS       porta.0         ' Chip select line
    #define GLCD_RST      porta.5         ' Reset line
    #define GLCD_DataPort portD
```

The GCBASIC constants for the interface to the controller are shown in
the table below.

<div class="informaltable">

| Constants       | Controls                                                                    | Options  |
|:----------------|:----------------------------------------------------------------------------|:---------|
| `GLCD_TYPE`     | `GLCD_TYPE_ILI9326`                                                         |          |
| `GLCD_RD`       | Specifies the output pin that is connected to RD IO pin on the GLCD.        | Required |
| `GLCD_WR`       | Specifies the output pin that is connected to WR on the GLCD.               | Required |
| `GLCD_RS`       | Specifies the output pin that is connected to RS pin on the GLCD.           | Required |
| `GLCD_CS`       | Specifies the output pin that is connected to CS pin on the GLCD.           | Required |
| `GLCD_RST`      | Specifies the output pin that is connected to RST pin on the GLCD.          | Required |
| `GLCD_DataPort` | Specifies the output port that is connected to DB0 to DB7 pins on the GLCD. | Required |

</div>

The GCBASIC constants for control display characteristics are shown in
the table below.

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
<td style="text-align: left;"><p>Specifies the font width of the GCBASIC font set.</p></td>
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

The GCBASIC commands supported for this GLCD are shown in the table
below.   Always review the appropiate library for the latest full set of
supported commands.

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
<td style="text-align: left;"><p><code class="literal">ILI9326_[color]</code></p></td>
<td style="text-align: left;"><p>Specify color as a parameter for many GLCD commands</p></td>
<td style="text-align: left;"><p>Color constants for this device are shown in the list below.<br />
</p></td>
</tr>
</tbody>
</table>

</div>

``` screen
    ILI9326_BLACK   'hexidecimal value 0x0000
    ILI9326_RED     'hexidecimal value 0xF800
    ILI9326_GREEN   'hexidecimal value 0x07E0
    ILI9326_BLUE    'hexidecimal value 0x001F
    ILI9326_WHITE   'hexidecimal value 0xFFFF
    ILI9326_PURPLE  'hexidecimal value 0xF11F
    ILI9326_YELLOW  'hexidecimal value 0xFFE0
    ILI9326_CYAN    'hexidecimal value 0x07FF
    ILI9326_D_GRAY  'hexidecimal value 0x528A
    ILI9326_L_GRAY  'hexidecimal value 0x7997
    ILI9326_SILVER  'hexidecimal value 0xC618
    ILI9326_MAROON  'hexidecimal value 0x8000
    ILI9326_OLIVE   'hexidecimal value 0x8400
    ILI9326_LIME    'hexidecimal value 0x07E0
    ILI9326_AQUA    'hexidecimal value 0x07FF
    ILI9326_TEAL    'hexidecimal value 0x0410
    ILI9326_NAVY    'hexidecimal value 0x0010
    ILI9326_FUCHSIA 'hexidecimal value 0xF81F
```

For a ILI9326 datasheet, please refer to Google.

This example shows how to drive a ILI9326 based Graphic LCD module with
the built in commands of GCBASIC.

<span class="strong">**Example \#1**</span>

``` screen
    ;Chip Settings
    #chip 16F1789,32

    #config MCLRE=on
    #option explicit
    #include <glcd.h>
    #define GLCD_TYPE GLCD_TYPE_ILI9326

    #define GLCD_RD       porta.3        ' read command line
    #define GLCD_WR       porta.2         ' write command line
    #define GLCD_RS       porta.1         ' Command/Data line
    #define GLCD_CS       porta.0         ' Chip select line
    #define GLCD_RST      porta.5         ' Reset line
    #define GLCD_DataPort portD

    GLCDPrint(0, 0, "Test of the ILI9326 Device")
    end
```

  

<span class="strong">**Example \#2**</span> This example shows how to
drive a ILI3941 with the OLED fonts. Note the use of the
`GLCDfntDefaultSize` to select the size of the OLED font in use.  

``` screen
  'Chip Settings
    #chip 16F1789,32

    #config MCLRE=on
    #option explicit
    #include <glcd.h>
    #define GLCD_TYPE GLCD_TYPE_ILI9326

    #define GLCD_RD       porta.3        ' read command line
    #define GLCD_WR       porta.2         ' write command line
    #define GLCD_RS       porta.1         ' Command/Data line
    #define GLCD_CS       porta.0         ' Chip select line
    #define GLCD_RST      porta.5         ' Reset line
    #define GLCD_DataPort portD

    #define GLCD_OLED_FONT                'The constant is required to support OLED fonts

    GLCDfntDefaultSize = 2
    GLCDFontWidth = 5
    GLCDPrint ( 40, 0, "OLED" )
    GLCDPrint ( 0, 18, "Typ:  ILI9326" )
    GLCDPrint ( 0, 34, "Size: 400 x 240" )

    GLCDfntDefaultSize = 1
    GLCDPrint(20, 56,"https://goo.gl/gjrxkp")
```

  

<span class="strong">**For more help, see**</span>
<a href="_glcdcls.html" class="link" title="GLCDCLS">GLCDCLS</a>,
<a href="_glcddrawchar.html" class="link" title="GLCDDrawChar">GLCDDrawChar</a>,
<a href="_glcdprint.html" class="link" title="GLCDPrint">GLCDPrint</a>,
<a href="_glcdreadbyte.html" class="link" title="GLCDReadByte">GLCDReadByte</a>,
<a href="_glcdwritebyte.html" class="link" title="GLCDWriteByte">GLCDWriteByte</a>
or <a href="_pset.html" class="link" title="Pset">Pset</a>

Supported in &lt;GLCD.H&gt;

</div>
