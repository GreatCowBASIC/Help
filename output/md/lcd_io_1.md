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
<a href="http://gcbasic.sourceforge.net/library/DIAGRAMS/1-Wire%20LCD/1-wire%20LCD%2074HC595%20for%20GCB.jpg" class="link">here</a>.
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

For a code example download
<a href="http://gcbasic.sourceforge.net/library/DEMO%20CODE/Demo%20code%20for%20lcd/Demo%20mode%201.gcb" class="link">One Wire LCD Example</a>.

See for further code examples see
<a href="http://github.com/Anobium/Great-Cow-BASIC-Demonstration-Sources/tree/master/LCD_Solutions" class="link">0,1 and 2 Wire LCD Solutions</a>.

See the separate sections of the Help file for the specifics of each
Connection Mode.

<span class="strong">**For more help, see**</span>
<a href="lcd_io_0" class="link" title="LCD_IO 0">LCD_IO 0</a>,
<a href="lcd_io_2" class="link" title="LCD_IO 2">LCD_IO 2</a>
<a href="lcd_io_2_74xx164" class="link" title="LCD_IO 2_74xx164">LCD_IO 2_74xx164</a>,
<a href="lcd_io_2_74xx174" class="link" title="LCD_IO 2_74xx174">LCD_IO 2_74xx174</a>
<a href="lcd_io_4" class="link" title="LCD_IO 4">LCD_IO 4</a>,
<a href="lcd_io_8" class="link" title="LCD_IO 8">LCD_IO 8</a>,
<a href="lcd_io_10" class="link" title="LCD_IO 10">LCD_IO 10</a>
or
<a href="lcd_io_12" class="link" title="LCD_IO 12">LCD_IO 12</a>

</div>
