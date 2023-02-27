<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="lcd_overview"></span>LCD Overview

</div>

</div>

</div>

<span class="strong">**Introduction:**</span>

The LCD routines in this section allow Great Cow BASIC programs to
control an alphanumeric Liquid Crystal Displays based on the <span
class="strong">**HD44780**</span> IC. This covers most 16 x 1, 16 x 2,
20 x 4 and 40 x 4 LCD displays.

The Great Cow BASIC methods allow the displays to be connected to the
microcontroller

<span class="strong">**Connection Modes:**</span>

The table below shows the connection modes. These modes support the
connection to the LCD using differting methods.

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: center;">Connection Mode</th>
<th style="text-align: left;">Required Connections</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: center;"><p>0</p></td>
<td style="text-align: left;"><p>No configuration is required directly by this method. The LCD routines <span class="strong"><strong>must</strong></span> be provided with other subroutines which will handle the communication. This is useful for communicating with LCDs connected through RS232 or I2C.<br />
This is an advanced method of driving an LCD.</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1</p></td>
<td style="text-align: left;"><p>Uses a combined data and clock line. This mode is used when the LCD is connected through a shift register 74HC595, as detailed at <a href="http://gcbasic.sourceforge.net/library/DIAGRAMS/1-Wire%20LCD/" class="link"><span class="strong"><strong>here</strong></span></a>.<br />
This method of driving an LCD requires an additional integrated circuit and other passive components. This is not recommended for the beginner.</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>2</p></td>
<td style="text-align: left;"><p>Uses separated Data and Clock lines. This mode is used when the LCD is connected through a 74LS174 shift register IC, as detailed at <a href="http://gcbasic.sourceforge.net/library/DIAGRAMS/2-Wire%20LCD/" class="link"><span class="strong"><strong>here</strong></span></a><br />
This method of driving an LCD requires additional integrated circuits and other passive components. This is not recommended for the beginner.</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>3</p></td>
<td style="text-align: left;"><p><code class="literal">DB</code>, <code class="literal">CB</code>, <code class="literal">EB</code> are connected to the microcontroller as the Data, Clock and Enable Bits.<br />
This a common method to connect a microcontroller to an LCD. This requires 3 data ports on the microcontroller.</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>4</p></td>
<td style="text-align: left;"><p><code class="literal">R/W</code>, <code class="literal">RS</code>, <code class="literal">Enable</code> and the highest 4 data lines (<code class="literal">DB4</code> through <code class="literal">DB7</code>) are connected to the microcontroller. The use of the R/W line is optional.<br />
This a common method to connect a microcontroller to an LCD. This requires 7(6) data ports on the microcontroller.</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>8</p></td>
<td style="text-align: left;"><p><code class="literal">R/W</code>, <code class="literal">RS</code>, <code class="literal">Enable</code> and all 8 data lines. The data lines must all be connected to the same I/O port, in sequential order. For example, <code class="literal">DB0</code> to <code class="literal">PORTB.0</code>, <code class="literal">DB1</code> to <code class="literal">PORTB.1</code> and so on, with`DB7` going to <code class="literal">PORTB.7</code>.<br />
This is a common method to connect a microcontroller to a LCD. This requires 11(10) data ports on the microcontroller.</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>10</p></td>
<td style="text-align: left;"><p>The LCD is controlled via I2C. A type 10 LCD 12C adapter. Set <code class="literal">LCD_IO</code> to <code class="literal">10</code> for the YwRobot LCD1602 IIC V1 or the Sainsmart LCD_PIC I2C adapter<br />
This is a common method and requires two data ports on the microcontroller.</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>12</p></td>
<td style="text-align: left;"><p>The LCD is controlled via I2C. A type 12 LCD 12C adapter. Set <code class="literal">LCD_IO</code> to `12`for the Ywmjkdz I2C adapter with a potentiometer (variable resistance) bent over top of chip.<br />
This is a common method and requires two data ports on the microcontroller.</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>107</p></td>
<td style="text-align: left;"><p>The LCD is controlled via serial. Set <code class="literal">LCD_IO</code> to <code class="literal">107</code> or <code class="literal">K107</code>.<br />
The K107 requires one serial data ports on the microcontroller.</p></td>
</tr>
</tbody>
</table>

</div>

  
  

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

### Supported LCDs mapped to Connection Mode

The support of various types of LCD displays are shown in the following
table.

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;">Supported LCD Type<br />
number of characters x number of lines</th>
<th style="text-align: left;">Connection Mode</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p>16 x 1, 16 x 2, 20 x 2, 20 x 4 type LCD displays,<br />
also known as 1601, 1602, 2002, 2004 type LCD displays.</p></td>
<td style="text-align: left;"><p>0,1,2,4,8,10 and 12</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>40 x 4 LCD displays,<br />
also known as 4004 type LCD displays.</p></td>
<td style="text-align: left;"><p>4</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>16 x 1 LCD displays, with a non-standard/non-consective memory map.<br />
</p>
<p>This LCD sub type is supported using a specific constant.</p>
<p>Use <code class="literal">#define LCD_VARIANT 1601a</code> to use this sub variant.</p>
<p>Also known as 1601 type LCD displays.</p></td>
<td style="text-align: left;"><p>Supports any LCD_IO mode.</p></td>
</tr>
</tbody>
</table>

</div>

</div>

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

### Communication Performance

There may be a need to change the communication performance for a
specific LCD as some LCD’s are slower to operate. Great Cow BASIC
supports change the communications speed.

To change the performance (communications speed) of the LCD use
`#DEFINE LCD_SPEED`. This method allows the timing to be optimised.

<span class="emphasis">*Example*</span>

``` screen
 #DEFINE LCD_SPEED  FAST
```

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;">Define</th>
<th style="text-align: left;">Performance Characteristics</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">LCD_SPEED</code></p></td>
<td style="text-align: left;"><p><code class="literal">FAST</code> - The speed is approximately 20,000 CPS.<br />
<code class="literal">MEDIUM</code> - The speed is approximately 15,000 CPS.<br />
<code class="literal">SLOW</code> - The speed is approximately 10,000 CPS.<br />
<code class="literal">OPTIMAL</code> - The speed is approximately 30,000 CPS.<br />
</p></td>
</tr>
</tbody>
</table>

</div>

If `LCD_SPEED` is not defined, the speed defaults to `SLOW`  
  
     

</div>

**Using LCD\_Speed OPTIMAL  
. **  

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

### Note

   `OPTIMAL` disables fixed delays and allows the LCD operate as fast as
it can.  In this mode, The the busy flag is polled before each byte is
sent to the HD44780 controller.   This not only optimizes speed, but
also assures that data is not sent to the diplay controler until it is
ready to receive the data.

With most displays this equates to a speed of about 30,000 characters
per second.  For comparision about 10 times faster than I2C using a
PC8574 Expander (See LCD\_IO 10 or See LCD\_IO 112)

`OPTIMAL` is only supported in LCD\_IO 4,8 and only when LCD\_NO\_RW is
not defined (RW Mode).  When `#DEFINE LCD_NO_RW` is defined, reading
data from the HD44780 is not possible since this disables Read Mode on
the controller.  In this case busy flag checking is not available and
the GET subroutine is not avaiable.

In order to enable busy flag checking, and, therefore to use the `GET`
command the following criteria must be true.

<div class="orderedlist">

1.  LCD I/O Mode must be either 4-wire or 8-wire
2.  `#DEFINE LCD_NO_RW` is not defined
3.  An I\\O pin is connected between the microcontroller and the RW
    connection on the LCD Display
4.  `'DEFINE LCD_RW  port.pin` is defined in the Great Cow BASIC source
    code

</div>

Example:

``` screen
  #DEFINE LCD_IO 4
  #DEFINE LCD_SPEED OPTIMAL

  #DEFINE LCD_DB7 PORTB.5
  #DEFINE LCD_DB6 PORTB.4
  #DEFINE LCD_DB5 PORTB.3
  #DEFINE LCD_DB4 PORTB.2

  #DEFINE LCD_RW PORTA.3    'Must be defined for RW Mode
  #DEFINE LCD_RS PORTA.2
  #DEFINE LCD_ENABLE PORTA.1
```

</div>

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

### Changing the LCD Width

To change the LCD width characteristics use `#define LCD_WIDTH`

</div>

  
  

See the separate sections of the Help file for the specifics of each
Connection Mode.

<span class="strong">**For more help, see**</span>
<a href="lcd_io_0" class="link" title="LCD_IO 0">LCD_IO 0</a>,
<a href="lcd_io_1" class="link" title="LCD_IO 1">LCD_IO 1</a>,
<a href="lcd_io_2" class="link" title="LCD_IO 2">LCD_IO 2</a>,
<a href="lcd_io_3" class="link" title="LCD_IO 3">LCD_IO 3</a>,
<a href="lcd_io_2_74xx164" class="link" title="LCD_IO 2_74xx164">LCD_IO_2 74xx164</a>,
<a href="lcd_io_2_74xx174" class="link" title="LCD_IO 2_74xx174">LCD_IO_2 74xx174</a>,
<a href="lcd_io_4" class="link" title="LCD_IO 4">LCD_IO 4</a>,
<a href="lcd_io_8" class="link" title="LCD_IO 8">LCD_IO 8</a>,
<a href="lcd_io_10" class="link" title="LCD_IO 10">LCD_IO 10</a>
or
<a href="lcd_io_12" class="link" title="LCD_IO 12">LCD_IO 12</a>

<span class="strong">**and,**</span>

<a href="lcd_width" class="link" title="LCD_WIDTH">LCD_Width</a>,
<a href="lcd_speed" class="link" title="LCD_SPEED">LCD_Speed</a>

</div>
