<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="i2c_overview"></span>I2C Overview

</div>

</div>

</div>

<span class="strong">**Introduction:**</span>

These software routines allow GCBASIC programs to send and receive I2C
messages. They can be configured to act as master or slave, and the
speed can also be altered.

No hardware I2C module is required for these routines - all
communication is handled in software. However, these routines will not
work on 12-bit instruction Microchip PIC microcontrollers (10F, 12F5xx
and 16F5xx chips).

<span class="strong">**Relevant Constants:**</span>

These constants control the setup of the software I2C routines:

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;"><span class="strong"><strong>Constant</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Controls</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Default Value</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p>I2C_MODE</p></td>
<td style="text-align: left;"><p>Mode of I2C routines (Master or Slave)</p></td>
<td style="text-align: left;"><p>Master</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>I2C_DATA</p></td>
<td style="text-align: left;"><p>Pin on microcontroller connected to I2C data</p></td>
<td style="text-align: left;"><p>N/A</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>I2C_CLOCK</p></td>
<td style="text-align: left;"><p>Pin on microcontroller connected to I2C clock</p></td>
<td style="text-align: left;"><p>N/A</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>I2C_BIT_DELAY</p></td>
<td style="text-align: left;"><p>Time for a bit (used for acknowledge detection)</p></td>
<td style="text-align: left;"><p>2 us</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>I2C_CLOCK_DELAY</p></td>
<td style="text-align: left;"><p>Time for clock pulse to remain high</p></td>
<td style="text-align: left;"><p>1 us</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>I2C_END_DELAY</p></td>
<td style="text-align: left;"><p>Time between clock pulses</p></td>
<td style="text-align: left;"><p>1 us</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>I2C_USE_TIMEOUT</p></td>
<td style="text-align: left;"><p>Set to true if the I2C routines should stop waiting for the I2c bus - the routine will exit if a timeout occurs. Should be used when you need to prevent system lockups on the I2C bus.</p>
<p>Supports both software I2C master and slave mode.</p>
<p>Will return the variable <code class="literal">I2CAck = FALSE</code> when a timeout has occurred.</p></td>
<td style="text-align: left;"><p>Not Set</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>I2C_DISABLE_INTERRUPTS</p></td>
<td style="text-align: left;"><p>Disable interrupts during I2C routines. Important when an i2C clock is part of your solution</p></td>
<td style="text-align: left;"><p>Not defined.</p></td>
</tr>
</tbody>
</table>

</div>

<span class="strong">**Example:**</span> This example examines the IC2
devices and displays on a terminal. This code will require adaption but
the code shows an approach to discover the IC2 devices.

``` screen
  ' I2C Overview - using the ChipIno board, see here for information
  #chip 16F886, 8
  #config MCLRE_ON

  ' Define I2C settings
  #define I2C_MODE Master
  #define I2C_DATA PORTC.4
  #define I2C_CLOCK PORTC.3
  #define I2C_DISABLE_INTERRUPTS ON

  'USART/SERIAL PORT via a MAX232 TO PC Terminal
  #define USART_BAUD_RATE 9600
  #define USART_TX_BLOCKING

  Dir PORTc.6 Out
  #define USART_DELAY 0 ms

  HSerPrintCRLF 2
  HSerPrint "I2C Discover using the ChipIno"
  HSerPrintCRLF 2

  HSerPrint "Started: "
  HSerPrint "Searching I2C address space: v0.85"
  HSerPrintCRLF

  wait 100 ms
  dim DeviceID as byte
  for DeviceID = 0 to 255
    I2CStart
    I2CSend ( deviceID )
    I2CSend ( 0 )
    I2CSend ( 0 )
    i2cstop

    if I2CSendState = True  then

      HSerPrint   "_"
      HSerPrint   "ID: 0x"
      HSerPrint   hex(deviceID)
      HSerPrint   " (d"
      HSerPrint   Str(deviceID)
      HSerPrint   ")"
      HSerPrintCRLF
    end if
  next
  HSerPrint   "End of Device Search": HSerPrintCRLF 2
  End
```

Supported in &lt;I2C.H&gt;

</div>
