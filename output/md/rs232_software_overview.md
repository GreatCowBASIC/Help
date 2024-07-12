<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="rs232_software_overview"></span>RS232 Software Overview

</div>

</div>

</div>

<span class="strong">**Introduction:**</span>

These routines allow the microcontroller to send and receive RS232 data.

All functions are implemented using software, so no special hardware is
required on the microcontroller. However, if the microcontroller has a
hardware serial module (usually referred to as UART or USART), and the
serial data lines are connected to the appropriate pins, the hardware
routines should be used for smaller code, improved reliability and
higher baud rates.

<span class="strong">**Relevant Constants:**</span>

These constants are used to control settings for the RS232 serial
communication routines. To set them, place a line in the main program
file that uses `#define` to assign a value to the particular constant.

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;"><span class="strong"><strong>Constant Name/s</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Controls</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Default Value</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">SendALow</code>, <code class="literal">SendBLow</code>, <code class="literal">SendCLow</code></p></td>
<td style="text-align: left;"><p>These are used to define the commands used to send a low (0) bit on serial channels A, B and C respectively.</p></td>
<td style="text-align: left;"><p>No Default<br />
<span class="strong"><strong>Must be defined</strong></span></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">SendAHigh</code>, <code class="literal">SendBHigh</code>, <code class="literal">SendCHigh</code></p></td>
<td style="text-align: left;"><p>These are used to define the commands used to send a high (1) bit on serial channels A, B and C respectively.</p></td>
<td style="text-align: left;"><p>No Default<br />
<span class="strong"><strong>Must be defined</strong></span></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">RecALow</code>, <code class="literal">RecBLow</code>, <code class="literal">RecCLow</code></p></td>
<td style="text-align: left;"><p>The condition that is true when a low bit is being received</p></td>
<td style="text-align: left;"><p><code class="literal">Sys232Temp.0 OFF</code><br />
<span class="strong"><strong>Must be defined</strong></span></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">RecAHigh</code>, <code class="literal">RecBHigh</code>, <code class="literal">RecCHigh</code></p></td>
<td style="text-align: left;"><p>The condition that is true when a high bit is being received</p></td>
<td style="text-align: left;"><p><code class="literal">Sys232Temp.0 ON</code><br />
<span class="strong"><strong>Must be defined</strong></span></p></td>
</tr>
</tbody>
</table>

</div>

</div>
