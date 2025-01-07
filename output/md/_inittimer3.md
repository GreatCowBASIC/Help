<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="_inittimer3"></span>InitTimer3

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
InitTimer3 source, prescaler
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers with a Timer 3 module.

<span class="strong">**Explanation:**</span>

`InitTimer3` will set up timer 3.

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
</p>
<p><br />
<br />
<code class="literal">Osc</code> - Selects the clock source in use, as set by the microcontroller specific configuration (fuses or #config).  This could be an internal clock or an external clock source ( external clock sources are typically attached to the XTAL pins).</p>
<p><code class="literal">Ext</code> - Selects the clock source attached to a specific exernal interrupt input port.  This allows a different clock frequency than the main clock to be used, such as 32.768 kHz crystals commonly used for real time circuits.<br />
<br />
</p>
<p><code class="literal">ExtOsc</code> is an external oscillator and only available on a Microchip PIC microcontroller.</p>
<p>Enhanced Microchip PIC microcontrollers with a dedicated TMRxCLK register support additional clock sources. This includes, but limited to, the following devices: 16F153xx, 16F16xx, 16F188xx and 18FxxK40 Microchip PIC microcontroller series On these devices the clock source can be one of the following:</p>
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
<td style="text-align: left;"><p><code class="literal">PS3_1</code></p></td>
<td style="text-align: center;"><p>0</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:2</p></td>
<td style="text-align: left;"><p><code class="literal">PS3_2</code></p></td>
<td style="text-align: center;"><p>16</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:4</p></td>
<td style="text-align: left;"><p><code class="literal">PS3_4</code></p></td>
<td style="text-align: center;"><p>32</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:8</p></td>
<td style="text-align: left;"><p><code class="literal">PS3_8</code></p></td>
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
<td style="text-align: left;"><p><code class="literal">PS_3_0</code></p></td>
<td style="text-align: center;"><p>1</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:1</p></td>
<td style="text-align: left;"><p><code class="literal">PS_1</code></p></td>
<td style="text-align: left;"><p><code class="literal">PS_3_1</code></p></td>
<td style="text-align: center;"><p>1</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:8</p></td>
<td style="text-align: left;"><p><code class="literal">PS_8</code></p></td>
<td style="text-align: left;"><p><code class="literal">PS_3_8</code></p></td>
<td style="text-align: center;"><p>2</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:64</p></td>
<td style="text-align: left;"><p><code class="literal">PS_64</code></p></td>
<td style="text-align: left;"><p><code class="literal">PS_3_64</code></p></td>
<td style="text-align: center;"><p>3</p></td>
</tr>
<tr class="odd">
<td style="text-align: center;"><p>1:256</p></td>
<td style="text-align: left;"><p><code class="literal">PS_256</code></p></td>
<td style="text-align: left;"><p><code class="literal">PS_3_256</code></p></td>
<td style="text-align: center;"><p>4</p></td>
</tr>
<tr class="even">
<td style="text-align: center;"><p>1:1024</p></td>
<td style="text-align: left;"><p><code class="literal">PS_1024</code></p></td>
<td style="text-align: left;"><p><code class="literal">PS_3_1024</code></p></td>
<td style="text-align: center;"><p>5</p></td>
</tr>
</tbody>
</table>

</div>

<span class="strong">**Supported in &lt;TIMER.H&gt;**</span>

</div>
