<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="readad10"></span>ReadAD10

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

For a normal ( also called a Single Channel ) read use.

``` screen
    word_variable = ReadAD10( ANX )
```

For a Differential Channel read use the following.  Where ANpX is the
positive port, and ANnY is the negative port.

``` screen
    integer_variable = ReadAD10( ANpX , ANnY )
```

To obtain a 10-bit value from an AD Channel use the following to force a
10 bit AD Channel to respond with the correct value, in terms of the
range \[0 to 1023\]

``` screen
    integer_variable = ReadAD10( ANX , TRUE )
```

<span class="strong">**Command Availability:**</span>

ReadAD10 is a function that can be used to read the built-in analog to
digital converter that many microcontroller chips include.  The port
should be specified as AN0, AN1, AN2, etc., up to the number of analog
inputs available on the chip that is in use.  Those familiar with Atmel
AVR microcontrollers can also refer to the ports as ADC0, ADC1,
etc.  Refer to the datasheet for the microcontroller chip to find the
number of ports available.  (Note: it’s perfectly acceptable to use ANx
on AVR, or ADCx on the microcontroller.)

When using <span class="strong">**ReadAD10**</span> ( ANX ) the returned
value is the <span class="strong">**full range**</span> of the ADC
module.  Therefore, the method will return an 8 bit value \[0-255\], or
an 10 bit value \[0-1023\] or an 12 bit value \[0-4095\].   This is
dependent on the microcontrollers capabilities.   For a 10 bit value
\[0-1023\] always to be returned use user\_variable = ReadAD10( ANX ,
TRUE ).   The user variable can be a byte, word, integer or long but
typically a word is recommnended.

When using <span class="strong">**ReadAD10**</span> ( ANpX , ANnY ), for
differential ADC reading, the returned value is an integer as negative
values will be returned.

When using <span class="strong">**ReadAD10**</span> ( ANpX , TRUE ), to
force a 10 bit ADC reading, the returned value is an integer.

Other functions that are similar are <span
class="strong">**ReadAD**</span> and <span
class="strong">**ReadAD12**</span>.  See the relevant Help page for the
specific usage of each function.

<span class="strong">**AD\_Delay**</span> controls is the acquisition
delay.   The default value is 20 us.  This can be changed to a longer
acquisition delay by adding the following constant.

``` screen
    #define AD_Delay 4 10us
```

<span class="strong">**ADSpeed**</span>( controls the source of the
clock for the ADC module.   It varies from one chip to another.  
InternalClock is a microcontroller only option that will drive the ADC
from an internal RC oscillator.  The default value is 128.

``` screen
    'default value
    #define ADSpeed MediumSpeed


    'pre-defined constants
    #define HighSpeed 255
    #define MediumSpeed 128
    #define LowSpeed 0
```

<span class="strong">**AD\_Acquisition\_Time\_Select\_bits**</span> also
controls the Acquisition Time Select bits.   Acquisition time is the
duration that the AD charge holding capacitor remains connected to AD
channel from the instant the read is commenced is set until conversions
begins.

The default value of AD\_Acquisition\_Time\_Select\_bits is 0b100 or
decimal 4, where all three ACQT bits will be set.  To change use the
following.

``` screen
    'change the default value
    #define AD_Acquisition_Time_Select_bits 0b001    'this will only set ACQT bit 0, ACQT bits 1 and 2 will be cleared.
```

<span class="strong">**Example 1 - Read 10-bit ADC**</span>

``` screen
    #chip 16F819, 8

    'Set the input pin direction
    Dir PORTA.0 In


    'Print 255 reading
    For CurrentAddress = 0 to 255

        'Take a reading and show it
        Print str(ReadAD10(AN0))

        'Wait 10 minutes before getting another reading
        Wait 10 min
    Next
```

<span class="strong">**Example 2 - Reading Reference Voltages:**</span>

When selecting the reference source for ADC on ATmega328 Great Cow BASIC
will overwrite anything that you put into te ADMUX register - but this
option allow you change the ADC reference source on Atmel AVR
microcontrollers.   You can set the AD\_REF\_SOURCE constant to whatever
you want to use.   It defaults to the VCC pin, as example you can set
the Atmel AVR to use the 1.1V reference with this: <span
class="strong">**\#define AD\_REF\_SOURCE AD\_REF\_256**</span> where
256 refers to the 2.56V reference on some older AVRs, but the same code
will select the 1.1V reference on an ATmega328p

``` screen
    ' Dynamically switching reference.
    #define AD_REF_SOURCE ADRefSource
    #define AD_VREF_DELAY 5 ms
    AdRefSource = AD_REF_AVCC
    HSerPrint ReadAD10(AN1)
    HSerPrint ", "
    AdRefSource = AD_REF_256
    HSerPrint ReadAD10(AN1)
```

The example above sets the AD\_REF\_SOURCE to a variable, and then
changes the value of the variable to select the source.   With this
approach, we also need to allow time to charge the reference capacitor
to the correct voltage.

<span class="strong">**Example 3 - Read 10-bit ADC forcing a 10-bit
value to be returned**</span>

``` screen
    #chip 16F1789, 8

    'Set the input pin direction
    Dir PORTA.0 In


    'Print 255 reading
    For CurrentAddress = 0 to 255

        'Take a reading and show it
        Print str(ReadAD10(AN0), TRUE)

        'Wait 10 minutes before getting another reading
        Wait 10 min
    Next
```

<span class="strong">**Example 4**</span>

This example used the diffential capabilities of ADC port and writes the
output to the EEPROM.  The output value will be in the range of \[-1023
to 1023\].

AN0 and AN2 are used for the diffential ADC reading.

``` screen
    #chip 16F1789, 8

    'USART settings
    #define USART_BAUD_RATE 9600  'Initializes USART port with 9600 baud
    #define USART_TX_BLOCKING ' wait for tx register to be empty
    wait 100 ms

    'Set the input pin direction
    Dir PORTA.0 In
    Dir PORTA.2 In

    'Loop to take readings until the EEPROM is full
    For CurrentAddress = 0 to 255

        'Take a reading and log it
        HSerPrint ReadAD10( AN0, AN2 )
        HserPrintCRLF
        'Wait 10 minutes before getting another reading
        Wait 10 min

    Next
```

<span class="strong">**See Also**</span>
<a href="readad" class="link" title="ReadAD">ReadAD</a>,
<a href="readad12" class="link" title="ReadAD12">ReadAD12</a>

</div>
