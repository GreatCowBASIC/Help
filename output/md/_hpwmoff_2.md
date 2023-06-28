<div class="section">

<div class="titlepage">

<div>

<div>

###### <span id="_hpwmoff_2"></span>HPWMOff

</div>

</div>

</div>

<span class="strong">**Syntax:**</span>

``` screen
    HPWMOff ( channel )   'selectively turn off the CCP channel

    HPWMOff               'turn off CCP channel 1 only
```

<span class="strong">**Command Availability:**</span>

Only available on Microchip PIC microcontrollers with
Capture&Compare/PWM (CCP) modules.

<span class="strong">**Explanation:**</span>

This command will disable the output of the CCP1/PWM module on the
Microchip PIC chip.

<span class="strong">**Example:**</span>

``` screen
    'Select chip model and speed
    #chip 16F877A, 20

    'Set the CCP1 pin to output mode
    DIR PORTC.2 out

    'Main code
    do
        'Turn up brightness over 2.5 seconds
        For Bright = 1 to 255
            HPWM 1, 40, Bright
            wait 10 ms
        next

        wait 1 s
        HPWMOff ( 1 )' turn off the PWM channel

    loop
```

<span class="strong">**For more help, see**</span>
<a href="_hpwmoff.html" class="link" title="HPWMOff">HPWMOff</a>

</div>
