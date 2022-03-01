<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="pcd8544_controllers"></span>PCD8544 Controllers

</div>

</div>

</div>

This section covers GLCD devices that use the PCD844 graphics
controller.  

The PCD8544 is a low power CMOS LCD controller/driver, designed to drive
a graphic display of 48 rows and 84 columns. All necessary functions for
the display are provided in a single chip, including on-chip generation
of LCD supply and bias voltages, resulting in a minimum of external
components and low power consumption. The PCD8544 interfaces to
microcontrollers through a serial bus interface.

The Great Cow BASIC constants shown below control the configuration of
the PCD844 controller.    Great Cow BASIC supports SPI software
connectivity only - this is shown in the tables below.

The PCD8544 is a monochrome device.

The PCD844can operate in two modes. Full GLCD mode and Text/JPG mode the
full GLCD mode requires a minimum of 512 bytes. For microcontrollers
with limited memory the text only can be selected by setting the correct
constant.

To use the PCD844 driver simply include the following in your user code.
This will initialise the driver.

``` screen
    #include <glcd.h>
    #define GLCD_TYPE GLCD_TYPE_PCD8544

    ' Pin mappings for software SPI for Nokia 3310 Device
    #define GLCD_DO     portc.5              'example port setting
    #define GLCD_SCK    portc.3              'example port setting
    #define GLCD_DC     portc.2              'example port setting
    #define GLCD_CS     portc.1              'example port setting
    #define GLCD_RESET  portc.0              'example port setting
```

The Great Cow BASIC constants for the interface to the controller are
shown in the table below.

<div class="informaltable">

| <span class="strong">**Constants**</span> | <span class="strong">**Controls**</span>                                          | <span class="strong">**Options**</span> |
|:------------------------------------------|:----------------------------------------------------------------------------------|:----------------------------------------|
| `GLCD_TYPE`                               | `GLCD_TYPE_PCD8544`                                                               |                                         |
| `GLCD_DC`                                 | Specifies the output pin that is connected to Data/Command IO pin on the GLCD.    | Required                                |
| `GLCD_CS`                                 | Specifies the output pin that is connected to Chip Select (CS) on the GLCD.       | Required                                |
| `GLCD_Reset`                              | Specifies the output pin that is connected to Reset pin on the GLCD.              | Required                                |
| `GLCD_D0`                                 | Specifies the output pin that is connected to Data Out (GLCD in) pin on the GLCD. | Required                                |
| `GLCD_SCK`                                | Specifies the output pin that is connected to Clock (CLK) pin on the GLCD.        | Required                                |

</div>

The Great Cow BASIC constants for control display characteristics are
shown in the table below.

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
<td style="text-align: left;"><p><code class="literal">GLCD_TYPE_PCD8544_CHARACTER_MODE_ONLY</code></p></td>
<td style="text-align: left;"><p>Specifies that the display controller will operate in text mode and BMP draw mode only.<br />
For microcontrollers with less then 1kb of RAM this will be set be default.</p></td>
<td style="text-align: center;"><p>Optional</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">PCD8544ClockDelay</code></p></td>
<td style="text-align: left;"><p>Specifies the clock delay, if required for slower microcontroller,</p></td>
<td style="text-align: center;"><p>Optional. Set to 0 as the default value</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">PCD8544WriteDelay</code></p></td>
<td style="text-align: left;"><p>Specifies the write delay, if required for slower microcontroller,</p></td>
<td style="text-align: center;"><p>Optional. Set to 0 as the default value</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_WIDTH</code></p></td>
<td style="text-align: left;"><p>The width parameter of the GLCD</p></td>
<td style="text-align: center;"><p>160<br />
This cannot be changed</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_HEIGHT</code></p></td>
<td style="text-align: left;"><p>The height parameter of the GLCD</p></td>
<td style="text-align: center;"><p>128<br />
This cannot be changed</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCDFontWidth</code></p></td>
<td style="text-align: left;"><p>Specifies the font width of the Great Cow BASIC font set.</p></td>
<td style="text-align: center;"><p>6</p></td>
</tr>
</tbody>
</table>

</div>

The Great Cow BASIC commands supported for this GLCD are shown in the
table below.   Always review the appropiate library for the latest full
set of supported commands.

<div class="informaltable">

| <span class="strong">**Command**</span> | <span class="strong">**Purpose**</span>                                                  | <span class="strong">**Example**</span>                                                        |
|:----------------------------------------|:-----------------------------------------------------------------------------------------|:-----------------------------------------------------------------------------------------------|
| `GLCDCLS`                               | Clear screen of GLCD                                                                     | `GLCDCLS`                                                                                      |
| `GLCDPrint`                             | Print string of characters on GLCD using GCB font set                                    | `GLCDPrint( Xposition, Yposition, Stringvariable )`                                            |
| `GLCDDrawChar`                          | Print character on GLCD using GCB font set                                               | `GLCDDrawChar( Xposition, Yposition, CharCode )`                                               |
| `GLCDDrawString`                        | Print characters on GLCD using GCB font set                                              | `GLCDDrawString( Xposition, Yposition, Stringvariable )`                                       |
| `Box`                                   | Draw a box on the GLCD to a specific size                                                | `Box ( Xposition1, Yposition1, Xposition2, Yposition2, [Optional In LineColour as 0 or 1] )`   |
| `FilledBox`                             | Draw a box on the GLCD to a specific size that is filled with the foreground colour.     | `FilledBox (Xposition1, Yposition1, Xposition2, Yposition2, [Optional In LineColour 0 or 1] )` |
| `Line`                                  | Draw a line on the GLCD to a specific length that is filled with the specific attribute. | `Line ( Xposition1, Yposition1, Xposition2, Yposition2, [Optional In LineColour 0 or 1] )`     |
| `PSet`                                  | Set a pixel on the GLCD at a specific position that is set with the specific attribute.  | `PSet(Xposition, Yposition, Pixel Colour 0 or 1)`                                              |
| `GLCDWriteByte`                         | Set a byte value to the controller, see the datasheet for usage.                         | `GLCDWriteByte ( LCDByte)`                                                                     |
| `GLCDReadByte`                          | Read a byte value from the controller, see the datasheet for usage.                      | `bytevariable = GLCDReadByte`                                                                  |

</div>

\*For a PCD8544 datasheet, please refer
<a href="https://www.google.co.uk/url?sa=t&amp;rct=j&amp;q=&amp;esrc=s&amp;source=web&amp;cd=1&amp;cad=rja&amp;uact=8&amp;ved=0CCMQFjAA&amp;url=https%3A%2F%2Fwww.sparkfun.com%2Fdatasheets%2FLCD%2FMonochrome%2FNokia5110.pdf&amp;ei=bmjDVKePM83datDIgYgH&amp;usg=AFQjCNFa7N9WMhSg849oXejlfP3FRvQqpA&amp;sig2=ZFpG-ubTxvrBRAV4dRvhVw" class="link">here</a>  

This example shows how to drive a PCD8544 based Graphic LCD module with
the built in commands of Great Cow BASIC.

Example:

``` screen
      #chip 16lf1939,32
      #option Explicit
      #config MCLRE_ON

      #include <glcd.h>

      #DEFINE GLCD_TYPE GLCD_TYPE_PCD8544

      ' Pin mappings for software SPI for Nokia 3310 Device
      #define GLCD_DO portc.5
      #define GLCD_SCK portc.3
      #define GLCD_DC portc.2
      #define GLCD_CS portc.1
      #define GLCD_RESET portc.0

      Dim outString as string
      Dim ccount, byteNumber as Byte
      Dim longNumber as Long
      Dim wordNumber as Word
      GLCDCLS

      DO forever
         for CCount = 31 to 127
              GLCDPrint (0, 0, "PrintStr")
              GLCDDrawString (0, 9, "DrawStr")
              GLCDPrint ( 44 ,  21, "     ")
              GLCDPrint ( 44 ,  29, "     ") ' word value
              GLCDPrint ( 44 ,  37, "   ") ' Byte value

              outstring = hex( longNumber_U)
              GLCDPrint ( 44 , 21,outstring )
              outstring = hex( longNumber_H)
              GLCDPrint ( 55 , 21, outstring)
              outstring = hex( longNumber)
              GLCDPrint ( 67 , 21,  outstring )
              GLCDPrint ( 44 , 29, mid( str(wordNumber),1, 6))
              GLCDPrint ( 44 , 37, byteNumber)

              box 46,9,57,19
              GLCDDrawChar(48, 9, CCount )
              outString = str( CCount )
              ' draw a box to overwrite existing strings
              FilledBox(58,9,GLCD_WIDTH-1,17,GLCDBackground )
              GLCDDrawString(58, 9, outString )

               box 0,0,GLCD_WIDTH-1, GLCD_HEIGHT-1
               box GLCD_WIDTH-5, GLCD_HEIGHT-5,GLCD_WIDTH- 1, GLCD_HEIGHT-1
               filledbox 2,30,6,38, wordNumber
               Circle( 25,30,8,1)            ;center
               FilledCircle( 25,30,4,longNumber xor 1) ;center

               line 0,  GLCD_HEIGHT-1 , GLCD_WIDTH/2, (GLCD_HEIGHT /2) +1
               line  GLCD_WIDTH/2, (GLCD_HEIGHT /2) +1 ,0, (GLCD_HEIGHT /2) +1


              longNumber = longNumber + 7
              wordNumber = wordNumber + 3
              byteNumber++
          NEXT
      LOOP

      end
```

<span class="strong">**For more help, see**</span>
<a href="glcdcls" class="link" title="GLCDCLS">GLCDCLS</a>,
<a href="glcddrawchar" class="link" title="GLCDDrawChar">GLCDDrawChar</a>,
<a href="glcdprint" class="link" title="GLCDPrint">GLCDPrint</a>,
<a href="glcdreadbyte" class="link" title="GLCDReadByte">GLCDReadByte</a>,
<a href="glcdwritebyte" class="link" title="GLCDWriteByte">GLCDWriteByte</a>
or <a href="pset" class="link" title="Pset">Pset</a>

Supported in &lt;GLCD.H&gt; and &lt;glcd\_PCD8544.h&gt;

</div>
