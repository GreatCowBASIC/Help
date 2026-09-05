<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="lcd_io_4"></span>LCD\_IO 4

</div>

</div>

</div>

<span class="strong">**Using connection mode 4:**</span>

To use connection mode 4 the R/W, RS, Enable control lines and the
highest 4 data lines (DB4 through DB7) must be connected to the
microcontroller.

<span class="strong">**Relevant Constants:**</span>

Specific constants are used to control settings for the Liquid Crystal
Display routines included with GCBASIC. To set these constants the main
program should specific constants to support the connection mode using
\#define. Constants required for connection mode 4.

Constants are required for 4-bit mode as follows.

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;"><span class="strong"><strong>Constant Name</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Controls</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Default Value</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">LCD_SPEED</code></p></td>
<td style="text-align: left;"><p><code class="literal">FAST</code>, <code class="literal">MEDIUM</code> or <code class="literal">SLOW</code>.</p></td>
<td style="text-align: left;"><p><code class="literal">MEDIUM</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">LCD_IO</code></p></td>
<td style="text-align: left;"><p>Must be <span class="strong"><strong>4</strong></span></p></td>
<td style="text-align: left;"><p><code class="literal">4</code></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">LCD_RS</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to Register Select on the LCD.</p></td>
<td style="text-align: left;"><p>Must be defined as <code class="literal">port.bit</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">LCD_RW</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to Read/Write on the LCD. The R/W pin can be disabled*.</p></td>
<td style="text-align: left;"><p>Must be defined as <code class="literal">port.bit</code> <span class="emphasis"><em>(unless R/W is disabled)</em></span></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">LCD_Enable</code></p></td>
<td style="text-align: left;"><p>Specifies the output pin that is connected to Read/Write on the LCD.</p></td>
<td style="text-align: left;"><p>Must be defined as <code class="literal">port.bit</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">LCD_DB4</code></p></td>
<td style="text-align: left;"><p>Output pin used to interface with bit 4 of the LCD data bus</p></td>
<td style="text-align: left;"><p>Must be defined as <code class="literal">port.bit</code></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">LCD_DB5</code></p></td>
<td style="text-align: left;"><p>Output pin used to interface with bit 5 of the LCD data bus</p></td>
<td style="text-align: left;"><p>Must be defined as <code class="literal">port.bit</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">LCD_DB6</code></p></td>
<td style="text-align: left;"><p>Output pin used to interface with bit 6 of the LCD data bus</p></td>
<td style="text-align: left;"><p>Must be defined as <code class="literal">port.bit</code></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">LCD_DB7</code></p></td>
<td style="text-align: left;"><p>Output pin used to interface with bit 7 of the LCD data bus</p></td>
<td style="text-align: left;"><p>Must be defined as <code class="literal">port.bit</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
<td style="text-align: left;"> </td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">LCD_VFD_DELAY</code></p></td>
<td style="text-align: left;"><p>Specifies a delay between transmission of data nibbles to LCD or VFD.</p>
<p>Usage must include number value and unit of time.</p>
<p><code class="literal">#DEFINE LCD_VFD_DELAY 1 ms</code></p>
<p>Only applicable when using LCD_IO 4</p></td>
<td style="text-align: left;"><p>None.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">LCD_OCULAR_OM1614</code></p></td>
<td style="text-align: left;"><p>Specifies OCULAR OM1614 suppport. This changes the intialisation routine to a specific routine for the OCULAR devices.</p></td>
<td style="text-align: left;"><p>To specify explicit OCULAR_OM1614 support <code class="literal">#DEFINE LCD_OCULAR_OM1614</code></p>
<p>The OCULAR devices requires LCD_RW</p></td>
</tr>
</tbody>
</table>

</div>

The `R/W` pin can be disabled by setting the `LCD_NO_RW` constant. If
this is done, there is no need for the `R/W` to be connected to the
chip, and no need for the `LCD_RW` constant to be set. Ensure that the
`R/W` line on the LCD is connected to ground if not used.

<span class="strong">**Example:**</span>

``` programlisting
    #chip 16F877A, 20

    ' Connection mode 4: a 4-bit parallel connection using the LCD's
    ' upper four data lines (DB4-DB7), plus RS and Enable. R/W is disabled
    ' here (LCD_NO_RW), so the LCD's R/W pin must be tied to ground.
    #define LCD_IO 4
    #define LCD_NO_RW

    #define LCD_RS      PORTA.7
    #define LCD_Enable  PORTA.6
    #define LCD_DB4     PORTB.4
    #define LCD_DB5     PORTB.5
    #define LCD_DB6     PORTB.6
    #define LCD_DB7     PORTB.7

    CLS

    Print "Hello World."          ' <<< the print instruction this page documents

    End
```

<span class="strong">**Key line:**</span> `Print "Hello World."` — each
character is written as two 4-bit nibbles over `LCD_DB4`-`LCD_DB7`,
strobed by `LCD_Enable`, exactly as the physical LCD’s HD44780-style
controller expects in 4-bit mode.

Also see further code examples at
<a href="http://github.com/Anobium/Great-Cow-BASIC-Demonstration-Sources/tree/master/LCD_Solutions" class="link">Four Wire LCD Solutions</a>.

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
