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
| `LCD_I2C_ADDRESS_1`                           | Address of I2C adapter                   | `Default = 0x4E`                      |
| `LCD_I2C_ADDRESS_2`                           | Address of I2C adapter                   | `Recommended = 0x4C`                  |
| `LCD_I2C_ADDRESS_3`                           | Address of I2C adapter                   | `Recommended = 0x4A`                  |
| `LCD_I2C_ADDRESS_4`                           | Address of I2C adapter                   | `Recommended = 0x48`                  |
| `LCD_I2C_ADDRESS_5`                           | Address of I2C adapter                   | `Recommended = 0x46`                  |
| `LCD_I2C_ADDRESS_6`                           | Address of I2C adapter                   | `Recommended = 0x44`                  |
| `LCD_I2C_ADDRESS_7`                           | Address of I2C adapter                   | `Recommended = 0x42`                  |
| `LCD_I2C_ADDRESS_8`                           | Address of I2C adapter                   | `Recommended = 0x40`                  |

</div>

<span class="strong">**Example Usage**</span>

An example for using two I2C-LCD. This example can be extended to
support more than two or more ( up to eight ) I2C-LCD(s).

This example shows you can have up to eight LCD on the I2C-Bus (8
Addresses 0x40 to 0x4E of the PCF8574-Adaptor).

``` screen
    // Set up I2C-LCD
    #DEFINE LCD_IO 10

    /*  Set LCD_IO to 10 for the YwRobot LCD1602 IIC V1 or the Sainsmart LCD_PIC I2C adapter
    Set LCD_IO to 12 for the Ywmjkdz I2C adapter with pot bent over top of chip */

    #DEFINE LCD_I2C_ADDRESS_1 0x4E ' prepare the first LCD on Address 0x4E
    #DEFINE LCD_I2C_ADDRESS_6 0x44 ' prepare the second LCD on Address 0x44

    // To switch between the two LCD can be done with

    LCD_I2C_ADDRESS_Current = LCD_I2C_ADDRESS_6 // now the second I2C-LCD is active

    // or

    LCD_I2C_ADDRESS_Current = LCD_I2C_ADDRESS_1 //  now the first I2C-LCD is active
```

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
