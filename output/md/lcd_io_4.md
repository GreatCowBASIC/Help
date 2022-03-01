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
Display routines included with Great Cow BASIC. To set these constants
the main program should specific constants to support the connection
mode using \#define. Constants required for connection mode 4.

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
</tbody>
</table>

</div>

The `R/W` pin can be disabled by setting the `LCD_NO_RW` constant. If
this is done, there is no need for the `R/W` to be connected to the
chip, and no need for the `LCD_RW` constant to be set. Ensure that the
`R/W` line on the LCD is connected to ground if not used.

For a code example download
<a href="http://gcbasic.sourceforge.net/library/DEMO%20CODE/Demo%20code%20for%20lcd/Demo%20mode%204.gcb" class="link">Four Wire LCD Example</a>.

Also see for further code examples see
<a href="http://github.com/Anobium/Great-Cow-BASIC-Demonstration-Sources/tree/master/LCD_Solutions" class="link">Four Wire LCD Solutions</a>.

See the separate sections of the Help file for the specifics of each
Connection Mode.

<span class="strong">**For more help, see**</span>
<a href="lcd_io_0" class="link" title="LCD_IO 0">LCD_IO 0</a>,
<a href="lcd_io_1" class="link" title="LCD_IO 1">LCD_IO 1</a>,
<a href="lcd_io_2" class="link" title="LCD_IO 2">LCD_IO 2</a>,
<a href="lcd_io_2_74xx164" class="link" title="LCD_IO 2_74xx164">LCD_IO 2_74xx164</a>,
<a href="lcd_io_2_74xx174" class="link" title="LCD_IO 2_74xx174">LCD_IO 2_74xx174</a>,
<a href="lcd_io_8" class="link" title="LCD_IO 8">LCD_IO 8</a>,
<a href="lcd_io_10" class="link" title="LCD_IO 10">LCD_IO 10</a>
or
<a href="lcd_io_12" class="link" title="LCD_IO 12">LCD_IO 12</a>

</div>
