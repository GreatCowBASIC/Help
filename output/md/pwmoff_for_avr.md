<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="pwmoff_for_avr"></span>PWMOff for AVR

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
  PWMOff
```

<span class="strong">**Command Availability:**</span>

This command is only available on the Atmel AVR microcontrollers with a
Timer/Counter0 OC0B register.

<span class="strong">**Explanation:**</span>

The PWMOff command will only disable the output of the OC0B/PWM module
of the Atmel AVR microcontrollers.

This command is not available for any other OCnx/PWM modules.

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

</div>
