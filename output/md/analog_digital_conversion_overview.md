<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="analog_digital_conversion_overview"></span>Analog/Digital Conversion Overview

</div>

</div>

</div>

<span class="strong">**About Analog to Digital Conversion**</span>

The analog-to-digital converter (ADC or A/D) module support is
implemented by GCBASIC to provide 8-bit, 10-bit, and 12-bit
single-channel measurement mode and differential-channel measurement
mode.

GCBASIC configures the analog-to-digital converter clock source, the
programmed acquisition time, and the justification of the response byte,
word, or integer (as defined in the GCBASIC method used).

<span class="strong">**Normal or Single-Channel Measurement
Mode**</span>

Single-channel measurement mode is the default method for reading the
ADC port. The positive input is attached to a suitable device (a light
sensor or adjustable resistor), and the commands `ReadAD`, `ReadAD10`,
and `ReadAD12` return a byte, word, or word value respectively.

<div class="informalfigure">

<div class="mediaobject" align="center">

![graphic](./images/adcoverviewb1.PNG)

</div>

</div>

The A/D module on most microcontrollers only supports single-ended mode.
Single-channel mode uses a single A/D port, and the returned value
represents the difference between the voltage on the analog pin and a
fixed negative reference, which is usually ground or Vss.

The syntax for single-ended A/D is `Returned_Value = ReadAD(Port)`.

Example

``` programlisting
  Print ReadAD10(AN3)          ' <<< reading a single channel in single-ended mode
```

<span class="strong">**Key line:**</span> `ReadAD10(AN3)` — reads
channel `AN3` against ground and returns a 10-bit value.

<span class="strong">**Differential-Channel Measurement Mode**</span>

Some devices in the Microchip PIC family also support differential
analog-to-digital conversion. With differential conversion, the
differential voltage between two channels is measured and converted to a
digital value. The returned value can be either positive or negative,
and is therefore stored as an integer.

<div class="informalfigure">

<div class="mediaobject" align="center">

![graphic](./images/adcoverviewb2.PNG)

</div>

</div>

When configured for differential-channel measurement mode, the positive
channel is connected to the defined positive analog pin (ANx), and the
negative channel is connected to the defined negative analog pin. These
two pins are internally connected (within the microcontroller) to a
unity-gain differential amplifier, and once the amplifier has completed
the comparison, the result is returned as an integer.

The positive channel input is selected using the CHSx bits, and the
negative channel input is selected using the CHSNx bits. GCBASIC manages
these bits automatically — the programmer only needs to supply the
correct analog pin designators in the `ReadADx` commands.

<div class="informalfigure">

<div class="mediaobject" align="center">

![graphic](./images/adcoverviewb3.PNG)

</div>

</div>

The 12-bit returned result is available in the ADRESH and ADRESL
registers, which GCBASIC returns as an integer variable.

Some Microchip PIC microcontrollers have differential A/D modules and
support differential mode as well as 12-bit A/D. With differential mode,
the returned value can be either a positive or negative number that
represents the voltage differential between the two A/D ports.

The syntax for differential A/D is
`ReadAD( PositiveANPort , NegativeANPort )`. Note: if the negative port
is omitted, `ReadAD()` performs a single-ended read on the positive AN
port.

Example

``` programlisting
  Print ReadAD12( AN3, AN4 )          ' <<< reading the voltage difference between two channels
```

<span class="strong">**Key line:**</span>
`ReadAD12( AN3, AN4 )` — returns the signed difference between `AN3`
(positive) and `AN4` (negative) as a 12-bit integer.

<span class="strong">**Using a Voltage Reference**</span>

Voltage references come in many forms and offer different features
across the PIC, AVR, and LGT microcontroller families. In the end,
accuracy and stability are a voltage reference’s most important
characteristics, since the reference’s main purpose is to provide a
known output voltage. Any variation from this known value is an error.
It is therefore useful to use the internal voltage reference provided
within the microcontroller where available.

To use a voltage reference source for ADC operation, set the
`AD_REF_SOURCE` constant to your chosen source. It defaults to the VCC
pin, and therefore the constant is set by default to `AD_REF_AVCC`. The
voltage reference is specific to the microcontroller, but the options
are generally as follows:

<div class="informaltable">

| <span class="strong">**AD\_REF\_SOURCE Constant**</span> | <span class="strong">**Reference Voltage**</span> |
|:---------------------------------------------------------|:--------------------------------------------------|
| AD\_REF\_AVCC                                            | VCC supply voltage                                |
| AD\_REF\_1024                                            | 1.024 V internal reference source                 |
| AD\_REF\_2048                                            | 2.048 V internal reference source                 |
| AD\_REF\_4096                                            | 4.096 V internal reference source                 |
| AD\_REF\_AREF                                            | External voltage reference source                 |
| AD\_REF\_256                                             | AD\_REF\_256 for ATmega devices                   |

</div>

<span class="strong">**Optimising GCBASIC Code**</span>

GCBASIC supports a wide range of A/D modules, and the supporting library
addresses up to 34 channels. To reduce the size of the code produced,
you can define which channels are specifically supported. See
<a href="analog_digital_conversion_code_optimisation" class="link" title="Analog/Digital Conversion Code Optimisation">Analog/Digital Conversion Code Optimisation</a>
for more details.

For the latest Microchip PIC microcontrollers that support differential
and 12-bit A/D, refer to Microchip MPLAB Code Configurator (MCC) or the
microcontroller’s datasheet.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="readad" class="link" title="ReadAD">ReadAD</a> — 8-bit
    single/differential read
-   <a href="readad10" class="link" title="ReadAD10">ReadAD10</a> — 10-bit
    single/differential read
-   <a href="readad12" class="link" title="ReadAD12">ReadAD12</a> — 12-bit
    single/differential read
-   <a href="analog_digital_conversion_code_optimisation" class="link" title="Analog/Digital Conversion Code Optimisation">Analog/Digital Conversion Code Optimisation</a> — reducing
    code size for unused channels

</div>

</div>
