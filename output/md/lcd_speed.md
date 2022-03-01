<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="lcd_speed"></span>LCD\_SPEED

</div>

</div>

</div>

<span class="strong">**Using LCD\_SPEED:**</span>

The communication performance of a LCD display can be controlled via a
`#DEFINE`. This method allows the timing to be optimised.

<span class="strong">**Example**</span>

``` literallayout
#DEFINE LCD_SPEED  FAST
```

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;">Define</th>
<th style="text-align: left;">Required Connections</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">LCD_SPEED</code></p></td>
<td style="text-align: left;"><p>Options are:<br />
<code class="literal">FAST</code> - The speed is approximately 20,000 CPS.<br />
<code class="literal">MEDIUM</code> - The speed is approximately 15,000 CPS.<br />
<code class="literal">SLOW</code> - The speed is approximately 10,000 CPS.<br />
<code class="literal">OPTIMAL</code> - The speed is approximately 30,000 CPS.<br />
</p></td>
</tr>
</tbody>
</table>

</div>

If `LCD_SPEED` is not defined, the speed defaults to `SLOW`  
  
To change the performance (communications speed) of the LCD use
`#DEFINE LCD_SPEED`. This method allows the timing to be optimised.

<span class="strong">**Example**</span>

``` screen
  #DEFINE LCD_SPEED  FAST
```

If `LCD_SPEED` is not defined, the speed defaults to `SLOW`

<span class="strong">**Speed Parameter OPTIMAL**</span>

WHEN LCD\_NO\_RW is not defined, OPTIMAL disables fixed delays and
allows the LCD operate as fast as it can.

In this mode, The the busy flag is polled before each byte is sent to
the HD44780 controller.   This not only optimizes speed, but also
assures that data is not sent to the diplay controler until it is ready
to receive the data.

With most displays this equates to a speed of about 30,000 characters
per second. For comparision about 10 times faster than I2C using a
PC8574 Expander (See LCD\_IO 10 or See LCD\_IO 112)

`OPTIMAL` is only supported in LCD\_IO 4,8 and only when LCD\_NO\_RW is
not defined (RW Mode)

When `#DEFINE LCD_NO_RW` is defined, reading data from the HD44780 is
not possible since this disables Read Mode on the controller.  In this
case busy flag checking is not available and the GET subroutine is not
avaiable.

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
  #DEFINE LCD_DB7 PORTB.3
  #DEFINE LCD_DB6 PORTB.2

  #DEFINE LCD_RW PORTA.3    'Must be defined for RW Mode
  #DEFINE LCD_RS PORTA,2
  #DEFINE LCD_ENABLE PORTA.1
```

</div>
