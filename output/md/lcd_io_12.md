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
Display routines included with Great Cow BASIC. To set them, place a
line in the main program file that uses `#define` to assign a value to
the particular constant.

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
<td style="text-align: left;"><p>Address of I2C adapter</p></td>
<td style="text-align: left;"><p>Not set</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">LCD_I2C_Address_2</code></p></td>
<td style="text-align: left;"><p>Address of I2C adapter</p></td>
<td style="text-align: left;"><p>Not set</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">LCD_I2C_Address_2</code></p></td>
<td style="text-align: left;"><p>Address of I2C adapter</p></td>
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

For code examples see
<a href="http://github.com/Anobium/Great-Cow-BASIC-Demonstration-Sources/tree/master/LCD_Solutions" class="link">I2C LCD Solutions</a>.

See the separate sections of the Help file for the specifics of each
Connection Mode.

<span class="strong">**For more help, see**</span>
<a href="lcd_io_0" class="link" title="LCD_IO 0">LCD_IO 0</a>,
<a href="lcd_io_1" class="link" title="LCD_IO 1">LCD_IO 1</a>,
<a href="lcd_io_2" class="link" title="LCD_IO 2">LCD_IO 2</a>
<a href="lcd_io_2_74xx164" class="link" title="LCD_IO 2_74xx164">LCD_IO 2_74xx164</a>,
<a href="lcd_io_2_74xx174" class="link" title="LCD_IO 2_74xx174">LCD_IO 2_74xx174</a>,
<a href="lcd_io_4" class="link" title="LCD_IO 4">LCD_IO 4</a>,
<a href="lcd_io_8" class="link" title="LCD_IO 8">LCD_IO 8</a>,
<a href="lcd_io_10" class="link" title="LCD_IO 10">LCD_IO 10</a>

</div>
