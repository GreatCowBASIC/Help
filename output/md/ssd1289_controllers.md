<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="ssd1289_controllers"></span>SSD1289 Controllers

</div>

</div>

</div>

This section covers GLCD devices that use the SSD1289 graphics
controller. The SSD1289 is a 240 x 320 single chip controller driver IC
for 262k color (RGB) amorphous TFT LCD.

The GCBASIC constants shown below control the configuration of the
SSD1289 controller. The SSD1289 uses a 16-bit parallel data bus, not
SPI; the tables below show the required pin constants.

GCBASIC supports 65K-color mode operations.

To use the SSD1289 driver simply include the following in your user
code. This will initialise the driver.

``` programlisting
    #include <glcd.h>
    #DEFINE GLCD_TYPE GLCD_TYPE_SSD1289          ' <<< the constant that selects this controller driver
    'Pin mappings for the 16-bit parallel bus
    #define GLCD_WR     porta.0           'example port setting -- Write strobe
    #define GLCD_CS     porta.1           'example port setting -- Chip select
    #define GLCD_RS     porta.2           'example port setting -- Register select
    #define GLCD_RST    porta.3           'example port setting -- Reset
    #define GLCD_DB0    portd.0           'example port setting -- Data bus bit 0
    #define GLCD_DB1    portd.1           'example port setting -- Data bus bit 1
    #define GLCD_DB2    portd.2           'example port setting -- Data bus bit 2
    #define GLCD_DB3    portd.3           'example port setting -- Data bus bit 3
    #define GLCD_DB4    portd.4           'example port setting -- Data bus bit 4
    #define GLCD_DB5    portd.5           'example port setting -- Data bus bit 5
    #define GLCD_DB6    portd.6           'example port setting -- Data bus bit 6
    #define GLCD_DB7    portd.7           'example port setting -- Data bus bit 7
    'Data bus bits 8 through 15 must also be defined for a full 16-bit bus
```

<span class="strong">**Key line:**</span>
`#DEFINE GLCD_TYPE GLCD_TYPE_SSD1289` — tells `<glcd.h>` to compile in
the SSD1289 driver rather than any of the library’s other supported
controllers; unlike most other GCBASIC GLCD drivers, this one talks to
the panel over a 16-bit parallel data bus (`GLCD_DB0` through
`GLCD_DB15`) rather than SPI, so no clock or data-in/data-out pins are
needed.

The GCBASIC constants for the interface to the controller are shown in
the table below.

<div class="informaltable">

| Constants                      | Controls                                                                     | Default                  |
|:-------------------------------|:-----------------------------------------------------------------------------|:-------------------------|
| `GLCD_TYPE`                    | `GLCD_TYPE_SSD1289`                                                          |                          |
| `GLCD_WR`                      | Specifies the output pin that is connected to the Write strobe on the GLCD.  | Required                 |
| `GLCD_CS`                      | Specifies the output pin that is connected to Chip Select (CS) on the GLCD.  | Required                 |
| `GLCD_RS`                      | Specifies the output pin that is connected to Register Select on the GLCD.   | Required                 |
| `GLCD_RST`                     | Specifies the output pin that is connected to Reset on the GLCD.             | Required                 |
| `GLCD_DB0` through `GLCD_DB15` | Specifies the 16 output pins connected to the parallel data bus on the GLCD. | All 16 bits are required |

</div>

The GCBASIC constants for control display characteristics are shown in
the table below.

<div class="informaltable">

| Constant        | Purpose                                           | Default                         |
|:----------------|:--------------------------------------------------|:--------------------------------|
| `GLCD_WIDTH`    | The width parameter of the GLCD                   | Must be set by the user program |
| `GLCD_HEIGHT`   | The height parameter of the GLCD                  | Must be set by the user program |
| `GLCDFontWidth` | Specifies the font width of the GCBASIC font set. | 6                               |

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
<td style="text-align: left;"><p><code class="literal">Box ( Xposition1, Yposition1, Xposition2, Yposition2,  [Optional In LineColour as 0 or 1]</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">FilledBox</code></p></td>
<td style="text-align: left;"><p>Draw a box on the GLCD to a specific size that is filled with the foreground colour.</p></td>
<td style="text-align: left;"><p><code class="literal">FilledBox (Xposition1, Yposition1, Xposition2, Yposition2,  [Optional In LineColour 0 or 1] )</code></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">Line</code></p></td>
<td style="text-align: left;"><p>Draw a line on the GLCD to a specific length that is filled with the specific attribute.</p></td>
<td style="text-align: left;"><p><code class="literal">Line ( Xposition1, Yposition1, Xposition2, Yposition2,  [Optional In LineColour 0 or 1] )</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">PSet</code></p></td>
<td style="text-align: left;"><p>Set a pixel on the GLCD at a specific position that is set with the specific attribute.</p></td>
<td style="text-align: left;"><p><code class="literal">PSet(Xposition, Yposition, Pixel Colour 0 or 1)</code></p></td>
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
<td style="text-align: left;"><p><code class="literal">SSD1289_[color]</code></p></td>
<td style="text-align: left;"><p>Specify color as a parameter for many GLCD commands</p></td>
<td style="text-align: left;"><p>Color constants for this device are shown in the list below.<br />
</p>
<p>Any color can be defined using a valid hexidecimal word value between 0x0000 to 0xFFFF.</p></td>
</tr>
</tbody>
</table>

</div>

The library predefines the named colors below as 16-bit RGB565 values (5
bits red, 6 bits green, 5 bits blue). Pass any of these constants, or
your own custom 0x0000-0xFFFF value, as the colour parameter to
`GLCDCLS`, `Box`, `FilledBox`, `Line`, `GLCDDrawChar`, or
`GLCDDrawString`.

``` programlisting
      SSD1289_BLACK   'hexidecimal value 0x0000
      SSD1289_RED     'hexidecimal value 0xF800
      SSD1289_GREEN   'hexidecimal value 0x07E0
      SSD1289_BLUE    'hexidecimal value 0x001F
      SSD1289_WHITE   'hexidecimal value 0xFFFF
      SSD1289_PURPLE  'hexidecimal value 0xF11F
      SSD1289_YELLOW  'hexidecimal value 0xFFE0
      SSD1289_CYAN    'hexidecimal value 0x07FF
      SSD1289_D_GRAY  'hexidecimal value 0x528A
      SSD1289_L_GRAY  'hexidecimal value 0x7997
      SSD1289_SILVER  'hexidecimal value 0xC618
      SSD1289_MAROON  'hexidecimal value 0x8000
      SSD1289_OLIVE   'hexidecimal value 0x8400
      SSD1289_LIME    'hexidecimal value 0x07E0
      SSD1289_AQUA    'hexidecimal value 0x07FF
      SSD1289_TEAL    'hexidecimal value 0x0410
      SSD1289_NAVY    'hexidecimal value 0x0010
      SSD1289_FUCHSIA 'hexidecimal value 0xF81F
```

For a SSD1289 datasheet, please refer
<a href="http://gcbasic.sourceforge.net/library/DISPLAY/SDD1289.pdf" class="link">here</a>.  

This example shows how to drive an SSD1289 based Graphic LCD module with
the built in commands of GCBASIC.  

<span class="strong">**Example:**</span>

``` programlisting
    ;Chip Settings
    #chip 16F1937,32
    #config MCLRE_ON

    #include <glcd.h>

    'Defines for SSD1289
    #define GLCD_TYPE GLCD_TYPE_SSD1289
    #define GLCD_WIDTH 240
    #define GLCD_HEIGHT 320

    'Pin mappings for the 16-bit parallel bus
    #define GLCD_WR porta.0
    #define GLCD_CS porta.1
    #define GLCD_RS porta.2
    #define GLCD_RST porta.3
    #define GLCD_DB0 portd.0
    #define GLCD_DB1 portd.1
    #define GLCD_DB2 portd.2
    #define GLCD_DB3 portd.3
    #define GLCD_DB4 portd.4
    #define GLCD_DB5 portd.5
    #define GLCD_DB6 portd.6
    #define GLCD_DB7 portd.7

    GLCDPrint(0, 0, "Test of the SSD1289 Device")          ' <<< the GLCDPrint instruction
    end
```

<span class="strong">**Key line:**</span>
`GLCDPrint(0, 0, "Test of the SSD1289 Device")` — once the 16-bit
parallel bus is fully wired and `GLCD_WIDTH`/`GLCD_HEIGHT` are set for
the 240x320 panel, drawing commands like `GLCDPrint` behave the same as
on any other GCBASIC-supported GLCD.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="glcdcls" class="link" title="GLCDCLS">GLCDCLS</a> — clearing
    the display
-   <a href="glcddrawchar" class="link" title="GLCDDrawChar">GLCDDrawChar</a> — drawing
    a single character
-   <a href="glcdprint" class="link" title="GLCDPrint">GLCDPrint</a> — printing
    a value at a specific location, as used above
-   <a href="glcdreadbyte" class="link" title="GLCDReadByte">GLCDReadByte</a>
    /
    <a href="glcdwritebyte" class="link" title="GLCDWriteByte">GLCDWriteByte</a> — low-level
    byte access, for expert use
-   <a href="pset" class="link" title="Pset">Pset</a> — setting a
    single pixel

</div>

Supported in &lt;GLCD.H&gt;

</div>
