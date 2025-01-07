<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="_ili9481_controllers"></span>ILI9481 Controllers

</div>

</div>

</div>

This section covers GLCD devices that use the ILI9481 graphics
controller.

ILI9481 is a 262k-color single-chip SoC driver for a-TFT liquid crystal
display with resolution of 320 RGB x 480  dots, comprising a 960-channel
source driver, a 480-channel gate driver, 345,600 bytes GRAM for graphic
data.

GCBASIC supports 65K-color mode operations.

The GCBASIC constants shown below control the configuration of the
ILI9481controller.    The GCBASIC constants for control and data line
connections are shown in the table below. Two options are available for
connectivity:

1\) The 8-bit mode where 8 pins are connected between the
microcontroller and the GLCD to control the data bus.

2\) The 16-bit mode where two data ports (8 pins each) are connected
between the microcontroller and the GLCD to control the data bus.

To use the ILI9481 driver simply include the following in your user
code. This will initialise the driver.

  
  
<span class="strong">**8-bit mode**</span>

``` screen
    'Pin mappings for Data Bus Interface (DBI)
    'this GLCD driver supports 8 bit and 16 bit parallel data lines

    '8 bit DBI
    #include <glcd.h>
    #DEFINE GLCD_TYPE GLCD_TYPE_ILI9481

    '8 bit control and parallel data lines (UNO Board)
    #define GLCD_RD       ANALOG_0          ' read command line
    #define GLCD_WR       ANALOG_1          ' write command line
    #define GLCD_RS       ANALOG_2          ' Command/Data line
    #define GLCD_CS       ANALOG_3          ' Chip select line
    #define GLCD_RST      ANALOG_4          ' Reset line

    #define GLCD_DB0       DIGITAL_8        'Data port'
    #define GLCD_DB1       DIGITAL_9        'Data port'
    #define GLCD_DB2       DIGITAL_2        'Data port'
    #define GLCD_DB3       DIGITAL_3        'Data port'
    #define GLCD_DB4       DIGITAL_4        'Data port'
    #define GLCD_DB5       DIGITAL_5        'Data port'
    #define GLCD_DB6       DIGITAL_6        'Data port'
    #define GLCD_DB7       DIGITAL_7        'Data port'
```

  
  

<span class="strong">**16-bit mode**</span>

``` screen
    '16 bit DBI
    #include <glcd.h>
    #define GLCD_TYPE GLCD_TYPE_ILI9481
    #define GLCD_ILI9481_16bit

    '16 bit control and dual data port lines (Mega2560 Board)
    #define ILI9481_GLCD_CS PortG.1    'Chip Select line
    #define ILI9481_GLCD_RS PortD.7    'DC data command line
    #define ILI9481_GLCD_WR PortG.2    'Write command line
    #define ILI9481_GLCD_RST PortG.0    'Reset line

    #define ILI9481_DataPortH PortA    'DB[15:8]
    #define ILI9481_DataPortL PortC    'DB[7:0]
```

  
  
The GCBASIC constants for the interface to the controller are shown in
the table below.  
  

<div class="informaltable">

| Constants            | Controls                                                                            | Options  |
|:---------------------|:------------------------------------------------------------------------------------|:---------|
| `GLCD_TYPE`          | `GLCD_TYPE_ILI9481`                                                                 |          |
| `GLCD_ILI9481_16bit` | Specifies 16 bit DBI mode                                                           |          |
| `GLCD_DB0..7`        | Specifies the pin that is connected to DB0..7 IO pin on the GLCD (8 bit DBI).       | Required |
| `ILI9481_DataPortH`  | Specifies the port DB\[15:8\] pins on the GLCD (16 bit DBI).                        | Required |
| `ILI9481_DataPortL`  | Specifies the port DB\[7:0\] pins on the GLCD (16 bit DBI).                         | Required |
| `GLCD_RST`           | Specifies the output pin that is connected to Reset IO pin on the GLCD.             | Required |
| `GLCD_CS`            | Specifies the output pin that is connected to Chip Select (CS) on the GLCD.         | Required |
| `GLCD_RS`            | Specifies the output pin that is connected to Data/Command pin on the GLCD.         | Required |
| `GLCD_WR`            | Specifies the output pin that is connected to Data In (RW or WDR) pin on the GLCD.  | Required |
| `GLCD_RD`            | Specifies the output pin that is connected to Data Out (RD or RDR) pin on the GLCD. | Required |

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
<td style="text-align: left;"><p><code class="literal">ILI9481_[color]</code></p></td>
<td style="text-align: left;"><p>Specify color as a parameter for many GLCD commands</p></td>
<td style="text-align: left;"><p>Color constants for this device are shown in the list below.<br />
</p>
<p>Any color can be defined using a valid hexidecimal word value between 0x0000 to 0xFFFF.</p></td>
</tr>
</tbody>
</table>

</div>

  
  

``` screen
    ILI9481_BLACK   'hexidecimal value 0x0000
    ILI9481_RED     'hexidecimal value 0xF800
    ILI9481_GREEN   'hexidecimal value 0x0400
    ILI9481_BLUE    'hexidecimal value 0x001F
    ILI9481_WHITE   'hexidecimal value 0xFFFF
    ILI9481_PURPLE  'hexidecimal value 0xF11F
    ILI9481_YELLOW  'hexidecimal value 0xFFE0
    ILI9481_CYAN    'hexidecimal value 0x07FF
    ILI9481_D_GRAY  'hexidecimal value 0x528A
    ILI9481_L_GRAY  'hexidecimal value 0x7997
    ILI9481_SILVER  'hexidecimal value 0xC618
    ILI9481_MAROON  'hexidecimal value 0x8000
    ILI9481_OLIVE   'hexidecimal value 0x8400
    ILI9481_LIME    'hexidecimal value 0x07E0
    ILI9481_AQUA    'hexidecimal value 0x07FF
    ILI9481_TEAL    'hexidecimal value 0x0410
    ILI9481_NAVY    'hexidecimal value 0x0010
    ILI9481_FUCHSIA 'hexidecimal value 0xF81F
```

  
  

These examples show how to drive a ILI9481 based Graphic LCD module with
the built in commands of GCBASIC. The 8 bit DBI example uses a UNO
shield, this can easily adapted to Microchip architecture. The 16 bit
DBI example uses a Mega2560 board.

  
  
<span class="strong">**Examples:**</span>

``` screen
    '8 bit DBI
    #include <glcd.h>
    #include <UNO_mega328p.h >

    #define GLCD_TYPE GLCD_TYPE_ILI9481

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

    GLCDPrint(0, 0, "Test of the ILI9481 Device")
    end
```

  
  
  
  

``` screen
    '16 bit DBI
    #chip mega2560, 16
    #include <glcd.h>

    #define GLCD_TYPE GLCD_TYPE_ILI9481
    #define GLCD_ILI9481_16bit

    #define ILI9481_GLCD_CS PortG.1
    #define ILI9481_GLCD_RS PortD.7
    #define ILI9481_GLCD_WR PortG.2
    #define ILI9481_GLCD_RST PortG.0
    #define ILI9481_DataPortH PortA
    #define ILI9481_DataPortL PortC

    #define ILI9481_YELLOW1   0xFFC1
    #define ILI9481_BlueViolet  0x895C

    GLCDCLS_ILI9481 ILI9481_Black
    wait 1 s
    GLCDCLS_ILI9481 ILI9481_White
    wait 1 s

    GLCDfntDefaultsize = 3
    GLCDBackground = ILI9481_BlueViolet
    GLCDForeground = ILI9481_Yellow1
    GLCDCLS
    wait 1 s

    Start:

    'demonstrate screen rotation
    GLCDRotate (Portrait)
    GLCDCLS
    GLCDDrawString ( ILI9481_GLCD_WIDTH/2 - 24, ILI9481_GLCD_HEIGHT/2 - 62, "GCB")
    GLCDDrawString ( ILI9481_GLCD_WIDTH/2 - 120, ILI9481_GLCD_HEIGHT/2 - 24, "ILI9481 Driver")
    wait 5 s

    GLCDRotate (Landscape)
    GLCDCLS
    GLCDDrawString ( ILI9481_GLCD_WIDTH/2 - 24, ILI9481_GLCD_HEIGHT/2 - 62, "GCB")
    GLCDDrawString ( ILI9481_GLCD_WIDTH/2 - 120, ILI9481_GLCD_HEIGHT/2 -24, "ILI9481 Driver")
    wait 5 s

    GLCDRotate (Portrait_REV)
    GLCDCLS
    GLCDDrawString ( ILI9481_GLCD_WIDTH/2 - 24, ILI9481_GLCD_HEIGHT/2 - 62, "GCB")
    GLCDDrawString ( ILI9481_GLCD_WIDTH/2 - 120, ILI9481_GLCD_HEIGHT/2 - 24, "ILI9481 Driver")
    wait 5 s

    GLCDRotate (Landscape_REV)
    GLCDCLS
    GLCDDrawString ( ILI9481_GLCD_WIDTH/2 - 24, ILI9481_GLCD_HEIGHT/2 - 62, "GCB")
    GLCDDrawString ( ILI9481_GLCD_WIDTH/2 - 120, ILI9481_GLCD_HEIGHT/2 - 24, "ILI9481 Driver")
    wait 5 s

    goto Start
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
