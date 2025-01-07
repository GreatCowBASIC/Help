<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="_hpwm_ccptimern"></span>HPWM\_CCPTimerN

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    HPWM_CCPTimerN channel, frequency, duty cycle [, timer 2, 4 or 6 ]
```

<span class="strong">**Command Availability:**</span>

Only available on Microchip PIC microcontrollers with
Capture/Compare/PWM (CCP) module.

This command supports the CCP 8 bit support with selectable <span
class="strong">**Timer 2, 4 or 6 only**</span> for CCP/PWM only.  

For CCP/PWM support for timers 2 only see
<a href="_hpwm_ccp.html" class="link" title="HPWM CCP">HPWM CCPTimer</a>

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

`timer` specifies the timer source. Timers 2, 4 and 6 are supported.

To stop the PWM signal use the `HPWMOff` method with the parameter of
the channel.

``` screen
    'Stop the CCP/PWM signal
    HPWMOff ( 1 )
```

<span class="strong">**Example:**</span>

``` screen
    #chip 16F1825, 4

    DIR portc Out
    DIR porta Out

    initialisation:

    'Command as follows:
    ' HPWM_CCPTimerN   CCP_Channel, Frequency, Duty, Timer Source.  Timer source defaults to timer 2, so, the timersource is optional.

    HPWM_CCPTimerN  3, 30, 77 , 4         'CCP/PWM module 3 using timer 4
    HPWM_CCPTimerN  4, 40, 102, 6         'CCP/PWM module 4 using timer 6
    HPWM  1, 10, 26                       'CCP/PWM module 1 with no parameter therefore timer 2

    do
    loop
```

</div>
