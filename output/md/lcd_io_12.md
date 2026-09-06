<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="lcd_io_12"></span>LCD\_IO 12

</div>

</div>

</div>

<span class="strong">**Using connection mode 12:**</span>

The LCD is controlled via I2C. A type 12 is the Ywmjkdz I2C adapter with
potentiometer variable resistor) bent over top of chip. To use mode 12
you must define the I2C ports as normal in your GCB code. Then, define
the LCD type, set the I2C\_address of the LCD adapter and the LCD speed,
if required.

<span class="strong">**Relevant Constants:**</span>

These constants are used to control settings for the Liquid Crystal
Display routines included with GCBASIC. To set them, place a line in the
main program file that uses `#define` to assign a value to the
particular constant.

When using 2-bit mode only three constants must be set - all others can
be ignored.

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;"><span class="strong"><strong>Constant Name</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Controls</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Value</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">LCD_IO</code></p></td>
<td style="text-align: left;"><p>I/O mode</p></td>
<td style="text-align: left;"><p><code class="literal">12</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">LCD_I2C_Address_1</code></p></td>
<td style="text-align: left;"><p>Address of I2C adapter</p></td>
<td style="text-align: left;"><p>Default <code class="literal">0x4E</code><br />
could also be <code class="literal">0x27</code></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">LCD_I2C_Address_2</code></p></td>
<td style="text-align: left;"><p>Address of a second I2C adapter, for multiple-adapter use</p></td>
<td style="text-align: left;"><p>Not set</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">LCD_I2C_Address_3</code></p></td>
<td style="text-align: left;"><p>Address of a third I2C adapter, for multiple-adapter use</p></td>
<td style="text-align: left;"><p>Not set</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">LCD_I2C_Address_4</code></p></td>
<td style="text-align: left;"><p>Address of a fourth I2C adapter, for multiple-adapter use</p></td>
<td style="text-align: left;"><p>Not set</p></td>
</tr>
</tbody>
</table>

</div>

To set the correct address see the picture below:

<div class="informalfigure">

<div class="mediaobject" align="center">

![graphic](./images/lcd_io12b1.JPG)

</div>

</div>

<span class="strong">**Example:**</span>

``` programlisting
    #chip 16F877A, 20

    ' Connection mode 12: I2C via a Ywmjkdz-layout adapter (the variant with
    ' the contrast potentiometer bent over the top of the chip).
    #define I2C_MODE Master
    #define I2C_DATA PORTC.4
    #define I2C_CLOCK PORTC.5

    #define LCD_IO 12
    #define LCD_I2C_Address_1 0x4E          ' <<< the I2C address this page's constant table documents

    CLS
    Print "Hello World."
```

<span class="strong">**Key line:**</span>
`#define LCD_I2C_Address_1 0x4E` — sets the I2C address of the adapter
this page documents; see
<a href="multiple_i2c_adapters_lcd_io_12" class="link" title="Multiple I2C Adapters (LCD_IO 12)">Multiple I2C Adapters (LCD_IO 12)</a>
for driving up to four of these adapters on the same bus.

For further code examples see [I2C LCD
Solutions](https://github.com/Anobium/Great-Cow-BASIC-Demonstration-Sources/tree/master/LCD_Solutions).

See the separate sections of the Help file for the specifics of each
Connection Mode.

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
-   <a href="lcd_io_10" class="link" title="LCD_IO 10">LCD_IO 10</a> — I2C
    via a PCF8574/PCF8574A I/O expander
-   <a href="lcd_io_14" class="link" title="LCD_IO 14">LCD_IO 14</a> — SPI
    expander
-   <a href="lcd_io_16" class="link" title="LCD_IO 16">LCD_IO 16</a> — PIC16LF72
    SPI expander
-   <a href="lcd_io_107" class="link" title="LCD_IO 107">LCD_IO 107</a> — K107
    serial adapter

</div>

</div>
