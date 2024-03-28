<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="lcd_io_10"></span>LCD\_IO 10

</div>

</div>

</div>

<span class="strong">**Using connection mode 10:**</span>

The LCD is controlled via I2C of a type 10 LCD 12C adapter. Use LCD\_IO
10 for the YwRobot LCD1602 IIC V1 or the Sainsmart LCD\_PIC I2C adapter.
To use mode 10 you must define the I2C ports as normal in your GCBASIC
code. Then, define the LCD type, set the I2C\_address of the LCD adapter
and the LCD speed, if required. Finally, set the backlight control, if
required.

<span class="strong">**Relevant Constants:**</span>

These constants are used to control settings for the Liquid Crystal
Display routines included with GCBASIC. To set them, place a line in the
main program file that uses \#define to assign a value to the particular
constant.

<div class="informaltable">

| <span class="strong">**Constant Name**</span> | <span class="strong">**Controls**</span> | <span class="strong">**Value**</span> |
|:----------------------------------------------|:-----------------------------------------|:--------------------------------------|
| `LCD_IO`                                      | The I/O mode. Must be 10                 | `10`                                  |
| `LCD_I2C_Address_1`                           | Address of I2C adapter                   | Default `0x4E`                        |
| `LCD_I2C_Address_2`                           | Address of I2C adapter                   | Not set                               |
| `LCD_I2C_Address_3`                           | Address of I2C adapter                   | Not set                               |
| `LCD_I2C_Address_4`                           | Address of I2C adapter                   | Not set                               |

</div>

For code examples see
<a href="http://github.com/Anobium/Great-Cow-BASIC-Demonstration-Sources/tree/master/LCD_Solutions" class="link">I2C LCD Solutions</a>.

See the separate sections of the Help file for the specifics of each
Connection Mode.

<span class="strong">**For more help, see**</span>
<a href="lcd_io_0" class="link" title="LCD_IO 0">LCD_IO 0</a>,
<a href="lcd_io_1" class="link" title="LCD_IO 1">LCD_IO 1</a>,
<a href="lcd_io_2" class="link" title="LCD_IO 2">LCD_IO 2</a>,
<a href="lcd_io_2_74xx164" class="link" title="LCD_IO 2_74xx164">LCD_IO 2_74xx164</a>,
<a href="lcd_io_2_74xx174" class="link" title="LCD_IO 2_74xx174">LCD_IO 2_74xx174</a>,
<a href="lcd_io_4" class="link" title="LCD_IO 4">LCD_IO 4</a>,
<a href="lcd_io_8" class="link" title="LCD_IO 8">LCD_IO 8</a>,
<a href="lcd_io_12" class="link" title="LCD_IO 12">LCD_IO 12</a>

</div>
