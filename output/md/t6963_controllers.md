<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="t6963_controllers"></span>T6963 Controllers

</div>

</div>

</div>

This section covers Graphical Liquid Crystal Display (GLCD) devices that
use the Toshiba T6963 graphics controller.   The T6963 is a monochrome
device that typically is blue or white.   The GLCD can be provided in a
number of pixels sizes - 240 \* 64 or 240 \* 128.  
  
The Toshiba T6963 is a very popular LCD controller for use in small
graphics modules. It is capable of controlling displays with a
resolution up to 240x128. Because of its low power and small outline it
is most suitable for mobile applications such as PDAs, MP3 players or
mobile measurement equipment.  
  
A number of GLCD modules have this controller built-in these include the
SP12N002 & SP14N001. Although this controller is small, it has the
capability of displaying and merging text and graphics and it manages
all the interfacing signals to the displays Row and Column
drivers.   The GCBASIC library supports the complex capabilities of the
T6963.  
  
The T6963 is an LCD is driven by on-board 5V parallel interface chipset
T6963.   For the specific operating voltage always verify the operating
voltages in the device specific datasheet.  
  
The GCBASIC connectivity option is the 8-bit mode - where 8 connections
(for the data) are required between the microcontroller and the GLCD to
control the data bus.  
  
To use the T6963 driver simply include the following in your user code.
   This will initialise the driver.  
  

``` screen
    #chip 16f1939,32
    #option explicit

    '***********************************************************************************************
    'Specify this GLCD - a 240 x 64 pixels display
    #include <glcd.h>
     #define GLCD_TYPE GLCD_TYPE_T6963_64

    '***********************************************************************************************
    'define the connectivity - the 8bit port
    #define GLCD_DATA_PORT PORTD             'Library support contigous 8-bit port

  '  or
  '  #define GLCD_DB0      PORTD.0            'chip specific configuration where the ibrary supports 8-bit port defined via 8 constants
  '  #define GLCD_DB1      PORTD.1            'chip specific configuration
  '  #define GLCD_DB2      PORTD.2            'chip specific configuration
  '  #define GLCD_DB3      PORTD.3            'chip specific configuration
  '  #define GLCD_DB4      PORTD.4            'chip specific configuration
  '  #define GLCD_DB5      PORTD.5            'chip specific configuration
  '  #define GLCD_DB6      PORTD.6            'chip specific configuration
  '  #define GLCD_DB7      PORTD.7            'chip specific configuration

     #define GLCD_CS        PORTa.7           'Chip Enable (Active Low)
     #define GLCD_CD        PORTa.0           'Command or Data conrol line port
     #define GLCD_RD        PORTA.1           'Read control line  port
     #define GLCD_WR        PORTA.2           'Write control line port
     #define GLCD_RESET     PORTA.3           'Reset port
     #define GLCD_FS        PORTA.5           'FS port
     #define GLCD_FS_SELECT 1                 'FS1 Font Select port. 6x8 font: FS1=“High”=1 8x8 font FS1=“Low”=0 for GLCD_FS_SELECT

    '***********************************************************************************************
    '*
    '* Note    :   The T6963 controller's RAM address space from $0000 - $7FFF, total 32kbyte RAM, or it could be 64kbyte RAM best check!!
    '*
    '***********************************************************************************************
     #define TEXT_HOME_ADDR      0x0000                                                         'This is specific to the GLCD display
     #define GRH_HOME_ADDR       0x3FFF                                                         'This is specific to the GLCD display
     #define CG_HOME_ADDR        0x77FF                                                         'This is specific to the GLCD display
     #define COLUMN              40    'Set column number to be 40 , 32, 30 etc.                 This is specific to the GLCD display
     #define MAX_ROW_PIXEL       64    'MAX_ROW_PIXEL the physical matrix length (y direction)   This is specific to the GLCD display
     #define MAX_COL_PIXEL       240   'MAX_COL_PIXEL the physical matrix width (x direction)    This is specific to the GLCD display

    '***********************************************************************************************
    '* End of configuration
    '***********************************************************************************************
```

  
  

The GCBASIC constants for the interface to the controller are shown in
the table below.

<div class="informaltable">

| <span class="strong">**Constants**</span> | <span class="strong">**Controls**</span>                                                                                                   | <span class="strong">**Options**</span>        |
|:------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------|:-----------------------------------------------|
| `GLCD_TYPE`                               | `GLCD_TYPE_TYPE_T6963_64` or `GLCD_TYPE_T6963_128`                                                                                         | Required                                       |
| `GLCD_DATA_PORT`                          | A full 8-bit port. 8 contigous input/outputs.                                                                                              | or use GLCD\_DB0..GLCD\_DB7                    |
| `GLCD_DB0..7`                             | A 8-bit port using 8 input/outputs.                                                                                                        | or use GLCD\_DATA\_PORT                        |
| `GLCD_CS`                                 | Specifies the output pin that is connected to Chip Select on the GLCD.                                                                     | Required                                       |
| `GLCD_CD`                                 | Specifies the output pin that is connected to Command/Data on the GLCD.                                                                    | Required                                       |
| `GLCD_RD`                                 | Specifies the output pin that is connected to Read on the GLCD.                                                                            | Required                                       |
| `GLCD_WR`                                 | Specifies the output pin that is connected to Write on the GLCD.                                                                           | Required                                       |
| `GLCD_RESET`                              | Specifies the output pin that is connected to Reset on the GLCD.                                                                           | Required                                       |
| `GLCD_FS`                                 | Specifies the output pin that is connected to FS on the GLCD. The FS specifies the font size. Please set to 6 setting GLCD\_FS\_SELECT = 1 | Required                                       |
| `GLCD_FS_SELECT`                          | Specifies the output pin that is connected to FS on the GLCD. The FS specifies the font size. Please set to 6 setting GLCD\_FS\_SELECT = 1 | Required. Can be 1 or 0. Default setting is 1. |

</div>

  
  

The T6963 differs from most other GLCD controllers in its use of the
display RAM.    Where a fixed area of memory is normally allocated for
text, graphics and the external character generator, but with the T6963
the size for each area <span class="strong">**MUST**</span> be set by
software commands.    This means that the area for text, graphics and
external character generator can be freely allocated within the external
memory, up to 64 kByte.   Check the specific device for the amount of
memory available.   This can range from 4 kbyte to 64 kbyte.

  
  
For more information on memory management refer the device specific
datasheet.  
  
The GCBASIC constants control the memory configuration of the T6963
controller.

<div class="informaltable">

| <span class="strong">**Constants**</span> | <span class="strong">**Value**</span> | <span class="strong">**Comments**</span>                                                      |
|:------------------------------------------|:--------------------------------------|:----------------------------------------------------------------------------------------------|
| `TEXT_HOME_ADDR`                          | 0x0000                                | This is specific to the GLCD display                                                          |
| `GRH_HOME_ADDR`                           | 0x3FFF                                | This is specific to the GLCD display                                                          |
| `CG_HOME_ADDR`                            | 0x77FF                                | This is specific to the GLCD display                                                          |
| `COLUMN`                                  | 40                                    | Set column number to be 40 , 32, 30 etc. This is specific to the GLCD display                 |
| `MAX_ROW_PIXEL`                           | 64                                    | MAX\_ROW\_PIXEL the physical matrix length (y direction) This is specific to the GLCD display |
| `MAX_COL_PIXEL`                           | 240                                   | MAX\_COL\_PIXEL the physical matrix width (x direction) This is specific to the GLCD display  |

</div>

  
  
The GCBASIC library supports the following capabilities.   Please refer
to the relevant Help section and the device specific demonstrations.  
  
<span class="strong">**Commands Supported for the LCD and
GLCD**</span>  
  

The GLCD command set covers the standard GLCDCLS, Line, Circle and all
the GLCD methods and the LCD command set: CLS, Locate, Print, LCDHEX
etc. The demonstrations show how to load BMP loading via external data
sources and GLCD and LCD page swapping.  
  
The table below shows the specific implementations of the command set
for this device.   Refer to the GLCD and LCD in the Help for the generic
GLCD and LCD commands.  
  

<div class="informaltable">

| <span class="strong">**Commands**</span> | <span class="strong">**Usage**</span>                         |
|:-----------------------------------------|:--------------------------------------------------------------|
| CLS                                      | Clear the screen of the current LCD page                      |
| LOCATE                                   | Locate the cursor at a specific screen position               |
| PRINT                                    | Print numbers or strings                                      |
| PUT                                      | Put a specific ASCII code at a specific screen position       |
| LCDHOME                                  | Set output position of 0, 0                                   |
| LCDcmd                                   | Send specific command to the device to control the device.    |
| LCDdata                                  | Send specific data to the device to control the device.       |
| LCDHex                                   | Print Hex value of a number to the LCD screen                 |
| LCDSpace                                 | Print a number of space to the LCD screen                     |
| LCDCursor                                | Send specific commands to the device to control the cursor    |
| GLCDCLS                                  | Clear the screen of the current GLCD page                     |
| GLCDRotate                               | Rotate the GLCD screen. Only Landscape rotation is supported. |
| SelectGLCDPage\_T6963                    | Select a specific GLCD page.                                  |
| SelectLCDPage\_T6963                     | Select a specific LCD page.                                   |

</div>

  
  
<span class="strong">**GLCD and LCD page swapping**</span>  
  
To support GLCD and LCD page swapping - this can be used to support
fixed pages of information, BMPs or scrolling the following constants
have are available to the user.  
  

For GLCD memory addressing

``` screen
  GLCDPage0_T6963
  GLCDPage1_T6963
  GLCDPage2_T6963
  ... etc
  GLCDPage10_T6963
```

Ten pages are automatically created but the number of pages available is
constrained by the memory configuration.  
  
For LCD memory addressing

``` screen
  LCDPage0_T6963
  LCDPage1_T6963
  LCDPage2_T6963
  ...etc
  LCDPage10_T6963
```

Ten pages are automatically created but the number of pages available is
constrained by the memory configuration.  
To use add the following to you user program.   See the demonstration
programs for more detailed usage.   After calling the `SelectGLCDPage`
or `SelectLCDPage` methods all GLCD or LCD commands will be applied to
the current GLCD or LCD page.  
  

``` screen
    'Select the GLCD page 1 memory
    SelectGLCDPage ( GLCDPage1_T6963 )

    'Select the LCD page 2 memory
    SelectLCDPage ( LCDPage2_T6963 )
```

  
  

The `SelectLCDPage` and `SelectLCDPage` and "Set Text Home Address"
methods change the screen being viewed on the device.

The key is to establish what you want your memory map to look like.    
Below is a map for one of my 240 x 64 pixel device.     The default is
for 10 screen pages (some newer LCD’s may have more RAM for more
screens).     If you write the appropriate value (0x1000, or 0x11b0, or
0x1360, etc) to the text home address, the display will instantly change
to that screen - using `SelectLCDPage` and `SelectLCDPage` method with
the appropiate constant as parameter.

You can write your screens "ahead of time", in my case during the
"splash screen" delay interval, and instantly change to them later as
desired.     You can do this by setting <span
class="strong">**current\_grh\_home\_addr**</span> to the appropiate
page.    And, then execute the GLCD commands you would normal use.

The graphic and text screens are independant but can be overlaid for a
variety of useful effects.

Although, not tested, the LCD text screens can be scrolled 1 full text
line at a time, while the GLCD screens can be scrolled 1 pixel row at a
time, provided you’ve set up your memory map accordingly with adequate
RAM for the graphic area.

  
  
<span class="strong">**Default Memory Map**</span>  
  

``` screen
            '
            '*******************************************************
            '
            ' LCD MEMORY MAP
            '
            '*******************************************************
            '
            '
            '
            ' --------------------
            ' |                  | 0x0000
            ' |                  |
            ' | TEXT RAM AREA    | Each page has the numnbers of bytes + extra
            ' | ( 10 SCREENs )   | few bytes need to attributes. This is
            ' |                  | mentioned in the datasheet but imperical
            ' |                  | testing shows... you need the extra bytes
            ' --------------------
            ' |                  |
            ' | xx bytes unused  |
            ' |                  |
            ' --------------------
            ' |                  | 0x3fff
            ' |                  |
            ' |                  |
            ' |  GCLD RAM AREA   |
            ' |  ( 10 SCREENS )  |
            ' |                  |
            ' |                  |
            ' |          |
            ' --------------------
            ' |                  | 0x77ff
            ' |   CG RAM AREA    | (Sacrosanct)
            ' |                  |
            ' -------------------- 0x7ffff
            '
```

<span class="strong">**Other methods and constants**</span>  
There are many other methods and constants that support this
device.   Reviewing the library will assist in understanding how these
private methods and constants support the overal solution for this
library.  
  

<span class="strong">**For more help, see**</span>
<a href="glcdcls" class="link" title="GLCDCLS">GLCDCLS</a>,
<a href="glcddrawchar" class="link" title="GLCDDrawChar">GLCDDrawChar</a>,
<a href="glcdprint" class="link" title="GLCDPrint">GLCDPrint</a>
or <a href="pset" class="link" title="Pset">Pset</a>

Supported in &lt;GLCD.H&gt;

   

</div>
