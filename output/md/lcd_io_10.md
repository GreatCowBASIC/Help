<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="lcd_io_10"></span>LCD\_IO 10

</div>

</div>

</div>

LCD\_IO 10 provides support for character LCD modules that use an
I2C/TWI interface based on the <span class="strong">**PCF8574 or
PCF8574A I/O expander**</span>.   These I/O expanders are commonly found
on low‑cost LCD “I2C backpacks” sold under many brand names (YwRobot,
Sainsmart, Joy-It, generic blue/black I2C adapters, etc.).

The PCF8574 device converts an I2C bus signal into 8 digital output
lines, which are then wired to the LCD’s RS, EN, D4–D7, and backlight
control pins.  

`LCD_IO 10` implements the correct signalling for this type of <span
class="strong">**I/O expander**</span>.

Use `LCD_IO 10` whenever your LCD module uses a <span
class="strong">**PCF8574‑based I2C adapter**</span>, regardless of brand
or PCB layout.  You can configure the specific LCD port layout, if
required.

To use mode 10:

<div class="orderedlist">

1.  Configure your I2C/TWI pins normally in your GCBASIC program.
2.  Define the LCD type by using `LCD_IO 10`
3.  Set the I2C address of the PCF8574 adapter, if required.  Typical
    PCF8574 I2C addresses range from <span class="strong">**0x40 to
    0x4E**</span>, depending on the A0–A2 jumper settings on the adapter
    board.
4.  Optionally set LCD speed and backlight behaviour.
5.  Optionally set the LCD port layout.

</div>

<span class="strong">**Relevant Constants**</span>

These constants configure the Liquid Crystal Display routines in
GCBASIC. Add them to your main program using `#define`.

<div class="informaltable">

| <span class="strong">**Constant Name**</span> | <span class="strong">**Controls**</span>               | <span class="strong">**Value**</span>   |
|:----------------------------------------------|:-------------------------------------------------------|:----------------------------------------|
| `LCD_IO`                                      | Selects the I/O mode. Must be 10 for PCF8574 I2C LCDs. | `10`                                    |
| <span class="strong">**Constant Name**</span> | <span class="strong">**Controls**</span>               | <span class="strong">**Default**</span> |
| I2C\_LCD\_E                                   | LCD Enable - Expander Port Bit                         | `I2C_LCD_BYTE.2`                        |
| I2C\_LCD\_RW                                  | LCD RW - Expander Port Bit                             | `I2C_LCD_BYTE.1`                        |
| I2C\_LCD\_RS                                  | LCD RS - Expander Port Bit                             | `I2C_LCD_BYTE.0`                        |
| I2C\_LCD\_BL                                  | LCD Back Light - Expander Port Bit                     | `I2C_LCD_BYTE.3`                        |
| I2C\_LCD\_D4                                  | LCD Data Bit4 - Expander Port Bit                      | `I2C_LCD_BYTE.4`                        |
| I2C\_LCD\_D5                                  | LCD Data Bit5 - Expander Port Bit                      | `I2C_LCD_BYTE.5`                        |
| I2C\_LCD\_D6                                  | LCD Data Bit6 - Expander Port Bit                      | `I2C_LCD_BYTE.6`                        |
| I2C\_LCD\_D7                                  | LCD Data Bit7 - Expander Port Bit                      | `I2C_LCD_BYTE.7`                        |
|                                               |                                                        |                                         |
| `LCD_I2C_ADDRESS_1`                           | PCF8574 I2C address (A0–A2 = 111)                      | `0x4E`                                  |
| `LCD_I2C_ADDRESS_2`                           | PCF8574 I2C address (A0–A2 = 110)                      | `0x4C`                                  |
| `LCD_I2C_ADDRESS_3`                           | PCF8574 I2C address (A0–A2 = 101)                      | `0x4A`                                  |
| `LCD_I2C_ADDRESS_4`                           | PCF8574 I2C address (A0–A2 = 100)                      | `0x48`                                  |
| `LCD_I2C_ADDRESS_5`                           | PCF8574 I2C address (A0–A2 = 011)                      | `0x46`                                  |
| `LCD_I2C_ADDRESS_6`                           | PCF8574 I2C address (A0–A2 = 010)                      | `0x44`                                  |
| `LCD_I2C_ADDRESS_7`                           | PCF8574 I2C address (A0–A2 = 001)                      | `0x42`                                  |
| `LCD_I2C_ADDRESS_8`                           | PCF8574 I2C address (A0–A2 = 000)                      | `0x40`                                  |

</div>

<span class="strong">**Example Usage**</span>

This example demonstrates using two PCF8574‑based I2C LCDs on the same
I2C bus. Up to eight LCDs may be connected simultaneously, each with a
unique PCF8574 address (0x40–0x4E).

``` programlisting
    Set up I2C-LCD

    #DEFINE LCD_IO 10

    /*  LCD_IO 10 is for PCF8574-based I2C LCD adapters.
        Examples include YwRobot LCD1602 IIC V1, Sainsmart LCD_PIC,
        and most generic blue/black I2C LCD backpacks.

        LCD_IO 12 is used for adapters based on the Ywmjkdz layout
        with the potentiometer bent over the IC.
    */

    #DEFINE LCD_I2C_ADDRESS_1 0x4E   ' First LCD at address 0x4E

    PRINT "Hello World"
```

This example demonstrates using two PCF8574‑based I2C LCDs on the same
I2C bus. Up to eight LCDs may be connected simultaneously, each with a
unique PCF8574 address (0x40–0x4E).

``` programlisting
    Set up I2C-LCD

    #DEFINE LCD_IO 10

    /*  LCD_IO 10 is for PCF8574-based I2C LCD adapters.
        Examples include YwRobot LCD1602 IIC V1, Sainsmart LCD_PIC,
        and most generic blue/black I2C LCD backpacks.

        LCD_IO 12 is used for adapters based on the Ywmjkdz layout
        with the potentiometer bent over the IC.
    */

    #DEFINE LCD_I2C_ADDRESS_1 0x4E   ' First LCD at address 0x4E
    #DEFINE LCD_I2C_ADDRESS_6 0x44   ' Second LCD at address 0x44

    ' Switch between LCDs:
    LCD_I2C_ADDRESS_Current = LCD_I2C_ADDRESS_6   ' Activate second LCD
        PRINT "Hello World"

    LCD_I2C_ADDRESS_Current = LCD_I2C_ADDRESS_1   ' Activate first LCD
        PRINT "Hello World"
```

See other sections of the Help file for details on alternative
connection modes.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="lcd_io_0" class="link" title="LCD_IO 0">LCD_IO 0</a> — single
    subroutine, software-driven mode
-   <a href="lcd_io_1" class="link" title="LCD_IO 1">LCD_IO 1</a> — 1-wire,
    via a 74HC595 shift register
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
