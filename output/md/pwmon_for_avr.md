<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="pwmon_for_avr"></span>PWMOn for AVR

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
  PWMOn
```

<span class="strong">**Command Availability:**</span>

This command is only available on the Atmel AVR microcontrollers with a
Timer/Counter0 OC0B register.

<span class="strong">**Explanation:**</span>

The PWMOn command will only enable the output of the OC0B/PWM module of
the Atmel AVR microcontroller.

This command is not available for any other OCnx/PWM modules.

<span class="strong">**Example:**</span>

``` programlisting
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
      PWMON          ' <<< the PWMOn instruction
      wait 5 s
      PWMOFF
      wait 5 s

    loop
```

<span class="strong">**Key line:**</span> `PWMON` — enables the OC0B PWM
output using the frequency and duty cycle set by the
`PWM_Freq`/`PWM_Duty` constants above; unlike the Microchip PIC version,
this command only ever controls the OC0B channel.  
  

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="pwmoff_for_avr" class="link" title="PWMOff for AVR">PWMOff</a> — the
    counterpart command that disables the OC0B PWM output

</div>

</div>
