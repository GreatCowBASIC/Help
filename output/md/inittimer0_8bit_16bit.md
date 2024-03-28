<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="inittimer0_8bit_16bit"></span>InitTimer0 8bit/16bit

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    InitTimer0 source, prescaler + clocksource, postscaler
```

Timer are useful as timers can generate interrupts. Timers can be used
in conjunction with `On Interrupt` to run a section of code when a
specific timer event occurs. Example events are when the timer matches a
specific value, or, the timer resets to a zero value. For more details
on timer events see `On Interrupt`.

<span class="strong">**Command Availability:**</span>

Available on microcontrollers with a Timer 0 where the timer has the
capability of operating as an 8 bit or 16 bit timer.   This type of
Timer 0 can be found on Microchip PIC 18(L)F, as well as small number of
18C and 16(L)F microcontrollers.   These timers can be configured for
either 8-bit or 16-bit operation.

You may need to refer to the datasheet for your microcontroller to
determine if it supports both 8-bit and 16-bit operations.

<span class="strong">**Explanation for 8-bit timer:**</span>

The default operation is as an 8-bit timer.   `InitTimer0` will set up
timer 0.

Parameters are required as shown in the table below:

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
<td style="text-align: left;"><p><code class="literal">source</code></p></td>
<td style="text-align: left;"><p>The clock source for this specific timer. Can be either <code class="literal">Osc</code> or <code class="literal">Ext</code> where`Osc` is an internal oscillator and <code class="literal">Ext</code> is an external oscillator.</p>
<p><br />
<br />
<code class="literal">Osc</code> - Selects the clock source in use, as set by the microcontroller specific configuration (fuses or #config).  This could be an internal clock or an external clock source ( external clock sources are typically attached to the XTAL pins).</p>
<p><code class="literal">Ext</code> - Selects the clock source attached to a specific exernal interrupt input port.  This allows a different clock frequency than the main clock to be used, such as 32.768 kHz crystals commonly used for real time circuits.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">prescaler</code></p></td>
<td style="text-align: left;"><p>The value of the prescaler for this specific timer, <span class="strong"><strong>and</strong></span>, the clocksource</p>
<p>See the tables below for permitted values for Microchip PIC or the Atmel AVR microcontrollers.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">postscaler</code></p></td>
<td style="text-align: left;"><p>The value of the postscaler for this specific timer.</p>
<p>See the tables below for permitted values for Microchip PIC or the Atmel AVR microcontrollers.</p></td>
</tr>
</tbody>
</table>

</div>

<span class="emphasis">*8 bit Example:*</span>

The example show in the `osc` as an internal source, a `prescaler` value
of 256 witht the HFINTOSC `clocksource` and a `postscaler` value of 2

``` screen
    InitTimer0 Osc, PRE0_256 + TMR0_HFINTOSC ,  POST0_2
    'also, note when in 8-bit mode you MUST set the 8bit timer value to the upper byte of a WORD, when setting the `SetTimer`
    SetTimer 0, 0x5800   'Setting the HIGH byte!!!
```

<span class="emphasis">*16 bit Example:*</span>

To use the 16 bit timer you need to add the constant
`#define TMR0_16bit`.

The example show in the `osc` as an internal source, a `prescaler` value
of 256 witht the HFINTOSC `clocksource` and a `postscaler` value of 2

``` screen
    #define TMR0_16bit
    InitTimer0 Osc, PRE0_256 + TMR0_HFINTOSC ,  POST0_2
```

<span class="strong">**Differences in Timer0 Operations**</span>

The section refers to chips with a 8/16-bit Timer0.

When these chips are operating in 8-bit mode, Timer0 behaves much like
Timers2/4/6. In 8-bit mode the TMR0H register does not increment. It
instead becomes the Period or Match register and is aliased as "PR0"
(Period Register 0).

In 8-bit mode, Timer0 does not technically overflow. Instead when TMR0L
increments and matches the value in the PR0 register, TMR0L is reset to
0. The interrupt flag bit (TMR0IF) bit is then set (based upon
Postscaler).

The default value in the PR0 "match register" is 255. This value can be
set/changed in the user program to set/change the timer period. This can
be used to fine tune the timer period.  
  

<span class="strong">**Timer 0 mandated constants:**</span>

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
<td style="text-align: left;"><p><code class="literal">source</code></p></td>
<td style="text-align: left;"><p>The clock source for this specific timer. Can be either <code class="literal">Osc</code> or <code class="literal">Ext</code> where <code class="literal">Osc</code> is an internal oscillator and <code class="literal">Ext</code> is an external oscillator.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">prescaler</code></p></td>
<td style="text-align: left;"><p>The value of the prescaler for this specific timer. See the tables below for permitted values for Microchip PIC or the Atmel AVR microcontrollers. You may also be required to specify one of the following clock sources.<br />
<br />
<code class="literal">TMR0_CLC1</code><br />
<code class="literal">TMR0_SOSC</code><br />
<code class="literal">TMR0_LFINTOSC</code><br />
<code class="literal">TMR0_HFINTOSC</code><br />
<code class="literal">TMR0_FOSC4</code><br />
<code class="literal">TMR0_T0CKIPPS_Inverted</code><br />
<code class="literal">TMR0_T0CKIPPS_True</code><br />
<br />
</p>
<p>You should use a simple addition to concatenate the prescaler with a specific clock source. For example.<br />
<br />
<code class="literal">PRE0_16</code> + <code class="literal">TMR0_HFINTOSC</code><br />
<br />
</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">postscaler</code></p></td>
<td style="text-align: left;"><p>See the tables below for permitted values for Microchip.<br />
Also, refer to the specific datasheet <code class="literal">postcaler</code> values.</p></td>
</tr>
</tbody>
</table>

</div>

  
  
Microchip PIC microcontrollers where the `prescaler` rate select bits
are in the range of 1 to 32768 you should use one of the following
constants.

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
<td style="text-align: left;"><p><code class="literal">PRE0_1</code></p></td>
<td style="text-align: center;"><p>0</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:2</p></td>
<td style="text-align: left;"><p><code class="literal">PRE0_2</code></p></td>
<td style="text-align: center;"><p>1</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:4</p></td>
<td style="text-align: left;"><p><code class="literal">PRE0_4</code></p></td>
<td style="text-align: center;"><p>2</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:8</p></td>
<td style="text-align: left;"><p><code class="literal">PRE0_8</code></p></td>
<td style="text-align: center;"><p>3</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:16</p></td>
<td style="text-align: left;"><p><code class="literal">PRE0_16</code></p></td>
<td style="text-align: center;"><p>4</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:32</p></td>
<td style="text-align: left;"><p><code class="literal">PRE0_32</code></p></td>
<td style="text-align: center;"><p>5</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:64</p></td>
<td style="text-align: left;"><p><code class="literal">PRE0_64</code></p></td>
<td style="text-align: center;"><p>6</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:128</p></td>
<td style="text-align: left;"><p><code class="literal">PRE0_128</code></p></td>
<td style="text-align: center;"><p>7</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:256</p></td>
<td style="text-align: left;"><p><code class="literal">PRE0_256</code></p></td>
<td style="text-align: center;"><p>8</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:512</p></td>
<td style="text-align: left;"><p><code class="literal">PRE0_512</code></p></td>
<td style="text-align: center;"><p>9</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:1024</p></td>
<td style="text-align: left;"><p><code class="literal">PRE0_1024</code></p></td>
<td style="text-align: center;"><p>10</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:2048</p></td>
<td style="text-align: left;"><p><code class="literal">PRE0_2048</code></p></td>
<td style="text-align: center;"><p>11</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:4096</p></td>
<td style="text-align: left;"><p><code class="literal">PRE0_4096</code></p></td>
<td style="text-align: center;"><p>12</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:8192</p></td>
<td style="text-align: left;"><p><code class="literal">PRE0_8192</code></p></td>
<td style="text-align: center;"><p>13</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:16384</p></td>
<td style="text-align: left;"><p><code class="literal">PRE0_16384</code></p></td>
<td style="text-align: center;"><p>14</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:32768</p></td>
<td style="text-align: left;"><p><code class="literal">PRE0_32768</code></p></td>
<td style="text-align: center;"><p>15</p></td>
</tr>
</tbody>
</table>

</div>

These correspond to a prescaler of between 1:1 and 1:32768 of the
oscillator speed where the oscillator speed is (FOSC/4). The prescaler
applies to both the internal oscillator or the external clock.

  
  

On Microchip PIC microcontrollers where the `prescaler` rate select bits
are in the range of 2 to 256 you should use one of the following
constants. If the `prescaler` rate select bits are in the range of 1 to
32768 then see the subsequent table.

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
<td style="text-align: center;"><p>1:2</p></td>
<td style="text-align: left;"><p><code class="literal">PS0_2</code></p></td>
<td style="text-align: center;"><p>0</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:4</p></td>
<td style="text-align: left;"><p><code class="literal">PS0_4</code></p></td>
<td style="text-align: center;"><p>1</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:8</p></td>
<td style="text-align: left;"><p><code class="literal">PS0_8</code></p></td>
<td style="text-align: center;"><p>2</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:16</p></td>
<td style="text-align: left;"><p><code class="literal">PS0_16</code></p></td>
<td style="text-align: center;"><p>3</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:32</p></td>
<td style="text-align: left;"><p><code class="literal">PS0_32</code></p></td>
<td style="text-align: center;"><p>4</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:64</p></td>
<td style="text-align: left;"><p><code class="literal">PS0_64</code></p></td>
<td style="text-align: center;"><p>5</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:128</p></td>
<td style="text-align: left;"><p><code class="literal">PS0_128</code></p></td>
<td style="text-align: center;"><p>6</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:256</p></td>
<td style="text-align: left;"><p><code class="literal">PS0_256</code></p></td>
<td style="text-align: center;"><p>7</p></td>
</tr>
</tbody>
</table>

</div>

These correspond to a prescaler of between 1:2 and 1:256 of the
oscillator speed where the oscillator speed is (FOSC/4). The prescaler
applies to both the internal oscillator or the external clock.  
  

On Microchip PIC microcontroller that require `postscaler` is can be one
of the following constants where the Postscaler Rate Select bits are in
the range of 1 to 16.

<div class="informaltable">

| <span class="strong">**Postcaler Value**</span> | <span class="strong">**Primary GCB Constant**</span> | <span class="strong">**Use Numeric Constant**</span> |
|:-----------------------------------------------:|:-----------------------------------------------------|:----------------------------------------------------:|
|                       1:1                       | `POST0_1`                                            |                          0                           |
|                       1:2                       | `POST0_2`                                            |                          1                           |
|                       1:3                       | `POST0_3`                                            |                          2                           |
|                       1:4                       | `POST0_4`                                            |                          3                           |
|                       1:5                       | `POST0_5`                                            |                          4                           |
|                       1:6                       | `POST0_6`                                            |                          5                           |
|                       1:7                       | `POST0_7`                                            |                          6                           |
|                       1:8                       | `POST0_8`                                            |                          7                           |
|                       1:9                       | `POST0_9`                                            |                          8                           |
|                      1:10                       | `POST0_10`                                           |                          9                           |
|                      1:11                       | `POST0_11`                                           |                          10                          |
|                      1:12                       | `POST0_12`                                           |                          11                          |
|                      1:13                       | `POST0_13`                                           |                          12                          |
|                      1:14                       | `POST0_14`                                           |                          13                          |
|                      1:15                       | `POST0_15`                                           |                          14                          |
|                      1:16                       | `POST0_16`                                           |                          15                          |

</div>

  
  
  

<span class="strong">**Example:**</span>

This code uses Timer 0 and On Interrupt to flash an LED.

``` screen
/*

Remember four things to setup a timer.

1.  InitTimer0 source, prescaler + clocksource, postscaler

2.  SetTimer (byte_value, value ), or
    SetTimer (word_value [where the High byte sets the timer], value )

3.  StartTimer 0

    and, optionally use

4.  ClearTimer 0

*/

    'Chip Settings.
    #CHIP 16f18313, 32

    Dir porta.1 Out

    'Setup the timer.
    '          Source, Prescaler  + Clock Source    , Postscaler
    InitTimer0 Osc,    PRE0_16384 + TMR0_HFINTOSC   , POST0_11

    ' Set the Timer start value.  Use the HIGH byte of the word when using an 8/16bit timer in 8 bit mode
    SetTimer ( 0, 0x5800 )

    ' Start the Timer by writing to TMR0ON bit
    StartTimer 0


    Do
        Wait While TMR0IF = 0
        ' Clearing timer flag
        TMR0IF = 0
        porta.1 = ! porta.1

    Loop
```

<span class="strong">**Supported in &lt;TIMER.H&gt;**</span>

See also see:
<a href="inittimer0" class="link" title="InitTimer0">InitTimer0</a>
for microcontroller with only an 8 bit Timer 0 module.

</div>
