<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="_hpwm_ccp"></span>HPWM CCP

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    HPWM channel, frequency, duty cycle
```

<span class="strong">**Command Availability:**</span>

Only available on Microchip PIC microcontrollers with
Capture/Compare/PWM (CCP) module.

This command supports the CCP 8 bit support with <span
class="strong">**Timer 2 only**</span>.  

For CCP/PWM support for timers 2, 4 and 6, if the specific devices
supports alternative CCP/PWM clock sources - see here
<a href="_hpwm_ccptimern.html" class="link" title="HPWM_CCPTimerN">HPWM_CCPTimerN</a>

For PWM 10 Bit support with other timers - see here
<a href="_hpwm_10_bit.html" class="link" title="HPWM 10 Bit">HPWM 10 Bit</a>

<span class="strong">**Explanation:**</span>

This command sets up the hardware PWM module of the Microchip PIC
microcontroller to generate a PWM waveform of the given frequency and
duty cycle.  

If you only need one particular frequency and duty cycle, you should use
PWMOn and the constants PWM\_Freq and PWM\_Duty instead.

`channel` is 1, 2, 3, 4 or 5, and corresponds to the pins CCP1, CCP2,
CCP3, CCP4 and CCP5 respectively. On chips with only one CCP port, pin
CCP or CCP1 is always used, and `channel` is ignored. (It should be set
to 1 anyway to allow for future upgrades to more powerful
microcontrollers.)

`frequency` sets the frequency of the PWM output. It is measured in KHz.
The maximum value allowed is 255 KHz. The minimum value varies depending
on the clock speed. 1 KHz is the minimum on chips 16 MHz or under and 2
Khz is the lowest possible on 20 MHz chips. In situations that do not
require a specific PWM frequency, the PWM frequency should equal
approximately 1 five-hundredth the clock speed of the microcontroller
(ie 40 Khz on a 20 MHz chip, 16 KHz on an 8 MHz chip). This gives the
best duty cycle resolution possible.

`duty cycle` specifies the desired duty cycle of the PWM signal, and
ranges from 0 to 255 where 255 is 100% duty cycle.

To stop the PWM signal use the `HPWMOff` method with the parameter of
the channel.

``` screen
    'Stop the CCP/PWM signal
    HPWMOff ( 1 )
```

The optional constant `HPWM_FAST` can be defined to enable the
recalculation of the timer prescaler when needed. This will provide
faster operation, but uses extra byte of RAM and may cause problems if
`HPWM` and `PWMOn` are used together in a program. This will not cause
any issue when using `HPWM` and `PWMOff` in the same program with
`HPWM_FAST`.

The optional constant `DisableCCPFixedModePWM` can be defined to prevent
Timer2 from being enabled. This constant may be required when you need
to use Timer2 for non-CCP/PWM support.

<span class="strong">**Example:**</span>

``` screen
    'This program will alter the brightness of an LED using
    'CCP/PWM.

    'Select chip model and speed
    #chip 16F877A, 20

    'Set the CCP1 pin to output mode
    DIR PORTC.2 out

    'Main code
    do
        'Turn up brightness over the range
        For Bright = 1 to 255
            HPWM 1, 40, Bright
            wait 10 ms
        next
        'Turn down brightness over the range
        For Bright = 255 to 1 Step -1
            HPWM 1, 40, Bright
            wait 10 ms
        next
    loop
```

</div>
