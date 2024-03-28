<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="ili9488_controllers"></span>ILI9488 Controllers

</div>

</div>

</div>

This section covers GLCD devices that use the ILI9488 graphics
controller.

ILI9488 is a 262k-color single-chip SoC driver for a-TFT liquid crystal
display with resolution of 320 x 240 resolution, 16.7M-color and with
internal GRAM .

GCBASIC supports 65K-color mode operations.

The GCBASIC constants shown below control the configuration of the
ILI9488 controller.    The GCBASIC constants for control and data line
connections are shown in the table below. Only SPI is available for
connectivity:

To use the ILI9488 driver simply include the following in your user
code. This will initialise the driver.

  
  
<span class="strong">**SPI mode**</span>

``` screen
    'Pin mappings for SPI

    #include <glcd.h>
    #DEFINE GLCD_TYPE GLCD_TYPE_ILI9488

    #DEFINE GLCD_DC       PORTB.3           ' Data command line
    #DEFINE GLCD_CS       PORTB.5           ' Chip select line
    #DEFINE GLCD_RST      PORTB.4           ' Reset line

    #DEFINE GLCD_DI       PORTB.2          ' Data in | MISO
    #DEFINE GLCD_DO       PORTB.0          ' Data out | MOSI
    #DEFINE GLCD_SCK      PORTB.1          ' Clock Line
```

  
  

  
  
The GCBASIC constants for the interface to the controller are shown in
the table below.  
  

<div class="informaltable">

| Constants              | Controls                                                                                                                       | Options  |
|:-----------------------|:-------------------------------------------------------------------------------------------------------------------------------|:---------|
| `GLCD_TYPE`            | GLCD\_TYPE\_ILI9488                                                                                                            |          |
| `ILI9488_HARDWARESPI`  | Specifies to use the microcontrollers SPI module. For PPS microcontrollers the libary assumes PPS for SPI has been configured. | Optional |
| `HWSPIMODE MASTERFAST` | Specifies the speed of the SPI communications.                                                                                 | Optional |
| `GLCD_RST`             | Specifies the output pin that is connected to Reset IO pin on the GLCD.                                                        | Required |
| `GLCD_CS`              | Specifies the output pin that is connected to Chip Select (CS) on the GLCD.                                                    | Required |
| `GLCD_RS`              | Specifies the output pin that is connected to Data/Command pin on the GLCD.                                                    | Required |
| `GLCD_DI`              | Specifies the output pin that is connected to Data In (RW or WDR) pin on the GLCD.                                             | Required |
| `GLCD_DO`              | Specifies the output pin that is connected to Data Out (RD or RDR) pin on the GLCD.                                            | Required |
| `GLCD_SCK`             | Specifies the output pin that is connected to Clock pin on the GLCD.                                                           | Required |

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
below.  Always review the appropiate library for the latest full set of
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
<td style="text-align: left;"><p><code class="literal">GLCDRotate</code></p></td>
<td style="text-align: left;"><p>Rotate the display</p></td>
<td style="text-align: left;"><p><code class="literal">LANDSCAPE</code>, <code class="literal">PORTRAIT_REV</code>, <code class="literal">LANDSCAPE_REV</code> and <code class="literal">PORTRAIT</code> are supported</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">ILI9488__TFT_[color]</code></p></td>
<td style="text-align: left;"><p>Specify color as a parameter for many GLCD commands</p></td>
<td style="text-align: left;"><p>Color constants for this device are shown in the list below, butm you can use the generic TFT color scheme.<br />
</p>
<p>Any color can be defined using a valid hexidecimal word value between 0x0000 to 0xFFFF.</p></td>
</tr>
</tbody>
</table>

</div>

  
  

``` screen
    ILI9488_TFT_BLACK       //0x000000
    ILI9488_TFT_RED         //0xFC0000
    ILI9488_TFT_GREEN       //0x00FC00
    ILI9488_TFT_BLUE        //0x0000FC
    ILI9488_TFT_WHITE       //0xFFFFFF

    ILI9488_TFT_CYAN        //0x003F3F
    ILI9488_TFT_DARKCYAN    //0x00AFAF
    ILI9488_TFT_DARKGREEN   //0x002100
    ILI9488_TFT_DARKGREY    //0xAAAAAA
    ILI9488_TFT_GREENYELLOW //0x93FC33
    ILI9488_TFT_LIGHTGREY   //0xC9C9C9
    ILI9488_TFT_MAGENTA     //0xCC00CC
    ILI9488_TFT_MAROON      //0x7E007E
    ILI9488_TFT_NAVY        //0x00003E
    ILI9488_TFT_OLIVE       //0x783E00
    ILI9488_TFT_ORANGE      //0xFC2900
    ILI9488_TFT_PINK        //0xFC000F
    ILI9488_TFT_PURPLE      //0xF01F9E
    ILI9488_TFT_YELLOW      //0xFC7E00
```

  
  

These examples show how to drive a ILI9488 based Graphic LCD module with
the built in commands of GCBASIC.

  
  
<span class="strong">**Examples - PPS Enabled**</span>

``` screen
    #chip 18F26K83, 64
    #option Explicit

    'Generated by PIC PPS Tool for GCBASIC
    #startup InitPPS, 85
    #DEFINE PPSToolPart 18f26k83

    Sub InitPPS
        'Module: UART pin directions
        Dir PORTC.7 Out    ' Make TX1 pin an output
        'Module: UART1
        RC7PPS = 0x0013    'TX1 > RC7

        #IFDEF ILI9488_HardwareSPI
            UNLOCKPPS
            'Module: SPI1
            RB0PPS = 0x001F    'SDO1 > RB0
            RB1PPS = 0x001E    'SCK1 > RB1
            SPI1SCKPPS = 0x0009    'RB1 > SCK1 (bi-directional)
            SPI1SDIPPS = 0x000A    'RB2 > SDI1
        #ELSE
            RB0PPS = 0
            RB1PPS = 0
        #ENDIF
    End Sub
    // Template comment at the end of the config file

    #include <glcd.h>
    #DEFINE GLCD_TYPE GLCD_TYPE_ILI9488
    #DEFINE ILI9488_HARDWARESPI
    #DEFINE HWSPIMODE MASTERFAST
    #DEFINE GLCD_DC       PORTB.3           ' Data command line
    #DEFINE GLCD_CS       PORTB.5           ' Chip select line
    #DEFINE GLCD_RST      PORTB.4           ' Reset line

    #DEFINE GLCD_DI       PORTB.2          ' Data in | MISO
    #DEFINE GLCD_DO       PORTB.0          ' Data out | MOSI
    #DEFINE GLCD_SCK      PORTB.1          ' Clock Line

    '''********************************************************************************

    'main program start here

    // Set the background
    #DEFINE DEFAULT_GLCDBACKGROUND TFT_WHITE


    GLCDPrint 0, 0, "Test of the ILI9488 Device", TFT_BLACK
    end
```

  
  
  
  
<span class="strong">**Examples - Legacy non PPS
microcontroller**</span>

``` screen
    #chip 16F1939
    #option Explicit



    #include <glcd.h>
    #DEFINE GLCD_TYPE GLCD_TYPE_ILI9488
    #DEFINE GLCD_DC       PORTB.3           ' Data command line
    #DEFINE GLCD_CS       PORTB.5           ' Chip select line
    #DEFINE GLCD_RST      PORTB.4           ' Reset line

    #DEFINE GLCD_DI       PORTB.2          ' Data in | MISO
    #DEFINE GLCD_DO       PORTB.0          ' Data out | MOSI
    #DEFINE GLCD_SCK      PORTB.1          ' Clock Line

    '''********************************************************************************

    'main program start here

    // Set the background
    #DEFINE DEFAULT_GLCDBACKGROUND TFT_WHITE


    GLCDPrint 0, 0, "Test of the ILI9488 Device", TFT_BLACK
    end
```

  
  

``` screen
```

  
  

<span class="strong">**For more help, see**</span>
<a href="glcdcls" class="link" title="GLCDCLS">GLCDCLS</a>,
<a href="glcddrawchar" class="link" title="GLCDDrawChar">GLCDDrawChar</a>,
<a href="glcdprint" class="link" title="GLCDPrint">GLCDPrint</a>,
<a href="glcdreadbyte" class="link" title="GLCDReadByte">GLCDReadByte</a>,
<a href="glcdwritebyte" class="link" title="GLCDWriteByte">GLCDWriteByte</a>
or <a href="pset" class="link" title="Pset">Pset</a>  
  
Supported in &lt;GLCD.H&gt;

  
  
<span class="strong">**Developer Notes**</span>

The ILI9488 library implemented uses BRG color scheme which is different
from other GLCD libraries.

The ILI9488 library implemented also uses 18bits for color definition
where the color scheme is defined as shown below:

<div class="informalfigure">

<div class="mediaobject" align="center">

<img src="./images/ili9488.png" height="360" alt="graphic" />

</div>

</div>

The ILI9488 library implemented there has the following differences from
a typical GLCD library.

<div class="orderedlist">

1.  The colors are defined as RGB left justified 6 bits.
2.  The colors are defined as Longs ( not Words other GLCDs are Words).
3.  The color information uses a 18bit macro for SPI
    communications.  Color information is sent to the GLCD in three
    bytes.
4.  The color contraints are based on the SPI constraints specified in
    the ILI9488 datasheet.

</div>

</div>
