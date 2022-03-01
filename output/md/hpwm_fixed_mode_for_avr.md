<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="hpwm_fixed_mode_for_avr"></span>HPWM Fixed Mode for AVR

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    PWMOn

    'or

    PWMOff
```

<span class="strong">**Command Availability:**</span>

This command is only available on the Atmel AVR microcontrollers with a
Timer/Counter0 OC0B register.

<span class="strong">**Explanation:**</span>

The PWMOn command will only enable the output of the OC0B/PWM module of
the Atmel AVR microcontroller.

This command is not available for any other OCnx/PWM modules.

This command sets up the hardware PWM module of the Atmel AVR
microcontroller to generate a PWM waveform of the given frequency and
duty cycle.   Once PWMON method is called, the PWM will be emitted until
PWMOff is called.

These constants are required for PWMOn.

<div class="informaltable">

| <span class="strong">**Constant Name**</span> | <span class="strong">**Controls**</span>                           | <span class="strong">**Default Value**</span> |
|:----------------------------------------------|:-------------------------------------------------------------------|:----------------------------------------------|
| `PWM_Freq`                                    | Specifies the output frequency of the PWM module in KHz.           | 38                                            |
| `PWM_Duty`                                    | Sets the duty cycle of the PWM module output. Given as percentage. | 50                                            |

</div>

<span class="strong">**Example:**</span>

``` screen
    'This program demonstrates the PWMOn and PWMOff commands
    'of the fixed mode HPWM on OC0B pin.

    #chip mega328p,16

    'activate appropriate PWM output pins
    dir PortD.5 Out     'OC0B

    'define PWM_Freq in kHz
    'define PWM_Duty in %

    #define PWM_Freq 40
    #define PWM_Duty 50

    do

      'turn on/off single channel 40 KHz PWM on OC0B pin
      PWMON
      wait 5 s
      PWMOFF
      wait 5 s

    loop
```

  
  
<span class="strong">**For more help, see**</span>
<a href="pwmon_for_avr" class="link" title="PWMOn for AVR">PWMOn</a>
and
<a href="pwmoff_for_avr" class="link" title="PWMOff for AVR">PWMOff</a>
<span class="strong">**or, for Microchip microcontrollers see**</span>
<a href="hpwm_fixed_mode" class="link" title="HPWM Fixed Mode">Fixed Mode PWM for Microchip</a>

</div>
