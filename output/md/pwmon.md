<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="pwmon"></span>PWMOn

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    PWMOn
```

<span class="strong">**Command Availability:**</span>

Only available on Microchip PIC microcontrollers with
Capture/Compare/PWM module CCP1.

This command does not operate on any other CCP channel.

<span class="strong">**Explanation:**</span>

<span class="strong">**Example 1:**</span>

This command will enable the output of the CCP1/PWM module on the
Microchip PIC microcontroller.

``` programlisting
    'This program will enable a 76 Khz PWM signal, with a duty cycle
    'of 80%. It will emit the signal for 10 seconds, then stop.
    #define PWM_Freq 76    'Set frequency in KHz
    #define PWM_Duty 80    'Set duty cycle to 80 %
    PWMOn                  'Turn on the PWM          ' <<< the PWMOn instruction
    WAIT 10 s              'Wait 10 seconds
    PWMOff                 'Turn off the PWM
```

<span class="strong">**Key line:**</span> `PWMOn` — enables the CCP1
module’s output pin using the frequency and duty cycle already set by
the `PWM_Freq` and `PWM_Duty` constants above; the signal keeps running
until `PWMOff` is called.  
  

<span class="strong">**Example 2:**</span>

This command will enable the output of the CCP1/PWM module on the
Microchip PIC microcontroller.

Note the chip frequency.

``` programlisting
    'This program will enable a 62Hz PWM signal, with a duty cycle
    'of 50%.


    #Chip 12F1840, 1

    dir porta.2 out
    #define PWM_Freq .0625    'Set frequency in Hz equates to 62Hz
    #define PWM_Duty 50       'Set duty cycle to 80 %
    PWMON

    Do
    loop
```

  
  
<span class="strong">**Example 3:**</span>

This command will enable the output of the CCP1/PWM module on the
Microchip PIC microcontroller.

Note the chip frequency.

``` programlisting
    'This program will enable a 7.7Hz PWM signal, with a duty cycle
    'of 50%.


    #Chip 12F1840, 0.125

    dir porta.2 out
    #define PWM_Freq .0077   'Set frequency in Hz equates to 7.7Hz
    #define PWM_Duty 50       'Set duty cycle to 50 %
    PWMON

    Do
    loop
```

  
  

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="pwmoff" class="link" title="PWMOff">PWMOff</a> — the
    counterpart command that disables the CCP1 PWM output

</div>

</div>
