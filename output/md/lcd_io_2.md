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
Display routines included with Great Cow BASIC. To set these constants
the main program should specific constants to support the connection
mode using \#define. When using 2-bit mode only three constants must be
set - all others are optional or can be ignored.

<div class="informaltable">

| <span class="strong">**Constant Name**</span> | <span class="strong">**Controls**</span> | <span class="strong">**Default Value**</span> |
|:----------------------------------------------|:-----------------------------------------|:----------------------------------------------|
| `LCD_IO`                                      | The I/O mode.                            | `2`                                           |
| `LCD_DB`                                      | The data pin used in 2-bit mode.         | <span class="strong">**Mandated**</span>      |
| `LCD_CB`                                      | The clock pin used in 2- bit mode.       | <span class="strong">**Mandated**</span>      |

</div>

For a code example download
<a href="http://gcbasic.sourceforge.net/library/DEMO%20CODE/Demo%20code%20for%20lcd/" class="link">Two Wire LCD Example</a>.

See for further code examples see
<a href="http://github.com/Anobium/Great-Cow-BASIC-Demonstration-Sources/tree/master/LCD_Solutions" class="link">Two Wire LCD Solutions</a>.

See the separate sections of the Help file for the specifics of each
Connection Mode.

<span class="strong">**For more help, see**</span>
<a href="lcd_io_0" class="link" title="LCD_IO 0">LCD_IO 0</a>,
<a href="lcd_io_1" class="link" title="LCD_IO 1">LCD_IO 1</a>,
<a href="lcd_io_2_74xx164" class="link" title="LCD_IO 2_74xx164">LCD_IO 2_74xx164</a>,
<a href="lcd_io_2_74xx174" class="link" title="LCD_IO 2_74xx174">LCD_IO 2_74xx174</a>,
<a href="lcd_io_4" class="link" title="LCD_IO 4">LCD_IO 4</a>,
<a href="lcd_io_8" class="link" title="LCD_IO 8">LCD_IO 8</a>,
<a href="lcd_io_10" class="link" title="LCD_IO 10">LCD_IO 10</a>
or
<a href="lcd_io_12" class="link" title="LCD_IO 12">LCD_IO 12</a>

</div>
