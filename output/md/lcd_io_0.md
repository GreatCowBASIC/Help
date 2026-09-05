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

<span class="strong">**Example:**</span>

``` programlisting
    #chip 16F877A, 20

    ' Connection mode 0: every byte written to the LCD is handled by a custom
    ' subroutine instead of GCBASIC's built-in LCD_IO wiring. This example's
    ' subroutine sends the byte over I2C to a remote LCD driver.
    #define LCD_IO 0
    #define LCD_NO_RW
    #define LCDWriteByte MySendToLCD

    cls
    print "Hello World."          ' <<< the print instruction this page documents

    end

    Sub MySendToLCD(In MyLCDByte)

        'Uses I2C.
        'Sends an address byte (128), then a control byte where bit 4 is the
        'state of the RS pin, then a data byte, which is sent to the LCD.

        ControlByte = 0
        If LCD_RS = On Then ControlByte.4 = On

        I2CStart
        I2CSend 128
        I2CSend ControlByte
        I2CSend MyLCDByte
        I2CStop

        'Allow time for the receiver to update the LCD.
        Wait 5 ms

    End Sub
```

<span class="strong">**Key line:**</span>
`print "Hello World."` — exercises the connection exactly like any other
LCD\_IO mode; `LCDWriteByte` transparently calls `MySendToLCD` for every
byte `print` sends, so higher-level commands need no special handling
for connection mode 0.

See the separate sections of the Help file for the specifics of each
Connection Mode.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

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
