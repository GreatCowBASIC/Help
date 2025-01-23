<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="lcd_io_0"></span>LCD\_IO 0

</div>

</div>

</div>

<span class="strong">**Using connection mode 0:**</span>

To use connection mode 0, a subroutine to write a byte to the LCD <span
class="strong">**must**</span> be provided.

Optionally, another subroutine to read a byte from the LCD can also be
defined. If the LCD was to be read, the function `LCDReadByte` would be
set to the name of a function that reads the LCD and returns the data
byte from the LCD. If there is no way (or no requirement) to read from
the LCD, then the `LCD_NO_RW` constant must be set.

In connection mode 0, the `LCD_RS` constant will be set automatically to
an unused bit variable. The higher level LCD commands (such as `Print`
and `Locate`) will set it, and the subroutine is responsible for writing
to the LCD. The subroutine should handle the process and then set the RS
pin on the LCD appropriately.

<span class="strong">**Relevant Constants:**</span>

Specific constants are used to control settings for the Liquid Crystal
Display routines included with GCBASIC. To set these constants the main
program should specific constants to support the connection mode using
\#define.

When using connection mode 0 only one constant must be set - all others
are optional or can be ignored.

<div class="informaltable">

| <span class="strong">**Constant Name**</span> | <span class="strong">**Controls**</span> | <span class="strong">**Value**</span> |
|:----------------------------------------------|:-----------------------------------------|:--------------------------------------|
| `LCD_IO`                                      | The I/O mode.                            | `0`                                   |

</div>

For a code example of connection mode 0 program, download
<a href="http://gcbasic.sourceforge.net/library/DEMO%20CODE/Demo%20code%20for%20lcd/Demo%20mode%200.gcb" class="link">here</a>.

See the separate sections of the Help file for the specifics of each
Connection Mode.

<span class="strong">**For more help, see**</span>
<a href="lcd_io_1" class="link" title="LCD_IO 1">LCD_IO 1</a>,
<a href="lcd_io_2" class="link" title="LCD_IO 2">LCD_IO 2</a>,
<a href="lcd_io_2_74xx164" class="link" title="LCD_IO 2_74xx164">LCD_IO 2_74xx164</a>,
<a href="lcd_io_2_74xx174" class="link" title="LCD_IO 2_74xx174">LCD_IO 2_74xx174</a>,
<a href="lcd_io_4" class="link" title="LCD_IO 4">LCD_IO 4</a>,<a href="lcd_io_8" class="link" title="LCD_IO 8">LCD_IO 8</a>,
<a href="lcd_io_10" class="link" title="LCD_IO 10">LCD_IO 10</a>
or
<a href="lcd_io_12" class="link" title="LCD_IO 12">LCD_IO 12</a>

</div>
