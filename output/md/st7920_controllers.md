<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="st7920_controllers"></span>ST7920 Controllers

</div>

</div>

</div>

This section covers GLCD devices that use the ST7920 graphics
controller.

The Great Cow BASIC constants for control of the connectivity are shown
in the table below. The only connectivity option the 8-bit mode where 8
pins are connected between the microcontroller and the GLCD to control
the data bus.  

The ST7920 GLCD is graphics and character mixed mode display.  

ST7920 LCD controller/driver IC can display alphabets, numbers, Chinese
fonts and self-defined characters.   It supports 3 kinds of bus
interface, namely 8-bit, 4-bit and serial.   Great Cow BASIC is
currently supports 8-bit only. For LCD only operations (text characters
only) you can use the Great Cow BASIC LCD routines.  

All functions, including display RAM, Character Generation ROM, LCD
display drivers and control circuits are all in a one-chip solution.
With a minimum system configuration, a Chinese character display system
can be easily achieved.  

The ST7920 includes character ROM with 8192 16x16 dots Chinese fonts and
126 16x8 dots half-width alphanumerical fonts.   It supports 64x256 dots
graphic display area for graphic display (GDRAM).   Mix-mode display
with both character and graphic data is possible.   ST7920 has built-in
CGRAM and provide 4 sets software programmable 16x16 fonts.  

To use the ST7920 driver simply include the following in your user code.
This will initialise the driver.  

``` screen
    #include <glcd.h>
    #DEFINE GLCD_TYPE GLCD_TYPE_ST7920

    #define GLCD_Enable     PORTA.1           'example port setting
    #define GLCD_RS         PORTa.0           'example port setting
    #define GLCD_RW         PORTA.2           'example port setting
    #define GLCD_RESET      PORTA.3           'example port setting
    #define GLCD_DATA_PORT  PORTD             'example port setting
```

The Great Cow BASIC constants for the interface to the controller are
shown in the table below.

<div class="informaltable">

<span class="strong">**Constants**</span>

</div>

</div>

<span class="strong">**Controls**</span>

<span class="strong">**Options**</span>

`GLCD_TYPE`

`GLCD_TYPE_ST7920`

Required

`GLCD_DATA_PORT`

Specifies the output port that is connected between the microcontroller
and the GLCD.

Required

`GLCD_RS`

Specifies the output pin that is connected to Register Select on the
GLCD.

Required

`GLCD_RW`

Specifies the output pin that is connected to Read/Write on the GLCD.
The R/W pin can be disabled\*.

<span class="strong">**<span class="emphasis">*Must be
defined*</span>**</span> <span class="emphasis">*unless R/W is
disabled), see*</span> `GLCD_NO_RW`

`GLCD_RESET`

Specifies the output pin that is connected to Reset on the GLCD.

Required

`GLCD_ENABLE`

Specifies the output pin that is connected to Enable on the GLCD.

Required

`GLCD_NO_RW`

Disables read/write inspection of the device during read/write
operations

Optional, but recommend NOT to set. The R/W pin can be disabled by
setting the `GLCD_NO_RW` constant. If this is done, there is no need for
the `R/W` to be connected to the chip, and no need for the `LCD_RW`
constant to be set. Ensure that the `R/W` line on the LCD is connected
to ground if not used.

Constants that control the timing of the library

`ST7920READDELAY`

Set the time delay between read data transmissions.

Optional, set to `20` us as the default value.

`ST7920WRITEDELAY`

Set the time delay between write data transmissions.

Optional, set to `2` us as the default value.

' read delay of 25 is required at 32mhz, this can be reduced to 0 for
slower clock speeds \#DEFINE ST7920READDELAY 25 ' write delay of 2 is
required at 32mhz. this can be reduced to 1 for slower clock speeds
\#DEFINE ST7920WRITEDELAY 2

The Great Cow BASIC constants for control display characteristics are
shown in the table below.  

<div class="informaltable">

| <span class="strong">**Constants**</span> | <span class="strong">**Controls**</span> | <span class="strong">**Default**</span> |
|:------------------------------------------|:-----------------------------------------|:----------------------------------------|
| `GLCD_WIDTH`                              | The width parameter of the GLCD          | `128`  cannot be changed.               |
| `GLCD_HEIGHT`                             | The height parameter of the GLCD         | `64`  cannot be changed.                |

</div>

The Great Cow BASIC commands supported for this GLCD are shown in the
table below. For device specific see the commands with the prefix of
ST7920\*.

<div class="informaltable">

<span class="strong">**Command**</span>

</div>

<span class="strong">**Purpose**</span>

<span class="strong">**Example**</span>

`GLCDCLS`

Clear screen of GLCD

`GLCDCLS`

`GLCDPrint`

Print string of characters on GLCD using GCB font set

`GLCDPrint( Xposition, Yposition, Stringvariable )`

`GLCDDrawChar`

Print character on GLCD using GCB font set

`GLCDDrawChar( Xposition, Yposition, CharCode )`

`GLCDDrawString`

Print characters on GLCD using GCB font set

`GLCDDrawString( Xposition, Yposition, Stringvariable )`

`Box`

Draw a box on the GLCD to a specific size

`Box ( Xposition1, Yposition1, Xposition2, Yposition2, [Optional In LineColour as 0 or 1] )`

`FilledBox`

Draw a box on the GLCD to a specific size that is filled with the
foreground colour.

`FilledBox (Xposition1, Yposition1, Xposition2, Yposition2, [Optional In LineColour 0 or 1] )`

`Line`

Draw a line on the GLCD to a specific length that is filled with the
specific attribute.

`Line ( Xposition1, Yposition1, Xposition2, Yposition2, [Optional In LineColour 0 or 1] )`

`PSet`

Set a pixel on the GLCD at a specific position that is set with the
specific attribute.

`PSet(Xposition, Yposition, Pixel Colour 0 or 1)`

The following methods ( calls ) are available for expert use.  

`GLCDWriteByte`

Set a byte value to the controller, see the datasheet for usage.

`GLCDWriteByte (LCDByte)`

`GLCDReadByte`

Read a byte value from the controller, see the datasheet for usage.

`bytevariable = GLCDReadByte`

For a TS7920 datasheet, please refer
<a href="http://www.crystalfontz.com/controllers/ST7920.pdf" class="link">here.</a>

This example shows how to drive a ST7920 based Graphic LCD module with
the built in commands of Great Cow BASIC. See
<a href="http://www.greatcowbasic.com/sample-projects" class="link">Graphic LCD</a>
for details, this is an external web site.

<span class="strong">**Example 1:**</span>

``` screen
    ;Chip Settings
    #CHIP 16F1937,32
    #CONFIG  MCLRE_ON

    #INCLUDE <GLCD.H>
    #DEFINE GLCD_TYPE GLCD_TYPE_ST7920
    #DEFINE GLCD_IO 8
    #DEFINE GLCD_WIDTH 128
    #DEFINE GLCD_HEIGHT 160
    ' read delay of 25 is required at 32mhz, this can be reduced to 0 for slower clock speeds
    #DEFINE ST7920READDELAY 25
    ' write delay of 2 is required at 32mhz.  this can be reduced to 1 for slower clock speeds
    #DEFINE ST7920WRITEDELAY 2

    #DEFINE GLCD_RS PORTA.0
    #DEFINE GLCD_ENABLE PORTA.1
    #DEFINE GLCD_RW PORTA.2
    #DEFINE GLCD_RESET PORTA.3
    #DEFINE GLCD_DATA_PORT PORTD

    ST7920GLCDEnableGraphics
    GLCDClearGraphics_ST7920
    GLCDPrint 0, 1, "Great Cow BASIC "
    wait 1 s

    GLCDCLS
    GLCDClearGraphics_ST7920

    rrun = 0
    dim msg1 as string * 16

    dim  xradius, yordinate , radiusErr, incrementalxradius, orginalxradius, orginalyordinate as Integer


    Do forever
        GLCDCLS
        GLCDClearGraphics_ST7920          ;clear screen
        GLCDDrawString 30,0,"ChipMhz@"    ;print string
        GLCDDrawString 78,0, str(ChipMhz) ;print string
        Circle(10,10,10,0)            ;upper left
        Circle(117,10,10,0)           ;upper right
        Circle(63,31,10,0)            ;center
        Circle(63,31,20,0)            ;center
        Circle(10,53,10,0)            ;lower left
        Circle(117,53,10,0)           ;lower right
        GLCDDrawString 30,54,"PIC16F1937" ;print string
        wait 1 s                  ;wait
        FilledBox( 0,0,128,63)          ;create box
        for ypos = 0 to 63              ;draw row by row
             Line 0,ypos,128, 0      ;draw line
        next
        wait 1 s                  ;wait
        GLCDClearGraphics_ST7920          ;clear
    loop
```

<span class="strong">**Example 2:**</span>

``` screen
    ;Chip Settings
    #CHIP 16F1937,32
    #CONFIG MCLRE_ON

    #INCLUDE <GLCD.H>
    #DEFINE GLCD_TYPE GLCD_TYPE_ST7920
    #DEFINE GLCD_IO 8
    #DEFINE GLCD_WIDTH 128
    #DEFINE GLCD_HEIGHT 160

    ' read delay of 25 is required at 32mhz, this can be reduced to 0 for slower clock speeds
    #DEFINE ST7920READDELAY 25
    ' write delay of 2 is required at 32mhz.  this can be reduced to 1 for slower clock speeds
    #DEFINE ST7920WRITEDELAY 2

    #DEFINE GLCD_RS PORTA.0
    #DEFINE GLCD_ENABLE PORTA.1
    #DEFINE GLCD_RW PORTA.2
    #DEFINE GLCD_RESET PORTA.3
    #DEFINE GLCD_DATA_PORT PORTD

    WAIT 1 S
    GLCDEnableGraphics_ST7920
    GLCDClearGraphics_ST7920
    Tile_ST7920 "A"
    GLCDPrint 0, 1, "Great Cow BASIC "

    GLCDCLS

    rrun = 0
    dim msg1 as string * 16

    do forever

    GLCDEnableGraphics_ST7920
    GLCDClearGraphics_ST7920
    GTile_ST7920 0x55, 0x55
    wait 1 s

    GLCDClearGraphics_ST7920
    Lineh_ST7920(0, 0, GLCD_WIDTH)
    Lineh_ST7920(0, GLCD_HEIGHT - 1, GLCD_WIDTH)
    Linev_ST7920(0, 0, GLCD_HEIGHT)
    Linev_ST7920(GLCD_WIDTH - 1, 0, GLCD_HEIGHT)

    Box 18,30,28,40

    WAIT 2 S

    FilledBox 18,30,28,40

    GLCDClearGraphics_ST7920

    Start:

    GLCDDrawString 0,10,"Hello" 'Print Hello
    wait 1 s
    GLCDDrawString 0,10, "ASCII #:" 'Print ASCII #:
    Box 18,30,28,40 'Draw Box Around ASCII Character
    for char = 0x30 to 0x39        'Print 0 through 9
          GLCDDrawString 16, 20 , Str(char)+"  "
          GLCDdrawCHAR 20, 30, char
          wait 250 ms
    next
    line 0,50,127,50    'Draw Line using line command
    for xvar = 0 to 80  'draw line using Pset command
            pset xvar,63,on                    '
    next
    FilledBox 18,30,28,40 'Draw Box Around ASCII Character
    Wait 1 s
    GLCDClearGraphics_ST7920
    GLCDDrawString 0,10,"End  "
    wait 1 s
    GLCDClearGraphics_ST7920

    workingGLCDDrawChar:
    GLCDEnableGraphics_ST7920
    dim gtext as string
    gtext = "ST7920 @QC12864B"

    for xchar = 1 to gtext(0)  'Print 0 through 9
          xxpos = (1+(xchar*6)-6)
          GLCDDrawChar xxpos , 0 , gtext(xchar)
    next

    GLCDDrawString  1, 9, "Great Cow BASIC"
    GLCDDrawString  1, 18,"GLCD 128*64"
    GLCDDrawString  1, 27,"Using GLCD.H from GCB"
    GLCDDrawString  1, 37,"Using GLCD.H GCB"
    GLCDDrawString  1, 45,"GLCDDrawChar method"
    GLCDDrawString  1, 54,"Test Routines"
    wait 1 s

    GLCDClearGraphics_ST7920
    ST7920GLCDDisableGraphics
    GLCDCLS

    msg1 = "Run = " +str(rrun)
    rrun++
    GLCDPrint 0, 0, "ST7920 @QC12864B"
    GLCDPrint 0, 1, "Great Cow BASIC "
    GLCDPrint 0, 2, "GLCD 128*64"
    GLCDPrint 0, 3, msg1
    wait 5 s
    GLCDCLS

    ' show all chars... takes some time!
    ST7920CallBuiltinChar

    wait 1 s
    GLCDCLS

    ' See http://www.khngai.com/chinese/charmap/tblbig.php?page=0
    ' and see https://sourceforge.net/projects/vietunicode/files/hannom/hannom%20v2005/ for the FONTS!!

    dim BIG5code as word

    'ST7920 can display half-width HCGROM fonts, user- defined CGRAM fonts and full 16x16 CGROM fonts. The
    'character codes in 0000H~0006H will use user- defined fonts in CGRAM. The character codes in 02H~7FH will use
    'half-width alpha numeric fonts. The character code larger than A1H will be treated as 16x16 fonts and will be
    'combined with the next byte automatically. The 16x16 BIG5 fonts are stored in A140H~D75FH while the 16x16 GB
    'fonts are stored in A1A0H~F7FFH. In short:
    '1. To display HCGROM fonts:
    'Write 2 bytes of data into DDRAM to display two 8x16 fonts. Each byte represents 1 character.
    'The data is among 02H~7FH.
    '2. To display CGRAM fonts:
    'Write 2 bytes of data into DDRAM to display one 16x16 font.
    'Only 0000H, 0002H, 0004H and 0006H are acceptable.
    '3. To display CGROM fonts:
    'Write 2 bytes of data into DDRAM to display one 16x16 font.
    'A140H~D75FH are BIG5 code, A1A0H~F7FFH are GB code.

    'To display HCGROM fonts
    ' Write 2 bytes of data into DDRAM to display two 8x16 fonts. Each byte represents 1 character.
    ' The data is among 02H~7FH.
    ' The english characters set...

    linetest1:

      GLCDEnableGraphics_ST7920

      wait 1 s
      GLCDClearGraphics_ST7920

    'lineh test
    LineH_ST7920(0, 0, GLCD_WIDTH)
    LineH_ST7920(0, GLCD_HEIGHT - 1, GLCD_WIDTH)
    LineV_ST7920(0, 0, GLCD_HEIGHT)
    LineV_ST7920(GLCD_WIDTH - 1, 0, GLCD_HEIGHT)

    ' box test
    LineH_ST7920(10 ,0 , 118 )
    LineH_ST7920(0 ,8 , 128)
    LineH_ST7920(16 ,16 , 96 )
    LineH_ST7920(10 ,32 , 108 )
    LineH_ST7920(0, 16, GLCD_WIDTH)
    LineH_ST7920(0, 24, GLCD_WIDTH)
    LineH_ST7920(0, 32, GLCD_WIDTH)
    LineH_ST7920(0, 40, GLCD_WIDTH)
    LineH_ST7920(0, 48, GLCD_WIDTH)
    LineH_ST7920(0, 56, GLCD_WIDTH)
    LineH_ST7920(0, 63, GLCD_WIDTH)
    LineV_ST7920(16, 0, GLCD_HEIGHT)
    LineV_ST7920(17, 0, GLCD_HEIGHT)
    LineV_ST7920(15, 0, GLCD_HEIGHT)

    LineV_ST7920(46, 0, GLCD_HEIGHT)
    LineV_ST7920(47, 0, GLCD_HEIGHT)
    LineV_ST7920(48, 0, GLCD_HEIGHT)

    LineV_ST7920(46, 0, GLCD_HEIGHT)
    LineV_ST7920(47, 0, GLCD_HEIGHT)
    LineV_ST7920(48, 0, GLCD_HEIGHT)

    LineV_ST7920(96, 0, GLCD_HEIGHT)
    LineV_ST7920(97, 0, GLCD_HEIGHT)
    LineV_ST7920(98, 0, GLCD_HEIGHT)

    for HCGROM = 0 to GLCD_WIDTH step 8
        LineV_ST7920(HCGROM, 0, GLCD_HEIGHT)
    next

    GraphicTestPlace:

      GLCDClearGraphics_ST7920
      GraphicTest_ST7920
      GLCDClearGraphics_ST7920

      ' Test draw a line
      for yrowpos = 0 to 63 step 4
        LineH_ST7920(0, yrowpos, GLCD_WIDTH)
      next

      GLCDClearGraphics_ST7920
      ST7920GLCDDisableGraphics
      GLCDCLS

      SetIcon_ST7920( 1, 0x55 )

    loop

    sub ST7920CallBuiltinChar
        ' 0xA140 ~ 0xA15F
          for ii = 0 to 31

              WriteData_ST7920( 0xA1)
              WriteData_ST7920( 0x40 + ii)

          next

          wait 1 s

          GLCDCLS

          ' 0xA140 ~ 0xA15F
          for ii = 0 to 31

              WriteData_ST7920( 0xA1)
              WriteData_ST7920( 0xb0 + ii)

          next
          wait 1 s
          GLCDCLS

          ' 0xA140 ~ 0xA15F
          for ii = 0 to 31

              WriteData_ST7920( 0xA4)
              WriteData_ST7920( 0x40 + ii)

          next
          wait 1 s
          GLCDCLS
    end sub
```

<span class="strong">**For more help, see**</span>
<a href="glcdcls" class="link" title="GLCDCLS">GLCDCLS</a>,
<a href="glcddrawchar" class="link" title="GLCDDrawChar">GLCDDrawChar</a>,
<a href="glcdprint" class="link" title="GLCDPrint">GLCDPrint</a>,
<a href="glcdreadbyte" class="link" title="GLCDReadByte">GLCDReadByte</a>,
<a href="glcdwritebyte" class="link" title="GLCDWriteByte">GLCDWriteByte</a>
or <a href="pset" class="link" title="Pset">Pset</a>

Supported in &lt;GLCD.H&gt;
