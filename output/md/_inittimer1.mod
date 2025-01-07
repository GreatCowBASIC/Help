<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="inittimer1"></span>InitTimer1

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    InitTimer1 source, prescaler
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers with a Timer 1 module.

<span class="strong">**Explanation:**</span>

`InitTimer1` will set up timer 1.

Parameters are required as detailed in the table below:

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
<td style="text-align: left;"><p>The clock source for this specific timer. Can be either <code class="literal">Osc</code>, <code class="literal">Ext</code> or <code class="literal">ExtOsc</code> where:<br />
<code class="literal">Osc</code> is an internal oscillator.<br />
<code class="literal">Ext</code> is an external oscillator.<br />
<br />
<br />
<code class="literal">Osc</code> - Selects the clock source in use, as set by the microcontroller specific configuration (fuses or #config).  This could be an internal clock or an external clock source ( external clock sources are typically attached to the XTAL pins).</p>
<p><code class="literal">Ext</code> - Selects the clock source attached to a specific exernal interrupt input port.  This allows a different clock frequency than the main clock to be used, such as 32.768 kHz crystals commonly used for real time circuits.<br />
<br />
</p>
<p><code class="literal">ExtOsc</code> is an external oscillator and only available on a Microchip PIC microcontroller.</p>
<p>Enhanced Microchip PIC microcontrollers with a dedicated TMRxCLK register support additional clock sources. This includes, but limited to, the following devices: 16F153xx, 16F16xx, 16F188xx and 18FxxK40 Microchip PIC microcontroller series. On these devices the clock source can be one of the following:</p>
<p><code class="literal">Osc</code> is an internal oscillator which is the same source as <code class="literal">FOSC4</code>.<br />
<code class="literal">Ext</code> is an external oscillator which is the same source as <code class="literal">TxXKIPPS</code>.<br />
<code class="literal">ExtOsc</code> is an external oscillator which is the same source as <code class="literal">SOSC</code>.<br />
<code class="literal">FOSC</code> is an internal oscillator which is the Frequency of the OSCillator.<br />
<code class="literal">FOSC4</code> is an internal oscillator which is the Frequency of the OSCillator divided by 4.<br />
<code class="literal">SOSC</code> is an external oscillator which is the same source as <code class="literal">SOSC</code>.<br />
<code class="literal">MFINTOSC</code> is an internal 500KHz internal clock oscillator.<br />
<code class="literal">LFINTOSC</code> is an internal 31Khz internal clock oscillator.<br />
<code class="literal">HFINTOSC</code> is an oscillator as specified within the datasheet for each specific microcontroller.<br />
<code class="literal">TxCKIPPS</code> is an oscillator input on TxCKIPPS Pin.<br />
</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">prescaler</code></p></td>
<td style="text-align: left;"><p>The value of the prescaler for this specific timer. See the tables below for permitted vales for Microchip PIC or the Atmel AVR microcontrollers.</p></td>
</tr>
</tbody>
</table>

</div>

When the timer overflows an interrupt event will be generated. This
interrupt event can be used in conjunction with `On Interrupt` to run a
section of code when the interrupt event occurs.  
  
  
  
<span class="strong">**Microchip PIC microcontrollers:**</span>

On Microchip PIC microcontrollers `prescaler` must be one of the
following constants:

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
<td style="text-align: left;"><p><code class="literal">PS1_1</code></p></td>
<td style="text-align: center;"><p>0</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:2</p></td>
<td style="text-align: left;"><p><code class="literal">PS1_2</code></p></td>
<td style="text-align: center;"><p>16</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:4</p></td>
<td style="text-align: left;"><p><code class="literal">PS1_4</code></p></td>
<td style="text-align: center;"><p>32</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:8</p></td>
<td style="text-align: left;"><p><code class="literal">PS1_8</code></p></td>
<td style="text-align: center;"><p>48</p></td>
</tr>
</tbody>
</table>

</div>

These correspond to a prescaler of between 1:2 and 1:8 of the oscillator
(FOSC/4) speed. The prescaler will apply to either the oscillator or the
external clock input.  
  
  
  
<span class="strong">**Atmel AVR microcontrollers:**</span>

On the majority of Atmel AVR microcontrollers `prescaler` must be one of
the following constants:

The prescaler will only apply when the timer is driven from the `Osc`
the internal oscillator - the prescaler has no effect when the external
clock source is specified.

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
<td style="text-align: left;"><p><code class="literal">PS_1_0</code></p></td>
<td style="text-align: center;"><p>0</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:1</p></td>
<td style="text-align: left;"><p><code class="literal">PS_1</code></p></td>
<td style="text-align: left;"><p><code class="literal">PS_1_1</code></p></td>
<td style="text-align: center;"><p>1</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:8</p></td>
<td style="text-align: left;"><p><code class="literal">PS_8</code></p></td>
<td style="text-align: left;"><p><code class="literal">PS_1_8</code></p></td>
<td style="text-align: center;"><p>2</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:64</p></td>
<td style="text-align: left;"><p><code class="literal">PS_64</code></p></td>
<td style="text-align: left;"><p><code class="literal">PS_1_64</code></p></td>
<td style="text-align: center;"><p>3</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:256</p></td>
<td style="text-align: left;"><p><code class="literal">PS_256</code></p></td>
<td style="text-align: left;"><p><code class="literal">PS1_256</code></p></td>
<td style="text-align: center;"><p>4</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:1024</p></td>
<td style="text-align: left;"><p><code class="literal">PS_1024</code></p></td>
<td style="text-align: left;"><p><code class="literal">PS_1_1024</code></p></td>
<td style="text-align: center;"><p>5</p></td>
</tr>
</tbody>
</table>

</div>

  
  
  

On Atmel AVR ATtiny15/25/45/85/216/461/861 microcontrollers `prescaler`
must be one of the following constants:

The prescaler will only apply when the timer is driven from the `Osc`
the internal oscillator - the prescaler has no effect when the external
clock source is specified.

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
<td style="text-align: center;"><p>1:0</p></td>
<td style="text-align: left;"><p><code class="literal">PS_1_0</code></p></td>
<td style="text-align: center;"><p>0</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:1</p></td>
<td style="text-align: left;"><p><code class="literal">PS_1_1</code></p></td>
<td style="text-align: center;"><p>1</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:2</p></td>
<td style="text-align: left;"><p><code class="literal">PS_1_2</code></p></td>
<td style="text-align: center;"><p>2</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:4</p></td>
<td style="text-align: left;"><p><code class="literal">PS_1_4</code></p></td>
<td style="text-align: center;"><p>3</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:8</p></td>
<td style="text-align: left;"><p><code class="literal">PS_1_8</code></p></td>
<td style="text-align: center;"><p>4</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:16</p></td>
<td style="text-align: left;"><p><code class="literal">PS_1_16</code></p></td>
<td style="text-align: center;"><p>5</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:32</p></td>
<td style="text-align: left;"><p><code class="literal">PS_1_32</code></p></td>
<td style="text-align: center;"><p>6</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:64</p></td>
<td style="text-align: left;"><p><code class="literal">PS_1_64</code></p></td>
<td style="text-align: center;"><p>7</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:128</p></td>
<td style="text-align: left;"><p><code class="literal">PS_1_128</code></p></td>
<td style="text-align: center;"><p>8</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:256</p></td>
<td style="text-align: left;"><p><code class="literal">PS_1_256</code></p></td>
<td style="text-align: center;"><p>9</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:512</p></td>
<td style="text-align: left;"><p><code class="literal">PS_1_512</code></p></td>
<td style="text-align: center;"><p>10</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:1024</p></td>
<td style="text-align: left;"><p><code class="literal">PS_1_1024</code></p></td>
<td style="text-align: center;"><p>11</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:2048</p></td>
<td style="text-align: left;"><p><code class="literal">PS_1_2048</code></p></td>
<td style="text-align: center;"><p>12</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:4096</p></td>
<td style="text-align: left;"><p><code class="literal">PS_1_4096</code></p></td>
<td style="text-align: center;"><p>13</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:8192</p></td>
<td style="text-align: left;"><p><code class="literal">PS_1_8192</code></p></td>
<td style="text-align: center;"><p>14</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:16384</p></td>
<td style="text-align: left;"><p><code class="literal">PS_1_16384</code></p></td>
<td style="text-align: center;"><p>15</p></td>
</tr>
</tbody>
</table>

</div>

  
  
<span class="strong">**Example 1 (Microchip):**</span>

This example will measure that time that a switch is depressed (or on)
and will write the results to the EEPROM.

``` screen
    #chip 16F819, 20
    #define Switch PORTA.0

    Dir Switch In
    DataCount = 0

    'Initilise Timer 1
    InitTimer1 Osc, PS1_8

    Dim TimerValue As Word

    Do
        ClearTimer 1
        Wait Until Switch = On
        StartTimer 1
        Wait Until Switch = Off
        StopTimer 1

        'Read the timer
        TimerValue = Timer1

        'Log the timer value
        EPWrite(DataCount, TimerValue_H)
        EPWrite(DataCount + 1, TimerValue)
        DataCount += 2
    Loop
```

  
  
<span class="strong">**Example 2 (Atmel AVR):**</span>

This example will flash the yellow LED on an Arduino Uno (R3) once every
second.

``` literallayout
#Chip mega328p, 16  'Using Arduino Uno R3
```

``` literallayout
#define LED PORTB.5
Dir LED OUT
```

``` literallayout
Inittimer1  OSC, PS_256
Starttimer 1
Settimer 1, 3200  ;Preload Timer
```

``` literallayout
On Interrupt Timer1Overflow Call Flash_LED
```

``` literallayout
Do
    'Wait for interrupt
loop
```

``` literallayout
Sub Flash_LED
   Settimer 1, 3200   'Preload timer
   pulseout LED, 100 ms
End Sub
```

<span class="strong">**Supported in &lt;TIMER.H&gt;**</span>

</div>
