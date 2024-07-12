<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="lcd_io_2_74xx164"></span>LCD\_IO 2\_74xx164

</div>

</div>

</div>

<span class="strong">**Using connection mode 2\_74XX164:**</span>

Use a Data and a Clock line. This manner is used when the LCD is
connected through a shift register IC either using a 74HC164 or a
74LS164, as detailed at
<a href="http://gcbasic.sourceforge.net/library/DIAGRAMS/2-Wire%20LCD/" class="link">here</a>.
This connection method is also called a 2-wire connection.

This is the preferred two wire method to connect via a shift register to
an LCD display.

<span class="strong">**Relevant Constants:**</span>

Specific constants are used to control settings for the Liquid Crystal
Display routines included with GCBASIC. To set these constants the main
program should specific constants to support the connection mode using
\#define.

When using connection mode 2\_74XX164 only three constants must be set -
all others are optional or can be ignored.

<div class="informaltable">

| <span class="strong">**Constant Name**</span> | <span class="strong">**Controls**</span> | <span class="strong">**Default Value**</span> |
|:----------------------------------------------|:-----------------------------------------|:----------------------------------------------|
| `LCD_IO`                                      | The I/O mode.                            | `2`                                           |
| `LCD_DB`                                      | The data pin used in 2-bit mode.         | <span class="strong">**Mandated**</span>      |
| `LCD_CB`                                      | The clock pin used in 2- bit mode.       | <span class="strong">**Mandated**</span>      |

</div>

LCD.h supports in connection mode 2\_74XX164 via the control of pin 11
of the 74HC164 / 74LS164 the background led/backlight.

How to connect and control the LCD background led: see
<http://gcbasic.sourceforge.net/help/_lcdbacklight>

For a code example download
<a href="http://gcbasic.sourceforge.net/library/DEMO%20CODE/Demo%20code%20for%20lcd/Demo%20mode%202.gcb" class="link">Two Wire LCD Example</a>.

See for further code examples see
<a href="http://github.com/Anobium/Great-Cow-BASIC-Demonstration-Sources/tree/master/LCD_Solutions" class="link">Two Wire LCD Solutions</a>.

See the separate sections of the Help file for the specifics of each
Connection Mode.

<span class="strong">**For more help, see**</span>
<a href="lcd_io_0" class="link" title="LCD_IO 0">LCD_IO 0</a>,
<a href="lcd_io_1" class="link" title="LCD_IO 1">LCD_IO 1</a>,
<a href="lcd_io_2" class="link" title="LCD_IO 2">LCD_IO 2</a>,
<a href="lcd_io_2_74xx174" class="link" title="LCD_IO 2_74xx174">LCD_IO 2_74xx74</a>,
<a href="lcd_io_4" class="link" title="LCD_IO 4">LCD_IO 4</a>,
<a href="lcd_io_8" class="link" title="LCD_IO 8">LCD_IO 8</a>,
<a href="lcd_io_10" class="link" title="LCD_IO 10">LCD_IO 10</a>
or
<a href="lcd_io_12" class="link" title="LCD_IO 12">LCD_IO 12</a>

</div>
