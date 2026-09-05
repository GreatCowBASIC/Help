<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="lcd_io_2"></span>LCD\_IO 2

</div>

</div>

</div>

<span class="strong">**Using connection mode 2:**</span>

This method uses a Data and a Clock line via a shift register to control
the LCD display. This method is used when the LCD is connected through a
shift register IC either using a 74HC164 or a 74LS174, as detailed at
<a href="http://gcbasic.sourceforge.net/library/DIAGRAMS/2-Wire%20LCD/" class="link">here</a>.
This connection method is also called a 2-wire connection.

This is a <span class="strong">**deprecated**</span> method mode to
connect an LCD display to a microcontroller via a shift registry either
a 74LS174 (or a 74LS164 with diode connected to pin 11). This method
does not support backlight control and has no additional input/output
pin.

If you have used the 2-wire mode prior to August 2015, please choose
this method for your existing code.

See
<a href="lcd_io_2_74xx164" class="link" title="LCD_IO 2_74xx164">LCD_IO 2 74xx164</a>
for the preferred method to connect an LCD display to a microcomputer
via a shift register.

<span class="strong">**Relevant Constants:**</span>

Specific constants are used to control settings for the Liquid Crystal
Display routines included with GCBASIC. To set these constants the main
program should specific constants to support the connection mode using
\#define. When using 2-bit mode only three constants must be set - all
others are optional or can be ignored.

<div class="informaltable">

| <span class="strong">**Constant Name**</span> | <span class="strong">**Controls**</span> | <span class="strong">**Default Value**</span> |
|:----------------------------------------------|:-----------------------------------------|:----------------------------------------------|
| `LCD_IO`                                      | The I/O mode.                            | `2`                                           |
| `LCD_DB`                                      | The data pin used in 2-bit mode.         | <span class="strong">**Mandated**</span>      |
| `LCD_CB`                                      | The clock pin used in 2- bit mode.       | <span class="strong">**Mandated**</span>      |

</div>

<span class="strong">**Example:**</span>

``` programlisting
    #chip mega8, 8

    ' Connection mode 2 (deprecated): a Data and a Clock line drive a
    ' 74LS174 shift register, which in turn drives the LCD. This mode does
    ' not support backlight control; use LCD_IO 2_74XX164 for new designs.
    #define LCD_IO 2
    #define LCD_DB PORTC.0
    #define LCD_CB PORTC.1
    #define LCD_NO_RW

    CLS
    Print "GCBASIC"
    Locate 1,0
    Print "  Hello World."          ' <<< the print instruction this page documents
```

<span class="strong">**Key line:**</span>
`Print "  Hello World."` — writes to the second LCD line after
`Locate 1,0`; both `Print` calls are shifted out over `LCD_DB`/`LCD_CB`
to the 74LS174, which the LCD itself decodes back into an 8-bit parallel
write.

See further code examples at
<a href="http://github.com/Anobium/Great-Cow-BASIC-Demonstration-Sources/tree/master/LCD_Solutions" class="link">Two Wire LCD Solutions</a>.

See the separate sections of the Help file for the specifics of each
Connection Mode.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="lcd_io_0" class="link" title="LCD_IO 0">LCD_IO 0</a> — single
    subroutine, software-driven mode
-   <a href="lcd_io_1" class="link" title="LCD_IO 1">LCD_IO 1</a> — 1-wire,
    via a 74HC595 shift register
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
