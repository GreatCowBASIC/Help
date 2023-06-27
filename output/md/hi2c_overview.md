<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="hi2c_overview"></span>HI2C Overview

</div>

</div>

</div>

<span class="strong">**Introduction:**</span>

These methods allow Great Cow BASIC programs to send and receive Inter-
Integrated Circuit (I2C™) messages via:

<div class="itemizedlist">

-   Master Synchronous Serial Port (MSSP) module of the microcontroller
    for the Microchip PIC architecture, or
-   ATMEL 2-wire Serial Interface (TWI) for the Atmel AVR
    microcontroller architecture.

</div>

These methods are serial interfaces that are useful for communicating
with other peripheral or microcontroller devices. These peripheral
devices may be serial EEPROMs, shift registers, display drivers, A/D
converters, etc.

This method can operate in one of two operational modes:

<div class="itemizedlist">

-   Master Mode, or
-   Slave mode (with general address call)

</div>

These methods fully implement all the I2C master and slave functions
(including general call support) and supports interrupts on start and
stop bits in hardware to determine a free bus (multi-master function).

These methods implement the standard mode specifications as well as
7-bit and 10-bit addressing. A “glitch” filter is built into the SCL and
SDA pins when the pin is an input. This filter operates in both the 100
KHz and 400 KHz modes. In the 100 KHz mode, when these pins are an
output, there is a slew rate control of the pin that is independent of
device frequency.

A hardware I2C/TWI module within the microcontroller is required for
these methods.

The driver supports two hardware I2C ports. The second port is addressed
by the suffix HI2C2. All HI2C commands are applicable to the second
HI2C2 port.

For the Microchip I2C modules Specific for the 18F class including the
K42, K83 and Q10, see the later section regarding clock sources and I2C
frequencies.

The method supports the following frequencies:

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;"><span class="strong"><strong>Frequency</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Description</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Support</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p>Up to 400 kbits/s</p></td>
<td style="text-align: left;"><p>I2C/TWI <code class="literal">fast mode</code>: Defined as transfer rates up to 400 kbit/s.</p></td>
<td style="text-align: left;"><p>Supported</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>Up to 100 kbit/s.</p></td>
<td style="text-align: left;"><p>I2C/TWI <code class="literal">standard mode</code>: Defined as transfer rates up to 100 kbit/s.</p></td>
<td style="text-align: left;"><p>Supported</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>Up to 1 Mbit/s.</p></td>
<td style="text-align: left;"><p>I2C <code class="literal">fast-mode plus</code>: Allowing up to 1 Mbit/s.</p></td>
<td style="text-align: left;"><p>Supported on I2C Module Only</p>
<p>Requires alternative clock source to be set.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>Up to 3.4 Mbit/s.</p></td>
<td style="text-align: left;"><p>I2C <code class="literal">high speed</code>: Allowing up to 3.4 Mbit/s.</p></td>
<td style="text-align: left;"><p>Supported on I2C Module Only</p>
<p>Requires alternative clock source to be set.</p></td>
</tr>
</tbody>
</table>

</div>

<span class="strong">**Relevant Constants:**</span>

These constants control the setup of the hardware I2C methods:

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;"><span class="strong"><strong>Constant</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Controls</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Usage</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">Master</code></p></td>
<td style="text-align: left;"><p>Operational mode of the microcontroller</p></td>
<td style="text-align: left;"><p><code class="literal">HI2CMode ( Master )</code></p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">Slave</code></p></td>
<td style="text-align: left;"><p>Operational mode of the microcontroller</p></td>
<td style="text-align: left;"><p><code class="literal">HI2CMode ( Slave )</code></p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p><code class="literal">HI2C_BAUD_RATE</code></p></td>
<td style="text-align: left;"><p>Operational speed of the microcontroller. Defaults to 100 kbit/s</p></td>
<td style="text-align: left;"><p>For Microchip SSP or MSSP modules and AVR microcontrollers:</p>
<p><code class="literal">#define HI2C_BAUD_RATE 400</code> or<br />
<code class="literal">#define HI2C_BAUD_RATE 100.</code><br />
Where <code class="literal">#define HI2C_BAUD_RATE 100</code> is the default value and therefore does need to be specified.</p>
<p>For Microchip I2C module:</p>
<p>'define HI2C_BAUD_RATE 125' is the default KHz. You can override this value if you set up an alternative clock source.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p><code class="literal">HI2CITSCLWaitPeriod</code></p></td>
<td style="text-align: left;"><p>Sets the TSCL period to Zero as the Stop condition must be held for TSCL after Stop transition. Default to 70, some solutions can use this set to 0. The clock source and clock method must be reviewed before changing this setting.</p></td>
<td style="text-align: left;"><p>#define HI2CITSCLWaitPeriod 70</p></td>
</tr>
</tbody>
</table>

</div>

<span class="strong">**Port Settings:**</span>

The settings of the pin direction is critical to the operation of these
methods.  
For the Microchip SSP/MSSP modules both ports <span
class="strong">**must**</span> be set as <span
class="strong">**input**</span>.  
For the Microchip I2C module both ports <span
class="strong">**must**</span> be set as <span
class="strong">**output**</span>. And, configure the pins as open-drain
and set the I2C levels - see example below for usage.  
In all case the data and clock line \*must \* be pulled up with an
appropriate resistor (typically 4.k @ 5.0v for 100Mkz transmissions).  

<div class="informaltable">

| <span class="strong">**Constant**</span> | <span class="strong">**Controls**</span>       | <span class="strong">**Default Value**</span> |
|:-----------------------------------------|:-----------------------------------------------|:----------------------------------------------|
| `HI2C_DATA`                              | Pin on microcontroller connected to I2C data   | Must be defined                               |
| `HI2C_CLOCK`                             | Pin on microcontroller connected to I2C clock) | Must be defined                               |

</div>

  
<span class="strong">**Microchip I2C modules Specific Support - 18F
class including the K42, k47, K83, Q43, Q40/Q41, Q83/Q84, and
Q71**</span>

Clock Sources: The Microchip I2C can select one of ten clocks sources as
shown in the table below. I2C1Clock\_MFINTOSC is the default which
supports 125KHz.  
  
It is important to change the clock source from the default of 125KHz if
you want faster I2C communications. Change the following constant to
change the clock source. Obviously, you setup the clock source correctly
for I2C to operate:  
  

``` screen
        #define I2C1CLOCKSOURCE  I2C1CLOCK_MFINTOSC
```

Clock Constants that can be I2C clock sources are

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;"><span class="strong"><strong>Constant</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Clock Source</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Default Value</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p>I2C1CLOCK_SMT1</p></td>
<td style="text-align: left;"><p>SMT</p></td>
<td style="text-align: left;"><p>0x09+</p>
<p>You MUST setup the SMT clock source.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>I2C1CLOCK_TIMER6PSO</p></td>
<td style="text-align: left;"><p>Timer 6 Postscaler</p></td>
<td style="text-align: left;"><p>0x08+</p>
<p>You MUST setup the timer6 clock source.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>I2C1CLOCK_TIMER4PSO</p></td>
<td style="text-align: left;"><p>Timer 4 Postscaler</p></td>
<td style="text-align: left;"><p>0x07+</p>
<p>You MUST setup the timer4 clock source.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>I2C1CLOCK_TIMER2PSO</p></td>
<td style="text-align: left;"><p>Timer 2 Postscaler</p></td>
<td style="text-align: left;"><p>0x06+</p>
<p>You MUST setup the timer3 clock source.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>I2C1CLOCK_TIMER0OVERFLOW</p></td>
<td style="text-align: left;"><p>Timer 0 Overflow</p></td>
<td style="text-align: left;"><p>0x05+</p>
<p>You MUST setup the timer0 clock source.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>I2C1CLOCK_REFERENCEOUT</p></td>
<td style="text-align: left;"><p>Reference clock out</p></td>
<td style="text-align: left;"><p>0x04+</p>
<p>You MUST ensure the clock source generates a within specification clock source. Check the datasheet for more details.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>I2C1CLOCK_MFINTOSC</p></td>
<td style="text-align: left;"><p>MFINTOSC</p></td>
<td style="text-align: left;"><p>0x03 (default)+</p>
<p>This is the default and will set the I2C clock to 125KHz</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>I2C1CLOCK_HFINTOSC</p></td>
<td style="text-align: left;"><p>HFINTOSC</p></td>
<td style="text-align: left;"><p>0x02+</p>
<p>You MUST ensure the clock source generates a within specification clock source. Check the datasheet for more details.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>I2C1CLOCK_FOSC</p></td>
<td style="text-align: left;"><p>FOSC</p></td>
<td style="text-align: left;"><p>0x01+</p>
<p>You MUST ensure the clock source generates a within specification clock source. Check the datasheet for more details.</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>I2C1CLOCK_FOSC4</p></td>
<td style="text-align: left;"><p>FOSC/4</p></td>
<td style="text-align: left;"><p>0x00+</p>
<p>You MUST ensure the clock source generates a within specification clock source. Check the datasheet for more details.</p></td>
</tr>
</tbody>
</table>

</div>

  
  
This an example of using a Clock Source. This example uses the SMTClock
source as the clock source, the following methods implement the SMT as
the clock source. The defintion of the constant, the include, setting of
the SMT period, initialisation and starting of the clock source are ALL
required.  

``` screen
    'Set the clock source constant
    #define I2C1CLOCKSOURCE I2C1CLOCK_SMT1

    'include the SMT capability
    #Include <SMT_Timers.h>

    'Setup the SMT
    '400 KHz @ 64MHZ
    Setsmt1Period ( 39 )
      ' 100 KHz @ 64MHZ
      ' Setsmt1Period ( 158 )
    'Initialise and start the SMT
    InitSMT1(SMT_FOSC,SMTPres_1)
    StartSMT1
```

For other clock sources refer to the appropriate datasheet.  
  
Error Codes: This module has extensive error reporting. For the standard
error report refer to the appropriate datasheet. Great Cow BASIC also
exposes the following error messages to enable the user code to handle
the errors appropriately. These are exposed via the variable
`HI2C1lastError` - the bits of the `HI2C1lastError` are set as in the
table shown below.

<div class="informaltable">

| <span class="strong">**Constant**</span> | <span class="strong">**Error Value/Bit**</span> |
|:-----------------------------------------|:------------------------------------------------|
| I2C1\_GOOD                               | 0                                               |
| I2C1\_FAIL\_TIMEOUT                      | 1                                               |
| I2C1\_TXBE\_TIMEOUT                      | 2                                               |
| I2C1\_START\_TIMEOUT                     | 4                                               |
| I2C1\_RESTART\_TIMEOUT                   | 8                                               |
| I2C1\_RXBF\_TIMEOUT                      | 16                                              |
| I2C1\_ACK\_TIMEOUT                       | 32                                              |
| I2C1\_MDR\_TIMEOUT                       | 64                                              |
| I2C1\_STOP\_TIMEOUT                      | 128                                             |

</div>

  
Shown below are two examples of using Hardware I2C with Great Cow BASIC.

  
<span class="strong">**Example 1:**</span>  
This example examines the IC2 modules using the Microchip SSP/MSSP
module and the AVR microcontrollers. This will display the result on a
serial terminal. This code will require adaption but the code shows an
approach to discover the IC2 devices.

``` screen
    #chip mega328p, 16
    #config MCLRE_ON

    ' Define I2C settings
    #define HI2C_BAUD_RATE 400
    #define HI2C_DATA PORTC.5
    #define HI2C_CLOCK PORTC.4
    'I2C pins need to be input for SSP module when used on Microchip PIC device
    Dir HI2C_DATA in
    Dir HI2C_CLOCK in

    'MASTER MODE
    HI2CMode Master

    'USART/SERIAL PORT WORKS WITH max232 THEN TO PC Terminal
    #define USART_BAUD_RATE 9600
    #define USART_TX_BLOCKING
    Dir PORTc.6 Out
    #define USART_DELAY 0 ms

    HSerPrintCRLF 2
    HSerPrint "Hardware I2C Discover using the "
    HSerPrint CHipNameStr
    HSerPrintCRLF 2

    for deviceID = 0 to 255
      HI2CStart
      HI2CSend ( deviceID )

      if HI2CAckPollState = false then

         if (( deviceID & 1 ) = 0 ) then
         HSerPrint "W"
        else
         HSerPrint "R"
        end if
        HSerSend 9
        HSerPrint   "ID: 0x"
        HSerPrint   hex(deviceID)
        HSerSend 9
        HSerPrint "(d)"+str(deviceID)
        HSerPrintCRLF
        HI2CSend ( 0 )

      end if

      HI2CStop
    next
    HSerPrintCRLF
    HSerPrint   "End of Device Search"
    HSerPrintCRLF 2
```

  
  
This example examines the IC2 devices and displays on a serial terminal
for the I2C module only.  
This code will require adaption but the code shows an approach to
discover the IC2 devices.  
This code will only operate on the Microchip I2C module.  

``` screen
    #chip 18f25k42, 16
    #option Explicit
    #config MCLRE_ON

    #startup InitPPS, 85

    Sub InitPPS

          RC4PPS =      0x22   'RC4->I2C1:SDA1
          RC3PPS =      0x21   'RC3->I2C1:SCL1
          I2C1SCLPPS =  0x13   'RC3->I2C1:SCL1
          I2C1SDAPPS =  0x14   'RC4->I2C1:SDA1

          'Module: UART1
          RC6PPS = 0x0013     'TX1 > RC6
          U1RXPPS = 0x0017    'RC7 > RX1

    End Sub

    'Template comment at the end of the config file

    'Setup Serial port
    #define USART_BAUD_RATE 9600
    #define USART_TX_BLOCKING


    ' Define I2C settings
    #define HI2C_BAUD_RATE 125
    #define HI2C_DATA PORTC.4
    #define HI2C_CLOCK PORTC.3
    'Initialise I2C - note for the I2C module the ports need to be set to Output.
    Dir HI2C_DATA out
    Dir HI2C_CLOCK out
    RC3I2C.TH0=1   'Port specific controls may be required - see the datasheet
    RC4I2C.TH0=1   'Port specific controls may be required - see the datasheet

    'For this solution we can set the TSCL period to Zero as the Stop condition must be held for TSCL after Stop transition
    #define HI2CITSCLWaitPeriod 0

    '*****************************************************************************************************
    'Main program commences here.. everything before this is setup for the board.

    dim DeviceID as byte
    Dim DISPLAYNEWLINE as Byte

     do

        HSerPrintCRLF
        HSerPrint "Hardware I2C "
        HSerPrintCRLF 2

          ' Now assumes Serial Terminal is operational
          HSerPrintCRLF
          HSerPrint "   "
          'Create a horizontal row of numbers
          for DeviceID = 0 to 15
            HSerPrint hex(deviceID)
            HSerPrint " "
          next

          'Create a vertical column of numbers
          for DeviceID = 0 to 255
            DisplayNewLine = DeviceID % 16
            if DisplayNewLine = 0 Then
              HSerPrintCRLF
              HserPrint hex(DeviceID)
              if DisplayNewLine > 0 then
                HSerPrint " "
              end if
            end if
            HSerPrint " "

            'Do an initial Start
            HI2CStart
            if HI2CWaitMSSPTimeout <> True then

              'Send to address to device
              HI2CSend ( deviceID )

              'Did device fail to respond?
              if HI2CAckPollState = false then
                HI2CSend ( 0 )
                HSerPrint   hex(deviceID)
              Else
                HSerPrint "--"
              end if
              'Do a stop.
              HI2CStop

            Else
              HSerPrint "! "
            end if

          next

          HSerPrintCRLF 2
          HSerPrint   "End of Search"
          HSerPrintCRLF 2
          wait 1 s
          wait while SwitchIn = On
      loop
```

  
  

Supported in &lt;HI2C.H&gt;

</div>
