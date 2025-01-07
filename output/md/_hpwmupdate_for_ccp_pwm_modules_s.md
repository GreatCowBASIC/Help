<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="_hpwmupdate_for_ccp_pwm_modules_s"></span>HPWMUpdate for CCP/PWM Modules(s)

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    HPWMUpdate ( channel, duty_cycle )
```

<span class="strong">**Command Availability:**</span>

Available on Microchip PIC microcontrollers with the CCP module.

<span class="strong">**Explanation:**</span>

This command updates the <span class="strong">**duty cycle
only**</span>.

<div class="itemizedlist">

-   You <span class="strong">**MUST**</span> have previously called the
    HPWM CCP command using the full command to set the channel specific
    settings for frequency and timer source.  See the example below for
    the usage.
-   You <span class="strong">**MUST**</span> specify the constant
    \#define `HPWM_FAST` to support HPWMUpdate when using CCP module.

</div>

This command only supports the previously called HPWM CCP command, or,
if you have set more than one HPWM CCP channel then to use the command
you must have set the channel to the same frequency.

The command only supports the CCP module of the Microchip PIC
microcontroller to generate a PWM waveform at the previously defined
frequency and timer source.

`channel` is 1, 2, 3, 4 or 5. These corresponds to the CCP1 through to
CCP5 respectively.  The channel <span class="strong">**MUST**</span> be
supported by the microcontroller.   Check the microcontroller specific
datasheet for the available channel.

`duty cycle` specifies the desired duty cycle of the PWM signal, and
ranges from 0 to 255 where 255 is 100% duty cycle.

<span class="strong">**Example for CCP PWM:**</span>

``` screen
    'This program will alter the brightness of an LED using
    'hardware PWM.

    #chip 16F1938
    #option Explicit

    'Set the direction of the CCP/PWM port
    DIR portc.2 Out

    #define HPWM_FAST           'Required to support HPWMUpdate when using CCP module
    HPWM 1, 40, dutyvalue

    do
        'use for-loop to show the duty changing a 8bit value
        dim dutyvalue as byte
        for dutyvalue = 0 to 255
            HPWMUpdate 1, dutyvalue
            wait 10 ms
        next
        for dutyvalue = 254 to 1
            HPWMUpdate 1, dutyvalue
            wait 10 ms
        next
    loop
```

<span class="strong">**For more help, see**</span>
<a href="_pwmoff.html" class="link" title="PWMOff">PWMOff</a>

</div>
