<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_inittimer2"></span>InitTimer2

</div>

</div>

</div>

<span class="strong">**Syntax: (MicroChip PIC)**</span>

``` screen
    InitTimer2 prescaler, postscaler

or, where you required to state the clock source, use the following

    InitTimer2 clocksource, prescaler, postscaler
```

<span class="strong">**Syntax: (Atmel AVR)**</span>

``` screen
    InitTimer2 source, prescaler
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers with a Timer 2 module.  As shown above
a Microchip microcontroller can potentially support two types of methods
for initialisation.  
  
The first method is:  

``` screen
    InitTimer2 prescaler, postscaler
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
    InitTimer2 clocksource, prescaler, postscaler
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
    InitTimer2 (PreScale, PostScale)
```

If the microcontroller <span class="strong">**DOES**</span> have a
T2CLKCON register then ALL timers 2/4/6/8 for that specific
microcontroller chip use the second method, and are configured using:

``` screen
    InitTimer2 (Source,PreScale,PostScale)
```

The possible Source, Prescale and Postscale constants for each type are
shown in the tables below.  These table are summary tables from the
Microchip datasheets.  
  

<span class="strong">**Period of the Timers**</span>

The Period of the timer is determined by the system clock speed, the
prescale value and 8-bit value in the respective timer period
register.  The timer period for timer 2 is held in register PR2.    

When the timer is enabled, by starting the timer, it will increment
until the TMR2 register matches the value in the PR2 register.  At this
time the TMR2 register is cleared to 0 and the timer continues to
increment until the next match, and so on.  

The lower the value of the PR2 register, the shorter the timer period
will be.  The default value for the PR2 register at power up is 255.  

The timer interrupt flag (TMR2IF) is set based upon the number of match
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
  

`prescaler` can be one of the following settings, if you MicroChip
microcontroller has the T2CKPS4 bit then refer to table 3:

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
<td style="text-align: left;"><p><code class="literal">PS2_1</code></p></td>
<td style="text-align: center;"><p>0</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:4</p></td>
<td style="text-align: left;"><p><code class="literal">PS2_4</code></p></td>
<td style="text-align: center;"><p>1</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:16</p></td>
<td style="text-align: left;"><p><code class="literal">PS2_16</code></p></td>
<td style="text-align: center;"><p>2</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:64</p></td>
<td style="text-align: left;"><p><code class="literal">PS2_64</code></p></td>
<td style="text-align: center;"><p>3</p></td>
</tr>
</tbody>
</table>

</div>

<span class="strong">**Table 2 shown above**</span>  
  
Note that a 1:64 prescale is only avaialable on certain midrange
microcontrollers. Please refer to the datasheet to determine if a 1:64
prescale is supported by a spectific microcontroller.  
  

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
<td style="text-align: left;"><p><code class="literal">PS2_1</code></p></td>
<td style="text-align: center;"><p>0</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:2</p></td>
<td style="text-align: left;"><p><code class="literal">PS2_2</code></p></td>
<td style="text-align: center;"><p>1</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:4</p></td>
<td style="text-align: left;"><p><code class="literal">PS2_4</code></p></td>
<td style="text-align: center;"><p>2</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:8</p></td>
<td style="text-align: left;"><p><code class="literal">PS2_8</code></p></td>
<td style="text-align: center;"><p>3</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:16</p></td>
<td style="text-align: left;"><p><code class="literal">PS2_16</code></p></td>
<td style="text-align: center;"><p>4</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:32</p></td>
<td style="text-align: left;"><p><code class="literal">PS2_32</code></p></td>
<td style="text-align: center;"><p>5</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:64</p></td>
<td style="text-align: left;"><p><code class="literal">PS2_64</code></p></td>
<td style="text-align: center;"><p>6</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:128</p></td>
<td style="text-align: left;"><p><code class="literal">PS2_128</code></p></td>
<td style="text-align: center;"><p>7</p></td>
</tr>
</tbody>
</table>

</div>

<span class="strong">**Table 3 shown above**</span>  
  

`postscaler` slows the rate of the interrupt generation (or WDT reset)
from a counter/timer by dividing it down.

On Microchip PIC microcontroller one of the following constants where
the Postscaler Rate Select bits are in the range of 1 to 16.

<div class="informaltable">

| <span class="strong">**Postcaler Value**</span> | <span class="strong">**GCB Constant**</span> | <span class="strong">**Eqautes to**</span> |
|:------------------------------------------------|:---------------------------------------------|:-------------------------------------------|
| 1:1 Postscaler                                  | POST\_1                                      | 0                                          |
| 1:2 Postscaler                                  | POST\_2                                      | 1                                          |
| 1:3 Postscaler                                  | POST\_3                                      | 2                                          |
| 1:4 Postscaler                                  | POST\_4                                      | 3                                          |
| 1:5 Postscaler                                  | POST\_5                                      | 4                                          |
| 1:6 Postscaler                                  | POST\_6                                      | 5                                          |
| 1:7 Postscaler                                  | POST\_7                                      | 6                                          |
| 1:8 Postscaler                                  | POST\_8                                      | 7                                          |
| 1:9 Postscaler                                  | POST\_9                                      | 8                                          |
| 1:10 Postscaler                                 | POST\_10                                     | 9                                          |
| 1:11 Postscaler                                 | POST\_11                                     | 10                                         |
| 1:12 Postscaler                                 | POST\_12                                     | 11                                         |
| 1:13 Postscaler                                 | POST\_13                                     | 12                                         |
| 1:14 Postscaler                                 | POST\_14                                     | 13                                         |
| 1:15 Postscaler                                 | POST\_15                                     | 14                                         |
| 1:16 Postscaler                                 | POST\_16                                     | 15                                         |

</div>

<span class="strong">**Table 4 shown above**</span>

  
  

  
  

<span class="strong">**Explanation:(Atmel AVR)**</span>

`InitTimer2` will set up timer 2, according to the settings given.

`source` can be one of the following settings: Parameters for this timer
are detailed in the table below:

<div class="informaltable">

| Parameter | Description                                                                                                                                        |
|:----------|:---------------------------------------------------------------------------------------------------------------------------------------------------|
| `source`  | The clock source for this specific timer. Can be either `Osc` or `Ext` where\`Osc\` is an internal oscillator and `Ext` is an external oscillator. |

</div>

<span class="strong">**Table 5 shown above**</span>  
  

`prescaler` for Atmel AVR Timer 2 is chip specific and can be selected
from one of the two tables shown below. Please refer to the datasheet
determine which table to use and which prescales within that table are
supported by a specific Atmel AVR microcontroller.

Table1: Prescaler Rate Select bits are in the range of 1 to 1024

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: center;"><span class="strong"><strong>Prescaler Value</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Primary GCB Constant</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Secondary GCB Constant</strong></span></th>
<th style="text-align: center;"><span class="strong"><strong>Constant Equates<br />
to value</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: center;"><p>1:0</p></td>
<td style="text-align: left;"><p><code class="literal">PS_0</code></p></td>
<td style="text-align: left;"><p><code class="literal">PS_2_0</code></p></td>
<td style="text-align: center;"><p>1</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:1</p></td>
<td style="text-align: left;"><p><code class="literal">PS_1</code></p></td>
<td style="text-align: left;"><p><code class="literal">PS_2_1</code></p></td>
<td style="text-align: center;"><p>1</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:8</p></td>
<td style="text-align: left;"><p><code class="literal">PS_8</code></p></td>
<td style="text-align: left;"><p><code class="literal">PS_2_8</code></p></td>
<td style="text-align: center;"><p>2</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:64</p></td>
<td style="text-align: left;"><p><code class="literal">PS_64</code></p></td>
<td style="text-align: left;"><p><code class="literal">PS_2_64</code></p></td>
<td style="text-align: center;"><p>3</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:256</p></td>
<td style="text-align: left;"><p><code class="literal">PS_256</code></p></td>
<td style="text-align: left;"><p><code class="literal">PS2_256</code></p></td>
<td style="text-align: center;"><p>4</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:1024</p></td>
<td style="text-align: left;"><p><code class="literal">PS_1024</code></p></td>
<td style="text-align: left;"><p><code class="literal">PS_2_1024</code></p></td>
<td style="text-align: center;"><p>5</p></td>
</tr>
</tbody>
</table>

</div>

<span class="strong">**Table 6 shown above**</span>  
  
  

Prescaler Rate Select bits are in the range of 1 to 16384

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: center;"><span class="strong"><strong>Prescaler Value</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Primary GCB Constant</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Secondary GCB Constant</strong></span></th>
<th style="text-align: center;"><span class="strong"><strong>Constant Equates<br />
to value</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: center;"><p>1:1</p></td>
<td style="text-align: left;"><p><code class="literal">PS_2_1</code></p></td>
<td style="text-align: left;"><p><code class="literal">none</code></p></td>
<td style="text-align: center;"><p>1</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:2</p></td>
<td style="text-align: left;"><p><code class="literal">PS_2_2</code></p></td>
<td style="text-align: left;"><p><code class="literal">none</code></p></td>
<td style="text-align: center;"><p>2</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:4</p></td>
<td style="text-align: left;"><p><code class="literal">PS_2_4</code></p></td>
<td style="text-align: left;"><p><code class="literal">none</code></p></td>
<td style="text-align: center;"><p>3</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:8</p></td>
<td style="text-align: left;"><p><code class="literal">PS_2_8</code></p></td>
<td style="text-align: left;"><p><code class="literal">none</code></p></td>
<td style="text-align: center;"><p>4</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:16</p></td>
<td style="text-align: left;"><p><code class="literal">PS_2_16</code></p></td>
<td style="text-align: left;"><p><code class="literal">none</code></p></td>
<td style="text-align: center;"><p>5</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:32</p></td>
<td style="text-align: left;"><p><code class="literal">PS_2_32</code></p></td>
<td style="text-align: left;"><p><code class="literal">none</code></p></td>
<td style="text-align: center;"><p>6</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:64</p></td>
<td style="text-align: left;"><p><code class="literal">PS_2_64</code></p></td>
<td style="text-align: left;"><p><code class="literal">none</code></p></td>
<td style="text-align: center;"><p>7</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:128</p></td>
<td style="text-align: left;"><p><code class="literal">PS_2_128</code></p></td>
<td style="text-align: left;"><p><code class="literal">none</code></p></td>
<td style="text-align: center;"><p>8</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:256</p></td>
<td style="text-align: left;"><p><code class="literal">PS_2_256</code></p></td>
<td style="text-align: left;"><p><code class="literal">none</code></p></td>
<td style="text-align: center;"><p>9</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:512</p></td>
<td style="text-align: left;"><p><code class="literal">PS_2_512</code></p></td>
<td style="text-align: left;"><p><code class="literal">none</code></p></td>
<td style="text-align: center;"><p>10</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:1024</p></td>
<td style="text-align: left;"><p><code class="literal">PS_2_1024</code></p></td>
<td style="text-align: left;"><p><code class="literal">none</code></p></td>
<td style="text-align: center;"><p>11</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:2048</p></td>
<td style="text-align: left;"><p><code class="literal">PS_2_2048</code></p></td>
<td style="text-align: left;"><p><code class="literal">none</code></p></td>
<td style="text-align: center;"><p>12</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:4096</p></td>
<td style="text-align: left;"><p><code class="literal">PS_2_4096</code></p></td>
<td style="text-align: left;"><p><code class="literal">none</code></p></td>
<td style="text-align: center;"><p>13</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:8192</p></td>
<td style="text-align: left;"><p><code class="literal">PS_2_8192</code></p></td>
<td style="text-align: left;"><p><code class="literal">none</code></p></td>
<td style="text-align: center;"><p>14</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:16384</p></td>
<td style="text-align: left;"><p><code class="literal">PS_2_16384</code></p></td>
<td style="text-align: left;"><p><code class="literal">none</code></p></td>
<td style="text-align: center;"><p>15</p></td>
</tr>
</tbody>
</table>

</div>

<span class="strong">**Table 7 shown above**</span>  
  
<span class="strong">**Example:**</span>

This code uses Timer 2 and On Interrupt to flash an LED every 200 timer
ticks.

``` screen
    #chip 16F1788, 8

    #DEFINE LED PORTA.1
    DIR LED OUT

    #Define Match_Val PR2 'PR2 is the timer 2 match register
    Match_Val = 200       'Interrupt afer 200 timer ticks

    On interrupt timer2Match call FlashLED  'Interrupt on match
    Inittimer2 PS2_64, 15 'Prescale 1:64 /Postscale 1:16 (15)
    Starttimer 2

    Do
      ' Wating for interrupt on match val of 100
    Loop

    'This sub will be called when Timer 2 matches "Match_Val" (PR2)
    SUB FlashLED
        pulseout LED, 5 ms
    END SUB
```

</div>
