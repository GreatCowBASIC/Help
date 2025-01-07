<div class="section">

<div class="titlepage">

<div>

<div>

##### <span id="_hardware_pwm_code_optimisation"></span>Hardware PWM Code Optimisation

</div>

</div>

</div>

<span class="strong">**About Hardware PWM Code Optimisation**</span>

For compatibility all channels are supported by default. This is
maintains backward compatibility.  

To mimise the code, use the following to disable support for a specific
Capture/Compare/PWM (CCP) module, timers or the PWM module.  

Setting a constant to <span class="emphasis">*FALSE*</span> will remove
the support of the capability from the method and therefore will reduce
the program size.

``` screen
    #define USE_HPWMCCP1 FALSE
    #define USE_HPWMCCP2 FALSE
    #define USE_HPWMCCP3 FALSE
    #define USE_HPWMCCP4 FALSE
```

To further mimise the code, use the following to disable support for a
specific PWM channels. Only PWM channels 5, 6 and 7 are supported.

``` screen
    #define USE_HPWM3 FALSE
    #define USE_HPWM4 FALSE
    #define USE_HPWM5 FALSE
    #define USE_HPWM6 FALSE
    #define USE_HPWM7 FALSE
```

To further mimise the code, use the following to disable support for a
specific timers.

``` screen
    #define USE_HPWM_TIMER2 TRUE
    #define USE_HPWM_TIMER4 TRUE
    #define USE_HPWM_TIMER6 TRUE
```

<span class="strong">**Example**</span>

This will save 335 bytes of program memory by removing support for CCP1,
CCP2 and CCP4.

``` screen
    #chip 16f18855,32
    #Config MCLRE_ON

    UNLOCKPPS
        RC2PPS = 0x0A       'RC2->CCP2:CCP2;
    LOCKPPS

    #define USE_HPWMCCP1 FALSE       ' This is not used so optimise
    #define USE_HPWMCCP2 TRUE        ' This is used so include in the compiled code
    #define USE_HPWMCCP3 FALSE       ' This is not used so optimise
    #define USE_HPWMCCP4 FALSE       ' This is not used so optimise


    'Setting the port an output is VERY important... LED will not work if you do not set as an output.
    dir portC.2 out    ; CCP2

    do forever
            For Bright = 1 to 255
                HPWM 2, 40, Bright
                wait 10 ms
            next

    loop
```

</div>
