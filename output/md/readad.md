<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="readad"></span>ReadAD

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

For a normal ( also called a Single Channel ) read use.

``` screen
    byte_variable = ReadAD( ANX )
```

For a Differential Channel read use the following.  Where ANpX is the
positive port, and ANnY is the negative port.

``` screen
    byte_variable = ReadAD( ANpX , ANnY )
```

To obtain a byte value from an AD Channel use the following to force an
8 bit AD Channel to respond with a byte value \[0 to 255\].

``` screen
    byte_variable = ReadAD( ANX , TRUE )
```

<span class="strong">**Command Availability:**</span>

When using <span class="strong">**ReadAD**</span> ( ANx ) the returned
value is an 8 bit number \[0- 255\].  The byte variable assigned by the
function can be a byte, word, integer or long.

When using <span class="strong">**ReadAD**</span> ( ANpX , ANnY ) the
returned value is an integer, as negative values can be returned.

When using <span class="strong">**ReadAD**</span> ( ANpX , TRUE ) the
returned value is an integer, but you should treat as a byte.

ReadAD is a function that can be used to read the built-in analog to
digital converter that many microcontroller chips include.  port should
be specified as AN0, AN1, AN2, etc., up to the number of analog inputs
available on the chip that is in use.  Those familiar with Atmel AVR
microcontrollers can also refer to the ports as ADC0, ADC1, etc.  Refer
to the datasheet for the microcontroller chip to find the number of
ports available.  (Note: it’s perfectly acceptable to use ANx on AVR, or
ADCx on the microcontroller)

Other functions that are similar are <span
class="strong">**ReadAD10**</span> and <span
class="strong">**ReadAD12**</span>.  See the relevant Help page for the
specific usage of each function.

The constant <span class="strong">**AD\_Delay**</span> controls is the
acquisition delay.  The default value is 20 us.  This can be changed by
adding the following constant.

``` screen
    #define AD_Delay 2 10us
```

<span class="strong">**ADSpeed**</span> controls the source of the clock
for the ADC module.   It varies from one chip to another.  
InternalClock is a Microchip PIC microcontroller only option that will
drive the ADC from an internal RC oscillator.  The default value is 128.

Using ADSPEED

``` screen
    'default value
    #define ADSpeed MediumSpeed


    'pre-defined constants
    #define HighSpeed 255
    #define MediumSpeed 128
    #define LowSpeed 0
```

<span class="strong">**AD\_VREF\_DELAY**</span> controls the charging
time for VRef capacitor on Atmel AVR microcontrollers only.  This
therefore controls the charge from internal VRef.   ReadAD will not be
accurate for internal reference without this.

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

<span class="strong">**Example 1**</span>

This example reads the ADC port and writes the output to the EEPROM.

``` screen
    #chip 16F819, 8

    'Set the input pin direction
    Dir PORTA.0 In

    'Loop to take readings until the EEPROM is full
    For CurrentAddress = 0 to 255

        'Take a reading and log it
        EPWrite CurrentAddress, ReadAD(AN0)

        'Wait 10 minutes before getting another reading
        Wait 10 min
    Next
```

<span class="strong">**Example 2**</span>

This example reads the ADC port and writes the output to the
EEPROM.  The output value will be in the range of \[0-255\].

``` screen
    #chip 16F1789, 8


    'Set the input pin direction
    Dir PORTA.0 In

    'Loop to take readings until the EEPROM is full
    For CurrentAddress = 0 to 255

        'Take a reading and log it
        EPWrite CurrentAddress, ReadAD(AN0, TRUE)

        'Wait 10 minutes before getting another reading
        Wait 10 min
    Next
```

<span class="strong">**Example 3**</span>

This example used the diffential capabilities of ADC port and writes the
output to the EEPROM.  The output value will be in the range of \[-255
to 255\].

AN0 and AN2 are used for the diffential ADC reading.

``` screen
    #chip 16F1789, 8


    'Set the input pin direction
    Dir PORTA.0 In
    Dir PORTA.2 In

    'Loop to take readings until the EEPROM is full
    For CurrentAddress = 0 to 255

        'Take a reading and log it
        EPWrite CurrentAddress, ReadAD( AN0, AN2 )

        'Wait 10 minutes before getting another reading
        Wait 10 min
    Next
```

<span class="strong">**See Also**</span>
<a href="readad10" class="link" title="ReadAD10">ReadAD10</a>,
<a href="readad12" class="link" title="ReadAD12">ReadAD12</a>

</div>
