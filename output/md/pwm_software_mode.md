<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="pwm_software_mode"></span>PWM Software Mode

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    PWMOut channel, duty cycle, cycles
```

<span class="strong">**Command Availability:**</span>

Available on all microcontrollers. This method does NOT require a PWM
module within the microcontroller.

This command uses a software PWM routine within GCBASIC to produce a PWM
signal on the selected port of the chip.

The method `PWMOut` does not make use of any special hardware within the
microcontroller. The PWM signal is generated only while the `PWMOut`
command is executing - therefore, when the `PWMOut` is not executing by
moving onto the next command, the PWM signal will stop.

<span class="strong">**For more help, see**</span>
<a href="pwmout" class="link" title="PWMOut">PWMOut</a>

</div>
