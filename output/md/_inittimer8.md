<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_inittimer8"></span>InitTimer8

</div>

</div>

</div>

<span class="strong">**Syntax: (MicroChip PIC)**</span>

``` screen
    InitTimer8 prescaler, postscaler

or, where you required to state the clock source, use the following

    InitTimer8 clocksource, prescaler, postscaler
```

<span class="strong">**Syntax: (Atmel AVR)**</span>

``` screen
    InitTimer8 source, prescaler
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers with a Timer 8 module.  As shown above
a Microchip microcontroller can potentially support two types of methods
for initialisation.  
  
The first method is:  

``` screen
    InitTimer8 prescaler, postscaler
```

This the most common method to initialise a Microchip microcontroller
timer.  With this method the timer has only one possible clock source,
this mandated by the microcontrollers architecture, and that clock
source is the System Clock/4 also known as FOSC/4.  
  
  
The second method is much more flexible in term of the clock
source.  Microcontrollers that support this second method enable you to
select different clock sources and to select more prescale values.  The
method is shown below:  

``` screen
    InitTimer8 clocksource, prescaler, postscaler
```

<span class="strong">**How do you determine which method to use for your
specific Microchip microcontroller ?**</span>  
  
The timer type for a Microchip microcontroller can be determined by
checking for the existance of a T2CLKCON register, either in the
Datasheet or in the GCBASIC "dat file" for the specific device.  
  
If the Microchip microcontroller <span class="strong">**DOES
NOT**</span> have a T2CLKCON register then timers 2/4/6/8 for that
specific microcontroller chip use the first method, and are configured
using:  

``` screen
    InitTimer8 (PreScale, PostScale)
```

If the microcontroller <span class="strong">**DOES**</span> have a
T2CLKCON register then ALL timers 2/4/6/8 for that specific
microcontroller chip use the second method, and are configured using:

``` screen
    InitTimer8 (Source,PreScale,PostScale)
```

The possible Source, Prescale and Postscale constants for each type are
shown in the tables below.  These table are summary tables from the
Microchip datasheets.  
  

<span class="strong">**Period of the Timers**</span>

The Period of the timer is determined by the system clock speed, the
prescale value and 8-bit value in the respective timer period
register.  The timer period for timer 8 is held in register PR8.    

When the timer is enabled, by starting the timer, it will increment
until the TMR8 register matches the value in the PR8 register.  At this
time the TMR8 register is cleared to 0 and the timer continues to
increment until the next match, and so on.  

The lower the value of the PR8 register, the shorter the timer period
will be.  The default value for the PR8 register at power up is 255.  

The timer interrupt flag (TMR8IF) is set based upon the number of match
conditions as determine by the postscaler.  The postscaler does not
actually change the timer period, it changes the time between interrupt
conditions.  
  

<span class="strong">**Timer constants for the MicroChip
microcontrollers**</span>

Parameters for this timer are detailed in the tables below:

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;">Parameter</th>
<th style="text-align: left;">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">clocksource</code></p></td>
<td style="text-align: left;"><p>This is an optional parameter. Please review the datasheet for specific usage.<br />
 <br />
Source can be one of the following numeric values:<br />
 <br />
1 equates to OSC (FOSC/4).    The default clock source<br />
<br />
6 equates to EXTOSC same as SOSC<br />
5 equates to MFINTOSC<br />
4 equates to LFINTOSC<br />
3 equates to HFINTOSC<br />
2 equates to FOSC<br />
1 equates to FOSC/4 same as OSC<br />
0 equates to TxCKIPPS same as EXTOSC and EXT (T1CKIPPS)<br />
</p>
<p>Other sources may be available but can vary from microcontroller to microcontroller and these can be included manually per the specific microcontrollers datasheet.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">prescaler</code></p></td>
<td style="text-align: left;"><p>The value of the prescaler for this specific timer. See the tables below for permitted values.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">postscaler</code></p></td>
<td style="text-align: left;"><p>The value of the postscaler for this specific timer. See the tables below for permitted values.</p></td>
</tr>
</tbody>
</table>

</div>

<span class="strong">**Table 1 shown above**</span>

  
  

`prescaler` can be one of the following settings:

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: center;"><span class="strong"><strong>Prescaler Value</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Primary GCB Constant</strong></span></th>
<th style="text-align: center;"><span class="strong"><strong>Constant Equates<br />
to value</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: center;"><p>1:1</p></td>
<td style="text-align: left;"><p><code class="literal">PS8_1</code></p></td>
<td style="text-align: center;"><p>0</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:4</p></td>
<td style="text-align: left;"><p><code class="literal">PS8_4</code></p></td>
<td style="text-align: center;"><p>1</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:16</p></td>
<td style="text-align: left;"><p><code class="literal">PS8_16</code></p></td>
<td style="text-align: center;"><p>2</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:64</p></td>
<td style="text-align: left;"><p><code class="literal">PS8_64</code></p></td>
<td style="text-align: center;"><p>3</p></td>
</tr>
</tbody>
</table>

</div>

Note that a 1:64 prescale is only avaialable on certain midrange
microcontrollers. Please refer to the datasheet to determine if a 1:64
prescale is supported by a spectific microcontroller.

  
  

`postscaler` slows the rate of the interrupt generation (or WDT reset)
from a counter/timer by dividing it down.

On Microchip PIC microcontroller one of the following constants where
the Postscaler Rate Select bits are in the range of 1 to 16.

<div class="informaltable">

| <span class="strong">**Postcaler Value**</span> | <span class="strong">**Use Numeric Constant**</span> |
|:-----------------------------------------------:|:----------------------------------------------------:|
|                 1:1 Postscaler                  |                          0                           |
|                 1:2 Postscaler                  |                          1                           |
|                 1:3 Postscaler                  |                          2                           |
|                 1:4 Postscaler                  |                          3                           |
|                 1:5 Postscaler                  |                          4                           |
|                 1:6 Postscaler                  |                          5                           |
|                 1:7 Postscaler                  |                          6                           |
|                 1:8 Postscaler                  |                          7                           |
|                 1:9 Postscaler                  |                          8                           |
|                 1:10 Postscaler                 |                          9                           |
|                 1:11 Postscaler                 |                          10                          |
|                 1:12 Postscaler                 |                          11                          |
|                 1:13 Postscaler                 |                          12                          |
|                 1:14 Postscaler                 |                          13                          |
|                 1:15 Postscaler                 |                          14                          |
|                 1:16 Postscaler                 |                          15                          |

</div>

</div>
