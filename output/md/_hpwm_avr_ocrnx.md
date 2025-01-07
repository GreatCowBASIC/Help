<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="_hpwm_avr_ocrnx"></span>HPWM AVR OCRnx

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
     HPWM channel, frequency, duty cycle
```

<span class="strong">**Command Availability:**</span>

The HPWM command is available on Atmel AVR microcontrollers with an OCnx
pin, and is compatible with the PIC HPWM command method. Due to the the
unique way of AVR PWM implementation, and code efficiency, there are
some notable differences in the HPWM initialization and its use.

This command supports the Fast PWM Mode and period registers for their
respective devices. Typically Timer0 and Timer2 do not have a period
register and the "A" channel is sacrificed to provide that function.
Therefore, channel 1 and channel 6 will not be available, but are
documented for possible future use. Some device Timers do not have an
adjustable period register, so this command is not feasible (consult the
datasheet).

<span class="strong">**Explanation:**</span>

The HPWM command sets up the hardware PWM module of the Atmel AVR
microcontrollers to generate a PWM waveform of the given frequency and
duty cycle. Once this command is called, the PWM will be emitted until
the duty cycle parameter is written to zero.

If the need is just one particular frequency and duty cycle, one should
use PWMOn and the constants PWM\_Freq and PWM\_Duty instead. PWMOn for
the AVR is uniquely assigned to the OC0B pin, or channel 2. PWMOff will
only shutdown the AVR HPWM channel 2.

`channel` described as 1, 2, 3,…​16 correspond to the pins OCR0A,
OCR0B…​.OCR5C as detailed in the <span class="emphasis">*channel*</span>
constant table. Channel 1 and channel 6 are not available.

`frequency` sets the frequency of the PWM output measured in Khz. The
maximum value allowed is 255 KHz. In situations that do not require a
specific PWM frequency, the PWM frequency should equal approximately 4
times the clock speed (GCB chipMHz) of the microcontroller (ie 63 KHz on
a 16 MHz chip, 32 KHz on 8 MHz, 4 Khz on 1 MHz). This gives the best
duty cycle resolution possible. Alternate frequencies with good duty
cycle resolution are 1Khz, and 4Khz with chipMhz values of 16 and 8
respectively.

`duty cycle` specifies the desired duty cycle of the PWM signal, and
ranges from 0 to 255 where 255 is 100% duty cycle. The AVR fast PWM mode
has a small spike at the extreme setting of 0x00, on most devices, with
each period register rollover. By using the HPWM command, and writing
0x00 to the duty cycle parameter, the PWM signal will shutdown
completely and avoid the spike. The PWM signal can then be restarted
again with a new HPWM command.

Note: Due to the AVR having a timer prescaler of just 1, 8, and 64; the
AVR frequency and duty cycle resolution will be different from the PIC
frequency and duty cycle resolution. The AVR HPWM parameters will likely
need adjusting ,when substituted into an existing PIC program, and where
accuracy is required.

<span class="strong">**HPWM Constants:**</span>

The AVR HPWM timer constants for channel number control are shown in the
table below. Each timer constant needs to be defined for any one of the
channels it controls.

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;"><span class="strong"><strong>Timer</strong></span><br />
<span class="strong"><strong>Constants</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Controls</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Options</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p>AVRTC0</p></td>
<td style="text-align: left;"><p>Specifies AVR TC0 associated with <span class="emphasis"><em>channel</em></span> 1, and 2</p></td>
<td style="text-align: left;"><p>Must be defined</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>AVRTC1</p></td>
<td style="text-align: left;"><p>Specifies AVR TC1 associated with <span class="emphasis"><em>channel</em></span> 3, 4 and 5<br />
Channel 5 present on larger pinout devices</p></td>
<td style="text-align: left;"><p>Must be defined</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>AVRTC2</p></td>
<td style="text-align: left;"><p>Specifies AVR TC2 associated with <span class="emphasis"><em>channel</em></span> 6, and 7</p></td>
<td style="text-align: left;"><p>Must be defined</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>AVRTC3</p></td>
<td style="text-align: left;"><p>Specifies AVR TC3 associated with <span class="emphasis"><em>channel</em></span> 8, 9, and 10</p></td>
<td style="text-align: left;"><p>Must be defined</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>AVRTC4</p></td>
<td style="text-align: left;"><p>Specifies AVR TC4 associated with <span class="emphasis"><em>channel</em></span> 11,12, and 13</p></td>
<td style="text-align: left;"><p>Must be defined</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>AVRTC5</p></td>
<td style="text-align: left;"><p>Specifies AVR TC5 associated with <span class="emphasis"><em>channel</em></span> 14, 15, and 16</p></td>
<td style="text-align: left;"><p>Must be defined</p></td>
</tr>
</tbody>
</table>

</div>

The GCBASIC HPWM channel constants for output pin control are shown in
the table below. Each HPWM channel used needs to be defined. The Port
pin associated with each OCnx must be set to output.

<div class="informaltable">

<table data-border="1">
<thead>
<tr class="header">
<th style="text-align: left;"><span class="strong"><strong>Channel</strong></span><br />
<span class="strong"><strong>Constants</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Controls</strong></span></th>
<th style="text-align: left;"><span class="strong"><strong>Options</strong></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p>AVRCHAN1</p></td>
<td style="text-align: left;"><p>Specifies AVR HPWM <span class="emphasis"><em>channel</em></span> 1 to the associated output pin OC0A<br />
OCR0A is used as period register and thus not available</p></td>
<td style="text-align: left;"><p>N/A</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>AVRCHAN2</p></td>
<td style="text-align: left;"><p>Specifies AVR HPWM <span class="emphasis"><em>channel</em></span> 2 to the associated output pin OC0B</p></td>
<td style="text-align: left;"><p>Must be defined</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>AVRCHAN3</p></td>
<td style="text-align: left;"><p>Specifies AVR HPWM <span class="emphasis"><em>channel</em></span> 3 to the associated output pin OC1A<br />
MUX’d with OC0A pin on some ATTiny’s</p></td>
<td style="text-align: left;"><p>Must be defined</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>AVRCHAN4</p></td>
<td style="text-align: left;"><p>Specifies AVR HPWM <span class="emphasis"><em>channel</em></span> 4 to the associated output pin OC1B</p></td>
<td style="text-align: left;"><p>Must be defined</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>AVRCHAN5</p></td>
<td style="text-align: left;"><p>Specifies AVR HPWM <span class="emphasis"><em>channel</em></span> 5 to the associated output pin OC1C<br />
On some larger pinout devices and MUX’d with OC0A pin</p></td>
<td style="text-align: left;"><p>Must be defined</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>AVRCHAN6</p></td>
<td style="text-align: left;"><p>Specifies AVR HPWM <span class="emphasis"><em>channel</em></span> 6 to the associated output pin OC2A<br />
OCR2A is used as a period register and thus not available</p></td>
<td style="text-align: left;"><p>N/A</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>AVRCHAN7</p></td>
<td style="text-align: left;"><p>Specifies AVR HPWM <span class="emphasis"><em>channel</em></span> 7 to the associated output pin OC2B</p></td>
<td style="text-align: left;"><p>Must be defined</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>AVRCHAN8</p></td>
<td style="text-align: left;"><p>Specifies AVR HPWM <span class="emphasis"><em>channel</em></span> 8 to the associated output pin OC3A</p></td>
<td style="text-align: left;"><p>Must be defined</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>AVRCHAN9</p></td>
<td style="text-align: left;"><p>Specifies AVR HPWM <span class="emphasis"><em>channel</em></span> 9 to the associated output pin OC3B</p></td>
<td style="text-align: left;"><p>Must be defined</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>AVRCHAN10</p></td>
<td style="text-align: left;"><p>Specifies AVR HPWM <span class="emphasis"><em>channel</em></span> 9 to the associated output pin OC3C</p></td>
<td style="text-align: left;"><p>Must be defined</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>AVRCHAN11</p></td>
<td style="text-align: left;"><p>Specifies AVR HPWM <span class="emphasis"><em>channel</em></span> 11 to the associated output pin OC4A</p></td>
<td style="text-align: left;"><p>Must be defined</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>AVRCHAN12</p></td>
<td style="text-align: left;"><p>Specifies AVR HPWM <span class="emphasis"><em>channel</em></span> 12 to the associated output pin OC4B</p></td>
<td style="text-align: left;"><p>Must be defined</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>AVRCHAN13</p></td>
<td style="text-align: left;"><p>Specifies AVR HPWM <span class="emphasis"><em>channel</em></span> 13 to the associated output pin OC4C</p></td>
<td style="text-align: left;"><p>Must be defined</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>AVRCHAN14</p></td>
<td style="text-align: left;"><p>Specifies AVR HPWM <span class="emphasis"><em>channel</em></span> 14 to the associated output pin OC5A</p></td>
<td style="text-align: left;"><p>Must be defined</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>AVRCHAN15</p></td>
<td style="text-align: left;"><p>Specifies AVR HPWM <span class="emphasis"><em>channel</em></span> 15 to the associated output pin OC5B</p></td>
<td style="text-align: left;"><p>Must be defined</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>AVRCHAN16</p></td>
<td style="text-align: left;"><p>Specifies AVR HPWM <span class="emphasis"><em>channel</em></span> 16 to the associated output pin OC5C</p></td>
<td style="text-align: left;"><p>Must be defined</p></td>
</tr>
</tbody>
</table>

</div>

<span class="strong">**Example:**</span>

``` screen
        'Using HPWM command to alternate ramping leds with the UNO board
    #chip mega328,16

    '************pwm************************
    'Must define AVRTCx, AVRCHANx, and set OCnX pin dir to out

    #define AVRTC0    'Timer0
    #define AVRCHAN2
    dir PortD.5 Out   'OC0B, UNO pin 5

    #define AVRTC1    'Timer1
    #define AVRCHAN3
    #define AVRCHAN4
    dir PortB.1 out   'OC1A, UNO pin 9
    dir PortB.2 Out   'OC1B, UNO pin 10

    #define AVRTC2    'Timer2
    #define AVRCHAN7
    dir PortD.3 Out   'OC2B, UNO pin 3

    do

    '63khz works good with 16MHz
    '32khz with 8MHz intosc
    '4KHz with 8MHz intosc and ckDiv8 fuse
    freq = 63
      For PWMled1 = 0 to 255
        HPWM 2,freq,PWMled1
        PWMled2 = NOT PWMled1
        HPWM 3,freq,PWMled2
        HPWM 4,freq,PWMled2
        HPWM 7,freq,PWMled1
        wait 5 ms
      Next

      For PWMled1 = 255 to 0
        HPWM 2,freq,PWMled1
        PWMled2 = NOT PWMled1
        HPWM 3,freq,PWMled2
        HPWM 4,freq,PWMled2
        HPWM 7,freq,PWMled1
        wait 5 ms
      Next

    loop
```

</div>
