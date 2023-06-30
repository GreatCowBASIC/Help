<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="ili9486_l_controllers"></span>ILI9486(L) Controllers

</div>

</div>

</div>

This section covers GLCD devices that use the ILI9486(L) graphics
controller.

The ILI9486(L) is a 262kcolor single-chip SoC driver for a-Si TFT liquid
crystal display with resolution of 320RGBx480 dots, comprising a
960-channel source driver, a 480-channel gate driver, 345,600bytes GRAM
for graphic data of 320RGBx480 dots.

The GCBASIC constants shown below control the configuration of the
ILI9486(L) controller.    GCBASIC supports 1) SPI using the SPI hardware
module, 2) software SPI, 3) UNO shields and 4) an 8bit port bus - this
is detailed in the tables below.

GCBASIC supports 65K-color mode operations.

To use the ILI9486(L) driver simply include the following in your user
code. This will initialise the driver.

``` screen
    #include <glcd.h>
    #DEFINE GLCD_TYPE GLCD_TYPE_ILI9486L
```

The GCBASIC constants for the interface to the controller are shown in
the table below.

<div class="informaltable">

| Constants    | Controls                                                                          | Options  |
|:-------------|:----------------------------------------------------------------------------------|:---------|
| `GLCD_TYPE`  | `GLCD_TYPE_ILI9486L` or `GLCD_TYPE_ILI9486`                                       |          |
| `GLCD_DC`    | Specifies the output pin that is connected to Data/Command IO pin on the GLCD.    | Required |
| `GLCD_CS`    | Specifies the output pin that is connected to Chip Select (CS) on the GLCD.       | Required |
| `GLCD_Reset` | Specifies the output pin that is connected to Reset pin on the GLCD.              | Required |
| `GLCD_DI`    | Specifies the output pin that is connected to Data In (GLCD out) pin on the GLCD. | Required |
| `GLCD_DO`    | Specifies the output pin that is connected to Data Out (GLCD in) pin on the GLCD. | Required |
| `GLCD_SLK`   | Specifies the output pin that is connected to Clock (CLK) pin on the GLCD.        | Required |

</div>

The GCBASIC constants for the communicaton protocol for the controller
are shown in the table below.

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;"><code class="literal">Communications Constants</code></th>
<th style="text-align: left;">Use</th>
<th style="text-align: left;">Comments</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">ILI9486L_HardwareSPI</code></p></td>
<td style="text-align: left;"><p>Specifies that hardware SPI will be used</p></td>
<td style="text-align: left;"><p>SPI ports MUST be defined that match the SPI module for each specific microcontroller</p>
<p><span class="strong"><strong>#define ILI9486L_HardwareSPI</strong></span></p></td>
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
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">UNO_8bit_Shield</code></p></td>
<td style="text-align: left;"><p>Specifies that a UNO shield will be used</p></td>
<td style="text-align: left;"><p>The shield will use 13 ports. These ports are pre-defined by the shield. These ports must be specified.</p>
<p><span class="strong"><strong>#define UNO_8bit_Shield</strong></span></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_DataPort</code></p></td>
<td style="text-align: left;"><p>Specifies that a full 8 port will be used</p></td>
<td style="text-align: left;"><p>The microcontroller will use 13 ports. These port is defined as 8 contigous bits. These control port and the data port must be specified.</p>
<p><span class="strong"><strong>#define GLCD_DataPort portb</strong></span></p></td>
</tr>
</tbody>
</table>

</div>

The GCBASIC constants for control display characteristics are shown in
the table below.

<div class="informaltable">

| Constants       | Controls                                          | Default |
|:----------------|:--------------------------------------------------|:--------|
| `GLCD_WIDTH`    | The width parameter of the GLCD                   | `320`   |
| `GLCD_HEIGHT`   | The height parameter of the GLCD                  | `480`   |
| `GLCDFontWidth` | Specifies the font width of the GCBASIC font set. | `6`     |

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
<td style="text-align: left;"><p><code class="literal">Line ( Xposition1, Yposition1, Xposition2, Yposition2  [,Optional In LineColour] )</code></p></td>
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
<td style="text-align: left;"><p><code class="literal">ILI9486L_[color]</code></p></td>
<td style="text-align: left;"><p>Specify color as a parameter for many GLCD commands</p></td>
<td style="text-align: left;"><p>Color constants for this device are shown in the list below.<br />
</p>
<p>Any color can be defined using a valid hexidecimal word value between 0x0000 to 0xFFFF.</p></td>
</tr>
</tbody>
</table>

</div>

``` screen
    TFT_BLACK   'hexidecimal value 0x0000
    TFT_RED     'hexidecimal value 0xF800
    TFT_GREEN   'hexidecimal value 0x07E0
    TFT_BLUE    'hexidecimal value 0x001F
    TFT_WHITE   'hexidecimal value 0xFFFF
    TFT_PURPLE  'hexidecimal value 0xF11F
    TFT_YELLOW  'hexidecimal value 0xFFE0
    TFT_CYAN    'hexidecimal value 0x07FF
    TFT_D_GRAY  'hexidecimal value 0x528A
    TFT_L_GRAY  'hexidecimal value 0x7997
    TFT_SILVER  'hexidecimal value 0xC618
    TFT_MAROON  'hexidecimal value 0x8000
    TFT_OLIVE   'hexidecimal value 0x8400
    TFT_LIME    'hexidecimal value 0x07E0
    TFT_AQUA    'hexidecimal value 0x07FF
    TFT_TEAL    'hexidecimal value 0x0410
    TFT_NAVY    'hexidecimal value 0x0010
    TFT_FUCHSIA 'hexidecimal value 0xF81F
```

For a ILI9486L datasheet, please refer to Google.

This example shows how to drive a ILI9486L based Graphic LCD module with
the built in commands of GCBASIC.

<span class="strong">**Example:**</span>

``` screen
    #chip mega328p, 16
    #option explicit

    #include <glcd.h>
    #include <UNO_mega328p.h >

    #define GLCD_TYPE GLCD_TYPE_ILI9486L

    'Pin mappings for SPI - this GLCD driver supports Hardware SPI and Software SPI
    #define GLCD_DC       DIGITAL_8           ' Data command line
    #define GLCD_CS       DIGITAL_10          ' Chip select line
    #define GLCD_RST      DIGITAL_9           ' Reset line

    #define GLCD_DI       DIGITAL_13          ' Data in | MISO
    #define GLCD_DO       DIGITAL_11          ' Data out | MOSI
    #define GLCD_SCK      DIGITAL_13          ' Clock Line

    #define ILI9486L_HardwareSPI              ' Remove/comment out if you want to use software SPI.


    GLCDPrint(0, 0, "Test of the ILI9486L Device")
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
