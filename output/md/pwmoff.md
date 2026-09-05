<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="pwmoff"></span>PWMOff

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` programlisting
    PWMOff
```

<span class="strong">**Command Availability:**</span>

Only available on Microchip PIC microcontrollers with
Capture/Compare/PWM module CCP1.

This command does not operate on any other CCP channel.

<span class="strong">**Explanation:**</span>

This command will disable the output of the CCP1/PWM module on the
Microchip PIC chip.

<span class="strong">**Example:**</span>

``` programlisting
    'This program will enable a 76 Khz PWM signal, with a duty cycle
    'of 80%. It will emit the signal for 10 seconds, then stop.
    #define PWM_Freq 76    'Set frequency in KHz
    #define PWM_Duty 80    'Set duty cycle to 80 %
    PWMOn                  'Turn on the PWM
    WAIT 10 s              'Wait 10 seconds
    PWMOff                 'Turn off the PWM          ' <<< the PWMOff instruction
```

<span class="strong">**Key line:**</span> `PWMOff` — immediately
disables the CCP1 module’s PWM output; the pin stops toggling until
`PWMOn` is called again.  
  
<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="pwmon" class="link" title="PWMOn">PWMOn</a> — the
    counterpart command that enables the CCP1 PWM output

</div>

</div>
