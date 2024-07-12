<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="sh1106_controllers"></span>SH1106 Controllers

</div>

</div>

</div>

This section covers GLCD devices that use the SH1106 graphics
controller. THe SH1106 is a single-chip CMOS OLED/PLED driver with
controller for organic/polymer light emitting diode dot-matrix graphic
display system. SH1106 consists of 132 segments, 64 commons that can
support a maximum display resolution of 132 X 64. It is designed for
Common Cathode type OLED panel.

The GCBASIC constants shown below control the configuration of the
SH1106 controller.    GCBASIC supports i2C hardware and software
connectivity - this is shown in the tables below.

The SH1106 is a monochrome device.

To use the SH1106 driver simply include the following in your user code.
This will initialise the driver. You can select Full Mode GLCD, Low
Memory Mode GLCD or Text mode these require 1024, 128 or 0 byte GLCD
buffer respectively - you microcontroller requires sufficient RAM to
support the selected mode of GLCD operation.

``` screen
    #include <glcd.h>

    ; ----- Define GLCD Hardware settings
    #define GLCD_TYPE GLCD_TYPE_SH1106
    #define GLCD_I2C_Address 0x78
    '#define GLCD_TYPE_SH1106_LOWMEMORY_GLCD_MODE        'select Low Memory mode of operation
    '#define GLCD_TYPE_SH1106_CHARACTER_MODE_ONLY        'select Text mode of operation

    ; ----- Define Hardware settings
    ' Define I2C settings
    #define HI2C_BAUD_RATE 400
    #define HI2C_DATA
    HI2CMode Master
```

The GCBASIC constants for control display characteristics are shown in
the table below.

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;"><span class="strong"><strong>Constants</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Controls</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Options</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_TYPE</code></p></td>
<td style="text-align: left;"><p><code class="literal">GLCD_TYPE_SH1106</code></p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_I2C_Address</code></p></td>
<td style="text-align: left;"><p>I2C address of the GLCD.</p></td>
<td style="text-align: left;"><p>Required</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">HI2C_BAUD_RATE</code></p></td>
<td style="text-align: left;"><p><code class="literal">HI2C_BAUD_RATE</code></p></td>
<td style="text-align: left;"><p>400 or 100</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">HI2C_DATA</code></p></td>
<td style="text-align: left;"><p><code class="literal">HI2C_DATA</code></p></td>
<td style="text-align: left;"><p>Mandated, plus<br />
<code class="literal">HI2CMode Master</code> is required.</p></td>
</tr>
</tbody>
</table>

</div>

The GCBASIC constants for control display characteristics are shown in
the table below.

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
<td style="text-align: left;"><p><code class="literal">GLCD_WIDTH</code></p></td>
<td style="text-align: left;"><p>The width parameter of the GLCD</p></td>
<td style="text-align: center;"><p><code class="literal">128</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_HEIGHT</code></p></td>
<td style="text-align: left;"><p>The height parameter of the GLCD</p></td>
<td style="text-align: center;"><p><code class="literal">64</code></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCDFontWidth</code></p></td>
<td style="text-align: left;"><p>Specifies the font width of the GCBASIC font set.</p></td>
<td style="text-align: center;"><p><code class="literal">6</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_TYPE_SH1106_CHARACTER_MODE_ONLY</code></p></td>
<td style="text-align: left;"><p>Specifies that the display controller will operate in text mode and BMP draw mode only.<br />
For microcontrollers with low RAM this will be set be default.<br />
When selected ONLY text related commands are suppored. For grapical commands you must have sufficient memory to use Full GLCD mode or use <code class="literal">GLCD_TYPE_SH1106_LOWMEMORY_GLCD_MODE</code></p></td>
<td style="text-align: center;"><p>Optional</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_TYPE_SH1106_LOWMEMORY_GLCD_MODE</code></p></td>
<td style="text-align: left;"><p>Specifies that the display controller will operate in Low Memory mode.</p></td>
<td style="text-align: center;"><p>Optional</p></td>
</tr>
</tbody>
</table>

</div>

The GCBASIC commands supported for this GLCD are shown in the table
below.   Always review the appropiate library for the latest full set of
supported commands.

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

The additional GCBASIC commands for this GLCD are shown in the table
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
<td style="text-align: left;"><p><code class="literal">GLCDSetDisplayInvertMode</code></p></td>
<td style="text-align: left;"><p>Inverts the display</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCDSetDisplayNormalMode</code></p></td>
<td style="text-align: left;"><p>Set the display to normal mode</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCDSetContrast ( dim_state )</code></p></td>
<td style="text-align: left;"><p>Sets the constrast between 0 and 255. The contrast increases as the value increases.<br />
Parameter is dim value</p></td>
</tr>
</tbody>
</table>

</div>

For a SH1106 datasheet, please refer
<a href="http://gcbasic.sourceforge.net/library/DISPLAY/SH1106.pdf" class="link">here</a>.

This example shows how to drive a SH1106 based Graphic LCD module with
the built in commands of GCBASIC.

``` screen
; ----- Configuration
    #chip mega328p,16
    #include <glcd.h>

    ; ----- Define Hardware settings
    ' Define I2C settings
    #define HI2C_BAUD_RATE 400
    #define HI2C_DATA
    HI2CMode Master

    ; ----- Define GLCD Hardware settings
    #define GLCD_TYPE GLCD_TYPE_SH1106
    #define GLCD_I2C_Address 0x78

    GLCDCLS
    GLCDPrint 0, 0, "GCBASIC"
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

This example shows how to drive a SH1106 based Graphic I2C LCD module
with the built in commands of GCBASIC using Low Memory Mode GLCD.

Note the use of `GLCD_Open_PageTransaction` and
`GLCD_Close_PageTransaction` to support the Low Memory Mode of operation
and the contraining of all GLCD commands with the transaction commands.
The use Low Memory Mode GLCD the two defines
`GLCD_TYPE_SH1106_LOWMEMORY_GLCD_MODE` and
`GLCD_TYPE_SH1106_CHARACTER_MODE_ONLY` are included in the user program.

``` screen
    #chip mega328p,16
    #include <glcd.h>

    ; ----- Define Hardware settings
    ' Define I2C settings
    #define HI2C_BAUD_RATE 400
    #define HI2C_DATA
    HI2CMode Master

    ; ----- Define GLCD Hardware settings
    #define GLCD_TYPE GLCD_TYPE_SH1106  'for 128 * 64 pixels support
    #define GLCD_I2C_Address 0x78
    #define GLCD_TYPE_SH1106_LOWMEMORY_GLCD_MODE
    #define GLCD_TYPE_SH1106_CHARACTER_MODE_ONLY

    dim outString as string * 21

    GLCDCLS
    GLCD_Open_PageTransaction 0,7
       GLCDPrint 0, 0, "GCBASIC"
       GLCDPrint (0, 16, "Anobium 2021")
    GLCD_Close_PageTransaction
    wait 3 s
    GLCDCLS

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

<span class="strong">**For more help, see**</span>
<a href="glcdcls" class="link" title="GLCDCLS">GLCDCLS</a>,
<a href="glcddrawchar" class="link" title="GLCDDrawChar">GLCDDrawChar</a>,
<a href="glcdprint" class="link" title="GLCDPrint">GLCDPrint</a>,
<a href="glcdreadbyte" class="link" title="GLCDReadByte">GLCDReadByte</a>,
<a href="glcdwritebyte" class="link" title="GLCDWriteByte">GLCDWriteByte</a>
or <a href="pset" class="link" title="Pset">Pset</a>

Supported in &lt;GLCD.H&gt;

</div>
