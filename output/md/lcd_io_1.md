<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="lcd_io_1"></span>LCD\_IO 1

</div>

</div>

</div>

<span class="strong">**Using connection mode 1:**</span>

This approach uses a single connectivity line that supports a combined
data and clock signal between the microcontroller and the LCD display.
This approach is used when the LCD is connected through a shift register
74HC595, as detailed at
[here](https://gcbasic.sourceforge.net/library/DIAGRAMS/1-Wire%20LCD/1-wire%20LCD%2074HC595%20for%20GCB.jpg).
This connection method is also called a 1-wire connection.

This solution approach recognises the original work provided in the
Elektor Magazine.

<span class="strong">**Relevant Constants:**</span>

Specific constants are used to control settings for the Liquid Crystal
Display routines included with GCBASIC. To set these constants the main
program should specific constants to support the connection mode using
\#define.

When using connection mode 1, only two constants must be set - all
others are optional or can be ignored.

How to connect and control the LCD background led: see
<a href="lcdbacklight" class="link" title="LCDBacklight">LCDBacklight</a>.

<div class="informaltable">

| <span class="strong">**Constant Name**</span> | <span class="strong">**Controls**</span> | <span class="strong">**Default Value**</span> |
|:----------------------------------------------|:-----------------------------------------|:----------------------------------------------|
| `LCD_IO`                                      | The I/O mode.                            | `1`                                           |
| `LCD_CD`                                      | The clock/data pin used in 1-bit mode.   | <span class="strong">**Mandated**</span>      |

</div>

LCD.h supports in 1-wire mode the control of pin 4 of the 74HC595 for
the background led.

<span class="strong">**Example:**</span>

``` programlisting
    #chip mega8, 8

    ' Connection mode 1: a single combined clock/data line drives a 74HC595
    ' shift register, which in turn drives the LCD. LCDBacklight controls
    ' pin 4 of the 74HC595 in this mode.
    #define LCD_IO 1
    #define LCD_CD PORTD.1
    #define LCD_NO_RW

    LCDBacklight On

    CLS
    Print "GCBASIC"
    Locate 1,0
    Print "  Hello World."          ' <<< the print instruction this page documents
```

<span class="strong">**Key line:**</span>
`Print "  Hello World."` — writes to the second LCD line after
`Locate 1,0`; both `Print` calls are shifted out over the single
`LCD_CD` line to the 74HC595, one bit at a time, with no other wiring
involved.

See further code examples at [0, 1 and 2 Wire LCD
Solutions](https://github.com/Anobium/Great-Cow-BASIC-Demonstration-Sources/tree/master/LCD_Solutions).

See the separate sections of the Help file for the specifics of each
Connection Mode.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="lcd_io_0" class="link" title="LCD_IO 0">LCD_IO 0</a> — single
    subroutine, software-driven mode
-   <a href="lcd_io_2" class="link" title="LCD_IO 2">LCD_IO 2</a> — 2-wire
    shift register, deprecated
-   <a href="lcd_io_2_74xx164" class="link" title="LCD_IO 2_74xx164">LCD_IO 2_74xx164</a> — 2-wire
    via 74HC164/74LS164, the preferred 2-wire method
-   <a href="lcd_io_2_74xx174" class="link" title="LCD_IO 2_74xx174">LCD_IO 2_74xx174</a> — 2-wire
    via 74LS174, deprecated
-   <a href="lcd_io_3" class="link" title="LCD_IO 3">LCD_IO 3</a> — 3-wire
    shift register with an added Enable line
-   <a href="lcd_io_4" class="link" title="LCD_IO 4">LCD_IO 4</a> — 4-bit
    parallel connection
-   <a href="lcd_io_8" class="link" title="LCD_IO 8">LCD_IO 8</a> — 8-bit
    parallel connection
-   <a href="lcd_io_10" class="link" title="LCD_IO 10">LCD_IO 10</a> — I2C
    via a PCF8574/PCF8574A I/O expander
-   <a href="lcd_io_12" class="link" title="LCD_IO 12">LCD_IO 12</a> — I2C
    via a Ywmjkdz-layout adapter
-   <a href="lcd_io_14" class="link" title="LCD_IO 14">LCD_IO 14</a> — SPI
    expander
-   <a href="lcd_io_16" class="link" title="LCD_IO 16">LCD_IO 16</a> — PIC16LF72
    SPI expander
-   <a href="lcd_io_107" class="link" title="LCD_IO 107">LCD_IO 107</a> — K107
    serial adapter

</div>

</div>
