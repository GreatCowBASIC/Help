<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="pwmout"></span>PWMOut

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

<span class="strong">**Explanation :**</span>

`channel` sets the channel that the PWM is to be generated on. This must
have been defined previously by setting the constants `PWM_OUT1`  

`PWM_OUT2`, `PWM_OUT3` or `PWM_OUT4`. The maximum number of channels
available is 4.  

`duty cycle` specifies the PWM duty cycle, and ranges from 0 to 255. 255
corresponds to 100%, 127 to 50%, 63 to 25%, and so on.  

`cycles` is used to set the amount of PWM pulses to supply. This is
useful for situations in which a pulse of a specific length is
required.  

The formula for calculating the time taken for one cycle is:  

``` screen
    TCYCLE = (28 + 10C)TOSC+ (255 * PWM_DELAY)
```

where:  

   -C is the number of channels used  
   -T<sub>OSC</sub> is the length of time taken to execute 1 instruction
on the chip (0.2 us on a 20 MHz chip, 1 us on a 4 Mhz chip)  
   -PWM\_DELAY is a length of time specified using the `PWM_DELAY`
constant  

<span class="strong">**Example 1 :**</span>

``` programlisting
    'This program controls the brightness of an LED on PORTB.0
    'using the software PWM routine and a potentiometer.
    #chip 16f877a, 20

    ; ----- Constants
    'PWM constant. This is a required constant.
    #define PWM_OUT1 portb.0

    ; ---- Optional Constant to add an delay after PWM pulse
    ''#Define PWM_DELAY 1 us


    ; ----- Define Hardware settings
    'PWM port out.  This is not required but good practice.
    dir PWM_OUT1 out

    'A potentiometer is attached to AN0

    ; ----- Variables
    ' No Variables specified in this example.

    ; ----- Main body of program commences here.
      do
          '100 cycles is a purely arbitrary value as the loop will maintain a relatively constant PWM
          PWMOut 1, ReadAD(AN0), 100          ' <<< the PWMOut instruction
      loop

end
```

<span class="strong">**Key line:**</span>
`PWMOut 1, ReadAD(AN0), 100` — drives channel 1 with a duty cycle read
live from the potentiometer on `AN0`, repeating for 100 cycles per call;
because the loop calls `PWMOut` again immediately, the pulse train
continues without a visible gap.

<span class="strong">**Example 2 :**</span>

``` programlisting
    'This program controls the brightness of an LED on gpio.1
    'using the software PWM routine and a potentiometer.
    #chip 12f675, 4

    ; ----- Constants
      'PWM constant. This is a required constant.
      #define PWM_OUT1 gpio.1

    ; ----- Define Hardware settings
      'PWM port out.  This is not required but good practice.
      dir PWM_OUT1 out

      'A potentiometer is attached to AN0

    ; ----- Variables
      ' No Variables specified in this example.

    ; ----- Main body of program commences here.
        do
          '100 cycles is a purely arbitrary value
            PWMOut 1, ReadAD(AN0), 100          ' <<< the PWMOut instruction, on a smaller 8-pin part
        loop
    end
```

<span class="strong">**Key line:**</span>
`PWMOut 1, ReadAD(AN0), 100` — identical call to Example 1, but on the
8-pin 12F675 using `gpio.1` instead of `portb.0`; the command itself
does not change with the chip, only the pin assigned to `PWM_OUT1`.

<span class="strong">**See Also:**</span>

<div class="itemizedlist">

-   <a href="pwmon" class="link" title="PWMOn">PWMOn</a> — hardware
    PWM alternative that does not need to be re-triggered in a loop
-   <a href="hpwm_ccp" class="link" title="HPWM CCP">HPWM CCP</a> — higher-resolution
    hardware PWM using a CCP module
-   <a href="dir" class="link" title="Dir">Dir</a> — setting the
    pin direction before driving it with PWM
-   <a href="readad" class="link" title="ReadAD">ReadAD</a> — reading
    the potentiometer value used as the duty cycle in the example above
-   <a href="wait" class="link" title="Wait">Wait</a> — introducing
    a fixed delay, as contrasted with a PWM pulse train

</div>

</div>
