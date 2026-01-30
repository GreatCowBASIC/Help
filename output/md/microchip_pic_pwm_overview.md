<div class="section">

<div class="titlepage">

<div>

<div>

#### <span id="microchip_pic_pwm_overview"></span>Microchip PIC PWM Overview

</div>

</div>

</div>

<span class="strong">**Introduction:**</span>

The methods described in this section allow the generation of Pulse
Width Modulation (PWM) signals. PWM signals enables the microcontroller
to control items like the speed of a motor, or the brightness of a LED
or lamp.  

The methods can also be used to generate the appropriate frequency
signal to drive an infrared LED for remote control applications.  

GCBASIC support the four different method shown below:  
    - Two methods use the microcontroller CCP module  
    - One method uses the microcontroller PWM module, and  
    - One method is a software emulation of PWM.  

<span class="strong">**<span class="emphasis">*Hardware PWM using a CCP
module*</span>**</span>

Using PWM with the CCP module: This option requires a CCP module within
the microcontroller.  

Hardware PWM is only available through the "CCP" or "CCPx" pin. This is
a hardware limitation of Microchip PIC microcontrollers.  

Microcontrollers with PPS can change the pin - use the PPS tool to set
the desired output pin.  

This method uses three parameters to setup the PWM.

``` screen
    'HPWM channel, frequency, duty cycle
    HPWM 1, 76, 80
```

<span class="strong">**<span class="emphasis">*Hardware PWM using a PWM
module*</span>**</span>

Using microcontroller PWM module. This option requires a PWM module
within the microcontroller Microcontrollers with PPS can change the pin
- use the PPS tool to set the desired output pin.  

This method uses four parameters to setup the PWM.

``` screen
    'HPWM channel, frequency, duty cycle, timer
    HPWM 5, 76, 80, 2
```

<span class="strong">**<span class="emphasis">*Hardware PWM using the
CCP1 in fixed mode*</span>**</span>

Using Hardware PWM on fixed mode PWM requires a CCP1 module.

The fixed mode can use CCP1 only, and, the parameters of the PWM cannot
be dynamically changed in the user program.   The parameters are fixed
by the definition of two constants.

``` screen
    #define PWM_Freq 76    'Set frequency in KHz
    #define PWM_Duty 80    'Set duty cycle to 80 %

    HPWMOn

    wait 5 s

    HPWMOff
```

<span class="strong">**<span class="emphasis">*Software
PWM*</span>**</span>

Using Software PWM on requires no specific modules with the
microcontroller.  

The PWM parameters for duty and the number of pulses can be changed
dynamically in the user program.  

The PWM is <span class="strong">**only**</span> operational for the
number of cycles stated in the calling method.  

``` screen
    'A call to use the software PWM on the specific port, with a duty of 127 for 100 cycles

    ; ----- Constants
    'PWM constant. This is a required constant.
    #define PWM_Out1 portb.0

  ; ----- Define Hardware settings
    'PWM port out.  This is not required but a good practice.
    dir PWM_Out1 out

    'Pulse the PWM
    PWMOut 1, 127, 100
```

<span class="strong">**Relevant Constants:**</span>

A number of constants are used to control settings for the PWM hardware
module of the microcontroller. To set them, place a line in the main
program file that uses \#define to assign a value to the particular
constant.  

</div>
