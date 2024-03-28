<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="st7567_controllers"></span>ST7567 Controllers

</div>

</div>

</div>

This section covers GLCD devices that use the ST7567 graphics
controller.

The ST7567 is a single-chip CMOS LCD driver with controller for organic
/ polymer light emitting diode dot-matrix graphic display system. It
consists of 128 segments and 64 commons. This IC is designed for Common
Cathode type LCD panel.

ST7567 is a single-chip dot matrix LCD driver which incorporates LCD
controller and common/segment drivers. A ST7567 can be connected
directly to a microprocessor with I2C or 4-line serial interface
(SPI-4). Display data sent from microprocessor is stored in the internal
Display Data RAM (DDRAM) of 65x132 bits. The display data bits which are
stored in DDRAM are directly related to the pixels of LCD panel. The
ST7567 contains 132 segment-outputs, 64 common-outputs and 1
icon-common-output, however the address pixels are 128 \* 64. The ST7567
has built-in oscillation circuit and low power consumption power
circuit, ST7567 generates LCD driving signal without external clock or
power, so that it is possible to make a display system with the fewest
components and minimal power consumption.

There are different types of ST75xx GLCDs.   The table below shows the
different types and the GCBASIC support.

<div class="informaltable">

| Index | GLCD MPU | Interfaces                         | Datasheet Ref    | Support           |
|:------|:---------|:-----------------------------------|:-----------------|:------------------|
| 1     | ST7565   | Parallel 8080&6080                 | Ver 1.0a;Page 12 | Not supported     |
| 2     | ST7565S  | Parallel 8080&6080                 | Ver 0.6b;Page 23 | Not supported     |
| 3     | ST7567   | 4 Pin SPI;Parallel 8080&6080       | Ver1.4b;Page 12  | 3&4 Pin SPI       |
| 4     | ST7567S  | 3&4 Pin SPI;I2C;Parallel 8080&6080 | Ver1.4;Page 17   | 3&4 Pin SPI & I2C |
| 5     | ST7576   | 3&4 Pin SPI;I2C;Parallel 8080&6080 | Ver1;Page 18     | 3&4 Pin SPI & I2C |

</div>

The ST7567 embeds with contrast control, display RAM and it is suitable
for many compact portable applications, such as mobile phone
sub-display, MP3 player and calculator, etc.

The GCBASIC constants shown below control the configuration of the
ST7567 controller.    GCBASIC supports SPI and I2C software connectivity
- this is shown in the tables below.

The ST7567 library supports 128 \* 64 pixels.

The ST7567 is a monochrome device. The library supports difference bias
settings for the different types of LCD. See the constant `ST7567_BIAS`
for the options.

The ST7567 can operate in three modes. Full GLCD mode, Low Memory GLCD
mode or Text/JPG mode the full GLCD mode requires a minimum of 1k bytes
or 512 bytes for the 128x64 respectively in Full GLCD mode. For
microcontrollers with limited memory the third mode of operation - Text
mode. These can be selected by setting the correct constant.

To use the ST7567 drivers simply include one of the following
configuration. You can select Full Mode GLCD, Low Memory Mode GLCD or
Text mode these require 1024, 128 or 0 bytes GLCD buffer respectively -
you microcontroller requires sufficient RAM to support the selected mode
of GLCD operation.

To use the ST7567 driver simply include the following in your user code.
This will initialise the driver.

``` screen
    'An I2C configuration
    #include <glcd.h>

    ; ----- Define GLCD Hardware settings
    #define GLCD_TYPE GLCD_TYPE_ST7567
    #define GLCD_I2C_Address 0x7E
    #define ST7567_BIAS     ST7567_SET_BIAS_7    ' ST7567_SET_BIAS_7 or ST7567_SET_BIAS_9


    ; ----- Define software IC2 settings
    #DEFINE I2C_MODE MASTER
    #DEFINE I2C_DATA PORTB.4
    #DEFINE I2C_CLOCK PORTB.6
    #DEFINE I2C_DISABLE_INTERRUPTS ON
```

or,

``` screen
    'An SPI configuration'
    #include <glcd.h>

    ; ----- Define GLCD Hardware settings
    #define GLCD_TYPE GLCD_TYPE_ST7567

    ; ----- Define Hardware settings
    #define S4Wire_DATA

    #define MOSI_ST7567 PortB.1
    #define SCK_ST7567  PortB.2
    #define DC_ST7567   PortB.3
    #define CS_ST7567   PortB.4
    #define RES_ST7567  PortB.5
```

The GCBASIC constants for control display characteristics are shown in
the table below.

<div class="informaltable">

| <span class="strong">**Constants**</span> | <span class="strong">**Controls**</span> | <span class="strong">**Options**</span> |
|:------------------------------------------|:-----------------------------------------|:----------------------------------------|
| `GLCD_TYPE`                               | `GLCD_TYPE_ST7567`                       | Required                                |
| `GLCD_I2C_Address`                        | I2C address of the GLCD.                 | Required defaults to 0x7E               |

</div>

The GCBASIC constants for SPI/S4Wire control display characteristics are
shown in the table below.

<div class="informaltable">

| <span class="strong">**Constants**</span> | <span class="strong">**Controls**</span>                                                           | <span class="strong">**Options**</span>                                                   |
|:------------------------------------------|:---------------------------------------------------------------------------------------------------|:------------------------------------------------------------------------------------------|
| `GLCD_TYPE`                               | `GLCD_TYPE_ST7567`                                                                                 | Required to support 128 \* 64 pixels. Mutualy exclusive to GLCD\_TYPE\_ST7567\_32         |
| `ST7567_BIAS`                             | Bias ratio of the voltage required to driving the LCD at a fixes duty of 1/65 ( see the datasheet) | Defaults to `ST7567_SET_BIAS_7`. Can be either `ST7567_SET_BIAS_7` or `ST7567_SET_BIAS_9` |
| `S4Wire_Data`                             | 4 wire SPI Mode                                                                                    | Required                                                                                  |
| `MOSI_ST7567`                             | Specifies output pin connected to serial data in D1 pin                                            | Must be defined                                                                           |
| `SCK_ST7567`                              | Specifies output pin connected to serial clock D0 pin                                              | Must be defined                                                                           |
| `DC_ST7567`                               | Specifies output pin connected to data control DC pin                                              | Must be defined                                                                           |
| `CS_ST7567`                               | Specifies output pin connected to chip select CS pin                                               | Must be defined                                                                           |
| `RES_ST7567`                              | Specifies output pin connected to reset RES pin                                                    | Must be defined                                                                           |

</div>

The GCBASIC constants for control display characteristics are shown in
the table below.

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
<td style="text-align: left;"><p><code class="literal">64</code></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_PROTECTOVERRUN</code></p></td>
<td style="text-align: left;"><p>Define this constant to restrict pixel operations with the pixel limits</p></td>
<td style="text-align: left;"><p>Not defined</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_TYPE_ST7567_CHARACTER_MODE_ONLY</code></p></td>
<td style="text-align: left;"><p>Specifies that the display controller will operate in text mode and BMP draw mode only.<br />
For microcontrollers with low RAM this will be set be default.<br />
When selected ONLY text related commands are suppored. For grapical commands you must have sufficient memory to use Full GLCD mode or use <code class="literal">GLCD_TYPE_ST7567_LOWMEMORY_GLCD_MODE</code></p></td>
<td style="text-align: left;"><p>Optional</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_TYPE_ST7567_LOWMEMORY_GLCD_MODE</code></p></td>
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

The GCBASIC variables for control display characteristics are shown in
the table below. These variables control the user definable parameters
of a specific GLCD.

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

The GCBASIC commands supported for this GLCD are shown in the table
below.

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

The GCBASIC specific commands for this GLCD are shown in the table
below.

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
<td style="text-align: left;"><p><code class="literal">GLCDSetContrast ( dim_state )</code></p></td>
<td style="text-align: left;"><p>Sets the constrast between 0 and 255. The contrast increases as the value increases.<br />
Parameter is dim value</p></td>
</tr>
</tbody>
</table>

</div>

This example shows how to drive a ST7567 based Graphic I2C LCD module
with the built in commands of GCBASIC using Full Mode GLCD

``` screen
    #CHIP 18F26Q71
    #OPTION Explicit

    #startup InitPPS, 85
        #define PPSToolPart 18F26Q71

        Sub InitPPS
            // Ensure PPS is NOT set for Software I2C
            UNLOCKPPS
            RB6PPS = 0
            RB4PPS = 0
        End Sub
        'Template comment at the end of the config file


    '' -------------------PORTA----------------
    '' Bit#:  -7---6---5---4---3---2---1---0---
    '' IO:   ----------------------------------
    ''-----------------------------------------
    ''

    '' -------------------PORTB----------------
    '' Bit#:  -7---6---5---4---3---2---1---0---
    '' IO:    ----SCL-----SDA------------------
    ''-----------------------------------------
    ''

    '' ------------------PORTC-----------------
    '' Bit#:  -7---6---5---4---3---2---1---0---
    '' IO:    ---------------------------------
    ''-----------------------------------------

    ' Define Software I2C settings
        #DEFINE I2C_MODE MASTER
        #DEFINE I2C_DATA PORTB.4
        #DEFINE I2C_CLOCK PORTB.6
        #DEFINE I2C_DISABLE_INTERRUPTS ON

    '*****************************************************************************************************
    'Main program commences here.. everything before this is setup for the chip.

        Dim DeviceID As Byte
        Dim DISPLAYNEWLINE As Byte

        #include <glcd.h>
        #DEFINE GLCD_TYPE GLCD_TYPE_ST7567
        #DEFINE GLCDDIRECTION INVERTED

    ; ----- Define variables
        Dim BYTENUMBER, CCOUNT as Byte

        CCount = 0
        dim longNumber as long
        longNumber = 123456 ' max value = 4294967290
        dim wordNumber as Word
        dim outstring as string
        wordNumber = 0
        byteNumber = 0

    ; ----- Main program

        GLCDPrint 0, 0,   "GCBASIC"
        GLCDPrint (0, 16, "Anobium 2024")
        GLCDPrint (0, 32, "Portability Demo")
        GLCDPrint (0, 48, ChipNameStr )

        wait 3 s
        GLCDCLS

        ' Prepare the static components of the screen
        GLCDPrint ( 2,   2, "PrintStr")                                   ; Print some text
        GLCDPrint ( 64,  2, "@")                                          ; Print some more text
        GLCDPrint ( 72,  2, ChipMhz)                                      ; Print chip speed
        GLCDPrint ( 86, 2, "Mhz")                                         ; Print some text
        GLCDDrawString( 2,10,"DrawStr")                                    ; Draw some text
        box 0,0,GLCD_WIDTH-1, GLCD_HEIGHT-1                               ; Draw a box
        box GLCD_WIDTH-5, GLCD_HEIGHT-5,GLCD_WIDTH-1, GLCD_HEIGHT-1       ; Draw a box
        Circle( 44,41,15)                                                 ; Draw a circle
        line 64,31,0,31                                                   ; Draw a line

        DO forever

            for CCount = 32 to 127

                GLCDPrint ( 64 ,  36,  hex(longNumber_E ) )                 ; Print a HEX string
                GLCDPrint ( 76 ,  36,  hex(longNumber_U ) )                 ; Print a HEX string
                GLCDPrint ( 88 ,  36,  hex(longNumber_H ) )                 ; Print a HEX string
                GLCDPrint ( 100 ,  36, hex(longNumber   ) )                 ; Print a HEX string
                GLCDPrint ( 112 ,  36, "h" )                                ; Print a HEX string


                GLCDPrint ( 64 ,  44, pad(str(wordNumber), 5 ) )           ; Print a padded string
                GLCDPrint ( 64 ,  52, pad(str(byteNumber), 3 ) )           ; Print a padded string


                box (46,9,56,19)                                           ; Draw a Box
                GLCDDrawChar(48, 10, CCount )                               ; Draw a character
                outString = str( CCount )                                  ; Prepare a string
                GLCDDrawString(64, 10, pad(outString,3) )                   ; Draw a string

                filledbox 3,43,11,51, wordNumber                           ; Draw a filled box

                FilledCircle( 44,41,9, longNumber xor 1)                   ; Draw a filled box
                line 0,63,64,31                                            ; Draw a line

                                                                            ; Do some simple maths
                longNumber = longNumber + 7 : wordNumber = wordNumber + 3 : byteNumber++
            NEXT
        LOOP
        end
```

  
  
This example shows how to drive a ST7567 based Graphic I2C LCD module
with the built in commands of GCBASIC using Low Memory Mode GLCD.  
Note the use of `GLCD_Open_PageTransaction` and
`GLCD_Close_PageTransaction` to support the Low Memory Mode of operation
and the contraining of all GLCD commands with the transaction commands.
The use Low Memory Mode GLCD the two defines
`GLCD_TYPE_ST7567_LOWMEMORY_GLCD_MODE` and
`GLCD_TYPE_ST7567_CHARACTER_MODE_ONLY` are included in the user
program.  

``` screen
    #chip {any valid chip}
    #include <glcd.h>

    ; ----- Define Hardware settings
    ' Define I2C settings
    #DEFINE I2C_MODE MASTER
    #DEFINE I2C_DATA PORTB.4
    #DEFINE I2C_CLOCK PORTB.6
    #DEFINE I2C_DISABLE_INTERRUPTS ON

    ; ----- Define GLCD Hardware settings
    #define GLCD_TYPE GLCD_TYPE_ST7567  'for 128 * 64 pixels support
    #define GLCD_I2C_Address 0x7E
    #define GLCD_TYPE_ST7567_LOWMEMORY_GLCD_MODE
    #define GLCD_TYPE_ST7567_CHARACTER_MODE_ONLY

    dim outString as string * 21

    GLCDCLS

    'To clarify - page udpates
    '0,7 correspond with the Text Lines from 0 to 7 on a 64 Pixel Display
    'In this example Code would be GLCD_Open_PageTransaction 0,1 been enough
    'But it is allowed to use GLCD_Open_PageTransaction 0,7 to show the full screen update
    GLCD_Open_PageTransaction 0,7
       GLCDPrint 0, 0, "GCBASIC"
       GLCDPrint (0, 16, "Anobium 2024")
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

  
This example shows how to drive a ST7567 based Graphic SPI LCD module
with the built in commands of GCBASIC.  

``` screen
    #chip  {any valid chip}
    #include <glcd.h>

    'Defines for a 7 pin SPI module
    'RES pin is pulsed low in glcd_ST7567.h for proper startup
    #define MOSI_ST7567 PortB.1
    #define SCK_ST7567 PortB.2
    #define DC_ST7567 PortB.3
    #define CS_ST7567 PortB.4
    #define RES_ST7567 PortB.5
    ; ----- Define GLCD Hardware settings
    #define GLCD_TYPE GLCD_TYPE_ST7567   'for 128 * 64 pixels support
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

  
This example shows how to drive a ST7567 with the OLED fonts. Note the
use of the `GLCDfntDefaultSize` to select the size of the OLED font in
use.  

``` screen
    #define GLCD_OLED_FONT

    GLCDfntDefaultSize = 2
    GLCDFontWidth = 5
    GLCDPrint ( 40, 0, "OLED" )
    GLCDPrint ( 0, 18, "Typ:  ST7567" )
    GLCDPrint ( 0, 34, "Size: 128x64" )

    GLCDfntDefaultSize = 1
    GLCDPrint(20, 56,"https://goo.gl/gjrxkp")
```

  
This example shows how to set the ST7567 OLED the lowest constrast level
by using a OLED chip specific command.  

``` screen
    'Use the GCB command to set the lowest constrast
    GLCDSetContrast ( 0 )

    GLCDfntDefaultSize = 2
    GLCDFontWidth = 5
    GLCDPrint ( 40, 0, "OLED" )
    GLCDPrint ( 0, 18, "Typ:  ST7567" )
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
    GLCDPrint ( 0, 18, "Typ:  ST7567" )
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
