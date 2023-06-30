<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="lcd_io_8"></span>LCD\_IO 8

</div>

</div>

</div>

<span class="strong">**Using connection mode 8:**</span>

Using connection mode will require `R/W`, `RS`, `Enable` and all 8 data
lines.

The data lines must all be connected to the same I/O port, in sequential
order. For example, `DB0` to `PORTB.0`, `DB1` to `PORTB.1` and so on,
with `DB7` going to `PORTB.7`.

<span class="strong">**Relevant Constants:**</span>

These constants are used to control settings for the Liquid Crystal
Display routines included with GCBASIC. To set them, place a line in the
main program file that uses `#define` to assign a value to the
particular constant.

Constants are required for 8-bit mode as follows.

<div class="informaltable">

| <span class="strong">**Constant Name**</span> | <span class="strong">**Controls**</span>                                                                                                 | <span class="strong">**Default Value**</span>                                                                                            |
|:----------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------|
| `LCD_SPEED`                                   | `FAST`, `MEDIUM` or `SLOW`.                                                                                                              | `MEDIUM`                                                                                                                                 |
| `LCD_IO`                                      | The I/O mode. Can be 2, 4 or 8.                                                                                                          | `8`                                                                                                                                      |
| `LCD_RS`                                      | Specifies the output pin that is connected to Register Select on the LCD.                                                                | <span class="strong">**<span class="emphasis">*Must be defined*</span>**</span>                                                          |
| `LCD_RW`                                      | Specifies the output pin that is connected to Read/Write on the LCD. The R/W pin can be disabled\*.                                      | <span class="strong">**<span class="emphasis">*Must be defined*</span>**</span> <span class="emphasis">*(unless R/W is disabled)*</span> |
| `LCD_Enable`                                  | Specifies the output pin that is connected to Read/Write on the LCD.                                                                     | <span class="strong">**<span class="emphasis">*Must be defined*</span>**</span>                                                          |
| `LCD_DATA_PORT`                               | Output port used to interface with LCD data bus                                                                                          | <span class="strong">**<span class="emphasis">*Must be defined*</span>**</span>                                                          |
| `LCD_LAT`                                     | Drives the port with `LATx` support. Resolves issues with faster Mhz and the Microchip PIC read/write/modify feature. See example below. | Optional                                                                                                                                 |

</div>

The `R/W` pin can be disabled by setting the `LCD_NO_RW` constant. If
this is done, there is no need for the `R/W` to be connected to the
chip, and no need for the `LCD_RW` constant to be set. Ensure that the
R/W line on the LCD is connected to ground if not used.

For a code example download
<a href="http://gcbasic.sourceforge.net/library/DEMO%20CODE/Demo%20code%20for%20lcd/Demo%20mode%208.gcb" class="link">Eight Wire LCD example</a>.

For code examples see
<a href="http://github.com/Anobium/Great-Cow-BASIC-Demonstration-Sources/tree/master/LCD_Solutions" class="link">Eight Wire Examples</a>.

See the separate sections of the Help file for the specifics of each
Connection Mode.

<span class="strong">**For more help, see**</span>
<a href="lcd_io_0" class="link" title="LCD_IO 0">LCD_IO 0</a>,
<a href="lcd_io_1" class="link" title="LCD_IO 1">LCD_IO 1</a>,
<a href="lcd_io_2" class="link" title="LCD_IO 2">LCD_IO 2</a>,
<a href="lcd_io_2_74xx164" class="link" title="LCD_IO 2_74xx164">LCD_IO 2_74xx164</a>,
<a href="lcd_io_2_74xx174" class="link" title="LCD_IO 2_74xx174">LCD_IO 2_74xx174</a>,
<a href="lcd_io_4" class="link" title="LCD_IO 4">LCD_IO 4</a>,
<a href="lcd_io_10" class="link" title="LCD_IO 10">LCD_IO 10</a>
or
<a href="lcd_io_12" class="link" title="LCD_IO 12">LCD_IO 12</a>

</div>
