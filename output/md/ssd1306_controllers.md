<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="ssd1306_controllers"></span>SSD1306 Controllers

</div>

</div>

</div>

This section covers GLCD devices that use the SSD1306 graphics
controller.

The SSD1306 is a single-chip CMOS OLED/PLED driver with controller for
organic / polymer light emitting diode dot-matrix graphic display
system. It consists of 128 segments and 64 commons. This IC is designed
for Common Cathode type OLED panel.

The SSD1306 embeds with contrast control, display RAM and oscillator,
which reduces the number of external components and power consumption.
It has 256-step brightness control. Data/Commands are sent from general
MCU through the hardware selectable 6800/8000 series compatible Parallel
Interface, I2C interface or Serial Peripheral Interface. It is suitable
for many compact portable applications, such as mobile phone
sub-display, MP3 player and calculator, etc.

The Great Cow BASIC constants shown below control the configuration of
the SSD1306 controller.    Great Cow BASIC supports SPI and I2C hardware
& software connectivity - this is shown in the tables below.

To use the SSD1306 driver simply include the following in your user
code. This will initialise the driver.

The SSD1306 library supports 128 \* 64 pixels or 128 \* 32 pixels. The
default is 128 \* 64 pixels.

The SSD1306 is a monochrome device.

The SSD1306 can operate in three modes. Full GLCD mode, Low Memory GLCD
mode or Text/JPG mode the full GLCD mode requires a minimum of 1k bytes
or 512 bytes for the 128x64 and the 128x32 devices respectively in Full
GLCD mode. For microcontrollers with limited memory the third mode of
operation - Text mode. These can be selected by setting the correct
constant.

To use the SSD1306 drivers simply include one of the following
configuration. You can select Full Mode GLCD, Low Memory Mode GLCD or
Text mode these require 1024, 128 or 0 byte GLCD buffer respectively -
you microcontroller requires sufficient RAM to support the selected mode
of GLCD operation.

``` screen
    'An I2C configuration
    #include <glcd.h>

    ; ----- Define GLCD Hardware settings
    #define GLCD_TYPE GLCD_TYPE_SSD1306
    #define GLCD_I2C_Address 0x78
    '#define GLCD_TYPE_SH1106_LOWMEMORY_GLCD_MODE       'select Low Memory mode of operation
    '#define GLCD_TYPE_SH1106_CHARACTER_MODE_ONLY       'select Text mode of operation


    ; ----- Define Hardware settings
    ' Define I2C settings
    #define HI2C_BAUD_RATE 400
    #define HI2C_DATA
    HI2CMode Master
```

or,

``` screen
    'An SPI configuration'
    #include <glcd.h>

    ; ----- Define GLCD Hardware settings
    #define GLCD_TYPE GLCD_TYPE_SSD1306

    ; ----- Define Hardware settings
    #define S4Wire_DATA

    #define MOSI_SSD1306 PortB.1
    #define SCK_SSD1306  PortB.2
    #define DC_SSD1306   PortB.3
    #define CS_SSD1306   PortB.4
    #define RES_SSD1306  PortB.5
```

The Great Cow BASIC constants for control display characteristics are
shown in the table below.

<div class="informaltable">

| <span class="strong">**Constants**</span> | <span class="strong">**Controls**</span> | <span class="strong">**Options**</span> |
|:------------------------------------------|:-----------------------------------------|:----------------------------------------|
| `GLCD_TYPE`                               | `GLCD_TYPE_SSD1306`                      | Required                                |
| `GLCD_I2C_Address`                        | I2C address of the GLCD.                 | Required                                |

</div>

The Great Cow BASIC constants for SPI/S4Wire control display
characteristics are shown in the table below.

<div class="informaltable">

| <span class="strong">**Constants**</span> | <span class="strong">**Controls**</span>                | <span class="strong">**Options**</span>                                            |
|:------------------------------------------|:--------------------------------------------------------|:-----------------------------------------------------------------------------------|
| `GLCD_TYPE`                               | `GLCD_TYPE_SSD1306`                                     | Required to support 128 \* 64 pixels. Mutualy exclusive to GLCD\_TYPE\_SSD1306\_32 |
| `GLCD_TYPE`                               | `GLCD_TYPE_SSD1306_32`                                  | Required to support 128 \* 32 pixels. Mutualy exclusive to GLCD\_TYPE\_SSD1306     |
| `S4Wire_Data`                             | 4 wire SPI Mode                                         | Required                                                                           |
| `MOSI_SSD1306`                            | Specifies output pin connected to serial data in D1 pin | Must be defined                                                                    |
| `SCK_SSD1306`                             | Specifies output pin connected to serial clock D0 pin   | Must be defined                                                                    |
| `DC_SSD1306`                              | Specifies output pin connected to data control DC pin   | Must be defined                                                                    |
| `CS_SSD1306`                              | Specifies output pin connected to chip select CS pin    | Must be defined                                                                    |
| `RES_SSD1306`                             | Specifies output pin connected to reset RES pin         | Must be defined                                                                    |

</div>

The Great Cow BASIC constants for control display characteristics are
shown in the table below.

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;"><span class="strong"><strong>Constants</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Controls</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Default</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_WIDTH</code></p></td>
<td style="text-align: left;"><p>The width parameter of the GLCD</p></td>
<td style="text-align: left;"><p><code class="literal">128</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_HEIGHT</code></p></td>
<td style="text-align: left;"><p>The height parameter of the GLCD</p></td>
<td style="text-align: left;"><p><code class="literal">64</code> or <code class="literal">32</code></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_PROTECTOVERRUN</code></p></td>
<td style="text-align: left;"><p>Define this constant to restrict pixel operations with the pixel limits</p></td>
<td style="text-align: left;"><p>Not defined</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_TYPE_SSD1306_CHARACTER_MODE_ONLY</code></p></td>
<td style="text-align: left;"><p>Specifies that the display controller will operate in text mode and BMP draw mode only.<br />
For microcontrollers with low RAM this will be set be default.<br />
When selected ONLY text related commands are suppored. For grapical commands you must have sufficient memory to use Full GLCD mode or use <code class="literal">GLCD_TYPE_SSD1306_LOWMEMORY_GLCD_MODE</code></p></td>
<td style="text-align: left;"><p>Optional</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_TYPE_SSD1306_LOWMEMORY_GLCD_MODE</code></p></td>
<td style="text-align: left;"><p>Specifies that the display controller will operate in Low Memory mode.</p></td>
<td style="text-align: left;"><p>Optional</p></td>
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

The Great Cow BASIC variables for control display characteristics are
shown in the table below. These variables control the user definable
parameters of a specific GLCD.

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;"><span class="strong"><strong>Variable</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Purpose</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Type</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCDBackground</code></p></td>
<td style="text-align: left;"><p>GLCD background state.</p></td>
<td style="text-align: left;"><p>A monochrome value.<br />
For mono GLCDs the default is White or 0x0001.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCDForeground</code></p></td>
<td style="text-align: left;"><p>Color of GLCD foreground.</p></td>
<td style="text-align: left;"><p>A monochrome value.<br />
For mono GLCDs the default is non-white or 0x0000.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCDFontWidth</code></p></td>
<td style="text-align: left;"><p>Width of the current GLCD font.</p></td>
<td style="text-align: left;"><p>Default is 6 pixels.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCDfntDefault</code></p></td>
<td style="text-align: left;"><p>Size of the current GLCD font.</p></td>
<td style="text-align: left;"><p>Default is 0.</p>
<p>This equates to the standard GCB font set.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCDfntDefaultsize</code></p></td>
<td style="text-align: left;"><p>Size of the current GLCD font.</p></td>
<td style="text-align: left;"><p>Default is 1.</p>
<p>This equates to the 8 pixel high.</p></td>
</tr>
</tbody>
</table>

</div>

The Great Cow BASIC commands supported for this GLCD are shown in the
table below.

<div class="informaltable">

| <span class="strong">**Command**</span> | <span class="strong">**Purpose**</span>                                                                              | <span class="strong">**Example**</span>                                                        |
|:----------------------------------------|:---------------------------------------------------------------------------------------------------------------------|:-----------------------------------------------------------------------------------------------|
| `GLCDCLS`                               | Clear screen of GLCD                                                                                                 | `GLCDCLS`                                                                                      |
| `GLCDPrint`                             | Print string of characters on GLCD using GCB font set                                                                | `GLCDPrint( Xposition, Yposition, Stringvariable )`                                            |
| `GLCDDrawChar`                          | Print character on GLCD using GCB font set                                                                           | `GLCDDrawChar( Xposition, Yposition, CharCode )`                                               |
| `GLCDDrawString`                        | Print characters on GLCD using GCB font set                                                                          | `GLCDDrawString( Xposition, Yposition, Stringvariable )`                                       |
| `Box`                                   | Draw a box on the GLCD to a specific size                                                                            | `Box ( Xposition1, Yposition1, Xposition2, Yposition2, [Optional In LineColour as 0 or 1] )`   |
| `FilledBox`                             | Draw a box on the GLCD to a specific size that is filled with the foreground colour.                                 | `FilledBox (Xposition1, Yposition1, Xposition2, Yposition2, [Optional In LineColour 0 or 1] )` |
| `Line`                                  | Draw a line on the GLCD to a specific length that is filled with the specific attribute.                             | `Line ( Xposition1, Yposition1, Xposition2, Yposition2, [Optional In LineColour 0 or 1] )`     |
| `PSet`                                  | Set a pixel on the GLCD at a specific position that is set with the specific attribute.                              | `PSet(Xposition, Yposition, Pixel Colour 0 or 1)`                                              |
| `GLCDWriteByte`                         | Set a byte value to the controller, see the datasheet for usage.                                                     | `GLCDWriteByte (LCDByte)`                                                                      |
| `GLCDReadByte`                          | Read a byte value from the controller, see the datasheet for usage.                                                  | `bytevariable = GLCDReadByte`                                                                  |
| `GLCD_Open_PageTransaction`             | Commence a series of GLCD commands when in low memory mode. Must be followed a `GLCD_Close_PageTransaction` command. | `GLCD_Close_PageTransaction 0, 7` where 0 and 7 are the range of pages to be updated           |
| `GLCD_Close_PageTransaction`            | Commence a series of GLCD commands when in low memory mode. Must follow a `GLCD_Open_PageTransaction` command.       |                                                                                                |

</div>

The Great Cow BASIC specific commands for this GLCD are shown in the
table below.

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;">Command</th>
<th style="text-align: left;">Purpose</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">Stopscroll_SSD1306</code></p></td>
<td style="text-align: left;"><p>Stops all scrolling</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">Startscrollright_SSD1306 ( start , stop [,scrollspeed] )</code></p></td>
<td style="text-align: left;"><p>Activate a right handed scroll for rows start through stop Hint, the display is 16 rows tall. To scroll the whole display, execute:<br />
<code class="literal">startscrollright_SSD1306(0x00, 0x0F)</code><br />
Parameters are <code class="literal">Start row</code>, <code class="literal">End row</code>, optionally <code class="literal">Scrollspeed</code></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">Startscrollleft_SSD1306 ( start , stop [,scrollspeed] )</code></p></td>
<td style="text-align: left;"><p>Activate a left handed scroll for rows start through stop Hint, the display is 16 rows tall. To scroll the whole display, execute:<br />
<code class="literal">startscrollleft_SSD1306(0x00, 0x0F)</code><br />
Parameters are <code class="literal">Start row</code>, <code class="literal">End row</code>, optionally <code class="literal">Scrollspeed</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">Startscrolldiagright_SSD1306 ( start , stop [,scrollspeed] )</code></p></td>
<td style="text-align: left;"><p>Activate a diagright handed scroll for rows start through stop Hint, the display is 16 rows tall. To scroll the whole display, execute:<br />
<code class="literal">startscrolldiagright_SSD1306(0x00, 0x0F)</code><br />
Parameters are <code class="literal">Start row</code>, <code class="literal">End row</code>, optionally <code class="literal">Scrollspeed</code></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">Startscrolldiagleft_SSD1306 ( start , stop [,scrollspeed] )</code></p></td>
<td style="text-align: left;"><p>Activate a diagleft handed scroll for rows start through stop Hint, the display is 16 rows tall. To scroll the whole display, execute:<br />
<code class="literal">startscrolldiagleft_SSD1306(0x00, 0x0F)</code><br />
Parameters are <code class="literal">Start row</code>,<code class="literal">End row</code>, optionally <code class="literal">Scrollspeed</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCDSetContrast ( dim_state )</code></p></td>
<td style="text-align: left;"><p>Sets the constrast between 0 and 255. The contrast increases as the value increases.<br />
Parameter is dim value</p></td>
</tr>
</tbody>
</table>

</div>

For a SSD1306 datasheet, please refer
<a href="http://gcbasic.sourceforge.net/library/DISPLAY/SSD1306.pdf" class="link">here</a>.

This example shows how to drive a SSD1306 based Graphic I2C LCD module
with the built in commands of Great Cow BASIC using Full Mode GLCD

``` screen
    #chip mega328p,16
    #include <glcd.h>

    ; ----- Define Hardware settings
    ' Define I2C settings
    #define HI2C_BAUD_RATE 400
    #define HI2C_DATA
    HI2CMode Master

    ; ----- Define GLCD Hardware settings
    #define GLCD_TYPE GLCD_TYPE_SSD1306  'for 128 * 64 pixels support
    #define GLCD_I2C_Address 0x78

    dim outString as string * 21

    GLCDCLS
    GLCDPrint 0, 0, "Great Cow BASIC"
    GLCDPrint (0, 16, "Anobium 2021")

    wait 3 s
    GLCDCLS

    ' Prepare the static components of the screen
    GLCDPrint ( 0,   0, "PrintStr") ; Print some text
    GLCDPrint ( 64,  0, "@")
    ; Print some more text
    GLCDPrint ( 72,  0, ChipMhz) ; Print chip speed
    GLCDPrint ( 86, 0, "Mhz") ; Print some text
    GLCDDrawString( 0,8,"DrawStr") ; Draw some text
    box 0,0,GLCD_WIDTH-1, GLCD_HEIGHT-1 ; Draw a box
    box GLCD_WIDTH-5, GLCD_HEIGHT-5,GLCD_WIDTH-1, GLCD_HEIGHT-1 ; Draw a box
    Circle( 44,41,15) ; Draw a circle
    line 64,31,0,31 ; Draw a line

    DO forever
       for CCount = 31 to 127
            GLCDPrint ( 64 ,  36,  hex(longNumber_E ) ) ; Print a HEX string
            GLCDPrint ( 76 ,  36,  hex(longNumber_U ) ) ; Print a HEX string
            GLCDPrint ( 88 ,  36,  hex(longNumber_H ) ) ; Print a HEX string
            GLCDPrint ( 100 ,  36, hex(longNumber   ) ) ; Print a HEX string
            GLCDPrint ( 112 ,  36, "h" ) ; Print a HEX string

            GLCDPrint ( 64 ,  44, pad(str(wordNumber), 5 ) ) ; Print a padded string
            GLCDPrint ( 64 ,  52, pad(str(byteNumber), 3 ) ) ; Print a padded string

            box (46,9,56,19) ; Draw a Box
            GLCDDrawChar(48, 9, CCount ) ; Draw a character
            outString = str( CCount ) ; Prepare a string
            GLCDDrawString(64, 9, pad(outString,3) ) ; Draw a string

            filledbox 3,43,11,51, wordNumber ; Draw a filled box

            FilledCircle( 44,41,9, longNumber xor 1) ; Draw a filled box
            line 0,63,64,31 ; Draw a line

            ; Do some simple maths
            longNumber = longNumber + 7 : wordNumber = wordNumber + 3 : byteNumber++
        NEXT
    LOOP
    end
```

  
  
This example shows how to drive a SSD1306 based Graphic I2C LCD module
with the built in commands of Great Cow BASIC using Low Memory Mode
GLCD.  
Note the use of `GLCD_Open_PageTransaction` and
`GLCD_Close_PageTransaction` to support the Low Memory Mode of operation
and the contraining of all GLCD commands with the transaction commands.
The use Low Memory Mode GLCD the two defines
`GLCD_TYPE_SSD1306_LOWMEMORY_GLCD_MODE` and
`GLCD_TYPE_SSD1306_CHARACTER_MODE_ONLY` are included in the user
program.  

``` screen
    #chip mega328p,16
    #include <glcd.h>

    ; ----- Define Hardware settings
    ' Define I2C settings
    #define HI2C_BAUD_RATE 400
    #define HI2C_DATA
    HI2CMode Master

    ; ----- Define GLCD Hardware settings
    #define GLCD_TYPE GLCD_TYPE_SSD1306  'for 128 * 64 pixels support
    #define GLCD_I2C_Address 0x78
    #define GLCD_TYPE_SSD1306_LOWMEMORY_GLCD_MODE
    #define GLCD_TYPE_SSD1306_CHARACTER_MODE_ONLY

    dim outString as string * 21

    GLCDCLS

    'To clarify - page udpates
    '0,7 correspond with the Text Lines from 0 to 7 on a 64 Pixel Display
    'In this example Code would be GLCD_Open_PageTransaction 0,1 been enough
    'But it is allowed to use GLCD_Open_PageTransaction 0,7 to show the full screen update
    GLCD_Open_PageTransaction 0,7
       GLCDPrint 0, 0, "Great Cow BASIC"
       GLCDPrint (0, 16, "Anobium 2021")
    GLCD_Close_PageTransaction
    wait 3 s
    DO forever

      for CCount = 31 to 127

        outString = str( CCount ) ; Prepare a string

        GLCD_Open_PageTransaction 0,7

           ' Prepare the static components of the screen
           GLCDPrint ( 0,   0, "PrintStr") ; Print some text
           GLCDPrint ( 64,  0, "@")
           ; Print some more text
           GLCDPrint ( 72,  0, ChipMhz) ; Print chip speed
           GLCDPrint ( 86, 0, "Mhz") ; Print some text
           GLCDDrawString( 0,8,"DrawStr") ; Draw some text
           box 0,0,GLCD_WIDTH-1, GLCD_HEIGHT-1 ; Draw a box
           box GLCD_WIDTH-5, GLCD_HEIGHT-5,GLCD_WIDTH-1, GLCD_HEIGHT-1 ; Draw a box
           Circle( 44,41,15) ; Draw a circle
           line 64,31,0,31 ; Draw a line

           GLCDPrint ( 64 ,  36,  hex(longNumber_E ) ) ; Print a HEX string
           GLCDPrint ( 76 ,  36,  hex(longNumber_U ) ) ; Print a HEX string
           GLCDPrint ( 88 ,  36,  hex(longNumber_H ) ) ; Print a HEX string
           GLCDPrint ( 100 ,  36, hex(longNumber   ) ) ; Print a HEX string
           GLCDPrint ( 112 ,  36, "h" ) ; Print a HEX string

           GLCDPrint ( 64 ,  44, pad(str(wordNumber), 5 ) ) ; Print a padded string
           GLCDPrint ( 64 ,  52, pad(str(byteNumber), 3 ) ) ; Print a padded string

           box (46,8,56,19) ; Draw a Box
           GLCDDrawChar(48, 9, CCount ) ; Draw a character

           GLCDDrawString(64, 9, pad(outString,3) ) ; Draw a string

           filledbox 3,43,11,51, wordNumber ; Draw a filled box

           FilledCircle( 44,41,9, longNumber xor 1) ; Draw a filled box
           line 0,63,64,31 ; Draw a line

        GLCD_Close_PageTransaction

        ; Do some simple maths
        longNumber = longNumber + 7 : wordNumber = wordNumber + 3 : byteNumber++
       NEXT
    LOOP
    end
```

  
This example shows how to drive a SSD1306 based Graphic SPI LCD module
with the built in commands of Great Cow BASIC.  

``` screen
    'Chip model
    #chip mega328p, 16
    #include <glcd.h>

    'Defines for a 7 pin SPI module
    'RES pin is pulsed low in glcd_SSD1306.h for proper startup
    #define MOSI_SSD1306 PortB.1
    #define SCK_SSD1306 PortB.2
    #define DC_SSD1306 PortB.3
    #define CS_SSD1306 PortB.4
    #define RES_SSD1306 PortB.5
    ; ----- Define GLCD Hardware settings
    #define GLCD_TYPE GLCD_TYPE_SSD1306   'for 128 * 64 pixels support
    #define S4Wire_DATA

    dim longnumber as Long
    longnumber = 123456
    dim wordnumber as word
    wordnumber = 62535
    dim bytenumber as Byte
    bytenumber =255

    #define led PortB.0
    dir led out


    Do
         SET led ON
         wait 1 s
         SET led OFF

        GLCDCLS
        GLCDPrint (30, 0, "Hello World!")
        Circle (18,24,10)
        FilledCircle (48,24,10)
        Box (70,14,90,34)
        FilledBox (106,14,126,34)
        GLCDDrawString (32,35,"Draw String")
        GLCDPrint (0,46,longnumber)
        GLCDPrint (94,46,wordnumber)
        GLCDPrint (52,55,bytenumber)
        Line (0,40,127,63)
        Line (0,63,127,40)
        wait 3 s

    Loop
```

  
This example shows how to drive a SSD1306 based Graphic I2C LCD module
with 128 \* 32 pixel support.  

``` screen
    #chip mega328p,16
    #include <glcd.h>

    ; ----- Define Hardware settings
    ' Define I2C settings
    #define HI2C_BAUD_RATE 400
    #define HI2C_DATA
    HI2CMode Master

    ; ----- Define GLCD Hardware settings
    #define GLCD_TYPE GLCD_TYPE_SSD1306_32  'for 128 * 32 pixels support
    #define GLCD_I2C_Address 0x78

    GLCDCLS
    GLCDPrint 0, 0, "Great Cow BASIC"
    GLCDPrint (0, 16, "Anobium 2021")
```

  
This example shows how to drive a SSD1306 with the OLED fonts. Note the
use of the `GLCDfntDefaultSize` to select the size of the OLED font in
use.  

``` screen
    #define GLCD_OLED_FONT

    GLCDfntDefaultSize = 2
    GLCDFontWidth = 5
    GLCDPrint ( 40, 0, "OLED" )
    GLCDPrint ( 0, 18, "Typ:  SSD1306" )
    GLCDPrint ( 0, 34, "Size: 128x64" )

    GLCDfntDefaultSize = 1
    GLCDPrint(20, 56,"https://goo.gl/gjrxkp")
```

  
This example shows how to set the SSD1306 OLED the lowest constrast
level by using a OLED chip specific command.  

``` screen
    'Use the GCB command to set the lowest constrast
    GLCDSetContrast ( 0 )
      'Then, use the Write command to set the output between 0 and 255
      Write_Command_SSD1306(SSD1306_SETVCOMDETECT)
      Write_Command_SSD1306(15)      ' 0x40 default, to lower the contrast, put 0 for lowest and 255 for highest.


    GLCDfntDefaultSize = 2
    GLCDFontWidth = 5
    GLCDPrint ( 40, 0, "OLED" )
    GLCDPrint ( 0, 18, "Typ:  SSD1306" )
    GLCDPrint ( 0, 34, "Size: 128x64" )

    GLCDfntDefaultSize = 1
    GLCDPrint(20, 56,"https://goo.gl/gjrxkp")
```

  

This example shows how to disable the large OLED Fontset. This disables
the font to reduce memory usage.

When the large OLED fontset is disabled every character will be shown as
a block character.  

``` screen
    #define GLCD_OLED_FONT                'The constant is required to support OLED fonts
    #define GLCD_Disable_OLED_FONT2       'The constant to disable the large fontset.

    GLCDfntDefaultSize = 2
    GLCDFontWidth = 5
    GLCDPrint ( 40, 0, "OLED" )
    GLCDPrint ( 0, 18, "Typ:  SSD1306" )
    GLCDPrint ( 0, 34, "Size: 128x64" )

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
