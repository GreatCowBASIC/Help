<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="readad12"></span>ReadAD12

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

For a normal (also called a Single Channel) read, use:

``` programlisting
    user_variable = ReadAD12( ANX )
```

For a Differential Channel read, use the following, where ANpX is the
positive port and ANnY is the negative port:

``` programlisting
    user_variable = ReadAD12( ANpX , ANnY )
```

To force a 12-bit AD channel to always respond with a value in the range
\[0 to 4095\], use:

``` programlisting
    user_variable = ReadAD12( ANX , TRUE )
```

<span class="strong">**Command Availability:**</span>

When using `ReadAD12( ANX )`, the returned value is a 12-bit number
\[0-4095\]. The receiving variable can be a word, integer, or long.

When using `ReadAD12( ANpX , ANnY )`, the returned value is an integer,
since negative values can be returned.

`ReadAD12` is a function that reads the built-in analog-to-digital
converter (ADC) that most microcontroller chips include. The port is
specified as `AN0`, `AN1`, `AN2`, and so on, up to the number of analog
inputs available on the chip in use. Those familiar with Atmel AVR
microcontrollers can also refer to the ports as `ADC0`, `ADC1`, and so
on — refer to the chip’s datasheet to find the number of ports
available. (Note: it is perfectly acceptable to use `ANx` on AVR, or
`ADCx` on a Microchip PIC.)

Other functions with similar behaviour are `ReadAD` and `ReadAD10` — see
their Help pages for the specific usage of each.

`AD_DELAY` controls the acquisition delay: the time the ADC’s internal
holding capacitor is given to charge to the input voltage before the
reading is taken. The default value is 20 us. If a reading looks noisy
or consistently off — especially from a high-impedance sensor, such as a
bare voltage divider without a buffer — increasing this delay is often
the fix, since the capacitor needs more time to settle. Change it with:

``` programlisting
    #define AD_DELAY 4 10us
```

`ADSPEED` controls the source of the clock for the ADC module; it varies
from one microcontroller to another. `InternalClock` is a Microchip
PIC-only option that drives the ADC from an internal RC oscillator. The
default value is 128.

``` programlisting
    'default value
    #define ADSPEED MEDIUMSPEED

    'pre-defined constants
    #define HIGHSPEED 255
    #define MEDIUMSPEED 128
    #define LOWSPEED 0
```

`AD_ACQUISITION_TIME_SELECT_BITS` also controls the acquisition time
select bits. Acquisition time is the duration the ADC’s charge-holding
capacitor stays connected to the AD channel, from the moment the read
starts until conversion begins — the same underlying delay that
`AD_DELAY` adjusts, exposed here as the raw bit pattern for
microcontrollers whose datasheet documents it this way.

The default value of `AD_ACQUISITION_TIME_SELECT_BITS` is `0b100`
(decimal 4), which sets all three ACQT bits. To change it:

``` programlisting
    'change the default value
    #define AD_ACQUISITION_TIME_SELECT_BITS 0b001    'this will only set ACQT bit 0; ACQT bits 1 and 2 will be cleared
```

<span class="strong">**Example 1 - Read 12-bit ADC**</span>

``` programlisting
    #chip 16F1788, 8

    'Set the input pin direction
    Dir PORTA.0 In

    'Print 255 readings
    For CurrentAddress = 0 to 255

        'Take a reading and show it
        Print str(ReadAD12(AN0))          ' <<< the ReadAD12 instruction

        'Wait 10 minutes before getting another reading
        Wait 10 min
    Next
```

<span class="strong">**Key line:**</span>
`Print str(ReadAD12(AN0))` — reads channel `AN0` and returns whatever
resolution the chip’s ADC module natively supports (8, 10, or 12 bits).

<span class="strong">**Example 2 - Force a 12-bit value to be
returned**</span>

``` programlisting
    #chip 16F1788, 8

    'Set the input pin direction
    Dir PORTA.0 In

    'Print 255 readings
    For CurrentAddress = 0 to 255

        'Take a reading and show it
        Print str(ReadAD12(AN0), TRUE)          ' <<< forcing a 12-bit result regardless of the chip's native ADC resolution
        'Wait 10 minutes before getting another reading
        Wait 10 min
    Next
```

<span class="strong">**Key line:**</span> `ReadAD12(AN0), TRUE` — the
`TRUE` argument guarantees a value in the range \[0-4095\] even on a
chip whose ADC natively returns 8 or 10 bits.

<span class="strong">**Example 3 - Differential reading**</span>

This example uses the differential capabilities of the ADC and writes
the output to a serial terminal. The output value will be in the range
\[-4095 to 4095\]. `AN0` and `AN2` are used for the differential
reading.

``` programlisting
    #chip 16F1789, 8

    'USART settings
    #define USART_BAUD_RATE 9600  'Initializes USART port with 9600 baud
    #define USART_TX_BLOCKING     'wait for tx register to be empty
    wait 100 ms

    'Set the input pin direction
    Dir PORTA.0 In
    Dir PORTA.2 In

    'Loop to take readings until the EEPROM is full
    For CurrentAddress = 0 to 255

        'Take a reading and log it
        HSerPrint ReadAD12( AN0, AN2 )          ' <<< the differential ReadAD12 instruction
        HserPrintCRLF
        'Wait 10 minutes before getting another reading
        Wait 10 min

    Next
```

<span class="strong">**Key line:**</span> `ReadAD12( AN0, AN2 )` — reads
the voltage difference between `AN0` (positive) and `AN2` (negative) as
a signed integer, rather than an absolute voltage on a single pin.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="readad" class="link" title="ReadAD">ReadAD</a> — 8-bit
    resolution single/differential read
-   <a href="readad10" class="link" title="ReadAD10">ReadAD10</a> — 10-bit
    resolution single/differential read
-   <a href="hserprint" class="link" title="HSerPrint">HSerPrint</a> — sending
    a reading over a serial connection, as used in Example 3

</div>

</div>
