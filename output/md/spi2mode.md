<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="spi2mode"></span>SPI2Mode

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

<span class="strong">**Legacy SPI Module**</span>

``` programlisting
    SPI2Mode ( _Mode_ [, _SPIClockMode_])

    // Specfic the hardware SPI operating mode, can be MasterFast, Master, MasterSlow
    #DEFINE HWSPI2Mode   MasterFast

    // You can use a shared constant to set a consant with the desired SPIClockMode
    #DEFINE HWSPI2ClockMode  SPI_CPOL_0 + SPI_CPHA_0
```

<span class="strong">**Modern SPI Module**</span>

``` programlisting
    SPI2Mode ( _Mode_ , _SPIClockMode_ )

    // Specfic the hardware SPI operating mode, can be MasterUltraFast, MasterFast, Master, MasterSlow
    #DEFINE HWSPI2Mode   MasterUltraFast

    // You can use a shared constant to set a consant with the desired SPIClockMode
    #DEFINE HWSPI2ClockMode  SPI_SS_0 + SPI_CPOL_0 + SPI_CPHA_0

    // Optionally change the SPI BAUD RATE from 4000
        #DEFINE SPI2_BAUD_RATE 8000

    // Optionally update the SPI baud rate register with an explicit value
    //  typical use is to entry a specific calculated value
        #DEFINE SPI2_BAUD_RATE_REGISTER  55
```

<span class="strong">**Command Availability:**</span>

Available on Microchip PIC and AVR microcontrollers with Hardware SPI
modules.

<span class="strong">**Legacy SPI Module vs Modern SPI Module:**</span>

GCBASIC automatically detects which SPI peripheral your chip has and
generates the matching code - you do not select it yourself. However,
the two modules differ in the options available and in how
`SPIClockMode` is used, so it helps to know which one applies to your
microcontroller:

<div class="itemizedlist">

-   <span class="strong">**Legacy SPI Module**</span> - the older-style
    SPI peripheral. This applies to classic PIC microcontrollers and to
    all AVR microcontrollers <span class="strong">**except**</span> the
    AVR Dx series. `SPIClockMode` is optional, and the fastest available
    speed is `MasterFast`.
-   <span class="strong">**Modern SPI Module**</span> - the newer, more
    capable SPI peripheral. This applies to recent PIC18 Q-series, K42,
    and K83 microcontrollers, and to AVR Dx-series microcontrollers.
    `SPIClockMode` is mandatory (it also sets the Slave Select
    behavior), and an additional `MasterUltraFast` speed is available.
    Modern SPI Module pins are usually also assigned through PPS.

</div>

If you want to confirm which module the compiler selected for your chip,
define `SHOWSPISCRIPTINFO` - see "Displaying SPI Configuration
Information" later in this section.

<span class="strong">**Explanation:**</span>

<span class="emphasis">*Mode*</span> sets the mode of the SPI module
within the microcontroller. These are the possible SPI Modes:

<div class="informaltable">

<span class="strong">**Mode Name**</span>

</div>

</div>

<span class="strong">**Description**</span>

<span class="strong">**Legacy SPI Module**</span>

`MasterSlow`

Master mode, SPI clock is 1/64 of the frequency of the microcontroller.

`Master`

Master mode, SPI clock is 1/16 of the frequency of the microcontroller.

`MasterFast`

Master mode, SPI clock is 1/4 of the frequency of the microcontroller.

<span class="strong">**Modern SPI Module**</span>

`MasterSlow`

SPI2BAUDRATE\_SCRIPT constant ( used to set the register
`SPI2_BAUD_RATE_REGISTER` ) is calculated as INT( ChipMHz \* 8 /
SPI2\_BAUD\_RATE \* 1000) - 1. Where SPI2\_BAUD\_RATE defaults to
ChipMHz / 4 \* 1000.

Also, see `SPI2_BAUD_RATE` and `SPI2_BAUD_RATE_REGISTER` for changing
SPI Baud Rate and settting the SPI Baud Rate register with an explicit
value

`Master`

SPI2BAUDRATE\_SCRIPT constant ( used to set the register
`SPI2_BAUD_RATE_REGISTER` ) is calculated as INT( ChipMHz \* 2 /
SPI2\_BAUD\_RATE \* 1000) - 1. Where SPI2\_BAUD\_RATE defaults to
ChipMHz / 4 \* 1000.

Also, see `SPI2_BAUD_RATE` and `SPI2_BAUD_RATE_REGISTER` for changing
SPI Baud Rate and settting the SPI Baud Rate register with an explicit
value

`MasterFast`

SPI2BAUDRATE\_SCRIPT constant ( used to set the register
`SPI2_BAUD_RATE_REGISTER` ) is calculated as INT( ChipMHz /
SPI2\_BAUD\_RATE \* 1000) - 1. Where SPI2\_BAUD\_RATE defaults to
ChipMHz / 4 \* 1000.

Also, see `SPI2_BAUD_RATE` and `SPI2_BAUD_RATE_REGISTER` for changing
SPI Baud Rate and settting the SPI Baud Rate register with an explicit
value

`MasterUltraFast`

SPI2BAUD is set to 0 and therefore the SPI clock baud rate to maximum

<span class="strong">**Slave Operations**</span>

`Slave`

Slave mode

`SlaveSS`

Slave mode, with the Slave Select pin enabled.

For the <span class="strong">**Legacy SPI Module**</span> <span
class="emphasis">*SPIClockMode*</span> is an optional parameter to set
the mode of the SPI clock mode. This optional parameter sets both the
clock polarity and clock edge.

For the <span class="strong">**Modern SPI Module**</span> <span
class="emphasis">*SPIClockMode*</span> is a mandated parameter to set
the mode of the SPI clock mode and the clock polarity bit. This
parameter sets both the clock polarity and clock edge.   There is no
verification by the compiler if you do use the <span
class="emphasis">*\_SPIClockMode*</span> for the Modern SPI Module - the
compiler uses the default value of
`SPI_SS = 0 & SPI_CPOL = 0 & SPI_CPHA = 0`  The use of SPI\_SS\_n
requires the PPS to be set.  If PPS is not set then the SPI\_SS will use
the default value specified in the specfic GCBASIC library.

For the \_SPIClockMode\_range, see the tables below:

<div class="informaltable">

<span class="strong">**SPIClockMode**</span>

</div>

<span class="strong">**Description**</span>

<span class="emphasis">*Legacy SPI Module*</span>

0

SPI\_CPOL = 0 & SPI\_CPHA = 0

1

SPI\_CPOL = 0 & SPI\_CPHA = 1

2

SPI\_CPOL = 1 & SPI\_CPHA = 0

3

SPI\_CPOL = 1 & SPI\_CPHA = 1

<span class="emphasis">*Modern SPI Module*</span>

0

SPI\_SS = 0 & SPI\_CPOL = 0 & SPI\_CPHA = 0

2

SPI\_SS = 0 & SPI\_CPOL = 1 & SPI\_CPHA = 0

5

SPI\_SS = 1 & SPI\_CPOL = 0 & SPI\_CPHA = 1

7

SPI\_SS = 1 & SPI\_CPOL = 1 & SPI\_CPHA = 1

You can use a constant value or alternatively you can use constants to
set the SPIClockMode as follows:

``` programlisting
    _Legacy SPI Module_
    SPI2Mode ( MasterFast, SPI_CPOL_n + SPI_CPHA_n )

    _Modern SPI Module_
    SPI2Mode ( MasterFast, SPI_SS_n + SPI_CPOL_n + SPI_CPHA_n )
```

Where the following parameters can be used as a calculation to set the
SPIClockMode.

<div class="informaltable">

<span class="strong">**Mode Name**</span>

</div>

<span class="strong">**Description**</span>

<span class="emphasis">*Legacy SPI Module*</span>

SPI\_CPOL\_0

CPOL = 0

SPI\_CPOL\_1

CPOL = 1

SPI\_CPHA\_0

CPHA = 0

SPI\_CPHA\_1

CPHA = 1

<span class="emphasis">*Modern SPI Module*</span>

SPI\_SS\_0

SS = 0 Clear polarity bit

SPI\_SS\_1

SS = 1 Set polarity bit

<span class="strong">**Explicitly changing the SPI baud rate on the
Modern SPI Module**</span>

You can explicitly change the SPI baud rate by defining the
`SPI2_BAUD_RATE` constant as follows.   This will change the default SPI
baud from 4000 to the specified numeric value.

``` programlisting
    #DEFINE SPI2_BAUD_RATE   8000
```

You can explicitly set the SPI baud rate register by defining the
`SPI2_BAUD_RATE_REGISTER` constant as follows.   This will write the
explicit numeric value to the SPI baud register.   This overwrites any
compiler calculated value.

``` programlisting
    #DEFINE SPI2_BAUD_RATE_REGISTER  55
```

<span class="strong">**Legacy SPI Module Summary:**</span>

When using SPI setting the clock frequency is completed using SPI2Mode,
and the master must also configure the clock polarity and phase with
respect to the data. Using the two options as CPOL and CPHA.

The timing diagram is shown below. The timing is further described and
applies to both the master and the slave device.

When CPOL=0 the base value of the clock is zero, i.e. the active state
is 1 and idle state is 0.

<div class="itemizedlist">

-   For CPHA=0, data are captured on the clock’s rising edge (low→high
    transition) and data is output on a falling edge (high→low clock
    transition).
-   For CPHA=1, data are captured on the clock’s falling edge and data
    is output on a rising edge.

</div>

When CPOL=1 the base value of the clock is one (inversion of CPOL=0),
i.e. the active state is 0 and idle state is 1.

<div class="itemizedlist">

-   For CPHA=0, data are captured on clock’s falling edge and data is
    output on a rising edge.
-   For CPHA=1, data are captured on clock’s rising edge and data is
    output on a falling edge.

</div>

When CPHA=0 means sampling on the first clock edge and , while CPHA=1
means sampling on the second clock edge, regardless of whether that
clock edge is rising or falling. Note that with CPHA=0, the data must be
stable for a half cycle before the first clock cycle.

In other words, CPHA=0 means transmitting data on the active to idle
state and CPHA=1 means that data is transmitted on the idle to active
state edge. Note that if transmission happens on a particular edge, then
capturing will happen on the opposite edge(i.e. if transmission happens
on falling, then reception happens on rising and vice versa). The MOSI
and MISO signals are usually stable (at their reception points) for the
half cycle until the next clock transition. SPI master and slave devices
may well sample data at different points in that half cycle.

This adds more flexibility to the communication channel between the
master and slave.

<div class="informalfigure">

<div class="mediaobject" align="center">

![graphic](./images/spimode1.PNG)

</div>

</div>

Legacy Example:

This example demonstrates the SPI capabilities for the mega328p. The
process is similar of any microcontroller..

You must set the data line as inputs and outputs.

``` programlisting
        #chip mega328p, 16
        #option explicit
        #include <UNO_mega328p.h >

        #DEFINE SPI2_HardwareSPI  'comment this out to make into Software SPI but, you may have to change clock lines

        'Pin mappings for SPI - this SPI driver supports Hardware SPI
        #DEFINE SPI2_DC       DIGITAL_8          ' Data command line
        #DEFINE SPI2_CS       DIGITAL_4          ' Chip select line
        #DEFINE SPI2_RESET    DIGITAL_9          ' Reset line

        #DEFINE SPI2_DI       DIGITAL_12          ' Data in | MISO
        #DEFINE SPI2_DO       DIGITAL_11          ' Data out | MOSI
        #DEFINE SPI2_SCK      DIGITAL_13          ' Clock Line

        dir SPI2_DC    out
        dir SPI2_CS    out
        dir SPI2_RESET out
        dir SPI2_DO    Out
        dir SPI2_DI    In
        dir SPI2_SCK   Out

        'If DIGITAL_10 is NOT used as the SPI2_CS (sometimes called SS) the port must and output or set as input/pulled high with a 10k resistor.
        'As follows:
        'If CS is configured as an input, it must be held high to ensure Master SPI operation.
        'If the CS pin is driven low by peripheral circuitry when the SPI is configured as a Master with the SS pin defined as an input, the
        'SPI system interprets this as another master selecting the SPI as a slave and starting to send data to it!
        'If CS is an output SPI communications will commence with no flow control.
        dir DIGITAL_10 Out


        dim outbyte, inbyte as byte


        #DEFINE HWSPI2CLOCKMODE  SPI_CPOL_0 + SPI_CPHA_0
        SPI2Mode ( MasterFast, HWSPI2CLOCKMODE )


       do
        set SPI2_CS OFF//  Select line
        set SPI2_DC OFF//  Send Data if off, or, Data if On
        SPI2Transfer ( outbyte, inbyte )          ' <<< the SPI2Transfer instruction
        set SPI2_CS ON//   Deselect Line
        set SPI2_DC ON
        wait 10 ms
       loop
```

<span class="strong">**Key line:**</span>
`SPI2Transfer ( outbyte, inbyte )` — sends \` outbyte \` over MOSI and
simultaneously receives the byte clocked in on MISO into \` inbyte \`
using the second hardware SPI module, since SPI transfers data in both
directions on every clock cycle.

<span class="strong">**Modern SPI Module Summary:**</span>

When using SPI setting the clock frequency is completed using SPI2Mode,
and the master must also configure the clock polarity and phase with
respect to the data.    Using the three options as CPOL, CPHA and SS.

The timing diagram is as shown in the prevsious section that impacts
CPOL and CPHA.  

If you have set the PPS for SPI2SSPPS then control of the SPI SS ( also
know as CS / ChipSelect) is automatically controlled by the SPI
transmission.

<span class="strong">**Example:**</span>

``` programlisting
    #CHIP 18F16Q41,64

    #STARTUP InitPPS, 85
    #DEFINE PPSToolPart 18F16Q41

    // Use PPS to assign SPI capabilities to specific ports
    // NOTE: the RxxPPS pin assignments and function-selector values below are illustrative -
    // confirm the correct pins and PPS function values for SPI2 on your specific device datasheet.
    SUB InitPPS
        SPI2SDIPPS = 0x000C
        RB6PPS = 0x001B
        SPI2SCKPPS = 0x000E
        RB5PPS = 0x001C
        RC6PPS = 0x001D
        SPI2SSPPS = 0x0016
    END SUB


    // Optionally change the SPI BAUD RATE from 4000
        // #DEFINE SPI2_BAUD_RATE 8000

    // Optionally update the SPI baud rate register with an explicit value
    //  typical use is to entry a specific calculated value
        // #DEFINE SPI2_BAUD_RATE_REGISTER  1

    // Specfic the hardware SPI operating model
    // Can be MasterUltraFast, MasterFast, Master, MasterSlow
    #DEFINE HWSPI2Mode   MasterUltraFast

    // You can use a shared constant to set a consant with the desired SPIClockMode
    #DEFINE HWSPI2ClockMode  SPI_SS_0 + SPI_CPOL_0 + SPI_CPHA_0

    // Call SPI2Mode
    SPI2Mode (HWSPI2Mode,  HWSPI2ClockMode )

    // Define the GCBASIC required SPI port constants.
    // Must match any PPS defined.
    #DEFINE SPI2_SCK   PORTB.6
    #DEFINE SPI2_DO    PORTB.5
    #DEFINE SPI2_DI    PORTB.4
    #DEFINE SPI2_DC    PortC.1
    #DEFINE SPI2_CS    PortC.6
    #DEFINE SPI2_RESET PortC.2

    DO
        // Send 0x75 via SPI over and over again...
        FastHWSPI2Transfer 0x75          ' <<< the FastHWSPI2Transfer instruction
    LOOP
```

<span class="strong">**Key line:**</span>
`FastHWSPI2Transfer 0x75` — sends the byte `0x75` using the second
Modern SPI Module configured just above by
`SPI2Mode (HWSPI2Mode, HWSPI2ClockMode)`; the SPI pins must match
whatever was assigned through PPS in `InitPPS`.

<span class="strong">**Displaying SPI Configuration
Information:**</span>

You can define `SHOWSPISCRIPTINFO` to have the compiler report
diagnostic information while it evaluates the SPI configuration. This
includes the chip name, whether the Legacy SPI Module or Modern SPI
Module constants were defined, and the calculated SPI baud rate values.

``` programlisting
    #DEFINE SHOWSPISCRIPTINFO
```

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="spi2transfer" class="link" title="SPI2Transfer">SPI2Transfer</a>
-   <a href="fasthwspi2transfer" class="link" title="FastHWSPI2Transfer">FastHWSPI2Transfer</a>

</div>
