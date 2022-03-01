<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="ili9340_controllers"></span>ILI9340 Controllers

</div>

</div>

</div>

This section covers GLCD devices that use the ILI9340 graphics
controller. The ILI9340 is a TFT LCD Single Chip Driver with 240RGBx320
Resolution and 262K colors.

Great Cow BASIC supports 65K-color mode operations.

The Great Cow BASIC constants shown below control the configuration of
the ILI9340 controller.    Great Cow BASIC supports SPI hardware and
software connectivity - this is shown in the tables below.

To use the ILI9340 driver simply include the following in your user
code. This will initialise the driver.

``` screen
    #include <glcd.h>
    #DEFINE GLCD_TYPE GLCD_TYPE_ILI9340

    'Pin mappings for ILI9340 - these MUST be specified
    #define GLCD_DC     porta.0           'example port setting
    #define GLCD_CS     porta.1           'example port setting
    #define GLCD_RESET  porta.2           'example port setting
    #define GLCD_DI     porta.3           'example port setting
    #define GLCD_DO     porta.4           'example port setting
```

The Great Cow BASIC constants for the interface to the controller are
shown in the table below.

<div class="informaltable">

| Constants    | Controls                                                                                                                    | Options                                                          |
|:-------------|:----------------------------------------------------------------------------------------------------------------------------|:-----------------------------------------------------------------|
| `GLCD_TYPE`  | `GLCD_TYPE_ILI9340`                                                                                                         |                                                                  |
| `GLCD_DC`    | Specifies the output pin that is connected to Data/Command IO pin on the GLCD.                                              | Required                                                         |
| `GLCD_CS`    | Specifies the output pin that is connected to Chip Select (CS) on the GLCD.                                                 | Required                                                         |
| `GLCD_Reset` | Specifies the output pin that is connected to Reset pin on the GLCD.                                                        | Required                                                         |
| `GLCD_DI`    | Specifies the output pin that is connected to Data In (GLCD out) pin on the GLCD.                                           | Required                                                         |
| `GLCD_DO`    | Specifies the output pin that is connected to Data Out (GLCD in) pin on the GLCD.                                           | Required                                                         |
| `GLCD_SCK`   | Specifies the output pin that is connected to Clock (CLK) pin on the GLCD. \#define GLCD\_SCK porta.5 'example port setting | Required                                                         |
|              |                                                                                                                             |                                                                  |
| `HWSPIMode`  | User can specify the hardware SPI mode. Must be one of MasterSlow, Master, Masterfast                                       | Optional. Defaults to Masterfast when chipMhz is less than 64mhz |

</div>

The Great Cow BASIC constants for control display characteristics are
shown in the table below.

<div class="informaltable">

| Constants       | Controls                                                  | Default                   |
|:----------------|:----------------------------------------------------------|:--------------------------|
| `GLCD_WIDTH`    | The width parameter of the GLCD                           | `320`+ Cannot be changed. |
| `GLCD_HEIGHT`   | The height parameter of the GLCD                          | `240`+ Cannot be changed. |
| `GLCDFontWidth` | Specifies the font width of the Great Cow BASIC font set. | `6`                       |

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
<td style="text-align: left;"><p><code class="literal">Box ( Xposition1, Yposition1, Xposition2, Yposition2 [,Optional LineColour]]</code></p></td>
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
<td style="text-align: left;"><p><code class="literal">ILI9340_[color]</code></p></td>
<td style="text-align: left;"><p>Specify color as a parameter for many GLCD commands</p></td>
<td style="text-align: left;"><p>Color constants for this device are shown in the list below.<br />
</p>
<p>Any color can be defined using a valid hexidecimal word value between 0x0000 to 0xFFFF.</p></td>
</tr>
</tbody>
</table>

</div>

``` screen
    ILI9340_BLACK   'hexidecimal value 0x0000
    ILI9340_RED     'hexidecimal value 0xF800
    ILI9340_GREEN   'hexidecimal value 0x07E0
    ILI9340_BLUE    'hexidecimal value 0x001F
    ILI9340_WHITE   'hexidecimal value 0xFFFF
    ILI9340_PURPLE  'hexidecimal value 0xF11F
    ILI9340_YELLOW  'hexidecimal value 0xFFE0
    ILI9340_CYAN    'hexidecimal value 0x07FF
    ILI9340_D_GRAY  'hexidecimal value 0x528A
    ILI9340_L_GRAY  'hexidecimal value 0x7997
    ILI9340_SILVER  'hexidecimal value 0xC618
    ILI9340_MAROON  'hexidecimal value 0x8000
    ILI9340_OLIVE   'hexidecimal value 0x8400
    ILI9340_LIME    'hexidecimal value 0x07E0
    ILI9340_AQUA    'hexidecimal value 0x07FF
    ILI9340_TEAL    'hexidecimal value 0x0410
    ILI9340_NAVY    'hexidecimal value 0x0010
    ILI9340_FUCHSIA 'hexidecimal value 0xF81F
```

For a ILI9340 datasheet, please refer
<a href="http://gcbasic.sourceforge.net/library/DISPLAY/ILI9340.pdf" class="link">here</a>.

This example shows how to drive a ILI9340 based Graphic LCD module with
the built in commands of Great Cow BASIC.

<span class="strong">**Example:**</span>

``` screen
    ;Chip Settings
    #chip 16F1937,32
    #config MCLRE_ON     'microcontroller specific configuration

    #include <glcd.h>

    'Defines for ILI9340
    #define GLCD_TYPE GLCD_TYPE_ILI9340

    'Pin mappings for ILI9340
    #define GLCD_DC porta.0
    #define GLCD_CS porta.1
    #define GLCD_RESET porta.2
    #define GLCD_DI porta.3
    #define GLCD_DO porta.4
    #define GLCD_SCK porta.5

    GLCDPrint(0, 0, "Test of the ILI9340 Device")
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
