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
have been defined previously by setting the constants `PWM_Out1`  

`PWM_Out2`, `PWM_Out3` or `PWM_Out4`. The maximum number of channels
available is 4.  

`duty cycle` specifies the PWM duty cycle, and ranges from 0 to 255. 255
corresponds to 100%, 127 to 50%, 63 to 25%, and so on.  

`cycles` is used to set the amount of PWM pulses to supply. This is
useful for situations in which a pulse of a specific length is
required.  

The formula for calculating the time taken for one cycle is:  

``` screen
    TCYCLE = (28 + 10C)TOSC+ (255 * PWM_Delay)
```

where:  

   -C is the number of channels used  
   -T<sub>OSC</sub> is the length of time taken to execute 1 instruction
on the chip (0.2 us on a 20 MHz chip, 1 us on a 4 Mhz chip)  
   -PWM\_Delay is a length of time specified using the `PWM_Delay`
constant  

<span class="strong">**Example 1 :**</span>

``` screen
    'This program controls the brightness of an LED on PORTB.0
    'using the software PWM routine and a potentiometer.
    #chip 16f877a, 20

    ; ----- Constants
    'PWM constant. This is a required constant.
    #define PWM_Out1 portb.0

    ; ---- Optional Constant to add an delay after PWM pulse
    ''#Define PWM_Delay 1 us


    ; ----- Define Hardware settings
    'PWM port out.  This is not required but good practice.
    dir PWM_Out1 out

    'A potentiometer is attached to ANO

    ; ----- Variables
    ' No Variables specified in this example.

    ; ----- Main body of program commences here.
      do
          '100 cycles is a purely arbitrary value as the loop will maintain a relatively constant PWM
          PWMOut 1, ReadAD(AN0), 100
      loop

end
```

<span class="strong">**Example 2 :**</span>

``` screen
    'This program controls the brightness of an LED on gpio.1
    'using the software PWM routine and a potentiometer.
    #chip 12f675, 4

    ; ----- Constants
      'PWM constant. This is a required constant.
      #define PWM_Out1 gpio.1

    ; ----- Define Hardware settings
      'PWM port out.  This is not required but good practice.
      dir PWM_Out1 out

      'A potentiometer is attached to ANO

    ; ----- Variables
      ' No Variables specified in this example.

    ; ----- Main body of program commences here.
        do
          '100 cycles is a purely arbitrary value
            PWMOut 1, ReadAD(AN0), 100
        loop
    end
```

</div>
