<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="uc1601_controllers"></span>UC1601 Controllers

</div>

</div>

</div>

This section covers GLCD devices that use the UC1601 graphics
controller.

The UC1601 is an advanced high-voltage mixed signal CMOS IC, especially
designed for the display needs of ultra-low power hand-held devices.

The UC1601 embeds with contrast control, display RAM and oscillator,
which reduces the number of external components and power consumption.  
It has 256-step brightness control. Data/Commands are sent from general
MCU through the hardware selectable 6800/8000 series compatible Parallel
Interface, I2C interface or Serial Peripheral Interface. It is suitable
for many compact portable applications, such as mobile phone
sub-display, MP3 player and calculator, etc.

The UC1601 library supports 132 \* 22 pixels.   The UC1601 library
supports monochrome devices.

<span
class="inlinemediaobject"><img src="./images/UC1601.gif" width="396" height="66" alt="graphic" /></span>

The UC1601 can operate in three modes.   Full GLCD mode, Low Memory GLCD
mode or Text/JPG mode the full GLCD mode requires a minimum of 396 bytes
or 128 bytes for the respective modes.  For microcontrollers with
limited memory the third mode of operation - Text mode. These can be
selected by setting the correct constant.

To use the UC1601 driver simply include the following in your user code.
This will initialise the driver.

The Great Cow BASIC constants shown below control the configuration of
the UC1601 controller.    Great Cow BASIC supports hardware I2C &
software I2C connectivity - this is shown in the tables below.

To use the UC1601 drivers simply include one of the following
configuration.

``` screen
    'An I2C configuration
    #include <glcd.h>

    #define GLCD_TYPE GLCD_TYPE_UC1601
    #define GLCD_I2C_Address      0x70                   'I2C address
    #define GLCD_RESET            portc.0                'Hard Reset pin connection
    #define GLCD_PROTECTOVERRUN
    #define GLCD_OLED_FONT

    ; ----- Define Hardware settings for I2C
    ' Define I2C settings - CHANGE PORTS
    #define I2C_MODE Master
    #define I2C_DATA PORTb.5
    #define I2C_CLOCK PORTb.7
    #define I2C_DISABLE_INTERRUPTS ON
```

The Great Cow BASIC constants for control display characteristics are
shown in the table below.

<div class="informaltable">

| <span class="strong">**Constants**</span> | <span class="strong">**Controls**</span> | <span class="strong">**Options**</span> |
|:------------------------------------------|:-----------------------------------------|:----------------------------------------|
| `GLCD_TYPE`                               | `GLCD_TYPE_UC1601`                       | Required                                |
| `GLCD_I2C_Address`                        | I2C address of the GLCD.                 | Fixed at 0x70.                          |

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
<td style="text-align: left;"><p><code class="literal">132</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_HEIGHT</code></p></td>
<td style="text-align: left;"><p>The height parameter of the GLCD</p></td>
<td style="text-align: left;"><p><code class="literal">22</code></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_PROTECTOVERRUN</code></p></td>
<td style="text-align: left;"><p>Define this constant to restrict pixel operations with the pixel limits</p></td>
<td style="text-align: left;"><p>Recommended</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">GLCD_TYPE_UC1601_CHARACTER_MODE_ONLY</code></p></td>
<td style="text-align: left;"><p>Specifies that the display controller will operate in text mode and BMP draw mode only.<br />
For microcontrollers with low RAM this will be set be default.<br />
When selected ONLY text related commands are suppored. For grapical commands you must have sufficient memory to use Full GLCD mode or use <code class="literal">GLCD_TYPE_UC1601_LOWMEMORY_GLCD_MODE</code></p></td>
<td style="text-align: left;"><p>Optional</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCD_TYPE_UC1601_LOWMEMORY_GLCD_MODE</code></p></td>
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

| <span class="strong">**Command**</span> | <span class="strong">**Purpose**</span>                                                                              | <span class="strong">**Example**</span>                                                         |
|:----------------------------------------|:---------------------------------------------------------------------------------------------------------------------|:------------------------------------------------------------------------------------------------|
| `GLCDCLS`                               | Clear screen of GLCD                                                                                                 | `GLCDCLS`                                                                                       |
| `GLCDPrint`                             | Print string of characters on GLCD using GCB font set                                                                | `GLCDPrint( Xposition, Yposition, Stringvariable )`                                             |
| `GLCDDrawChar`                          | Print character on GLCD using GCB font set                                                                           | `GLCDDrawChar( Xposition, Yposition, CharCode )`                                                |
| `GLCDDrawString`                        | Print characters on GLCD using GCB font set                                                                          | `GLCDDrawString( Xposition, Yposition, Stringvariable )`                                        |
| `Box`                                   | Draw a box on the GLCD to a specific size                                                                            | `Box ( Xposition1, Yposition1, Xposition2, Yposition2, [Optional In LineColour as 0 or 1] )`    |
| `FilledBox`                             | Draw a box on the GLCD to a specific size that is filled with the foreground colour.                                 | `FilledBox (Xposition1, Yposition1, Xposition2, Yposition2, [Optional In LineColour 0 or 1] )`  |
| `Line`                                  | Draw a line on the GLCD to a specific length that is filled with the specific attribute.                             | `Line ( Xposition1, Yposition1, Xposition2, Yposition2, [Optional In LineColour 0 or 1] )`      |
| `PSet`                                  | Set a pixel on the GLCD at a specific position that is set with the specific attribute.                              | `PSet(Xposition, Yposition, Pixel Colour 0 or 1)`                                               |
| `GLCD_Open_PageTransaction`             | Commence a series of GLCD commands when in low memory mode. Must be followed a `GLCD_Close_PageTransaction` command. | `GLCD_Close_PageTransaction 0, 3` where 0 and 3 are the range of pages to be updated            |
| `GLCD_Close_PageTransaction`            | Commence a series of GLCD commands when in low memory mode. Must follow a `GLCD_Open_PageTransaction` command.       |                                                                                                 |
| `Open_Transaction_UC1601`               | Send command instruction to GLCD. Handles I2C and SPI protocols.                                                     | Transaction must be closed by using `Close_Transaction_UC1601`                                  |
| `Open_Transaction_Data_UC1601`          | Send data instruction to GLCD. Handles I2C and SPI protocols.                                                        | Transaction must be closed by using `Close_Transaction_UC1601`                                  |
| `Write_Transaction_Data_UC1601`         | Send transactional, a stream of, data to GLCD.                                                                       | Transaction must be opened and closed by using transaction commands.                            |
| `Close_Transaction_UC1601`              | Close the communications to the GLCD.                                                                                | Transaction must be opened by using `Open_Transaction_UC1601` or `Open_Transaction_Data_UC1601` |

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
<td style="text-align: left;"><p><code class="literal">Stopscroll_UC1601</code></p></td>
<td style="text-align: left;"><p>Stops all scrolling</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">Startscroll_UC1601 ( start  )</code></p></td>
<td style="text-align: left;"><p>Activates a vertical scroll for rows start.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">GLCDSetContrast ( contrast_state )</code></p></td>
<td style="text-align: left;"><p>Sets the constrast between 0 and 255. The contrast increases as the value increases.<br />
Parameter is contrast value</p></td>
</tr>
</tbody>
</table>

</div>

For a UC1601 datasheet, please refer
<a href="http://gcbasic.sourceforge.net/library/DISPLAY/UC1601.pdf" class="link">here</a>.

This example shows how to drive a UC1601 based Graphic I2C LCD module
with the built in commands of Great Cow BASIC using Full Mode GLCD

``` screen
        ; ----- Configuration
        #chip 16f18446, 32
        #option explicit


    ; ----- Define GLCD Hardware settings
        #include <glcd.h>

        #define GLCD_TYPE GLCD_TYPE_UC1601
        #define GLCD_I2C_Address      0x70                   'I2C address
        #define GLCD_RESET            portc.0                'Hard Reset pin connection
        #define GLCD_PROTECTOVERRUN
        #define GLCD_OLED_FONT

    ; ----- Define Hardware settings

        ' Define I2C settings - CHANGE PORTS
        #define I2C_MODE Master
        #define I2C_DATA PORTb.5
        #define I2C_CLOCK PORTb.7
        #define I2C_DISABLE_INTERRUPTS ON

    ; ----- Define variables

    ; ----- Main program

        'You can treat the GLCD like an LCD....
        GLCDPrintStringLN "User the GLCD like an LCD...."
        GLCDPrintStringLN "The GLCDPrintString commands...."
        GLCDPrintString "Enjoy....."
        wait 4 s

    end
```

  
  
This example shows how to drive a UC1601 based Graphic I2C LCD module
with the built in commands of Great Cow BASIC using Low Memory Mode
GLCD.  
Note the use of `GLCD_Open_PageTransaction` and
`GLCD_Close_PageTransaction` to support the Low Memory Mode of operation
and the contraining of all GLCD commands with the transaction commands.
The use Low Memory Mode GLCD the two defines
`GLCD_TYPE_UC1601_LOWMEMORY_GLCD_MODE` and
`GLCD_TYPE_UC1601_CHARACTER_MODE_ONLY` are included in the user
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
    #define GLCD_TYPE GLCD_TYPE_UC1601
    #define GLCD_TYPE_UC1601_LOWMEMORY_GLCD_MODE
    #define GLCD_TYPE_UC1601_CHARACTER_MODE_ONLY

    dim outString as string * 21

    GLCDCLS

    'To clarify - page udpates
    '0,7 correspond with the Text Lines from 0 to 3 on a 22 Pixel Display
    'In this example Code would be GLCD_Open_PageTransaction 0,1 been enough
    'But it is allowed to use GLCD_Open_PageTransaction 0,3 to show the full screen update
    GLCD_Open_PageTransaction 0,3
       GLCDPrint 0, 0, "Great Cow BASIC"
       GLCDPrint (0, 16, "Anobium 2021")
    GLCD_Close_PageTransaction

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
